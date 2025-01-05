---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local a = "bloodygreed"
local hero = RPD.Dungeon.hero
local num = 0

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 67,
            name          = "BloodyGreed_BuffN",
            info          = "BloodyGreed_BuffD",
        }
    end,
    
    attackProc = function(self,buff,enemy,damage)
      local Spell = storage.gameGet(a) or {}
      local exp = Spell.exp
      local expMax = Spell.expMax
      local lvl = Spell.lvl
      
      storage.gamePut(a,{exp = exp + 1, expMax = expMax, lvl = lvl})
      if Spell.exp == Spell.expMax then
        storage.gamePut(a,{exp = 0, expMax = expMax+6, lvl = lvl + 1})
      end
      
      buff.target:heal(damage*(0.05+0.12*buff:level()),buff.target)
      return damage
    end
}