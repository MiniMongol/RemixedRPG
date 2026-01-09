local RPD = require "scripts/lib/commonClasses"
local storage = require "scripts/lib/storage"

local Que = {
 new = function(name)
  local mas = {}
  storage.gamePut(name, {mas = mas,size = 0})
 end,
 
 pushMas = function(name,mas)
  local Que = storage.gameGet(name) or {}
  storage.gamePut(name,{mas = mas,size = #mas})
 end,
 
 addMas = function(name,mas)
  local Que = storage.gameGet(name) or {}
  local oldmas = Que.mas
  local size = Que.size
  for i = size+1, #mas+size do
    oldmas[i] = mas[i-size]
  end
  
  storage.gamePut(name,{mas = oldmas,size = size + #mas})
 end,
 
 push = function(name,count)
  local Que = storage.gameGet(name) or {}
  local mas = Que.mas
  mas[Que.size+1] = count
  storage.gamePut(name,{mas = mas,size = Que.size+1})
 end,
 
 clear = function(name)
 local mas = {}
  storage.gamePut(name,{mas = mas,size = 0})
 end,
 
 getMas = function(name)
  local Que = storage.gameGet(name) or {}
  return Que.mas
 end,
 
 getD = function(name)
  local Que = storage.gameGet(name) or {}
  local a = 0
  local size = Que.size
  local mas = Que.mas
  local get = mas[0]
  if mas[a+1] ~= nil then
   while mas[a+1] ~= nil do
    mas[a] = mas[a+1]
    a = a+1
   end
  else
   mas[0] = 0
  end
  if size ~= 1 then
   size = size-1
  end
  storage.gamePut(name,{mas = mas,size = size})
  return get
 end
}
return Que