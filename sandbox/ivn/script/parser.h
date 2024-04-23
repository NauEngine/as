#pragma once

#include <vector>
#include "module.h"
#include "error.h"

namespace script {

std::unique_ptr<Module> parse(const char* content, std::vector<Error>& errors);

}