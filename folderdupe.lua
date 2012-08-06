-- this is now running lua 5.1, and will be using lua file system
require('lfs')

--[[ for time testing (also uncomment bottom)
local x = os.clock()
for i = 1,100000 do
--]]

--[[ old code, use for refenence (data structure)

local input = io.open('inputfolders.txt')
local output = io.open('folders.txt', 'w+')
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
  if #value ~= 1 then
    file = file .. key .. '\t' .. table.concat(value,'\t') .. '\n'
  end
end

output:write(file)
--]]-- end old code

---[[
local cur = lfs.currentdir()
local i,dir = lfs.dir(cur)

while true do
  f = dir:next()
  if f == nil then break end
  if not f:find('^%.') then
    if lfs.attributes(f,'mode') == 'directory' then
      --print(f)
    end
  end
end
--]]

--[[ for time testing
end
print(string.format("elapsed time: %.2f\n", os.clock() - x))
--]]


