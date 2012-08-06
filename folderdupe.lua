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

local input = io.open('inputfolders.txt')
local output = io.open('folders.txt', 'w+')
local file = ""
local foldertable = {}

function getdirandsize (pathtodir)
  for folder in lfs.dir(pathtodir) do
    if not folder:find('^%.') then
      local f = pathtodir .. '/' .. folder
      if lfs.attributes(f,'mode') == 'directory' then
        local size = lfs.attributes(f,'size')
        local key = folder .. '?' .. size
        if foldertable[key] == nil then
          foldertable[key] = {}
          table.insert(foldertable[key],pathtodir)
        else
          table.insert(foldertable[key],pathtodir)
        end
        getdirandsize(f)
      end
    end
  end
end

getdirandsize('.')

for key, value in pairs(foldertable) do
  if #value ~= 1 then
    local k1, k2 = key:match('(.*)?(%d*)')
    file = file .. k1 .. ' ' .. k2 .. '\t' .. table.concat(value,'\t') .. '\n'
    --print(k1 .. ' ' .. k2)
  end
end

output:write(file)

--[[ for time testing
end
print(string.format("elapsed time: %.2f\n", os.clock() - x))
--]]
