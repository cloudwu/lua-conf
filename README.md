What's the lua-conf
========

lua-conf is a lua library , it can convert a lua table to a constant C object (a lightuserdata). And then you can share it among many lua states .

Why use lua-conf
========

1. Reading the constant C object is thread safe , so you can use it in many lua states concurrently.
2. If you convert a large lua table , it will reduce the memory usage of lua vm . So the garbage collector will run faster (mark less gc objects).
3. Sometimes you need reload the lua vm , the constant data in the table don't need parser again.

Supported types
========

The keys must be a 32 bit integer or a string, the values can be boolean, string, number, and table.

How to build
========

Include the source luaconf.c in your project, or build it as a dynamic library. 

```
gcc -O2 -Wall --shared -o conf.so luaconf.c   #linux
gcc -O2 -Wall --shared -o conf.dll luaconf.c -I/usr/local/include -L/usr/local/bin -llua52 # mingw
gcc -O2 -o test -llua.5.2.3 test.c # mac with brew
```

How to use
========

See test.lua

http://blog.codingnow.com/2014/04/lua-conf.html  (In Chinese)
