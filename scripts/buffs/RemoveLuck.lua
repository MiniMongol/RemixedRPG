---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG = require "scripts/lib/Functions"

local hero = RPD.Dungeon.hero
local storage = require "scripts/lib/storage"
local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 59,
            info          = "PoisonedBloodD",
        }
    end,
    
    detach = function(self,buff)
     RPG.luck = RPG.luck - 10000
    end
}