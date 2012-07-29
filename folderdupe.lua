local file = io.popen('find temp -type d')
local toprint = file:read('*all')
file:close()
print(toprint)
