#pragma once

#include <memory>
#include <map>
#include <any>
#include "llvm/IR/LLVMContext.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

namespace script {

class Executor {
public:
  Executor();
  ~Executor();

  bool addGlobalVariable(const std::string& name, void* var);

  template <typename T, typename ...TArgs> bool addGlobalFunction(const std::string& name, int (T::*method)(TArgs...)) {
    std::function<int(void*, TArgs...)> function = [method](void* obj, TArgs... args) -> int {
      return ((T*)obj->*method)(args...);
    };

    functions[*name.c_str() - 'a'] = function;
    return true;
  }

  template<typename ...TArgs> int callGlobalFunction(void* obj, int index, TArgs... args) {
    auto& func = std::any_cast<std::function<int(void*, TArgs...)> &>(functions.at(index));
    return func(obj, std::forward<TArgs>(args)...);
  }

  bool addModule(std::unique_ptr<llvm::Module> module, llvm::orc::ThreadSafeContext& context);
  template <typename  T> std::enable_if_t<std::is_function<T>::value, T *> getSymbol(const std::string& name) {
    auto e = jit->lookup(name);
    if (!e)
      return nullptr;

    return (*e).toPtr<T*>();
  }

private:
  std::unique_ptr<llvm::orc::LLJIT> jit;
  std::map<int, std::any> functions;
};

}