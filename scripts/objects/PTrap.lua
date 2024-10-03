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
    local pDmg = RPG.AllFast()*(0.3+0.05*Spell.PT)
    
    if enemy and enemy ~= hero then
      local buff = RPD.affectBuff(enemy,"PoisonBuff",Spell.PT*2+1)
      buff:level(pDmg)
      object:remove()
    end
    
  end
}