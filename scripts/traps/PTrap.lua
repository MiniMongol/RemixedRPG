---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local trap = require"scripts/lib/trap"

local storage = require "scripts/lib/storage"

local a = "placetrap"

return trap.init(
    function (cell, char, data)
    Spell = storage.gameGet(a) or {}
      local hero = RPD.Dungeon.hero
      local enemy = RPD.Actor:findChar(cell)
      if enemy and enemy ~= hero then
      local buff = RPD.affectBuff(enemy,"PoisonBuff",Spell.PT*2+1)
      buff:level(RPG.AllFast()*(0.3+0.05*Spell.PT))
      end
    end
)
