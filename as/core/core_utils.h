//
// Created by Alex Zelenshikov on 20.03.2024.
//

#ifndef AS_PROTO_CORE_UTILS_H
#define AS_PROTO_CORE_UTILS_H

namespace as::utils
{
  std::string getErrorMessage(llvm::Error error);

  std::unique_ptr<llvm::Module> loadEmbeddedBitcode(llvm::LLVMContext &context,
                                                    const char *name, const unsigned char *start, size_t len);

  std::string generateModuleName(std::string filename);
}

#endif //AS_PROTO_CORE_UTILS_H
