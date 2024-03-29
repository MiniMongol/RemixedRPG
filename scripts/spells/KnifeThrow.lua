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
local a = "knifethrow"
local type ="phys"
local elmnt ="stab"

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
            image         = 29,
            imageFile     = "spellsIcons/spellicons.png",
            name          = RPD.textById("KnifeThrowN").." ["..tostring(lvl).." "..RPD.textById("Lvl").."]",
            info          = "KnifeThrowD",
            magicAffinity = "Combat",
            targetingType = "cell",
            level         = 1,
            spellCost     = 3,
            cooldown      = math.max(11-lvl-RPG.spellFast,5-math.ceil(RPG.spellFast/2)),
            castTime      = 1
        }
    end,
    castOnCell = function(self, spell, chr, cell)
     if RPD.Dungeon.hero:lvl() <= 4 then
     RPD.glog(RPD.textById("LvlLimit"))
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
      pos = RPD.Ballistica:cast(RPD.Dungeon.hero:getPos(),cell,true,true,true)
      enemy = RPD.Actor:findChar(pos)
      RPD.zapEffect(RPD.Dungeon.hero:getPos(),pos,"ThrowingKnife")
      if enemy and enemy ~= RPD.Dungeon.hero then
        RPG.damage(enemy,math.ceil(RPG.physStr()*0.1 + 0.05*lvl),type,elmnt)
        local poison = RPD.affectBuff(enemy, "PoisonBuff",RPG.smartInt(RPG.AllFast()*0.3 + 0.5*lvl))
        poison:level(RPG.physStr()*0.1)
        RPD.affectBuff(enemy, RPD.Buffs.Paralysis, 4)
     end
 return true
   end
}
