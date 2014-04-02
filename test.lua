local conf = require "conf"

local t = conf.new {
	a=1,
	b="hello",
	c=true,
	d = { 100,101,102,103}
}

local box = conf.box(t)

for k,v in ipairs(box.d) do
	print(string.format("d[%d] = %d",k,v))
end

print(box.a)
print(box.b)
print(box.c)

conf.delete(t)
