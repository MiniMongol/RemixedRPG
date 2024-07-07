---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local old = 0
local hero = RPD.Dungeon.hero
local a = "bonegolem"
local luckBonus = 1

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "Прислужник",
            info          = "",
        }
    end,
    
    charAct = function(self,buff)
      local Spell = storage.gameGet(a) or {}
      
      if Spell.summon == 0 then
        buff.target:die(buff.target)
      end
      
      if old > 3 then
        if Spell.summon > 3 then
          buff.target:die(buff.target)
        end
      end
      if old < 5 then
        old = old +1
      end
      if RPG.subclass ~= "Necromancer" and RPG.subclass ~= nil then
        buff.target:die(buff.target)
      end
    end,
    
    speedMultiplier = function(self, buff)
      local hero = RPD.Dungeon.hero
      local armor = hero:getBelongings().armor
   
      return math.max(0.1, ((0.8 +RPG.AllFast()*0.04) -0.05*RPD.Dungeon.depth -0.025*(math.max(0,armor:requiredSTR()-RPG.physStr())) ))
    end,
    
    attackProc = function(self,buff,enemy,damage)
    if RPG.subclass == "Necromancer" then
      luckBonus = 1.5
    end
    local dmg = RPG.smartInt(damage +RPG.magStr()*0.12)
    if RPG.physicStr ~= nil then
    if math.random(1,100+enemy:defenseSkill()) <= RPG.AllLuck()*luckBonus then
    enemy:getSprite():showStatus(0xffff00,"crit")
    enemy:damage(dmg*2,RPD.Dungeon.hero)
    else
    enemy:damage(dmg,RPD.Dungeon.hero)
    end
    else
    enemy:damage(dmg,RPD.Dungeon.hero)
    end
    return false
    end
}