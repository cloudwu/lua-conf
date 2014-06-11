#include <assert.h>
#include <pthread.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <unistd.h>

#define MAX_THREAD 16

typedef struct ConsumerData {
    const char* filename;
    void* product;
} ConsumerData;

void* Produce(const char* filename) {
    lua_State* L = luaL_newstate();
    printf("%p,%s\n", L, filename);
    luaL_openlibs(L);
    if (luaL_loadfile(L, filename) != 0) {
        printf("%s\n", lua_tostring(L, -1));
        return NULL;
    }

    if (lua_pcall(L, 0, LUA_MULTRET, 0) != 0) {
        printf("%s\n", lua_tostring(L, -1));
        return NULL;
    }

    if (lua_type(L, -1) != LUA_TLIGHTUSERDATA) {
        printf("producer must return lightuserdata\n");
        return NULL;
    }

    void* product = lua_touserdata(L, -1);
    lua_close(L);

    return product;
}

void* Consume(void* data) {

    ConsumerData* cd = data;
    lua_State* L = luaL_newstate();
    printf("%p,%s\n", L, cd->filename);
    luaL_openlibs(L);
    if (luaL_loadfile(L, cd->filename) != 0) {
        printf("%s\n", lua_tostring(L, -1));
        return NULL;
    }

    lua_pushlightuserdata(L, cd->product);

    if (lua_pcall(L, 1, LUA_MULTRET, 0) != 0) {
        printf("%s\n", lua_tostring(L, -1));
        return NULL;
    }

    lua_close(L);
    return NULL;
}

int main() {
    ConsumerData data;
    data.filename = "consumer.lua";
    data.product = Produce("producer.lua");

    pthread_t threads[MAX_THREAD] = { 0 };

    for (int i =0; i < MAX_THREAD; ++i) {
        pthread_create(&threads[i], NULL, &Consume, &data);
    }

    for (int i = 0; i < MAX_THREAD; ++i) {
        pthread_join(threads[i], NULL);
    }

    return 0;
}
