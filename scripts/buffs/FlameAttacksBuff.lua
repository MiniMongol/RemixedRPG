---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"
local a = "flameattacks"
local Spell = storage.gameGet(a) or {}

local hero = RPD.Dungeon.hero
local buff = require "scripts/lib/buff"
local num = 0

return buff.init{
    desc  = function ()
        return {
            icon          = 61,
            name          = "Пламенные удары",
            info          = "",
        }
    end,
    
    attackProc = function(self,buff,enemy,damage)
      hero = RPD.Dungeon.hero
      if enemy:buffLevel("FlameMark") > 0 then
        enemy:damage(math.ceil(1.5*Spell.lvl + RPG.magStr()*0.1 + hero:ht()*0.2),hero)
        enemy:getSprite():showStatus(0xffff00,RPD.textById("boom"))
      else
        enemy:damage(math.ceil(1.5*Spell.lvl + RPG.magStr()*0.1 + hero:ht()*0.1),hero)
      end
    return damage
    end
}