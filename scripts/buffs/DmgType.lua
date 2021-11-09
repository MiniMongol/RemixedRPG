---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"

local hero = RPD.Dungeon.hero
local buff = require "scripts/lib/buff"

local dmgModifs = defence = {
   FireElemental = {magDef = 15, fire=2, water=0.8, ice=0.5, earth, wind=0.9, lighting=1.1, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush=0.8},
   Statue = {magDef=10, fire, water, earth, wind=0.8, lighting=1.5, poison, light, dark, cut=1.5, cutstab=1.2, chop, stab=0.85, chopstab=0.95, crush=0.7},
   Wraith = {magDef=5, fire, water, earth, wind=0.9, lighting=0.7,  crush=1.5},
   Piranha = {magDef=10, fire=0.5, water=1.5, earth=0.9, wind=0.9, lighting=0.5, poison=0.8, light, dark, cut, cutstab=0.9, chop=0.9, stab=0.8, chopstab=0.85, crush=0.9},
   Mimic = {magDef = 15, fire=0.9, water, earth, wind, lighting=0.8, poison=0.8, light=0.5, dark, cut=1.3, cutstab, chop, stab=0.8, chopstab=0.9, crush},
   MimicPie = {magDef=10, fire=0.8, water=0.9, earth=0.7, wind, lighting=0.9, poison=0.8, light=0.5, dark, cut=0.5, cutstab=0.6, chop=0.5, stab=0.7, chopstab=0.6, crush=0.8},
   IceElemental = {magDef=15, fire=0.5, water=1.3, earth=1.2, wind=0.9, lighting=0.9, poison=1.5, light=1.5, dark=0.8, cut=1.2, cutstab=0.8, chop=0.8, stab=0.6, chopstab=0.7, crush=0.9},
   WaterElemental = {magDef=15, fire=0.8, water=1.5, earth=1.2, wind=1.2, lighting=0.5, poison=0.8, light=1.2, dark=0.8, cut=1.5, cutstab, chop=1.1, stab=1.5, chopstab=1.3, crush=1.1},
   EarthElemental = {magDef=15, fire=1.2, water=0.5, earth=1.5, wind=0.8, lighting=1.5, poison=0.8, light=1.2, dark, cut=1.1, cutstab, chop=0.9, stab=0.8, chopstab=0.85, crush=1.1},
   AirElemental = {magDef=15, fire=0.8, water=1.5, earth=1.2, wind=1.5, lighting=0.6, poison=0.9, light=1.5, dark, cut=1.5, cutstab=1.5, chop=1.2, stab=1.5, chopstab=1.3, crush=0.9},
   Crystal = {magDef=15, fire=1.2, water=0.8, earth=1.5, wind=0.8, lighting, poison=1.5, light=1.5, dark, cut=1.2, cutstab=0.8, chop=0.7, stab=0.5, chopstab=0.6, crush=0.5},
   ArmoredStatue = {magDef=15, fire=1.5, water=0.8, earth=1.5, wind=0.8, lighting=1.5, poison=2.5, light, dark, cut=1.5, cutstab, chop=1.2, stab=0.5, chopstab=0.8, crush=0.7},
   GoldenStatue = {magDef=20, fire=0.5, water=0.7, earth=1.2, wind=0.8, lighting=1.5, poison=1.5, light=1.2, dark=0.8, cut, cutstab=0.9, chop=0.9, stab=0.8, chopstab=0.85, crush=0.9},
   b= { },
   c= { },
   
   Rat = {magDef = 2, fire = 0, water, earth, wind, lighting=0.8, poison=0.8, light, dark, cut=0.6, cutstab=0.65, chop=0.6, stab=0.7, chopstab=0.65, crush=0.6},
   Gnoll = {magDef = 5, fire = 0.2, water, earth, wind, lighting=0.8, poison=0.8, light, dark, cut=0.8, cutstab=0.85, chop=0.8, stab=0.8, chopstab=0.8, crush=0.8},
   Crab = {magDef = 5, fire = 0.5, water = 1.5, earth = 1.2, wind = 0.8, lighting = 0.8, poison=0.8, light, dark, cut=1.3, cutstab, chop=0.9, stab=0.7, chopstab=0.8, crush=0.8},
   Albino = {magDef = 4, fire = 0.2, water, earth, wind, lighting = 0.8, poison, light = 0.5, dark, cut=0.6, cutstab=0.65, chop=0.6, stab=0.7, chopstab=0.65, crush=0.6},
   Woodlouise = {magDef = 5, fire = 0.5, water = 1.5, earth = 1.2, wind, lighting = 0, poison = 1.1, light = 0.5, dark, cut=1.5, cutstab=1.2, chop, stab=0.8, chopstab=0.9, crush=0.9},
   Goo = {magDef=20, fire=0.8, water=1.5, earth=1.5, wind=1.5, lighting=0.5, poison=1.5, light=0.5, dark=1.5, cut=1.2, cutstab=1.2, chop=0.9, stab=1.2, chopstab, crush=0.9},
   
   Thief = {magDef = 5, fire = 0.5, water, earth=0.8, wind, lighting=0.8, poison=0.8, light=0.9, dark, cut=0.8, cutstab=0.75, chop=0.8, stab=0.7, chopstab=0.75, crush=0.8},
   Skeleton = {magDef = 10, fire =1.2, water=0.9, earth=0.9, wind=0.9, lighting=1.5, poison=5, light=0.5, dark=1.5, cut=1.5, cutstab, chop=0.7, stab=0.8, chopstab=0.75, crush=0.6},
   Swarm = {magDef = 5, fire = 0.2, water=0.5, earth=0.9, wind=0.7, lighting=0.5, poison=0.5, light=0.5, dark, cut=0.9, cutstab=0.9, chop=0.9, stab=1.1, chopstab, crush=0.8}, 
   Shadow = {magDef = 10, fire = 1.5, water=1.5, earth=1.5, wind=1.5, lighting=1.5, poison=5, light=0.5, dark=1.5, cut=1.5, cutstab=1.5, chop=1.5, stab=1.5, chopstab=1.5, crush=1.5}, 
   Bandit = {magDef = 10, fire = 0.5, water, earth=0.9, wind, lighting=0.5, poison=0.5, light=0.5, dark=1.5, cut=0.8, cutstab=0.75, chop=0.8, stab=0.7, chopstab=0.75, crush=0.9},
   Tengu = {magDef=15, fire=0.8, water=1.3, earth=0.9, wind=1.2, lighting=0.7, poison=1.2, light=0.8, dark=1.5, cut=1.2, cutstab, chop=0.9, stab=0.8, chopstab=0.85, crush=0.9},
   
   Bat = {magDef = 5, fire = 0.2, water, earth=0.9, wind=1.5, lighting=0.8, poison=1.2, light=0.5, dark=1.5, cut=0.8, cutstab=0.9, chop=0.8, stab, chopstab=0.9, crush=0.8},
   Brute = {magDef = 10, fire = 0.5, water, earth, wind, lighting=0.9, poison=0.9, light, dark, cut=0.9, cutstab=0.9, chop=0.8, stab=0.9, chopstab=0.85, crush=1.2},
   Shaman = {magDef = 15, fire = 0.5, water, earth, wind=0.8, lighting=0.7, poison=0.5, light, dark, cut=0.8, cutstab=0.75, chop=0.8, stab=0.7, chopstab=0.75, crush=0.8},
   Spinner = {magDef=10, fire=0.5, water, earth=0.8, wind, lighting=0.8, poison=1.5, light=0.9, dark, cut=0.7, cutstab=0.75, chop=0.7, stab=0.8, chopstab=0.75, crush=0.6},
   Shielded = {magDef=20, fire=0.5, water, earth=1.2, wind=0.9, lighting=0.7, poison=1.2, light, dark, cut=1.3, cutstab=1.25, chop=1.2, stab, chopstab=1.1, crush=0.9}, 
   DM300 = {magDef=20, fire=1.5, water=0.7, earth=1.5, wind=0.9, lighting=0.7, poison=5, light, dark, cut=1.5, cutstab, chop=1.3, stab=0.9, chopstab=1.1, crush},
   
   Monk = {magDef=10, fire=0.5, water, earth=1.1, wind=1.1, lighting=0.8, poison=1.2, light, dark, cut=0.9, cutstab=0.9, chop=0.9, stab=0.9, chopstab=0.9, crush=0.95},
   Warlock = {magDef=15, fire=0.5, water, earth=0.8, wind=0.8, lighting=0.7, poison=0.5, light=0.5, dark=1.5, cut=0.8, cutstab=0.75, chop=0.75, stab=0.7, chopstab=0.7, crush=0.8},
   Golem = {magDef=20, fire=1.5, water=0.6, earth=1.5, wind=0.8, lighting=1.5, poison=2.5, light, dark, cut=1.1, cutstab=0.95, chop=0.9, stab=0.85, chopstab=0.85, crush=0.7},
   Senior = {magDef=23, fire=0.5, water, earth=1.1, wind=1.1, lighting=0.8, poison=1.2, light, dark, cut=0.95, cutstab=0.95, chop, stab=0.9, chopstab=0.95, crush=1.1},
   King = {magDef=30, fire=0.7, water, earth=1.1, wind=0.9, lighting=0.8, poison, light=0.5, dark, cut=0.8, cutstab=0.75, chop=0.8, stab=0.75, chopstab=0.75, crush=0.9},
   
   Succubus = {magDef=15, fire=0.8, water=0.8, earth, wind, lighting=0.9, poison=1.2, light=0.5, dark=1.5, cut=0.8, cutstab=0.75, chop=0.8, stab=0.7, chopstab=0.75, crush=0.8},
   Eye = {magDef=25, fire=0.6, water=1.1, earth=0.8, wind=0.9, lighting=0.7, poison=0.7, light=0.5, dark=1.5, cut=0.5, cutstab=0.45, chop=0.6, stab=0.4, chopstab=0.5, crush=0.8},
   Scorpio = {magDef=5, fire=0.2, water, earth=0.7, wind=0.8, lighting=0.7, poison=1.5, light=0.5, dark=1.5, cut=0.7, cutstab=0.6, chop=0.65, stab=0.5, chopstab=0.55, crush=0.4},
   Acidic = { },
   ShadowLord = { },
   
   SuspiciousRat = { },
   PseudoRat = { },
   ZombieGnoll = { },
   Worm = { },
   Nightmare = { },
   MimicAmulet = { },
   SpiritOfPain= { },
   YogsBrain= { },
   YogsEye= { },
   YogsHeart= { },
   YogsTeeth= { },
   Yog = { },
   
   SpiderServant = { },
   SpiderGuard = { },
   SpiderExploding = { },
   SpiderMind= { },
   SpiderMindAmber= { },
   SpiderNest= { },
   SpiderEgg= { },
  f = { },
   SpiderQueen = { },
   
   Kobold = { },
   KoboldIcemancer= { },
   ColdSpirit = { },
	IceGuardianCore= { },
   IceGuardian = { },
   
   DeathKnight = { },
   DreadKnight = { },
   EnslavedSoul = { },
   ExplodingSkull = { },
   JarOfSouls = { },
   Zombie = { },
   RunicSkull = { },
   Lich = { },
   
   a = { }
   
   },

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "",
            info          = "",
        }
    end,
    
    attackProc = function(self,buff,enemy,damage)
     return damage
    end
}