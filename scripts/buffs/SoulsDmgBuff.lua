---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local a = "soulstormentor"
local hero = RPD.Dungeon.hero
local num = 0
local type ="magic"
local elmnt

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 54,
            name          = "SoulsTormentorN",
            info          = "SoulsTormentorD",
        }
    end,
    
    attackProc = function(self,buff,enemy,damage)
    local Count = storage.gameGet(a) or {}
    num = num+1
    if num == 2 then
    enemy:getSprite():showStatus(0xffff00,RPD.textById("torment"))
     RPG.damage(enemy,math.ceil(5 +4*Count.lvl +RPG.magStr()*0.25 + enemy:ht()*(0.05+0.01*Count.lvl)),type,elmnt)
     num = 0
    end
    return damage
    end
}