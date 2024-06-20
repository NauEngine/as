//
// Created by ivn on 20.06.2024.
//

#include "core_test_fixture.h"

const auto BASE_SCRIPTS_PATH = "../..";
const auto TEMP_SCRIPTS_PATH = "cmake-build-debug/test";

CoreTestFixture::CoreTestFixture() :
    m_core(std::make_unique<as::Core>(BASE_SCRIPTS_PATH))
{
}

CoreTestFixture::~CoreTestFixture()
{
    for (const auto& file_path: m_temp_files)
    {
        std::error_code ec;
        std::filesystem::remove(file_path, ec);
    }

    m_temp_files.clear();
}

void CoreTestFixture::SetUp()
{
    m_core->registerLanguage(getLanguageName(), createLanguage());

    if (auto runtime = createRuntime())
        m_core->registerRuntime(std::move(runtime));
}

std::string CoreTestFixture::copyFile(const std::string& source_file, const std::string& dest_file)
{
    const auto source_file_path = std::filesystem::path(BASE_SCRIPTS_PATH) / source_file;
    const auto dest_file_path = std::filesystem::path(TEMP_SCRIPTS_PATH) / dest_file;
    const auto dest_file_full_path = std::filesystem::path(BASE_SCRIPTS_PATH) / dest_file_path;

    auto copy_options = std::filesystem::copy_options::overwrite_existing;
    std::error_code ec;
    const auto copy_result = copy_file(source_file_path, dest_file_full_path, copy_options, ec);

    if (!copy_result)
        return "";

    m_temp_files.insert(dest_file_full_path);
    return dest_file_path;
}
