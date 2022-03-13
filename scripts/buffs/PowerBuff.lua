---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"
local RPG  = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local buff = require "scripts/lib/buff"
local hero = RPD.Dungeon.hero
local depth = RPD.Dungeon.depth

local level
local dmgModifs = {
   FireElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"fire",""}},
   MirrorImage = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   Statue = {mod = 0, dmg = 0, type , element = {"",""}},
   Wraith = {mod = 3, dmg = 0.8, type = {"phys","mag"}, element = {"crush","dark"}},
   Piranha = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"cut","chop"},""}},
   Mimic = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"cut","chop"},""}},
   MimicPie = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"cut","chop"},""}},
   IceElemental = {mod = 3, dmg = 0.2, type = {"mag","phys"}, element = {"ice","stab"}},
   WaterElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"water",""}},
   EarthElemental = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","earth"}},
   AirElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"wind",""}},
   Crystal = {mod = 1, dmg = 5, type = {"","mag"}, element = {"","light"}},
   ArmoredStatue = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   GoldenStatue = {mod = 0, dmg = 0, type = {}, element = {"",""}},
   b= {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   c= {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   
   Rat = {mod = 2, dmg = 2, type = {"phys","mag"}, element = {"cut","poison"}},
   Gnoll = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   Crab = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""}},
   Albino = {mod = 2, dmg = 2, type = {"phys","mag"}, element = {"cut","poison"}},
   Woodlouise = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   Goo = {mod = 3, dmg = 0.5, type = {"phys","mag"}, element = {"crush","poison"}},
   RatKing = {mod = 2, dmg = 4, type = {"phys","mag"}, element = {"cut","poison"}},
   
   Thief = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""}},
   Skeleton = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   Swarm = {mod = 2, dmg = 3, type = {"phys","mag"}, element = {"cut","poison"}}, 
   Shadow = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {"crush","dark"}}, 
   Bandit = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""}},
   Tengu = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""}},
   
   Bat = {mod = 0, dmg = 0, type = {"phys",""}, element = {"cut",""}},
   Brute = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   Shaman = {mod = 0, dmg = 0, type = {"mag",""}, element = {"lightning",""}},
   Spinner = {mod = 1, dmg = 6, type = {"phys","mag"}, element = {"cut","poison"}},
   Shielded = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}}, 
   DM300 = {mod = 2, dmg = 8, type = {"phys","phys"}, element = {"stab","crush"}},
   
   Monk = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}},
   Warlock = {mod = 0, dmg = 0, type = {"mag",""}, element = {"dark",""}},
   Golem = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {"crush","earth"}},
   Senior = {mod = 2, dmg = 5, type = {"phys","phys"}, element = {"crush","stab"}},
   Undead = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","dark"}},
   King = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""}},
   
   Succubus = {mod = 3, dmg = 0.5, type = {"phys","mag"}, element = {{"crush","stab"},"dark"}},
   Eye = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","light"},""}},
   Scorpio = {mod = 3, dmg = 0.2, type = {"phys","mag"}, element = {"stab","poison"}},
   Acidic = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {"stab","poison"}},
   ShadowLord = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","stab"},""}},
   
   SuspiciousRat = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   PseudoRat = {mod = 0, dmg = 0.5, type = {"phys",""}, element = {{"cut","chop"},""}},
   ZombieGnoll = {mod = 2, dmg = 8, type = {"phys","mag"}, element = {"crush","poison"}},
   Worm = {mod = 2, dmg = 12, type = {"phys","mag"}, element = {{"cut","chop"},"poison"}},
   Nightmare = {mod = 0, dmg = 0, type = {"mag",""}, element = {"dark",""}},
   MimicAmulet = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"cut","chop"},""}},
   SpiritOfPain = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"stab","chop"},"dark"}},
   YogsBrain = {mod = 0, dmg = 0, type = {"mag",""}, element = {"lightning",""}},
   YogsEye = {mod = 0, dmg = 0, type = {"mag",""}, element = {"",""}},
   YogsHeart = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   YogsTeeth = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"stab","chop"},""}},
   Larva = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {{"cut","chop"},"poison"}},
  
   SpiderServant = {mod = 1, dmg = 2, type = {"phys","mag"}, element = {{"cut","chop"},"poison"}},
   SpiderGuard = {mod = 1, dmg = 4, type = {"phys","mag"}, element = {{"cut","chop"},"poison"}},
   SpiderExploding = {mod = 0, dmg = 0, type , element = {"",""}},
   SpiderMind = {mod = 0, dmg = 0, type = {"mag",""}, element = {"psy",""}},
   SpiderMindAmber= {mod = 0, dmg = 0, type = {"mag",""}, element = {"psy",""}},
   SpiderNest = {mod = 0, dmg = 0, type , element = {"",""}},
   SpiderEgg = {mod = 0, dmg = 0, type  , element = {"",""}},
   f = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   SpiderQueen = {mod = 2, dmg = 6, type = {"phys","mag"}, element = {{"stab","chop"},"poison"}},
   
   Kobold = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","ice"}},
   KoboldIcemancer= {mod = 0, dmg = 0, type = {"mag",""}, element = {"ice",""}},
   ColdSpirit = {mod = 4, dmg = 0.15, type = {"mag","phys"}, element = {"ice","stab"}},
   IceGuardianCore= {mod = 4, dmg = 0.4, type = {"phys","mag"}, element = {"stab","ice"}},
   IceGuardian = {mod = 4, dmg = 0.4, type = {"phys","mag"}, element = {"stab","ice"}},
   
   DeathKnight = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {{"cut","chop"},"dark"}},
   DreadKnight = {mod = 2, dmg = 6, type = {"phys","mag"}, element = {{"cut","chop"},"dark"}},
   EnslavedSoul = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","chop"},""}},
   ExplodingSkull = {mod = 3, dmg = 0.4, type = {"mag","phys"}, element = {"fire","crush"}},
   JarOfSouls = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   Zombie = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"cut","chop"},"poison"}},
   RunicSkull = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   Lich = {mod = 2, dmg = 5, type = {"mag",""}, element = {{"dark","earth"},"poison"}},
   
   a = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}}
   
   }
   
return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            info          = "",
        }
    end,
    
attackProc = function(self,buff,enemy,damage)
  depth = RPD.Dungeon.depth
  local mobModifs = dmgModifs[buff.target:getMobClassName()]
  local type = mobModifs["type"]
  local element = mobModifs["element"]
  local totalDmg = damage + math.ceil(0.2*depth)
  local mainElement = element[1]
  local addElement = element[2]
  
  if type ~= nil then
  totalDmg = RPG.getDamage(enemy,damage + math.ceil(0.2*depth),type[1],element[1])
  if mobModifs["mod"] == 1 then
    totalDmg = totalDmg-mobModifs["dmg"]
	enemy:getSprite():showStatus(0xffff00,(addElement[1] or addElement).."/"..(addElement[2] or "")..":")
    RPG.damage(enemy,mobModifs["dmg"],type[2],element[2])
	
  elseif mobModifs["mod"] == 2 then
    enemy:getSprite():showStatus(0xffff00,(addElement[1] or addElement).."/"..(addElement[2] or "")..":")
    RPG.damage(enemy,mobModifs["dmg"],type[2],element[2])
    
  elseif mobModifs["mod"] == 3 then
    totalDmg = totalDmg*(1-mobModifs[dmg])
	enemy:getSprite():showStatus(0xffff00,(addElement[1] or addElement).."/"..(addElement[2] or "")..":")
    RPG.damage(enemy,damage*mobModifs["dmg"],type[2],element[2])
	
	elseif mobModifs["mod"] == 4 then
	enemy:getSprite():showStatus(0xffff00,(addElement[1] or addElement).."/"..(addElement[2] or "")..":")
	RPG.damage(enemy,damage*mobModifs["dmg"],type[2],element[2])
	end
  end
  enemy:getSprite():showStatus(0xffff00,(mainElement[1] or mainElement).."/"..(mainElement[2] or "")..":")
  return totalDmg
end,

drBonus = function(self,buff)
  depth = RPD.Dungeon.depth
  return buff.target:dr() + math.ceil(0.5*depth)
end,

speedMultiplier = function(self,buff)
  depth = RPD.Dungeon.depth
  return 1
end
}
