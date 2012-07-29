local input = io.popen('find temp -type d')
local output = io.open('temp/folders.txt', 'w+')

local file = ""

local foldertable = {}

while true do
  local line = input:read('*line')
  if line == nil then break end
  local path, folder = line:match('(.*/)(.-)$')
  --print(path, folder)
  if folder ~= nil then
    if foldertable[folder] == nil then
      foldertable[folder] = {}
      table.insert(foldertable[folder],path)
    else
      table.insert(foldertable[folder],path)
    end
    --print(folder, foldertable.folder[1])
  end
end

for key,value in pairs(foldertable) do
  file = file .. key .. '\t' .. table.concat(value,'\t') .. '\n'
end

output:write(file)
