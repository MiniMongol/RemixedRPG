---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local a = "steelbody"
local hero = RPD.Dungeon.hero
local num = 0

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 53,
            name          = "Steelbody_BuffN",
            info          = "Steelbody_BuffD",
        }
    end,
    drBonus = function(self,buff)
     local Count = storage.gameGet(a) or {}
     return math.ceil(buff.target:hp()*0.15 +4 +3*Count.lvl)
    end,
    
    speedMultiplier = function(self, buff)
        return 0.5 + RPG.AllFast()*0.2
    end
}