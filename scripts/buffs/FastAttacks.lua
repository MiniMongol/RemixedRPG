---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"

local hero = RPD.Dungeon.hero
local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 68,
            name          = "Ускорение атак",
            info          = "",
        }
    end,
    
    attackProc = function(self,buff,enemy,damage)
    buff.target:spend(-math.min(0.8,buff:level()*0.05))
    return damage
    end
}