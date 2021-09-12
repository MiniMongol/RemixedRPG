---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"
local buff = require "scripts/lib/buff"

local hero = RPD.Dungeon.hero





return buff.init{
    desc  = function ()
      local int = storage.gameGet("burningbuff") or {}
        return {
            icon          = -1,
            name          = "",
            info          = "",
            data          =
            {
            dmg = int.dmg
            }
        }
    end,
    
    charAct = function(self,buff)
      local data = self:desc().data
      RPD.glog(data.dmg)
      buff.target:damage(math.ceil(data.dmg*(1+math.min((buff:level() +buff:level()%2)*0.05,0.3)) ),RPD.Dungeon.hero)
    end
}