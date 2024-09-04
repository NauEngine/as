//
// Created by Alex Zelenshikov on 04.09.2024.
//

#include "llvm/IR/IRBuilder.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lauxlib.h"
#include "lua/lstate.h"
#include "lua/lparser.h"
}

#include "lua_utils.h"

typedef struct {
    FILE *file;
    char buffer[LUAL_BUFFERSIZE];
} FileReaderData;

const char *file_reader(lua_State *L, void *data, size_t *size)
{
    FileReaderData *reader = (FileReaderData *)data;
    if (feof(reader->file)) return NULL;
    *size = fread(reader->buffer, 1, sizeof(reader->buffer), reader->file);
    return reader->buffer;
}

Proto* load_lua_source(lua_State *L, const char *filename)
{
    FILE *f = fopen(filename, "r");
    if (f == NULL)
    {
        luaL_error(L, "Cannot open file: %s", filename);
        return NULL;
    }

    FileReaderData reader;
    reader.file = f;

    ZIO zio;
    luaZ_init(L, &zio, file_reader, &reader);

    Mbuffer buff;
    luaZ_initbuffer(L, &buff);

    const char *source_name = lua_pushfstring(L, "@%s", filename);
    Proto *proto = luaY_parser(L, &zio, &buff, source_name);

    fclose(f);
    luaZ_freebuffer(L, &buff);
    return proto;
}

namespace as
{

Proto* loadLuaProto(lua_State* luaState, const std::string &filename, bool dump)
{
    Proto* proto = load_lua_source(luaState, filename.c_str());

    if (!proto)
    {
        llvm::errs() << "Failed to load script file: " << lua_tostring(luaState, -1) << "\n";
        exit(1);
    }

    if (dump)
    {
        llvm::errs() << "OPCODES: \n";
        printLuaFunction(proto, true);
    }

    return proto;
}

} // namespace as
