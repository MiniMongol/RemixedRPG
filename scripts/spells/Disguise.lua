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
local a = "disguise"

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
            image         = 13,
            imageFile     = "spellsIcons/spellicons.png",
            name          = "DisguiseN["..tostring(lvl).." уровень]",
            info          = "DisguiseD",
            magicAffinity = "Combat",
            targetingType = "self",
            level         = 1,
            spellCost     = 5,
            cooldown      = math.max(11-lvl-RPG.spellFast,5-math.ceil(RPG.spellFast/2)),
            castTime      = 1
        }
    end,
    cast = function(self, spell, chr)
    Count = storage.gameGet(a) or {}
    local hero = RPD.Dungeon.hero
    if RPD.Dungeon.hero:lvl() <= 4 then
     RPD.glog("-- LvlLimit")
     return false
    end
    if RPG.subclass ~= nil and RPG.subclass ~= "Bandit" then
      RPD.glog("-- SubclassLimit")
      return false
    end
    if Count.lvl ~= nil then
     lvl = Count.lvl
     exp = Count.exp
     expMax = Count.expMax
     exp = exp+1
    if exp == expMax then
     exp = 0
     expMax = expMax+7
     lvl = lvl+1
     end
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl})
    else
     lvl = 1
     exp = 0
     expMax = 4
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl})
    end
     local duration = 3+2*lvl 

        if hero:visibleEnemies() > 0 then
            RPD.glogn("-- DisguiseLimit")
            return false
        end

        RPD.affectBuff(hero,"DisguiseBuff", duration)
 return true
   end
}
