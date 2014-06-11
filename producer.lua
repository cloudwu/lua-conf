local conf = require "conf"

local map = {}
for i = 1, 26 do
	map[string.char(64+i)] = i
end

for i = 1, 26 do
	map[string.char(96+i)] = i
end


local t = conf.new {
	a=1,
	b="hello",
	c=true,
	d = { 100,101,102,103},
	e = map,
    f = { false, g = { h = 99999999, [88888888] = "i", "j", true }, },
	l = '`1234567890-=	qwertyuiop[]\\asdfghjkl;\'zxcvbnm,./ ~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?',

}

return t
