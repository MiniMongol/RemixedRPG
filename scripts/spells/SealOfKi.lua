---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local spell = require "scripts/lib/spell"

local storage = require "scripts/lib/storage"

local lvl
local expMax
local exp
local a = "sealofki"

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
            image         = 14,
            imageFile     = "spellsIcons/spellicons.png",
            name          = "SealOfKiN ["..tostring(lvl).." уровень]",
            info          = "SealOfKiD",
            magicAffinity = "Combat",
            targetingType = "cell",
            level         = 1,
            spellCost     = 15,
            cooldown      = math.max(21-lvl-RPG.spellFast,12-math.ceil(RPG.spellFast/2)),
            castTime      = 1
        }
    end,
    castOnCell = function(self, spell, chr, cell)
    if RPD.Dungeon.hero:lvl() <= 4 then
     RPD.glog("-- LvlLimit")
     return false
    end
    if RPG.subclass ~= nil and RPG.subclass ~= "Ninja" and RPG.subclass ~= "Necromancer" then
      RPD.glog("-- SubclassLimit")
      return false
    end
    
    Count = storage.gameGet(a) or {}
    if Count.lvl ~= nil then
     lvl = Count.lvl
     exp = Count.exp
     expMax = Count.expMax
     exp = exp+1
    if exp == expMax then
     exp = 0
     expMax = expMax+6
     lvl = lvl+1
     end
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl})
    else
     lvl = 1
     exp = 0
     expMax = 4
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl})
    end
    local enemy = RPD.Actor:findChar(cell)
    
    if enemy and enemy ~= RPD.Dungeon.hero and enemy:buffLevel("KiMark") == 1 then
      RPD.affectBuff(RPD.Dungeon.hero, RPD.Buffs.Invisibility, 4)
    end
    
    if enemy == RPD.Dungeon.hero then
       RPD.affectBuff(RPD.Dungeon.hero,"SealShield",2+lvl)
    else
      pos = RPD.Ballistica:cast(RPD.Dungeon.hero:getPos(),cell,true,true,true)
      enemy = RPD.Actor:findChar(pos)
      RPD.zapEffect(RPD.Dungeon.hero:getPos(),pos,"Seal")
      if enemy and enemy ~= RPD.Dungeon.hero then
        enemy:damage(math.ceil(RPG.magStr()*0.4 + 0.5*lvl),RPD.Dungeon.hero)
        RPD.affectBuff(enemy,"KiMark",4)
     end
   end
   
 return true
   end
}
