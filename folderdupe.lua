local file = io.popen('ls -d */','r')
--local file = io.popen('temp/ls -al','r')
local toprint = file:read('*all')
file:close()
print(toprint)

local file2 = io.popen('/bin/ls -d */')
local toprint2 = file2:read('*all')
print(toprint2)
