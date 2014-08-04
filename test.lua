local conf = require "conf"

local map = {}
for i = 1, 26 do
	map[string.char(64+i)] = i
end

for i = 1, 26 do
	map[string.char(96+i)] = i
end


local t = conf.host.new {
	a=1,
	b="hello",
	c=true,
	d = { foo = {}, 100,101,102,103},
	e = map,
}

local box = conf.box(t)

for k,v in ipairs(box.d) do
	print(string.format("d[%d] = %d",k,v))
end

for k,v in pairs(box.e) do
	print(string.format("e.%s = %d",k,v))
end

print(box.a)
print(box.b)
print(box.c)

box=nil
collectgarbage "collect"

conf.host.delete(t)
