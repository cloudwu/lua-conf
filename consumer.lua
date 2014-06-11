local conf = require "conf"

local t = conf.box(...)

for i = 1, 1000 do
    assert(t.a == 1)
    assert(t.b == "hello")
    assert(t.c == true)
    assert(t.d[1] == 100)
    assert(t.d[2] == 101)
    assert(t.d[3] == 102)
    assert(t.d[4] == 103)
    for i = 1, 26 do
        assert(t.e[string.char(64 + i)] == i)
        assert(t.e[string.char(96 + i)] == i)
    end
    assert(t.f[1] == false)
    assert(t.f.g.h == 99999999)
    assert(t.f.g[88888888] == "i")
    assert(t.f.g[1] == "j")
    assert(t.f.g[2] == true)
	assert(t.l == '`1234567890-=	qwertyuiop[]\\asdfghjkl;\'zxcvbnm,./ ~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?')

end
--conf.delete(...)
