---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local buff = require "scripts/lib/buff"
local a = "flameshield"
local Spell = storage.gameGet(a) or {}
local hero = RPD.Dungeon.hero
local shield
local shield2

local level

return buff.init{
    desc  = function ()
      shield = RPG.smartInt(12+2.5*Spell.lvl+hero:ht()*0.2)
      shield2 = shield
        return {
            icon          = 57,
            info          = "Flameshield_BuffD",
        }
    end,
name = function()
return RPD.textById("Flameshield_BuffN").." "..tostring(shield).."/"..tostring(shield2)
end,

charAct = function(self,buff)
  hero = RPD.Dungeon.hero
  level = RPD.Dungeon.level
  local x = level:cellX(hero:getPos())
  local y = level:cellY(hero:getPos())
  for i = x-1, x+1 do
    for j = y-1, y+1 do
      local c = level:cell(i,j)
      local tile = level:getTileType(c)
      if c ~= hero:getPos() and tile ~= 4 and tile ~= 12 then
        RPD.placeBlob(RPD.Blobs.Fire,c,1)
        local enemy = RPD.Actor:findChar(c)
        if enemy and enemy ~= hero then
          RPD.removeBuff(enemy,"FlameMark")
    RPD.affectBuff(enemy, "FlameMark", 2+Spell.lvl)
        end
      end
    end
  end
end,

defenceProc = function(self, buff, enemy, damage)
 shield = shield -(damage +buff.target:dr()*0.8)
 if shield <= 0 then
  buff:detach()
  return shield
 end
  RPD.playSound("body_armor")
  hero:getSprite():showStatus(0xffff00,RPD.textById("ShieldA"))
  RPD.glog(RPD.textById("ShieldAbsorb")..tostring(shield).."/"..tostring(shield2))
  return false
end


}
