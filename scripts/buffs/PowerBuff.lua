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
   FireElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"fire","" }, loot ={"materials/FireElmntCore"}, chance ={10} },
   MirrorImage = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}, loot ={}, chance ={}},
   Statue = {mod = 0, dmg = 0, type , element = {"",""}, loot ={}, chance ={}},
   Wraith = {mod = 3, dmg = 0.8, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   Piranha = {mod = 0, dmg = 0, type = {"phys",""}, element = { {"cut","chop"} ,""},loot ={}, chance ={}},
   Mimic = {mod = 0, dmg = 0, type = {"phys",""}, element = { {"cut","chop"},""},loot ={}, chance ={}},
   MimicPie = {mod = 0, dmg = 0, type = {"phys",""}, element = { {"cut","chop"},""},loot ={}, chance ={}},
   IceElemental = {mod = 3, dmg = 0.2, type = {"mag","phys"}, element = {"ice","stab"},loot ={"materials/IceElmntCore"}, chance ={10}},
   WaterElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"water",""},loot ={"materials/WaterElmntCore"}, chance ={10}},
   EarthElemental = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","earth"},loot ={"materials/EarthElmntCore"}, chance ={10}},
   AirElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"wind",""},loot ={"materials/AirElmntCore"}, chance ={10}},
   Crystal = {mod = 1, dmg = 5, type = {"","mag"}, element = {"","light"}, loot ={}, chance ={}},
   ArmoredStatue = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={}, chance ={}},
   GoldenStatue = {mod = 0, dmg = 0, type = {}, element = {"",""},loot ={}, chance ={}},
   FetidRat = {mod = 2, dmg = 3, type = {"phys","mag"}, element = {"cut","poison"},loot ={}, chance ={}},
   b= {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   c= {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   
   Rat = {mod = 2, dmg = 2, type = {"phys","mag"}, element = {"cut","poison"},loot ={"materials/RatClaw"}, chance ={20}},
   Gnoll = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/GnollSkin"}, chance ={15}},
   Crab = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""},loot ={"materials/CrabClaw"}, chance ={15}},
   Albino = {mod = 2, dmg = 2, type = {"phys","mag"}, element = {"cut","poison"},loot ={"materials/AlbinoFang"}, chance ={50}},
   Woodlouise = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/WoodlouiseCarapace"}, chance ={15}},
   Goo = {mod = 3, dmg = 0.5, type = {"phys","mag"}, element = {"crush","poison"},loot ={"materials/PieceOfGoo"}, chance ={0.05}},
   RatKing = {mod = 2, dmg = 4, type = {"phys","mag"}, element = {"cut","poison"},loot ={}, chance ={}},
   
   Thief = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""},loot ={"materials/PieceOfDagger"}, chance ={15}},
   Skeleton = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/SkeletonBone"}, chance ={35}},
   Swarm = {mod = 2, dmg = 3, type = {"phys","mag"}, element = {"cut","poison"},loot ={}, chance ={}}, 
   Shadow = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}}, 
   Bandit = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""},loot ={"materials/PieceOfDoug"}, chance ={50}},
   Tengu = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""},loot ={"materials/OldKunai"}, chance ={0.05}},
   
   Bat = {mod = 0, dmg = 0, type = {"phys",""}, element = {"cut",""},loot ={"materials/BatWing"}, chance ={20}},
   Brute = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/BruteSkin"}, chance ={20}},
   Shaman = {mod = 0, dmg = 0, type = {"mag",""}, element = {"lightning",""},loot ={"materials/ShamanMask"}, chance ={20}},
   Spinner = {mod = 1, dmg = 6, type = {"phys","mag"}, element = {"cut","poison"},loot ={"materials/SpiderFang"}, chance ={20}},
   Shielded = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/PieceOfShield"}, chance ={50}}, 
   DM300 = {mod = 2, dmg = 8, type = {"phys","phys"}, element = {"stab","crush"},loot ={"materials/PieceOfDM300"}, chance ={0.05}},
   
   Monk = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/MonkTooth"}, chance ={20}},
   Warlock = {mod = 0, dmg = 0, type = {"mag",""}, element = {"dark",""},loot ={"materials/WispOfBeard"}, chance ={20}},
   Golem = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {"crush","earth"},loot ={"materials/PieceOfGolemCore"}, chance ={10}},
   Senior = {mod = 2, dmg = 5, type = {"phys","phys"}, element = {"crush","stab"},loot ={"materials/MentorTooth"}, chance ={40}},
   Undead = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   King = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""},loot ={"materials/KingCrown"}, chance ={0.05}},
   
   Succubus = {mod = 3, dmg = 0.5, type = {"phys","mag"}, element = {{"crush","stab"},"dark"},loot ={}, chance ={}},
   Eye = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","light"},""},loot ={"materials/EyeLens"}, chance ={10}},
   Scorpio = {mod = 3, dmg = 0.2, type = {"phys","mag"}, element = {"stab","poison"},loot ={"materials/ScorpionSting"}, chance ={15}},
   Acidic = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {"stab","poison"},loot ={"materials/AcidicSting"}, chance ={50}},
   ShadowLord = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","stab"},""},loot ={"materials/PieceOFShadowLord"}, chance ={0.05}},
   
   SuspiciousRat = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   PseudoRat = {mod = 0, dmg = 0.5, type = {"phys",""}, element = {{"cut","chop"},""},loot ={"materials/PseudoRatFang"}, chance ={10}},
   ZombieGnoll = {mod = 2, dmg = 8, type = {"phys","mag"}, element = {"crush","poison"},loot ={"materials/ZombieGnollMeat"}, chance ={15}},
   Worm = {mod = 2, dmg = 12, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/WormLeather"}, chance ={15}},
   TreacherousSpirit = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"stab","chop"},"dark"},loot ={}, chance ={}},
   Nightmare = {mod = 0, dmg = 0, type = {"mag",""}, element = {"dark",""},loot ={}, chance ={}},
   MimicAmulet = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"cut","chop"},""},loot ={}, chance ={}},
   SpiritOfPain = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"stab","chop"},"dark"},loot ={}, chance ={}},
   YogsBrain = {mod = 0, dmg = 0, type = {"mag",""}, element = {"lightning",""},loot ={}, chance ={}},
   YogsEye = {mod = 1, dmg = 1, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   Yog  = {mod = 1, dmg = 1, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   YogsHeart = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   YogsTeeth = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"stab","chop"},""},loot ={}, chance ={}},
   Larva = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={}, chance ={}},
  
   SpiderServant = {mod = 1, dmg = 2, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/SpiderCarapace"}, chance ={20}},
   SpiderGuard = {mod = 1, dmg = 4, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/EliteSpiderCarapace"}, chance ={40}},
   SpiderExploding = {mod = 2, dmg = 4, type={"mag",""} , element = {"earth",""},loot ={}, chance ={}},
   SpiderMind = {mod = 0, dmg = 0, type = {"mag",""}, element = {"psy",""},loot ={}, chance ={}},
   SpiderMindAmber= {mod = 0, dmg = 0, type = {"mag",""}, element = {"psy",""},loot ={}, chance ={}},
   SpiderNest = {mod = 0, dmg = 0, type , element = {"",""},loot ={}, chance ={}},
   SpiderEgg = {mod = 0, dmg = 0, type  , element = {"",""},loot ={}, chance ={}},
   f = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   SpiderQueen = {mod = 2, dmg = 6, type = {"phys","mag"}, element = {{"stab","chop"},"poison"},loot ={"materials/SpiderQueenMandible"}, chance ={0.05}},
   
   Kobold = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","ice"},loot ={"materials/KoboldSkin"}, chance ={20}},
   KoboldIcemancer= {mod = 0, dmg = 0, type = {"mag",""}, element = {"ice",""},loot ={"materials/IcemancerEye"}, chance ={20}},
   ColdSpirit = {mod = 4, dmg = 0.15, type = {"mag","phys"}, element = {"ice","stab"},loot ={"materials/MagicSnow"}, chance ={20}},
   IceGuardianCore= {mod = 4, dmg = 0.4, type = {"phys","mag"}, element = {"stab","ice"},loot ={"materials/IceElmntCore"}, chance ={50}},
   IceGuardian = {mod = 4, dmg = 0.4, type = {"phys","mag"}, element = {"stab","ice"},loot ={"materials/IceGuardianCore"}, chance ={0.05}},
   
   DeathKnight = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {{"cut","chop"},"dark"},loot ={"materials/DeathKnightSpaulder"}, chance ={20}},
   DreadKnight = {mod = 2, dmg = 6, type = {"phys","mag"}, element = {{"cut","chop"},"dark"},loot ={"materials/DreadKnightSpaulder"}, chance ={20}},
   EnslavedSoul = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","chop"},""},loot ={"materials/Ectoplasm"}, chance ={20}},
   ExplodingSkull = {mod = 3, dmg = 0.4, type = {"mag","phys"}, element = {"fire","crush"},loot ={"PiecesOfSkull"}, chance ={25}},
   JarOfSouls = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   Zombie = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/ZombieFinger"}, chance ={20}},
   RunicSkull = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   Lich = {mod = 2, dmg = 5, type = {"mag",""}, element = {{"dark","earth"},"poison"},loot ={"materials/LichBone"}, chance ={0.05}},
   
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
  local totalDmg = damage + RPG.smartInt(0.2*depth)
  local mainElement = element[1]
  local addElement = element[2]
  
  if type ~= nil then
  totalDmg = RPG.getDamage(enemy,damage + RPG.smartInt(0.2*depth),type[1],element[1])
  if mobModifs["mod"] == 1 then
    totalDmg = totalDmg-mobModifs["dmg"]
    RPG.damage(enemy,mobModifs["dmg"],type[2],element[2])
	
  elseif mobModifs["mod"] == 2 then
    RPG.damage(enemy,mobModifs["dmg"],type[2],element[2])
    
  elseif mobModifs["mod"] == 3 then
    totalDmg = totalDmg*(1-mobModifs["dmg"])
    RPG.damage(enemy,damage*mobModifs["dmg"],type[2],element[2])
	
	elseif mobModifs["mod"] == 4 then
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

detach = function(self,buff) 
  local pos = buff.target:getPos() 
  local mobModifs = dmgModifs[buff.target:getMobClassName()]
  local level = RPD.Dungeon.level
  local loot = mobModifs["loot"]
  local chance = mobModifs["chance"]
  local countOfLoot
  if loot ~= nil then
    countOfLoot = #loot 
  else 
    countOfLoot = 0
  end
  if countOfLoot ~= 0 then
    for i = 1, countOfLoot do
      local lootRan = math.random(1,100)
      if lootRan <= chance[i] then
        level:drop(RPD.ItemFactory:itemByName(loot[i]), pos)
      end
    end 
  end
end,

speedMultiplier = function(self,buff)
  depth = RPD.Dungeon.depth
  return 1
end
}
