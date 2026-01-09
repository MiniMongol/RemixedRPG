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
local noModifs = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}, loot = {}, chance = {} }

local dmgModifs = {
  Voidbeast = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""},loot ={"materials/GnollSkin"}, chance ={30}},
   BoneGolem_lvl1 = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}, loot ={}, chance ={}},
   BoneGolem_lvl2 = {mod = 1, dmg = 5, type = {"phys","phys"}, element = {"crush","dark"}, loot ={}, chance ={}},
   BoneGolem_lvl3 = {mod = 3, dmg = 0.25, type = {"phys","phys"}, element = {"crush","dark"}, loot ={}, chance ={}},
   FireElemental = {mod = 3, dmg = 0, type = {"mag",""}, element = {"fire","" }, loot ={"materials/FireElmntCore"}, chance ={20} },
   MirrorImage = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""}, loot ={}, chance ={}},
   Statue = {mod = 0, dmg = 0, type={"phys",""}, element = {"",""}, loot ={}, chance ={}},
   Wraith = {mod = 3, dmg = 0.8, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   Piranha = {mod = 0, dmg = 0, type = {"phys",""}, element = { {"cut","chop"} ,""},loot ={}, chance ={}},
   Mimic = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""},loot ={}, chance ={}},
   MimicPie = {mod = 0, dmg = 0, type = {"phys",""}, element = { {"cut","chop"},""},loot ={}, chance ={}},
   IceElemental = {mod = 3, dmg = 0.2, type = {"mag","phys"}, element = {"ice","stab"},loot ={"materials/IceElmntCore"}, chance ={20}},
   WaterElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"water",""},loot ={"materials/WaterElmntCore"}, chance ={20}},
   EarthElemental = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","earth"},loot ={"materials/EarthElmntCore"}, chance ={20}},
   AirElemental = {mod = 0, dmg = 0, type = {"mag",""}, element = {"wind",""},loot ={"materials/WindElmntCore"}, chance ={20}},
   Crystal = {mod = 1, dmg = 5, type = {"","mag"}, element = {"","light"}, loot ={}, chance ={}},
   ArmoredStatue = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={}, chance ={}},
   GoldenStatue = {mod = 0, dmg = 0, type = {}, element = {"",""},loot ={}, chance ={}},
   FetidRat = {mod = 2, dmg = 3, type = {"phys","mag"}, element = {"cut","poison"},loot ={}, chance ={}},
   b= {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   c= {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   
   Rat = {mod = 2, dmg = 2, type = {"phys","mag"}, element = {"cut","poison"},loot ={"materials/RatClaw"}, chance ={30}},
   Gnoll = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/GnollSkin"}, chance ={30}},
   Crab = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""},loot ={"materials/CrabClaw"}, chance ={30}},
   Albino = {mod = 2, dmg = 2, type = {"phys","mag"}, element = {"cut","poison"},loot ={"materials/AlbinoFang"}, chance ={50}},
   Woodlouise = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/WoodlouiseCarapace"}, chance ={30}},
   Goo = {mod = 3, dmg = 0.5, type = {"phys","mag"}, element = {"crush","poison"},loot ={"materials/PieceOfGoo"}, chance ={20}},
   RatKing = {mod = 2, dmg = 4, type = {"phys","mag"}, element = {"cut","poison"},loot ={}, chance ={}},
   
   Thief = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""},loot ={"materials/PieceOfDagger"}, chance ={30}},
   Skeleton = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/SkeletonBone"}, chance ={60}},
   Swarm = {mod = 2, dmg = 3, type = {"phys","mag"}, element = {"cut","poison"},loot ={}, chance ={}}, 
   Shadow = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}}, 
   Bandit = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""},loot ={"materials/PieceOfDoug"}, chance ={50}},
   Tengu = {mod = 0, dmg = 0, type = {"phys",""}, element = {"stab",""},loot ={"materials/OldKunai"}, chance ={20}},
   
   Bat = {mod = 0, dmg = 0, type = {"phys",""}, element = {"cut",""},loot ={"materials/BatWing"}, chance ={40}},
   Brute = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/BruteSkin"}, chance ={40}},
   Shaman = {mod = 0, dmg = 0, type = {"mag",""}, element = {"lightning",""},loot ={"materials/ShamanMask"}, chance ={40}},
   Spinner = {mod = 1, dmg = 6, type = {"phys","mag"}, element = {"cut","poison"},loot ={"materials/SpiderFang"}, chance ={40}},
   Shielded = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/PieceOfShield"}, chance ={50}}, 
   DM300 = {mod = 2, dmg = 8, type = {"phys","phys"}, element = {"stab","crush"},loot ={"materials/PieceOfDM300"}, chance ={20}},
   
   Monk = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={"materials/MonkTooth"}, chance ={40}},
   Warlock = {mod = 0, dmg = 0, type = {"mag",""}, element = {"dark",""},loot ={"materials/WispOfBeard"}, chance ={40}},
   Golem = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {"crush","earth"},loot ={"materials/PieceOfGolemCore"}, chance ={20}},
   Senior = {mod = 2, dmg = 5, type = {"phys","phys"}, element = {"crush","stab"},loot ={"materials/MentorTooth"}, chance ={40}},
   Undead = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   King = {mod = 0, dmg = 0, type = {"phys",""}, element = {"chop",""},loot ={"materials/KingCrown"}, chance ={20}},
   
   Succubus = {mod = 3, dmg = 0.5, type = {"phys","mag"}, element = {{"crush","stab"},"dark"},loot ={}, chance ={}},
   Eye = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","light"},""},loot ={"materials/EyeLens"}, chance ={20}},
   Scorpio = {mod = 3, dmg = 0.2, type = {"phys","mag"}, element = {"stab","poison"},loot ={"materials/ScorpionSting"}, chance ={30}},
   Acidic = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {"stab","poison"},loot ={"materials/AcidicSting"}, chance ={50}},
   ShadowLord = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","stab"},""},loot ={"materials/PieceOFShadowLord"}, chance ={20}},
   
   SuspiciousRat = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   PseudoRat = {mod = 0, dmg = 0.5, type = {"phys",""}, element = {{"cut","chop"},""},loot ={"materials/PseudoRatFang"}, chance ={20}},
   ZombieGnoll = {mod = 2, dmg = 8, type = {"phys","mag"}, element = {"crush","poison"},loot ={"materials/ZombieGnollMeat"}, chance ={30}},
   Worm = {mod = 2, dmg = 12, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/WormLeather"}, chance ={30}},
   TreacherousSpirit = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"stab","chop"},"dark"},loot ={}, chance ={}},
   Nightmare = {mod = 0, dmg = 0, type = {"mag",""}, element = {"dark",""},loot ={}, chance ={}},
   MimicAmulet = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"cut","chop"},""},loot ={}, chance ={}},
   SpiritOfPain = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"stab","chop"},"dark"},loot ={}, chance ={}},
   YogsBrain = {mod = 0, dmg = 0, type = {"mag",""}, element = {"lightning",""},loot ={}, chance ={}},
   YogsEye = {mod = 1, dmg = 1, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   Yog  = {mod = 1, dmg = 1, type = {"phys","mag"}, element = {"crush","dark"},loot ={}, chance ={}},
   YogsHeart = {mod = 0, dmg = 0, type = {"phys",""}, element = {"crush",""},loot ={}, chance ={}},
   YogsTeeth = {mod = 0, dmg = 0, type = {"phys",""}, element = {{"stab","chop"},""},loot ={}, chance ={}},
   BurningFist = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {"crush","fire" }, loot ={}, chance ={} },
   RottingFist  = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {"crush","poison"},loot ={}, chance ={}},
   Larva = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={}, chance ={}},
  
   SpiderServant = {mod = 1, dmg = 2, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/SpiderCarapace"}, chance ={40}},
   SpiderGuard = {mod = 1, dmg = 4, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/EliteSpiderCarapace"}, chance ={40}},
   SpiderExploding = {mod = 1, dmg = 4, type={"phys","mag"} , element = {"chop","earth"},loot ={}, chance ={}},
   SpiderMind = {mod = 0, dmg = 0, type = {"mag",""}, element = {"psy",""},loot ={}, chance ={}},
   SpiderMindAmber= {mod = 0, dmg = 0, type = {"mag",""}, element = {"psy",""},loot ={}, chance ={}},
   SpiderNest = {mod = 0, dmg = 0, type = {} , element = {"",""},loot ={}, chance ={}},
   SpiderEgg = {mod = 0, dmg = 0, type = {} , element = {"",""},loot ={}, chance ={}},
   f = {mod = 0, dmg = 0, type = {"",""}, element = {"",""}},
   SpiderQueen = {mod = 2, dmg = 6, type = {"phys","mag"}, element = {{"stab","chop"},"poison"},loot ={"materials/SpiderQueenMandible"}, chance ={20}},
   
   Kobold = {mod = 2, dmg = 5, type = {"phys","mag"}, element = {"crush","ice"},loot ={"materials/KoboldSkin"}, chance ={40}},
   KoboldIcemancer= {mod = 0, dmg = 0, type = {"mag",""}, element = {"ice",""},loot ={"materials/IcemancerEye"}, chance ={40}},
   ColdSpirit = {mod = 4, dmg = 0.30, type = {"mag","phys"}, element = {"ice","stab"},loot ={"materials/MagicSnow"}, chance ={40}},
   IceGuardianCore= {mod = 4, dmg = 0.4, type = {"phys","mag"}, element = {"stab","ice"},loot ={"materials/IceElmntCore"}, chance ={50}},
   IceGuardian = {mod = 4, dmg = 0.4, type = {"phys","mag"}, element = {"stab","ice"},loot ={"materials/IceGuardianCore"}, chance ={20}},
   
   DeathKnight = {mod = 1, dmg = 5, type = {"phys","mag"}, element = {{"cut","chop"},"dark"},loot ={"materials/DeathKnightSpaulder"}, chance ={40}},
   DreadKnight = {mod = 2, dmg = 6, type = {"phys","mag"}, element = {{"cut","chop"},"dark"},loot ={"materials/DreadKnightSpaulder"}, chance ={40}},
   EnslavedSoul = {mod = 0, dmg = 0, type = {"mag",""}, element = {{"dark","chop"},""},loot ={"materials/SoulEctoplasm"}, chance ={40}},
   ExplodingSkull = {mod = 3, dmg = 0.4, type = {"mag","phys"}, element = {"fire","crush"},loot ={"materials/SkullSharps"}, chance ={25}},
   JarOfSouls = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   Zombie = {mod = 4, dmg = 0.2, type = {"phys","mag"}, element = {{"cut","chop"},"poison"},loot ={"materials/ZombieFinger"}, chance ={40}},
   RunicSkull = {mod = 0, dmg = 0, type = {"",""}, element = {"",""},loot ={}, chance ={}},
   Lich = {mod = 2, dmg = 5, type = {"mag",""}, element = {{"dark","earth"},"poison"},loot ={"materials/LichBone"}, chance ={20}},
   
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
  local bossLvl = 0
  if depth % 5 == 0 then
    bossLvl = depth/5
  end
  
  local totalDmg = damage + RPG.smartInt(-1 +0.25*depth +2*bossLvl)

  local mobModifs = dmgModifs[buff.target:getMobClassName()] or noModifs
  RPD.glog(buff.target:getMobClassName())

  --don't crash if no modifier defined
  --if not mobModifs then
  --  return totalDmg
  --end

  local type = mobModifs["type"]
  local element = mobModifs["element"]

  local mainElement = element[1]
  local addElement = element[2]
  
  if type ~= nil then
    totalDmg = RPG.getDamage(enemy,totalDmg,type[1],element[1])
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

  RPG.dmgText(type[1],mainElement,enemy)
  return totalDmg
end,

drBonus = function(self,buff)
  depth = RPD.Dungeon.depth
  return buff.target:dr() + math.ceil(-1 + 0.25*depth +2*(depth%5))
end,

detach = function(self,buff) 
  local pos = buff.target:getPos() 
  local mobModifs = dmgModifs[buff.target:getMobClassName()]
  local level = RPD.Dungeon.level
  local loot = mobModifs["loot"] or ""
  local chance = mobModifs["chance"]
  local countOfLoot
  if loot ~= nil then
    countOfLoot = #loot 
  else 
    countOfLoot = 0
  end
  if countOfLoot ~= 0 then
    for i = 1, countOfLoot do
      local lootRan = math.random(1,200)
      if lootRan <= chance[i]+RPG.AllLuck()*0.25 then
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
