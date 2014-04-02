What's the lua-conf ?
========

lua-conf is a lua library , it can convert a lua table to a constant C object (A lightuserdata). And then you can share it among many lua states .

Why use lua-conf ?
========

1. Reading the constant C object is thread safe , so you can use it in many lua states concurrently.
2. If you convert a large lua table , it will reduce the memory usage of lua vm . So the garbage collector will run faster (mark less gc objects).
3. Sometimes you need reload the lua vm , the constant data in the table don't need parser again.

Supported types
========

The keys must be a 32bit integer or a string, the values can be boolean, string, number, and table.

How to build
========

Include the source luaconf.c in your project, so build it to a dynamic library. 

```
gcc -O2 -Wall --shared -o conf.so luaconf.c   #linux
gcc -O2 -Wall --shared -o conf.dll luaconf.c -I/usr/local/include -L/usr/local/bin -llua52 # mingw (windows)
```

How to use
========

See test.lua
