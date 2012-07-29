local file = io.popen('ls -d */','r')
local toprint = file:read('*all')
print(toprint)
