---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local hero = RPD.Dungeon.hero
local a = "placetrap"
local scale = 0

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 3,
            name          = "",
            info          = "",
        }
    end,
    
    charAct = function(self,buff)
      local Spell = storage.gameGet(a) or {}
      buff.target:damage(math.ceil(buff:level()*(0.2 + scale*0.04)), RPD.Dungeon.hero)
      scale = scale +1
    end
}