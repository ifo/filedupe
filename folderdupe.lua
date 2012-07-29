local input = io.popen('find temp -type d')
local output = io.open('temp/folders.txt', 'w+')

local file = ""

local foldertable = {}

while true do
  local line = input:read('*line')
  if line == nil then break end
  file = file .. line .. "\n"
  local path, folder = line:match('(.*/)(.-)$')
  --print(path, folder)
  if foldertable[folder] ~= nil then
    foldertable[folder]:insert(path)
  else
    foldertable[folder] = {path}
  end
  print(foldertable[folder][1])
end
output:write(file)
