---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 25.03.19 0:06
---
local RPD  = require "scripts/lib/commonClasses"
local buff = require "scripts/lib/buff"
local hero = RPD.Dungeon.hero
local iconId = 44

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "Исцеляющая аура",
            info          = "От тебя исходит аура света",
        }
    end,

defenceProc = function(self, buff, enemy, damage)
hero:heal(10,hero)
return damage
end


}
