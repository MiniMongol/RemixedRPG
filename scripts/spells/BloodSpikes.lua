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
local a = "bloodspikes"
local enemyId_1
local enemyId_2
local bloodPoison
local staks

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
            image         = 8,
            imageFile     = "spellsIcons/spellicons.png",
            name          = "BloodSpikesN["..tostring(lvl).." уровень]",
            info          = "BloodSpikesD",
            magicAffinity = "Combat",
            targetingType = "cell",
            level         = 1,
            spellCost     = 5,
            cooldown      = 2,
            castTime      = 1
        }
    end,
    castOnCell = function(self, spell, chr, cell)
    local hero = RPD.Dungeon.hero
    local level = RPD.Dungeon.level
    Count = storage.gameGet(a) or {}
    
    if RPD.Dungeon.hero:lvl() <= 4 then
     RPD.glog("-- LvlLimit")
     return false
    end
    if RPG.subclass ~= nil and RPG.subclass ~= "Demonologist" then
      RPD.glog("-- SubclassLimit")
      return false
    end
    
    if Count.lvl ~= nil then
     lvl = Count.lvl
     exp = Count.exp
     expMax = Count.expMax
     staks = Count.staks
     bloodPoison = Count.bp
     if RPG.distance(cell) >= lvl+1 then
      RPD.glog("** DistanceLimit")
      return false
     else
     cost = math.ceil(lvl*1.5 + RPG.distance(cell) + hero:ht()*0.1)
     if hero:hp() > cost then
        hero:damage(cost,hero)
     else
        RPD.glog("-- HpLimit")
        return false
      end
      RPD.playSound("snd_blood_spikes.wav")
      RPD.topEffect(cell,"blood_spikes_top")
      RPD.bottomEffect(cell,"blood_spikes_bot")
      exp = exp+1
     end
    if exp == expMax then
     exp = 0
     expMax = expMax+10
     lvl = lvl+1
     end
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl, bp = bloodPoison, staks = staks})
    else
     lvl = 1
     exp = 0
     expMax = 4
     bloodPoison = 0
     staks = 0
     storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl, bp = bloodPoison, staks = staks})
    end
    local enemy = RPD.Actor:findChar(cell)
    
    if enemy and enemy ~= hero then
     enemyId_1 = enemy:getId()
    end

    if enemyId_1 == enemyId_2 and enemy and enemy ~= hero then
    enemyId_1 = nil
    RPD.topEffect(cell,"blood_spikes_sp_top")
    RPD.bottomEffect(cell,"blood_spikes_sp_bot")
     local x = level:cellX(enemy:getPos())
     local y = level:cellY(enemy:getPos())
     
     for i = x-1,x+1 do
      for j = y-1,y+1 do
       local pos = level:cell(i,j)
       local enemy2 = RPD.Actor:findChar(pos)
       if enemy2 and enemy2 ~= hero and enemy2 ~= enemy then
       
        enemy2:damage(math.ceil(RPG.magStr()*0.1 + hero:ht()*0.15) + lvl, hero)
        RPD.affectBuff(enemy2,"BloodMark", 3)
       end
      end
     end
    end
    
     enemyId_2 = enemyId_1
    if enemy and enemy ~= RPD.Dungeon.hero then
     enemy:damage(math.ceil(RPG.magStr()*0.2 + hero:ht()*0.25) + lvl ,hero)
     RPD.affectBuff(enemy,"BloodMark", 3)
     if enemy:hp() <= 0 then
      hero:heal(RPG.magStr()*0.2 + enemy:ht()*0.15 + 1.5*lvl,hero)
      RPD.Sfx.CellEmitter:get(hero:getPos()):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.HEALING ), 3)
      if tonumber(staks) ~= 5 then
        staks = tonumber(staks) + 1
      end
      
       bloodPoison = math.ceil(hero:ht()*(0.05 + 0.1*staks))
       hero:ht(hero:ht()-bloodPoison)
       if hero:hp() >= hero:ht() then
        hero:hp(hero:ht())
       end
       
      RPD.removeBuff(hero,"BloodPoisoning")
      RPD.affectBuff(hero,"BloodPoisoning",15+5*staks)
      storage.gamePut(a,{exp = exp, expMax = expMax, lvl = lvl, bp = bloodPoison, staks = staks})
     end
    end
    
  return true
   end
}
