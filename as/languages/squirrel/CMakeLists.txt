add_library(SquirrelIntegration STATIC
    sq_language.cpp
    sq_language.h
    sq_language_script.cpp
    sq_language_script.h
    sq_ir.cpp
    sq_ir.h

    squirrel/include/squirrel.h

    squirrel/squirrel/sqapi.cpp
    squirrel/squirrel/sqarray.h
    squirrel/squirrel/sqbaselib.cpp
    squirrel/squirrel/sqclass.cpp
    squirrel/squirrel/sqclass.h
    squirrel/squirrel/sqclosure.h
    squirrel/squirrel/sqcompiler.cpp
    squirrel/squirrel/sqcompiler.h
    squirrel/squirrel/sqdebug.cpp
    squirrel/squirrel/sqfuncproto.h
    squirrel/squirrel/sqfuncstate.cpp
    squirrel/squirrel/sqfuncstate.h
    squirrel/squirrel/sqlexer.cpp
    squirrel/squirrel/sqlexer.h
    squirrel/squirrel/sqmem.cpp
    squirrel/squirrel/sqobject.cpp
    squirrel/squirrel/sqobject.h
    squirrel/squirrel/sqopcodes.h
    squirrel/squirrel/sqpcheader.h
    squirrel/squirrel/sqstate.cpp
    squirrel/squirrel/sqstate.h
    squirrel/squirrel/sqstring.h
    squirrel/squirrel/sqtable.cpp
    squirrel/squirrel/sqtable.h
    squirrel/squirrel/squserdata.h
    squirrel/squirrel/squtils.h
    squirrel/squirrel/sqvm.cpp
    squirrel/squirrel/sqvm.h

    squirrel/sqstdlib/sqstdaux.cpp
    squirrel/sqstdlib/sqstdblob.cpp
    squirrel/sqstdlib/sqstdblobimpl.h
    squirrel/sqstdlib/sqstdio.cpp
    squirrel/sqstdlib/sqstdmath.cpp
    squirrel/sqstdlib/sqstdrex.cpp
    squirrel/sqstdlib/sqstdstream.cpp
    squirrel/sqstdlib/sqstdstream.h
    squirrel/sqstdlib/sqstdstring.cpp
    squirrel/sqstdlib/sqstdsystem.cpp

    bc/sqapi_bc.h
    bc/sqapi.ll

    bc/sq_adapters_bc.h
    bc/sq_adapters.ll
)

target_link_libraries(SquirrelIntegration AScript)

target_include_directories(SquirrelIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(SquirrelIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/squirrel/include")

set(BC_FLAGS -c -I"${CMAKE_CURRENT_SOURCE_DIR}/squirrel/include")
add_llvm_bc_library(sqapi squirrel/squirrel/sqapi.cpp)
add_llvm_bc_library(sq_adapters sq_adapters.cpp)
