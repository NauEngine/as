//
// Created by Alex Zelenshikov on 20.03.2024.
//

#ifndef AS_PROTO_CORE_UTILS_H
#define AS_PROTO_CORE_UTILS_H

namespace as::utils
{
  std::string GetErrorMessage(llvm::Error error);

  std::unique_ptr<llvm::Module> LoadEmbeddedBitcode(llvm::LLVMContext &context,
                                                    const char *name, const unsigned char *start, size_t len);
}

#endif //AS_PROTO_CORE_UTILS_H
