local file = io.popen('ls -d */','r')
local toprint = file:read('*all')
file:close()
print(toprint)
