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
    local level = RPD.Dungeon.level
    local enemy = RPD.Actor:findChar(cell)
    local Spell = storage.gameGet(a) or {}
    
    if enemy ~= hero then 
      for i = level:cellX(cell) -Spell.IT, level:cellX(cell) +Spell.IT do
        for j = level:cellY(cell) -Spell.IT, level:cellY(cell) +Spell.IT do
        
          level = RPD.Dungeon.level
          RPD.placePseudoBlob(RPD.PseudoBlobs.Freezing,level:cell(i,j))
          enemy = RPD.Actor:findChar(level:cell(i,j))
          
        if enemy and enemy ~= hero then
          RPG.damage(enemy,RPG.smartInt(1 + RPG.magStr()*(0.75 + 0.25*Spell.IT)),"magic","ice")
          end
          
        end
      end
      object:remove()
    end
    
  end
}