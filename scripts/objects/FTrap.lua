local storage = require "scripts/lib/storage"
local RPD = require "scripts/lib/commonClasses"
local RPG = require "scripts/lib/Functions"
local object = require "scripts/lib/object"
local a = "placetrap"

return object.init {

  nonPassable = function(self, object)
    return false
  end,
  
  stepOn = function(self, object)
    return true
  end,
  
  bump = function(self, object)
    local hero = RPD.Dungeon.hero
    local cell = object:getPos()
    local enemy = RPD.Actor:findChar(cell)
    local Spell = storage.gameGet(a) or {}
    if enemy and enemy ~= hero then
      RPD.placeBlob(RPD.Blobs.Fire,cell,2)
      local buff = RPD.affectBuff(enemy,"BurningBuff",Spell.FT+1)
    storage.gamePut("burningbuff",{dmg = 3*Spell.FT})
    object:remove()
    end
  end
}