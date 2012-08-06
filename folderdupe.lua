require('lfs')

local output = io.open('folders.txt', 'w+')

--[[ for time testing (also uncomment bottom)
local x = os.clock()
for i = 1,100000 do
--]]

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

--[[ for time testing
end
print(string.format("elapsed time: %.2f\n", os.clock() - x))
--]]

output:write(file)
