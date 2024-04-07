#include <stdlib.h>
#include <stdio.h>

#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"

#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/Bitcode/BitcodeWriter.h"

#include <string>

#include "core_utils.h"

namespace as::utils
{
  std::string GetErrorMessage(llvm::Error error)
  {
    std::string error_msg;
    handleAllErrors(std::move(error), [&](llvm::ErrorInfoBase &EIB) {
      error_msg = EIB.message();
    });

    return error_msg;
  }

  std::unique_ptr<llvm::Module> LoadEmbeddedBitcode(llvm::LLVMContext &context,
                                                    const char *name, const unsigned char *start, size_t len)
  {
    llvm::StringRef mem_ref((const char *)start, len - 1);

    auto buffer = llvm::MemoryBuffer::getMemBuffer(mem_ref, name);
    if (buffer)
    {
      if (auto module = llvm::getOwningLazyBitcodeModule(std::move(buffer), context))
      {
        if (auto error = module.get()->materializeAll())
        {
          printf("Failed to materialize embedded '%s' file: %s\n", name, GetErrorMessage(std::move(error)).c_str());
          exit(1);
        }

        return std::move(module.get());
      }
      else
      {
        printf("Failed to parse embedded '%s' file: %s\n", name, GetErrorMessage(module.takeError()).c_str());
        exit(1);
      }
    }

    return nullptr;
  }

  std::string GenerateModuleName(std::string filename)
  {
    if(filename.size() > 32) {
      filename = filename.substr(0,32);
    }
    // replace non-alphanum characters with '_'
    for(size_t n = 0; n < filename.size(); n++) {
      char c = filename[n];
      if((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')) {
        continue;
      }
      if(c == '\n' || c == '\r') {
        filename = filename.substr(0,n);
        break;
      }
      filename[n] = '_';
    }

    return filename;
  }
}

