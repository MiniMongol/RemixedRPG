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
      if old > 2 then
        if Spell.summon > 3 then
          buff.target:die(buff.target)
        end
      end
      old = old +1
      if RPG.subclass ~= "Necromancer" and RPG.subclass ~= nil then
        buff.target:die(buff.target)
      end
    end,
    
    speedMultiplier = function(self, buff)
        return 1.5
    end,
    
    attackProc = function(self,buff,enemy,damage)
    if RPG.subclass == "Necromancer" then
      luckBonus = 1.5
    end
    if RPG.physicStr ~= nil then
    if math.random(1,100+enemy:defenseSkill()) <= RPG.AllLuck()*luckBonus then
    enemy:getSprite():showStatus(0xffff00,"crit")
    enemy:damage(damage*2,RPD.Dungeon.hero)
    else
    enemy:damage(damage,RPD.Dungeon.hero)
    end
    else
    enemy:damage(damage,RPD.Dungeon.hero)
    end
    return false
    end
}