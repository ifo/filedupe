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
output:write(file)

for key,value in pairs(foldertable) do
  print (key,table.concat(value,','))
end
