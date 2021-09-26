---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local buff = require "scripts/lib/buff"
local a = "bloodshield"
local Spell = storage.gameGet(a) or {}
local hero = RPD.Dungeon.hero
local num = 0
local shield
local shield2

return buff.init{
    desc  = function ()
      shield = math.ceil(10+3*Spell.lvl+(hero:ht()-hero:hp())*0.15)
      shield2 = shield
        return {
            icon          = 57,
            info          = "BloodShieldD",
        }
    end,
name = function()
return RPD.textById("BloodShieldN")..tostring(shield).."/"..tostring(shield2)
end,

defenceProc = function(self, buff, enemy, damage)
 hero = RPD.Dungeon.hero
 shield = shield - damage
 if shield <= 0 then
  buff:detach()
  return shield1
 end
  RPD.playSound("body_armor")
  hero:getSprite():showStatus(0xffff00,RPD.textById("ShieldA"))
  RPD.glog(RPD.textById("ShieldAbsorb")..tostring(shield).."/"..tostring(shield2)
)
  return false
end


}
