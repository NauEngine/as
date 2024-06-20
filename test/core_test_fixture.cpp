//
// Created by ivn on 20.06.2024.
//

#include "core_test_fixture.h"

CoreTestFixture::CoreTestFixture() :
    m_core(std::make_unique<as::Core>("../../test/scripts"))
{
}

void CoreTestFixture::SetUp()
{
    m_core->registerLanguage(getLanguageName(), createLanguage());

    if (auto runtime = createRuntime())
        m_core->registerRuntime(std::move(runtime));
}
