---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local buff = require "scripts/lib/buff"
local hero = RPD.Dungeon.hero
local num = 0
local type ="phys"
local elmnt ="crush"

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "",
            info          = "",
        }
    end,

defenceProc = function(self, buff, enemy, damage)
 hero = RPD.Dungeon.hero
 if math.random(10,math.ceil(enemy:attackSkill()*4)+11) <= math.ceil(RPG.AllFast()*0.4 + RPG.AllLuck()*0.4 + hero:attackSkill()*0.2) then
 local dmg = damage/10 * buff:level()
 if dmg - enemy:dr() <= 0 then
  dmg = enemy:dr()+2
 end
  RPD.playSound("body_armor")
  hero:getSprite():showStatus(0xffff00,RPD.textById("counterblow"))
  RPD.glog(RPD.textById("Counterblow"))
  RPG.damage(enemy,dmg - enemy:dr(), type,elmnt)
  return 0
  else
  return damage
 end
end


}
