//
// Created by Alex Zelenshikov on 04.09.2024.
//

#include "llvm/IR/IRBuilder.h"
#include "as/core/script_interface.h"
#include "as/core/ir.h"

#include "lua_extern_metatables.h"
#include "lua_ir.h"

namespace as
{

llvm::GlobalVariable* LuaExternMetatables::buildIR(
    const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    auto& context = module.getContext();

    std::vector<llvm::Constant*> metatables;

    for (auto& [instanceName, interface] : externalRequires)
    {
        metatables.push_back(buildMetatableIR(instanceName, interface, lua_ir,module));
    }

    // typedef struct InstanceMetatableList
    // {
    //     int num_metatables;
    //     InstanceMetatable* metatables;
    // } InstanceMetatableList;

    std::vector<llvm::Constant*> metatableListFields;

    metatableListFields.push_back(llvm::ConstantInt::get(context, llvm::APInt(32, metatables.size())));

    const auto metatable_array_t = llvm::ArrayType::get(lua_ir->InstanceMetatable_t, metatables.size());
    const auto metatable_array_const = llvm::ConstantArray::get(metatable_array_t, metatables);
    metatableListFields.push_back(ir::wrapArrayIntoGlobal(metatable_array_const, "__metatables__", module));

    auto const_value = llvm::ConstantStruct::get(lua_ir->InstanceMetatableList_t, metatableListFields);

    return new llvm::GlobalVariable(module, lua_ir->InstanceMetatableList_t, false,
        llvm::GlobalValue::InternalLinkage, const_value, "__metatable_list__");
}

llvm::Constant* LuaExternMetatables::buildMetatableIR(
    const std::string& instanceName,
    const std::shared_ptr<ScriptInterface>& interface,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    const auto interface_name_var = ir::buildString(module, ".interface_name", interface->name);
    const auto instance_name_var = ir::buildString(module, ".interface_name", instanceName);
    auto nullConst = llvm::Constant::getNullValue(lua_ir->void_ptr_t);

    std::vector<llvm::Constant*> regTable;

    for (int i = 0; i < interface->methodNames.size(); ++i)
    {
        if (const auto methodType = interface->methodTypes[i])
        {
            const auto methodName = interface->methodNames[i];
            const auto func_name = std::format("_{}_{}", interface->name, methodName);
            const auto func = buildLuaCFunction(methodType, i, func_name, interface_name_var, lua_ir, module);

            llvm::Constant* regFields[] = {ir::buildString(module, ".method_name", methodName), func};
            regTable.push_back(llvm::ConstantStruct::get(lua_ir->luaL_Reg_t, regFields));
        }
    }

    regTable.push_back(llvm::ConstantStruct::get(lua_ir->luaL_Reg_t, {nullConst, nullConst}));

    std::vector<llvm::Constant*> metatableFields;

    metatableFields.push_back(instance_name_var);
    metatableFields.push_back(interface_name_var);

    const auto reg_array_t = llvm::ArrayType::get(lua_ir->luaL_Reg_t, regTable.size());
    const auto reg_array_const = llvm::ConstantArray::get(reg_array_t, regTable);
    metatableFields.push_back(ir::wrapArrayIntoGlobal(reg_array_const, "__methods__", module));

    return llvm::ConstantStruct::get(lua_ir->InstanceMetatable_t, metatableFields);
}

llvm::Function* LuaExternMetatables::buildLuaCFunction(
    llvm::FunctionType* methodType,
    int methodPosition,
    const std::string& methodName,
    llvm::Value* interface_name_var,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    auto& context = module.getContext();

    llvm::IRBuilder<> builder(context);
    llvm::Function* func = llvm::Function::Create(lua_ir->lua_func_t, llvm::Function::ExternalLinkage, methodName, module);
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Constant* int32_1 = builder.getInt32(1);
    llvm::Type* opaquePtr_t = llvm::PointerType::get(context, 0);

    llvm::Value* lua_state_var = func->getArg(0);

    llvm::Value* instancePtr = builder.CreateCall(lua_ir->luaL_checkudata_f, {lua_state_var, int32_1, interface_name_var});
    llvm::Value* vtblPtr = builder.CreateLoad(opaquePtr_t, instancePtr);
    llvm::Value* vtbl = builder.CreateLoad(opaquePtr_t, vtblPtr);
    llvm::Value* methodPtr = builder.CreateGEP(opaquePtr_t, vtbl, {builder.getInt64(methodPosition)});
    llvm::Value* method = builder.CreateLoad(opaquePtr_t, methodPtr);

    std::vector<llvm::Value*> args(methodType->getNumParams());
    args[0] = vtblPtr;

    for (int i = 1; i < methodType->getNumParams(); ++i)
    {
        args[i] = lua_ir->buildPopValue(builder, lua_state_var, methodType->getParamType(i), i + 1);
    }

    llvm::Value* callResult = builder.CreateCall(methodType, method, args);

    lua_ir->buildPushValue(builder, lua_state_var, methodType->getReturnType(), callResult);

    llvm::Constant* result = builder.getInt32(methodType->getReturnType()->isVoidTy() ? 0 : 1);
    builder.CreateRet(result);

    return func;
}



}
