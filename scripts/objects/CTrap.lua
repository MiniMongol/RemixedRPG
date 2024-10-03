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
      RPG.damage(enemy,RPG.physStr()*(0.2+0.2*Spell.CT),"phys","stab")
      local buff = RPD.affectBuff(enemy,"FastBleeding",Spell.CT+1)
      buff:level(RPG.smartInt(1 + RPG.physStr()*(0.05 + 0.08*Spell.CT)))
      object:remove()
    end
    
  end
}