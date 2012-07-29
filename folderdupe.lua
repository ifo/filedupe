local input = io.popen('find temp -type d')
local output = io.open('temp/folders.txt', 'w+')

local file = ""

while true do
  local line = input:read('*line')
  if line == nil then break end
  file = file .. line .. "\n"
end
--local toprint = file:read('*all')
--file:close()
--print(toprint)
output:write(file)
