---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local spell = require "scripts/lib/spell"

local storage = require "scripts/lib/storage"

local event = require "event"

local lvl
local expMax
local exp
local a = "chop"

return spell.init{
    desc  = function ()
    local Count = storage.gameGet(a) or {}

     if Count.lvl == nil then
  lvl = 1
  else
   if lvl == nil then
    lvl = Count.lvl
   end
  end
        return {
            image         = 3,
            imageFile     = "spellsIcons/spellicons.png",
            name          = RPD.textById("ChopN").." ["..tostring(lvl).." "..RPD.textById("Lvl").."]",
            info          = "ChopD",
            magicAffinity = "Combat",
            targetingType = "self",
            level         = 1,
            spellCost     = 2,
            cooldown      = math.max(21-lvl,18),
            castTime      = 0
        }
    end,
    
    function f()
      RPD.glog("1")
    end,
    
    cast = function(self, spell, chr, cell)
    Count = storage.gameGet(a) or {}
    if Count.lvl ~= nil then
     lvl = Count.lvl
     exp = Count.exp
     expMax = Count.expMax
     exp = exp+1
    if exp == expMax then
     exp = 0
     expMax = expMax+8
     lvl = lvl+1
     end
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl})
    else
     lvl = 1
     exp = 0
     expMax = 6
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl})
    end
    local t = event.timer(10,f,2)
    RPD.removeBuff(RPD.Dungeon.hero,"ChopBuff")
    RPD.permanentBuff(RPD.Dungeon.hero, "ChopBuff")
 return true
   end
}
