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
    local level = RPD.Dungeon.level
    local x = level:cellX(cell)
    local y = level:cellY(cell)
    local Spell = storage.gameGet(a) or {}
    
    if enemy ~= hero then
      for i = x -1, x +1 do
        for j = y -1, y +1 do
          level = RPD.Dungeon.level
          enemy = RPD.Actor:findChar(level:cell(i,j))
          
          if enemy and enemy ~= hero then
            if level:cell(i,j) == cell then
              RPG.damage(enemy,RPG.smartInt(5 + RPG.physStr()*(0.4+0.15*Spell.BT)),"phys",{"fire","crush"})
              else
              RPG.damage(enemy,RPG.smartInt(5 + RPG.physStr()*(0.25+0.1*Spell.BT)),"phys",{"fire","crush"})
            end
          end
          
        end
      end
      object:remove()
    end
    
  end
}