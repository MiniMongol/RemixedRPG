local RPD = require "scripts/lib/commonClasses"
local storage = require "scripts/lib/storage"




local RPG


 RPG = {
 
 forgedItem = forgedItem,
 mainMatCount = 16,
 materialsCount = 0,
 
 Objects ={
 Ui={
 WndInfoItem = luajava.bindClass("com.watabou.pixeldungeon.windows.WndInfoItem"),
 DCellListener = luajava.bindClass("com.watabou.pixeldungeon.scenes.DefaultCellListener"),
 WndBag = "com.watabou.pixeldungeon.windows.WndBag",
 WndMessage = "com.watabou.pixeldungeon.windows.WndTitledMessage"
 }
 },
 
 Image = luajava.bindClass("com.watabou.noosa.Image"),
 
 Buffs = {
  Bleeding       = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Bleeding"),
  Terror       = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Terror"),
  Shadows         = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Shadows"),
  Amok            = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Amok")
 },
 
 statsName = {
  "Ht",
  "Sp",
  "luck",
	"physicStr",
	"magicStr",
	"fast",
	"magDef",
	"spRegen",
	"fire",
	"lightning",
	"water",
	"ice",
	"earth",
	"poison", 
	"wind",
	"psy",
	"light", 
	"dark",
	"cut",
	"chop", 
	"stab",
	"crush"},
 
 strength = strength,
 intelligence = intelligence,
 dexterity = dexterity,
 vitality = vitality,
 wisdom = wisdom,
 luck = luck,
 physicStr = 1,
 physicStrBerserk = 0,
 magicStr = 1,
 fast = 1,
 spRegen = 1,
 magDef = 1,
 spellFast = 0,
 sPoints = 20,
 lvlToUp = 0,
 triger = 0,
 class = class,
 subClass = subClass,
 boneId = boneId,
 
 StatsA = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	magDef = 0,
	spRegen = 0
 },
 StatsA2 = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	magDef = 0,
	spRegen = 0
 },
 StatsB = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	magDef = 0,
	spRegen = 0,
	fire={0,0},
	water={0,0},
	ice={0,0},
	earth={0,0},
	wind={0,0},
	lightning={0,0},
	poison={0,0}, 
	light={0,0}, 
	dark={0,0},
	psy={0,0},
	cut={0,0},
	chop={0,0}, 
	stab={0,0},
	crush={0,0}
 },
 
 StatsArt = {
  luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	magDef = 0,
	spRegen = 0,
	fire={0,0},
	water={0,0},
	ice={0,0},
	earth={0,0},
	wind={0,0},
	lightning={0,0},
	poison={0,0}, 
	light={0,0}, 
	dark={0,0},
	psy={0,0},
	cut={0,0},
	chop={0,0}, 
	stab={0,0},
	crush={0,0}
 },
 
 StatsArt2 = {
  luck = 0,
	physicstr = 0,
	magicstr = 0,
	fast = 0,
	magDef = 0,
	spRegen = 0,
	fire={0,0},
	water={0,0},
	ice={0,0},
	earth={0,0},
	wind={0,0},
	lightning={0,0},
	poison ={0,0}, 
	light={0,0}, 
	dark={0,0},
	psy={0,0},
	cut={0,0},
	chop={0,0}, 
	stab={0,0},
	crush={0,0}
 },
 
 
 defence = {
   FireElemental = {magDef = 15, fire=2, water=0.8, ice=0.5, ice, earth, wind=0.9, lightning=1.1, poison, light, dark, psy, cut,  chop, stab,  crush=0.8},
   Statue = {magDef=10, fire, water, ice, earth, wind=0.8, lightning=1.5, poison, light, dark, psy=2, cut=1.5,  chop, stab=0.85,  crush=0.7},
   Wraith = {magDef=5, fire, water, ice, earth, wind=0.9, lightning=0.7,  crush=1.5},
   Piranha = {magDef=10, fire=0.5, water=1.5, ice, earth=0.9, wind=0.9, lightning=0.5, poison=0.8, light, dark, psy, cut,  chop=0.9, stab=0.8,  crush=0.9},
   Mimic = {magDef = 15, fire=0.9, water, ice, earth, wind, lightning=0.8, poison=0.8, light=0.5, dark, psy, cut=1.3,  chop, stab=0.8,  crush},
   MimicPie = {magDef=10, fire=0.8, water=0.9, ice, earth=0.7, wind, lightning=0.9, poison=0.8, light=0.5, dark, psy, cut=0.5,  chop=0.5, stab=0.7,  crush=0.8},
   IceElemental = {magDef=15, fire=0.5, water=1.3, ice, earth=1.2, wind=0.9, lightning=0.9, poison=1.5, light=1.5, dark=0.8, cut=1.2,  chop=0.8, stab=0.6,  crush=0.9},
   WaterElemental = {magDef=15, fire=0.8, water=1.5, ice, earth=1.2, wind=1.2, lightning=0.5, poison=0.8, light=1.2, dark=0.8, cut=1.5,  chop=1.1, stab=1.5,  crush=1.1},
   EarthElemental = {magDef=15, fire=1.2, water=0.5, ice, earth=1.5, wind=0.8, lightning=1.5, poison=0.8, light=1.2, dark, cut=1.1,  chop=0.9, stab=0.8,  crush=1.1},
   AirElemental = {magDef=15, fire=0.8, water=1.5, ice, earth=1.2, wind=1.5, lightning=0.6, poison=0.9, light=1.5, dark, cut=1.5,  chop=1.2, stab=1.5,  crush=0.9},
   Crystal = {magDef=15, fire=1.2, water=0.8, ice, earth=1.5, wind=0.8, lightning, poison=1.5, light=1.5, dark, cut=1.2,  chop=0.7, stab=0.5,  crush=0.5},
   ArmoredStatue = {magDef=15, fire=1.5, water=0.8, ice, earth=1.5, wind=0.8, lightning=1.5, poison=2.5, light, dark, cut=1.5,  chop=1.2, stab=0.5,  crush=0.7},
   GoldenStatue = {magDef=20, fire=0.5, water=0.7, ice, earth=1.2, wind=0.8, lightning=1.5, poison=1.5, light=1.2, dark=0.8, cut,  chop=0.9, stab=0.8,  crush=0.9},
   b= {magDef, fire, water, ice, earth, wind, lightning, poison, light, dark, cut,  chop, stab,  crush},
   c= {magDef, fire, water, ice, earth, wind, lightning, poison, light, dark, cut,  chop, stab,  crush},
   
   Rat = {magDef = 2, fire = 0, water, ice, earth, wind, lightning=0.8, poison=0.8, light, dark, cut=0.6,  .65, chop=0.6, stab=0.7,  crush=0.6},
   FetidRat= {magDef = 3, fire = 0, water=0.5, ice, earth, wind, lightning=0.8, poison=1.5, light, dark, cut=0.6,  .65, chop=0.6, stab=0.7,  crush=0.6},
   Gnoll = {magDef = 5, fire = 0.2, water, ice, earth, wind, lightning=0.8, poison=0.8, light, dark, cut=0.8,  .85, chop=0.8, stab=0.8,  crush=0.8},
   Crab = {magDef = 5, fire = 0.5, water = 1.5, ice, earth = 1.2, wind = 0.8, lightning = 0.8, poison=0.8, light, dark, cut=1.3,  chop=0.9, stab=0.7,  crush=0.8},
   Albino = {magDef = 4, fire = 0.2, water, ice, earth, wind, lightning = 0.8, poison, light = 0.5, dark, cut=0.6,  .65, chop=0.6, stab=0.7,  crush=0.6},
   Woodlouise = {magDef = 5, fire = 0.5, water = 1.5, ice, earth = 1.2, wind, lightning = 0, poison = 1.1, light = 0.5, dark, cut=1.2, chop, stab=0.3,  crush=0.8},
   Goo = {magDef=10, fire=0.8, water=1.5, ice, earth=1.5, wind=1.5, lightning=0.5, poison=1.5, light=0.5, dark=1.5, cut=1.2,  chop=0.9, stab=1.2,  crush=0.9},
   RatKing = {magDef = 8, fire = 0.2, water, ice, earth, wind, lightning = 0.8, poison, light = 0.5, dark, cut=0.6,  .65, chop=0.6, stab=0.7,  crush=0.6},
   
   Thief = {magDef = 8, fire = 0.5, water, ice, earth=0.8, wind, lightning=0.8, poison=0.8, light=0.9, dark, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.8},
   Skeleton = {magDef = 10, fire =1.2, water=0.9, ice, earth=0.9, wind=0.9, lightning=1.5, poison=5, light=0.5, dark=1.5, cut=1.5,  chop=0.7, stab=0.8,  crush=0.6},
   Swarm = {magDef = 5, fire = 0.2, water=0.5, ice, earth=0.9, wind=0.7, lightning=0.5, poison=0.5, light=0.5, dark, cut=0.9,  chop=0.9, stab=1.1,  crush=0.8}, 
   Shadow = {magDef = 10, fire = 1.5, water=1.5, ice, earth=1.5, wind=1.5, lightning=1.5, poison=5, light=0.5, dark=1.5, cut=1.5,  chop=1.5, stab=1.5,  crush=1.5}, 
   Bandit = {magDef = 10, fire = 0.5, water, ice, earth=0.9, wind, lightning=0.5, poison=0.5, light=0.5, dark=1.5, cut=0.8, psy =1.5, chop=0.8, stab=0.7,  crush=0.9},
   Tengu = {magDef=15, fire=0.8, water=1.3, ice, earth=0.9, wind=1.2, lightning=0.7, poison=1.2, light=0.8, dark=1.5, psy = 0.8, cut=1.2,  chop=0.9, stab=0.8,  crush=0.9},
   
   Bat = {magDef = 10, fire = 0.2, water, ice, earth=0.9, wind=1.5, lightning=0.8, poison=1.2, light=0.5, dark=1.5, cut=0.8,  chop=0.8, stab,  crush=0.8},
   Brute = {magDef = 15, fire = 0.5, water, ice, earth, wind, lightning=0.9, poison=0.9, light, dark, cut=0.9,  chop=0.8, stab=0.9,  crush=1.2},
   Shaman = {magDef = 8, fire = 0.5, water, ice, earth, wind=0.8, lightning=0.7, poison=0.5, light, dark, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.8},
   Spinner = {magDef=10, fire=0.5, water, ice, earth=0.8, wind, lightning=0.8, poison=1.5, light=0.9, dark, cut=0.7,  .75, chop=0.7, stab=0.8,  crush=0.6},
   Shielded = {magDef=18, fire=0.5, water, ice, earth=1.2, wind=0.9, lightning=0.7, poison=1.2, light, dark, cut=1.3, chop=1.2, stab=0.3,  crush=0.9}, 
   DM300 = {magDef=20, fire=1.5, water=0.7, ice, earth=1.5, wind=0.9, lightning=0.7, poison=5, light, dark, cut=1.5,  chop=1.3, stab=0.9,  crush},
   
   Monk = {magDef=10, fire=0.5, water, ice, earth=1.1, wind=1.1, lightning=0.8, poison=1.2, light, dark, cut=0.9,  chop=0.9, stab=0.9,  crush=0.95},
   Warlock = {magDef=8, fire=0.5, water, ice, earth=0.8, wind=0.8, lightning=0.7, poison=0.5, light=0.5, dark=1.5, cut=0.8,  .75, chop=0.75, stab=0.7,  crush=0.8},
   Golem = {magDef=30, fire=1.5, water=0.6, ice, earth=1.5, wind=0.8, lightning=1.5, poison=2.5, light, dark, cut=1.1,  .95, chop=0.9, stab=0.85,  crush=0.7},
   Senior = {magDef=15, fire=0.5, water, ice, earth=1.1, wind=1.1, lightning=0.8, poison=1.2, light, dark, cut=0.95,  .95, chop, stab=0.9,  crush=1.1},
   Undead = {magDef=8, fire, water=0.8, ice, earth=0.5, wind=0.8, lightning=1.5, poison=1.5, light=0.5, dark=1.5, psy=1.5, cut, chop=0.8, stab=1.2,  crush=0.5},
   King = {magDef=20, fire=0.7, water, ice, earth=1.1, wind=0.9, lightning=0.8, poison, light=0.5, dark, cut=0.8, psy=0.75, chop=0.8, stab=0.75,  crush=0.9},
   
   Succubus = {magDef=15, fire=0.8, water=0.8, ice, earth, wind, lightning=0.9, poison=1.2, light=0.5, dark=1.5, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.8},
   Eye = {magDef=5, fire=0.6, water=1.1, ice, earth=0.8, wind=0.9, lightning=0.7, poison=0.7, light=0.5, dark=1.5, cut=0.5,  .45, chop=0.6, stab=0.4,  crush=0.8},
   Scorpio = {magDef=5, fire=0.2, water, ice, earth=0.7, wind=0.8, lightning=0.7, poison=1.5, light=0.5, dark=1.5, cut=0.7,  chop=0.65, stab=0.5,  crush=0.4},
   Acidic = {magDef=5, fire=0.2, water, ice, earth=0.7, wind=0.8, lightning=0.7, poison=1.5, light=0.5, dark=1.5, cut=0.7,  chop=0.6, stab=0.5,  crush=0.4},
   ShadowLord = {magDef=25, fire=0.8, water, ice, earth, wind, lightning=0.6, poison=1.2, light=0.5, dark=1.5, cut=1.2,  chop=1.1, stab=1.2,  crush=0.9},
   
   SuspiciousRat = {magDef=5, fire=0.5, water, ice, earth, wind=0.8, lightning=0.6, poison=0.5, light=0.6, dark=1.2, cut=0.6,  chop=0.6, stab=0.5,  crush=0.8},
   PseudoRat = {magDef=20, fire=0.6, water, ice, earth, wind, lightning=0.8, poison=1.2, light=0.3, dark=1.5, cut=1.2,  chop=1.2, stab=0.9,  crush},
   ZombieGnoll = {magDef=10, fire=0.6, water, ice, earth, wind, lightning=0.8, poison=1.5, light=0.6, dark=1.1, cut=0.9,  chop=0.8, stab=0.8,  crush},
   Worm = {magDef=15, fire=0.4, water=1.2, ice=0.8, earth=1.5, wind=0.8, lightning=1.2, poison=1.5, light=0.7, dark=1.2, cut=0.9,  chop=0.8, stab,  crush},
   Nightmare = {magDef=8, fire=0.8, water, ice, earth, wind, lightning=1.1, poison=1.2, light=0.3, dark=1.5, cut=1.1,  chop, stab=1.1,  crush=0.9},
   MimicAmulet = {magDef=25, fire=0.8, water, ice, earth=0.9, wind=0.9, lightning=0.8, poison=0.9, light=0.5, dark=1.5, cut=1.1,  chop=1.1, stab=0.9,  crush},
   TreacherousSpirit = {magDef=15, fire=0.8, water=0.8, ice, earth, wind, lightning=0.7, poison=1.2, light=0.3, dark=1.5, cut=1.1,  chop, stab=1.1,  crush},
   SpiritOfPain= {magDef=5, fire=0.8, water=0.8, ice, earth, wind, lightning=0.7, poison=1.2, light=0.3, dark=1.5, cut=1.1,  chop, stab=1.1,  crush},
   YogsBrain= {magDef=6, fire=0.8, water=0.6, ice=1.2, earth=0.9, wind=0.9, lightning=1.5, poison=0.8, light=0.5, dark=1.2, cut=0.7,  chop=0.6, stab=0.8,  crush=0.9},
   YogsEye= {magDef=10, fire=0.7, water=1.2, ice=0.6, earth=0.7, wind=0.7, lightning=0.7, poison=0.6, light=0.2, dark=1.5, cut=0.5,  chop=0.6, stab=0.6,  crush=0.8},
   YogsHeart= {magDef=10, fire=0.8, water, ice=0.8, earth=1.2, wind, lightning=0.7, poison=1.3, light=0.5, dark=1.5, cut=0.9,  chop=0.9, stab=0.8,  crush=1.1},
   RottingFist= {magDef=10, fire=0.8, water, ice=0.8, earth=1.2, wind, lightning=0.7, poison=1.3, light=0.5, dark=1.5, cut=0.9,  chop=0.9, stab=0.8,  crush=1.1},
   BurningFist= {magDef=20, fire=1.5, water=0.8, ice=0.5, earth, wind=0.9, lightning=0.85, poison, light, dark=1.5, cut,  chop=0.9, stab=0.8,  crush=0.7},
   Yog = {magDef=10, fire=0.8, water=1.2, ice=0.6, earth=0.7, wind=0.7, lightning=0.7, poison=0.6, light=0.2, dark=1.5, cut=0.5,  chop=0.6, stab=0.6,  crush=0.8},
   YogsTeeth= {magDef=20, fire, water=0.9, ice=0.9, earth, wind, lightning=0.85, poison, light=0.5, dark=1.5, cut,  chop=0.9, stab=0.8,  crush=0.7},
   Yog = {magDef=10, fire=0.8, water=1.2, ice=0.6, earth=0.7, wind=0.7, lightning=0.7, poison=0.6, light=0.2, dark=1.5, cut=0.5,  chop=0.6, stab=0.6,  crush=0.8},
   Larva = {magDef=5, fire=0.8, water=0.8, ice, earth, wind, lightning=0.7, poison=1.2, light=0.3, dark=1.5, cut=0.8,  chop=0.8, stab,  crush=0.8},
   
   SpiderServant = {magDef=7, fire=0.7, water, ice, earth, wind, lightning=0.8, poison=1.2, light=0.9, dark, cut=1.15,  chop=0.8, stab=0.7,  crush},
   SpiderGuard = {magDef=10, fire=0.8, water, ice, earth, wind, lightning=0.8, poison=1.5, light, dark, cut=1.3,  chop, stab=0.9,  crush=1.1},
   SpiderExploding = {magDef=-5, fire=0.5, water=1.5, ice, earth=1.1, wind, lightning, poison, light, dark, cut=0.5,  chop=0.5, stab,  crush=0.8},
   SpiderMind= {magDef=5, fire=0.6, water, ice=0.8, earth, wind, lightning=0.6, poison=1.2, light, dark, cut=0.7,  chop=0.7, stab=0.7,  crush=0.9},
   SpiderMindAmber= {magDef=4, fire=0.8, water, ice=0.7, earth, wind, lightning=0.6, poison=1.2, light, dark, cut=0.8,  chop=0.8, stab=0.7,  crush},
   SpiderNest= {magDef=3, fire=0.2, water, ice, earth, wind=0.9, lightning=0.8, poison=1.2, light, dark, cut=0.3,  chop=0.5, stab=0.5,  crush=0.8},
   SpiderEgg= {magDef=1, fire=0.2, water, ice=0.2, earth=0.2, wind=0.2, lightning=0.2, poison=1.2, light, dark, cut=0.2,  chop=0.2, stab=0.2,  crush=0.2},
  f = {magDef, fire, water, ice, earth, wind, lightning, poison, light, dark, cut,  chop, stab,  crush},
   SpiderQueen = {magDef=12, fire=0.8, water, ice, earth, wind, lightning=0.8, poison=1.5, light=0.9, dark=1.2, cut=1.2,  chop=1.1, stab=0.8,  crush},
   
   Kobold = {magDef=10, fire=0.6, water=1.5, ice=2, earth, wind, lightning=0.8, poison, light, dark, cut=1.1,  chop, stab=0.9,  crush},
   KoboldIcemancer= {magDef=8, fire=0.6, water=1.5, ice=2, earth, wind, lightning=0.7, poison=0.9, light=0.9, dark, cut,  chop=0.9, stab=0.8,  crush=0.9},
   ColdSpirit = {magDef=15, fire=0.5, water=1.5, ice=2, earth, wind, lightning, poison, light=1.2, dark, cut=1.1,  chop=0.9, stab=0.8,  crush},
	IceGuardianCore= {magDef=20, fire=0.6, water=1.5, ice=2, earth, wind, lightning, poison=1.2, light=1.2, dark, cut=1.1,  chop=0.9, stab=0.8,  crush},
   IceGuardian = {magDef=20, fire=0.5, water=1.5, ice=2, earth, wind, lightning, poison=1.5, light=1.3, dark, cut=1.2,  chop=0.95, stab=0.8,  crush},
   
   DeathKnight = {magDef=10, fire, water=0.9, ice, earth, wind, lightning=0.7, poison=1.2, light=0.7, dark=1.3, cut=1.2,  chop, stab=0.9,  crush},
   DreadKnight = {magDef=15, fire, water=0.9, ice, earth, wind, lightning=0.7, poison, light, dark=1.5, cut=1.2,  chop=1.1, stab=0.95,  crush},
   EnslavedSoul = {magDef=8, fire, water, ice, earth, wind, lightning, poison=1.5, light=0.5, dark=1.5, cut,  chop, stab,  crush},
   ExplodingSkull = {magDef=5, fire=1.5, water=0.5, ice=0.6, earth, wind=0.8, lightning, poison=1.5, light=0.8, dark=0.8, cut,  chop=0.95, stab=0.8,  crush=0.7},
   JarOfSouls = {magDef=10, fire, water, ice, earth=0.9, wind, lightning, poison, light=0.8, dark=1.2, cut,  chop=0.9, stab=0.5,  crush=0.45},
   Zombie = {magDef=8, fire=0.9, water, ice, earth, wind, lightning=0.9, poison=1.2, light=0.8, dark=1.2, cut=0.9,  chop=0.85, stab=0.85,  crush},
   RunicSkull = {magDef=12, fire, water, ice, earth, wind, lightning, poison=1.5, light, dark, cut,  chop=0.9, stab=0.8,  crush=0.75},
   Lich = {magDef=20, fire=0.8, water, ice, earth=1.2, wind, lightning, poison=1.2, light=0.7, dark=1.5, cut,  chop=0.9, stab=0.8,  crush=0.85},
   
   a = {magDef, fire, water, ice, earth, wind, lightning, poison, light, dark, cut,  chop, stab,  crush}
   
   },
 
 
 physStr = function()
   return RPG.physicStr+RPG.StatsB["physicStr"] +RPG.StatsA["physicStr"] +RPG.StatsA2["physicStr"]+RPG.physicStrBerserk
 end,
 
 
 magStr = function()
   return RPG.magicStr +RPG.StatsA["magicStr"] +RPG.StatsA2["magicStr"] +RPG.StatsB["magicStr"]
 end,
 
 
 AllFast = function()
   return RPG.fast +RPG.StatsA["fast"] +RPG.StatsA2["fast"] +RPG.StatsB["fast"]
 end,
 
 
 allMagDef = function()
   return RPG.magDef +RPG.StatsB["magDef"] +RPG.StatsArt2["magDef"] +RPG.StatsArt["magDef"] +RPG.StatsA["magDef"] +RPG.StatsA2["magDef"]
 end,
 
 
 AllSpRegen = function()
   return RPG.spRegen +RPG.StatsA["spRegen"] +RPG.StatsA2["spRegen"] +RPG.StatsB["spRegen"] +RPG.StatsArt["spRegen"] +RPG.StatsArt2["spRegen"]
 end,
 
 
 AllLuck = function()
   local luck = 0
   if RPG.luck then
     luck = RPG.luck
   end
   return luck +RPG.StatsA["luck"] +RPG.StatsA2["luck"] +RPG.StatsB["luck"]
 end,
 
 
  selectAmmo = function(mode,title)
 
    local hero = RPD.Dungeon.hero
    local Add = require "scripts/lib/AdditionalFunctions"
    local WndBag = RPG.Objects.Ui.WndBag
    local listener = luajava.createProxy("com.watabou.pixeldungeon.windows.WndBag$Listener",{
  
    onSelect = function(item,selector)
      if item ~= nil then
        local itemEK = item:getEntityKind()
        local check = string.sub(itemEK,0,8)
        if check == "missiles" then
          local matFile = require("scripts/items/"..itemEK)
    
          if matFile:desc().data["canUseToShoot"] == true then
            storage.gamePut("choosedArrows",{is = itemEK})
        
          else
            RPD.playSound("snd_wrong.ogg")
            RPG.selectAmmo(title)
        
          end
        end
      end
    end})
   
    RPD.GameScene:selectItem(hero,listener,mode,title)
 end,
 
 
 selectItemForSmithing = function(mode,title,index,quantity)
 local smithy = require "scripts/lib/smithing"
  local hero = RPD.Dungeon.hero
  local Add = require "scripts/lib/AdditionalFunctions"


  local WndBag = RPG.Objects.Ui.WndBag
  local finalGroup = smithy.finalMaterials[index]
   
  local listener = luajava.createProxy("com.watabou.pixeldungeon.windows.WndBag$Listener",{
  onSelect = function(item,selector)
    if item ~= nil then
    local itemEK = item:getEntityKind()
    
     local check = false
     local itemCheck = false
     
     if string.sub(itemEK,0,9) == "materials" then
       local matFile = require("scripts/items/"..itemEK)
       if index == 1 then
         if matFile:desc().data[smithy.mode.."Usable"] == true then
           itemCheck = true
         end
       else
         itemCheck = true
       end
     end
     
        for i = 1,#finalGroup do
          local elements = finalGroup[i]
          if itemEK == elements[1] then
          check = i
          end
        end
        
        if itemCheck == true then
          smithy.allQuantity[index] = smithy.allQuantity[index] + quantity
          if check == false then
            finalGroup[#finalGroup+1] = {itemEK,quantity}
            RPD.glog(itemEK)
          else
            local elements = finalGroup[check]
            elements[2] = elements[2] + quantity
          end
        else
          RPD.playSound("snd_wrong.ogg")
        end
        
    Add.smithChooseMaterials(smithy.chooseMaterials)
    end
   end})
   
    RPD.GameScene:selectItem(hero,listener,mode,title)
 end,
 
 
 statsFromMaterials = function(materials,mode)
   local smithy = require "scripts/lib/smithing"
   local stats = {0,0,0,0,0,0,0,0}
   local wFix = {armor = 0, weapon = 14}
   local addStatsGroups = 
   {
     armor = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}},
     weapon = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}
   }
   
   local objectDmgType = {
   Sword = {"phys",{"cut","chop"}},
   Longsword = {"phys",{"cut","chop"}},
   Axe = {"phys",{"chop"}},
   Halberd = {"phys",{"chop"}},
   Dagger = {"phys",{"cut","stab"}},
   Mace = {"phys","crush"},
   Hammer = {"phys","crush"},
   Spear = {"phys","stab"},
   Bow = {"phys","stab"},
   Crossbow = {"phys","stab"}
   }
   local objectDrType = {
   LightArmor = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0.5,0.05},{1,0.1}},
   MediumArmor = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{1,0.1},{0.5,0.05}},
   HeavyArmor = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{1,0.1},{0.5,0.01},{0,0},{0.2,0.02}}
   }
   
   local allAdd = addStatsGroups[mode]
   local info
   local str = 0
   local minDmg = 0
   local maxDmg = 0
   local delayFactor = 1
   local accuracy = 1
   local range = 1
   local dr = 0
   local addStats
   local plusStats
   local groups = 
   {
   materials[1],
   materials[2],
   materials[3]
   }
  
  if mode == "armor" then
    plusStats = objectDrType[smithy.choosenObject]
    for i =1,14 do
      local stat = allAdd[i]
      local plusStat = plusStats[i]
      for j = 1,2 do
        stat[j] = stat[j] + plusStat[j]
      end
    end
  end
  
    for g = 1,3 do
      local group = groups[g]
      
    for i = 1, #group do
    
      local material = group[i]
      local matFile = require("scripts/items/"..material[1])
       
       local material1 = matFile:desc()
       local mainStats = material1.data.stats
       addStats = material1.data[mode]
       str = str + matFile:typicalStr()*material[2]
       minDmg = minDmg + material1.data.dmg[1]*material[2]
       maxDmg = maxDmg + material1.data.dmg[2]*material[2]
       delayFactor = delayFactor - material1.data.delay*material[2]
       accuraty = accuracy + material1.data.accuracy*material[2]
       range = range + material1.data.range*material[2]
       dr = dr + material1.data.dr*material[2]
       
       for j = 1, 8 do
       
         stats[j] = stats[j] + mainStats[j]*material[2]
         
       end
       
       for j = 1, 14 + wFix[mode] do
       
         local allStat = allAdd[j]
         local modeStat = addStats[j]
         
         for jj = 1,2 do
         
           allStat[jj] = allStat[jj] + modeStat[jj]*material[2]
           
         end
         
       end
     end
   end
   
   delayFactor = RPG.smartInt(delayFactor)
   accuracy = RPG.smartInt(accuracy)
   range = RPG.smartInt(range)
   
   for i = 1, 8 do
     stats[i] = RPG.smartInt(stats[i])
   end
   for i = 1, 14 +wFix[mode] do
     local stat = allAdd[i]
     stat[1] = RPG.smartInt(stat[1])
   end
   
   local drOrDmg =
   {
     armor = RPG.smartInt(dr),
     weapon = {RPG.smartInt(minDmg),RPG.smartInt(maxDmg)}
   }
   
    local itemInfo
    if mode == "armor" then
      itemInfo = RPG.getItemInfo(stats,allAdd)
    else
      itemInfo = RPG.getWeaponInfo(stats,allAdd)
    end
   
   local skip
   local max ={}
   local mat1
   local mat2
   local group1 = groups[1]
   if #group1 > 1 then
   
   for i = 1,2 do
     mat1 = group1[1]
   
     for ii = 2,#group1 do
       mat2 = group1[ii]
       
       if (mat2[2] > mat1[2] and mat2[1] ~= max[1]) or mat1[1] == max[1]  then
      
         mat1 = mat2
       end
     end
     
     max[i] = mat1[1]
   end
   else
   
   mat1 = group1[1]
   max[1] = mat1[1]
   max[2] = max[1]
     end
   
   local materialIcon =
   {
     iron = 1,
     steel = 2,
     leather = 3,
     gold = 3,
     cloth = 4,
     bone = 4
   }
    local icon
    max[1] = require("scripts/items/"..max[1])
    max[2] = require("scripts/items/"..max[2])
    icon = materialIcon[max[1]:desc().data.name]*RPG.mainMatCount + materialIcon[max[2]:desc().data.name]
    
    local name = max[1]:desc().name.."-"..max[2]:desc().name.."_"..mode
    
    local tier
    if mode == "weapon" then
      tier = math.max(RPG.smartInt((RPG.smartInt(maxDmg))/3),1)
    else
      tier = 1+RPG.smartInt((RPG.smartInt(dr)-2)/2)
    end
   
   if smithy.mode == "weapon" then
     
     return {str = RPG.smartInt(str),info = itemInfo, icon = icon, name = name, tier = tier, minDmg = RPG.smartInt(minDmg), maxDmg = RPG.smartInt(maxDmg), delay = delayFactor, accuracy = accuracy, range = range, dstats = stats, addStats = addStatsGroups[mode], type = table.unpack(objectDmgType[smithy.choosenObject],1), element = table.unpack(objectDmgType[smithy.choosenObject],2)}
   else
     return {str = RPG.smartInt(str),info = itemInfo, icon = icon, tier = tier, dr = drOrDmg[mode], dstats = RPG.unpackAll({stats,allAdd})}
   end
 end,
 
 
 smartInt = function(int)
   if int%1 >= 0.5 then
     return math.ceil(int)
   else
     return math.floor(int)
   end
 end,
 
 
  getElementCoef = function(element)
   local percent = 0.5
   local fixed = 0
   
   local art =RPG.StatsArt
   local art2 =RPG.StatsArt2
   local b = RPG.StatsB
   
   local elmntCoefs = {
   art[element[1] or element],
   art2[element[1] or element],
   b[element[1] or element]
   }
   local elmntCoefs2 = {
   art[element[2]],
   art2[element[2]],
   b[element[2]]
   }
   for i = 1,3 do
     local elmntCoef = elmntCoefs[i]
     percent = percent + elmntCoef[1]
     fixed = fixed + elmntCoef[2]
   end
   if element[2] ~= nil then
     for i = 1,3 do
     local elmntCoef = elmntCoefs2[i]
     percent = percent + elmntCoef[1]
     fixed = fixed + elmntCoef[2]
   end
     percent = percent/2
	 fixed = math.ceil(fixed/2)
   end
   return {percent,fixed}
 end,
 
 
 handCheck = function(item)
   local hero = RPD.Dungeon.hero
   if hero then
   if hero:getBelongings():itemSlot(item) == "LEFT_HAND" then
     return true
	 else
	 return false
   end
   end
 end,
 
 
  weaponOtherDmg = function(enemy, dmg, coefs)
    for i = 1, 10 do
      local dcoef = coefs[i]
      if dcoef[1] > 0 then
        RPG.damage(enemy,dcoef[1], "phys", RPG.statsName[i+8])
      end
      if dcoef[2] > 0 then
        RPG.damage(enemy,dmg*dcoef[2],"phys", RPG.statsName[i+8])
      end
    end
    
    for i = 15, 28 do
      local dcoef = coefs[i]
      if dcoef[1] > 0 then
        RPG.damage(enemy,dcoef[1], "mag", RPG.statsName[i])
      end
      if dcoef[2] > 0 then
        RPG.damage(enemy,dmg*dcoef[2],"mag", RPG.statsName[i])
      end
    end
 end,
 
 
 damage = function(enemy, dmg, type, element)
   local RPG = require "scripts/lib/Functions"
   local hero = RPD.Dungeon.hero
   local def = RPG["defence"]
   local depth = RPD.Dungeon.depth
   local defstats
   local name 
   local magRoll = 0
   local mag = 0
   local coef = 1
   local fCoef = 0
   local pCoef = 1
   local drRoll = 0
   local dr = 0
   local elmnt = element

   
   if enemy:name() == hero:name() or enemy:getMobClassName() == "MirrorImage" then
     local coefs = RPG.getElementCoef(elmnt)
     pCoef = coefs[1]
     fCoef = coefs[2]
     
     mag = RPG.allMagDef()*pCoef +fCoef
     dr = enemy:dr()*pCoef+fCoef
   else
     name = enemy:getMobClassName()
     defstats = def[name]
     mag = (defstats["magDef"] or 0) + depth*0.8
     dr = enemy:dr()
     
     if elmnt then
     coef = (defstats[elmnt[1] or elmnt] or 1) + (defstats[elmnt[2]] or 0)
     if elmnt[2] ~= nil then
	   coef = coef/2
	 end
	 else
	 elmnt = type
     end
   end
   
   if mag > 0 then
     magRoll = math.floor(math.random(0.5*(mag*coef),(mag*coef)))
     else
      magRoll = math.floor(math.random((mag*coef),(mag*coef)*0.5+1))
   end
   
   if dr > 0 then
     drRoll = math.floor(math.random((dr*coef)*0.5,(dr*coef)))
   else
     drRoll = math.floor(math.random((dr*coef),(dr*coef)*0.5+1))
   end
   
   if type ~= "phys" then
     enemy:getSprite():showStatus(0x33ccff,(elmnt[1] or elmnt).."/"..(elmnt[2] or "")..":")
     enemy:damage(dmg-magRoll,hero)
   else
     enemy:getSprite():showStatus(0xffff00,(elmnt[1] or elmnt).."/"..(elmnt[2] or "")..":")
     enemy:damage(dmg-drRoll,hero)
   end
 end,
 
 
 getDamage = function(enemy, dmg, type,element)
   local RPG = require "scripts/lib/Functions"
   local hero = RPD.Dungeon.hero
   local def = RPG["defence"]
   local depth = RPD.Dungeon.depth
   local defstats
   local name 
   local mag = 0
   local magRoll = 0
   local coef = 1
   local fCoef = 0
   local pCoef = 1
   local dr =0
   local drRoll= 0
   local elmnt = element

   if enemy:invalid() ~= true then
   if enemy:name() == hero:name() or enemy:getMobClassName() == "MirrorImage" then
     local coefs = RPG.getElementCoef(elmnt)
     pCoef = coefs[1]
     fCoef = coefs[2]
     mag = RPG.allMagDef()*pCoef +fCoef
     dr = enemy:dr()*pCoef+fCoef
   else
     name = enemy:getMobClassName()
     defstats = def[name]
     mag = (defstats["magDef"] or 0) + depth*1.2 
     dr = enemy:dr()
      coef = ((defstats[elmnt[1] or elmnt]) or 0) + (defstats[elmnt[2]] or 1)
	  if elmnt[2] ~= nil then
	    coef = coef/2
	 end
   end
   end
   
   if mag > 0 then
     magRoll = math.floor(math.random(0.5*(mag*coef),(mag*coef)))
     else
      magRoll = math.floor(math.random(1.5*(mag*coef),(mag*coef)))
   end
   
   if dr > 0 then
     drRoll = math.floor(math.random((dr*coef)*0.5,(dr*coef)))
   else
     drRoll = math.floor(math.random((dr*coef)*1.5,(dr*coef+1)))
   end
   
   if type ~= "phys" then
     return dmg-magRoll
   else
     return dmg-drRoll
   end
   
 end,
 
 
 itemStrBonus = function(str)
   local hero = RPD.Dungeon.hero
   return (RPG.physStr() -str)*0.1
 end,
 
 increaseHtSp = function(stats)
    local hero = RPD.Dungeon.hero
    hero:ht(hero:ht() + stats[1])
    hero:setMaxSkillPoints(hero:getSkillPointsMax() + stats[2])
 end,
 
 
 decreaseHtSp = function(stats)
    local hero = RPD.Dungeon.hero
    hero:ht(hero:ht() - stats[1])
    if hero:hp() > hero:ht() then
        hero:hp(hero:ht())
    end
    hero:setMaxSkillPoints(hero:getSkillPointsMax() - stats[2])
    if hero:getSkillPoints() > hero:getSkillPointsMax() then
        hero:setSkillPoints(hero:getSkillPointsMax())
    end
 end,
 
 
 addStats = function(stats, mas)
     local ItemStats = RPG[mas]
	 for i = 3, 8 do
	   ItemStats[RPG.statsName[i]] = stats[i]
	 end
	 if #ItemStats > 8 then
	   for i = 9, 22 do
	     local twoItemStats = ItemStats[RPG.statsName[i]]
	     local twoStats = stats[i]
	     for ii = 1,2 do
	       twoItemStats[ii] = twoStats[ii]
	     end
	   end
	 end
   end,
 
 
  delStats = function(mas)
    local ItemStats = RPG[mas]
	for i = 3, 8 do
	  ItemStats[RPG.statsName[i]] = 0
	end
	if #ItemStats > 6 then
	   for i = 9, 22 do
	     twoItemStats = ItemStats[RPG.statsName[i]]
	     for ii = 1,2 do
	       twoItemStats[ii] = 0
	     end
	   end
	 end
  end,
 
 
 baseSpeed = function()
   local hero = RPD.Dungeon.hero
   local armor = hero:getBelongings().armor
   local a =0.001
   if armor:requiredSTR() > hero:STR() then
     a = armor:requiredSTR() - hero:STR()
   end
   return math.max(0.1,((0.8 +RPG.AllFast()*0.04) -0.03*RPD.Dungeon.depth -math.max(0,(armor:requiredSTR() -RPG.physStr())*0.05))*math.pow(1.3,a))
 end,
 
 
 getItemInfo = function(stats, add)
   local itStInfo = ""
   local statsNames = {
  RPD.textById("Hp"),
  RPD.textById("Sp"),
  RPD.textById("luck"),
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("magDef"),
  RPD.textById("SpRegen"),
  RPD.textById("fireD"),
  RPD.textById("lightningD"),
  RPD.textById("waterD"),
  RPD.textById("iceD"),
  RPD.textById("earthD"),
  RPD.textById("poisonD"),
  RPD.textById("windD"),
  RPD.textById("psyD"),
  RPD.textById("lightD"),
  RPD.textById("darkD"),
  RPD.textById("cutD"),
  RPD.textById("chopD"),
  RPD.textById("stabD"),
  RPD.textById("crushD")
  }
   for i = 1,8 do
     if stats[i] ~= 0 then
       itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
     end
   end
  
  if add ~= nil then
   for i = 9, 22 do
      local twoStats = add[i-8]
      if twoStats[1] ~= 0  then
     
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] ~= 0 then
            itStInfo = itStInfo..",  "..tostring(twoStats[2]*100).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] > 0 then
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[2]*100).."%\n"
      end
    end
    end
    
   return itStInfo
 end,
 
 
 getWeaponInfo = function(stats,addStats)
   local itStInfo = ""
   local statsNames = {
  RPD.textById("Hp"),
  RPD.textById("Sp"),
  RPD.textById("luck"),
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("magDef"),
  RPD.textById("SpRegen"),
  RPD.textById("firePhys"),
  RPD.textById("lightningPhys"),
  RPD.textById("waterPhys"),
  RPD.textById("icePhys"),
  RPD.textById("earthPhys"),
  RPD.textById("poisonPhys"),
  RPD.textById("windPhys"),
  RPD.textById("psyPhys"),
  RPD.textById("lightPhys"),
  RPD.textById("darkPhys"),
  RPD.textById("cutPhys"),
  RPD.textById("chopPhys"),
  RPD.textById("stabPhys"),
  RPD.textById("crushPhys"),
  RPD.textById("fireMag"),
  RPD.textById("lightningMag"),
  RPD.textById("waterMag"),
  RPD.textById("iceMag"),
  RPD.textById("earthMag"),
  RPD.textById("poisonMag"),
  RPD.textById("windMag"),
  RPD.textById("psyMag"),
  RPD.textById("lightMag"),
  RPD.textById("darkMag"),
  RPD.textById("cutMag"),
  RPD.textById("chopMag"),
  RPD.textById("stabMag"),
  RPD.textById("crushMag")
  }
    if stats ~= nil then
      for i = 1,8 do
        if stats[i] ~= 0 then
          itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
        end
      end
    end
    
    for i = 9,12 do 
      local twoStats = addStats[i-8]
      if twoStats[1] ~= 0 then
     
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] ~= 0 then
            itStInfo = itStInfo..", "..tostring(twoStats[2]).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] > 0 then
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[2]).."%\n"
      end
    end
   
    for i = 13, 36 do
      local twoStats = addStats[i-8]
      if twoStats[1] > 0 then
     
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] > 0 then
            itStInfo = itStInfo..", "..tostring(twoStats[2]).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] > 0 then
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[2]).."%\n"
      end
    end
    
   return itStInfo
 end,
 
 
  getMaterialsInfo = function(stats,armorS,weaponS,dmg,dr,delay,acc,range)
    local itStInfo = ""
    local statsNames = {
  RPD.textById("Hp"),
  RPD.textById("Sp"),
  RPD.textById("luck"),
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("magDef"),
  RPD.textById("SpRegen")
  }
  local armorStNames = {
  RPD.textById("fireD"),
  RPD.textById("lightningD"),
  RPD.textById("waterD"),
  RPD.textById("iceD"),
  RPD.textById("earthD"),
  RPD.textById("poisonD"),
  RPD.textById("windD"),
  RPD.textById("psyD"),
  RPD.textById("lightD"),
  RPD.textById("darkD"),
  RPD.textById("cutD"),
  RPD.textById("chopD"),
  RPD.textById("stabD"),
  RPD.textById("crushD")
  }
  local weaponStNames = {
  RPD.textById("firePhys"),
  RPD.textById("lightningPhys"),
  RPD.textById("waterPhys"),
  RPD.textById("icePhys"),
  RPD.textById("earthPhys"),
  RPD.textById("poisonPhys"),
  RPD.textById("windPhys"),
  RPD.textById("psyPhys"),
  RPD.textById("lightPhys"),
  RPD.textById("darkPhys"),
  RPD.textById("cutPhys"),
  RPD.textById("chopPhys"),
  RPD.textById("stabPhys"),
  RPD.textById("crushPhys"),
  RPD.textById("fireMag"),
  RPD.textById("lightningMag"),
  RPD.textById("waterMag"),
  RPD.textById("iceMag"),
  RPD.textById("earthMag"),
  RPD.textById("poisonMag"),
  RPD.textById("windMag"),
  RPD.textById("psyMag"),
  RPD.textById("lightMag"),
  RPD.textById("darkMag"),
  RPD.textById("cutMag"),
  RPD.textById("chopMag"),
  RPD.textById("stabMag"),
  RPD.textById("crushMag")
  }
    
      for i = 1,8 do
        if stats[i] ~= 0 then
          itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
        end
      end
      
      itStInfo = itStInfo.." "..RPD.textById("DmgStat")..": "..tostring(dmg[1]).." — "..tostring(dmg[2].."\n")
    
    if dr ~= 0 then
      itStInfo = itStInfo.." "..RPD.textById("DrStat")..": "..tostring(dr).."\n"
    end
    
    if delay ~= 0 then
      itStInfo = itStInfo.." "..RPD.textById("DelayStat")..": "..tostring(delay).."\n"
    end
    
    if acc ~= 0 then
      itStInfo = itStInfo.." "..RPD.textById("AccuracyStat")..": "..tostring(acc).."\n"
    end
    
    if range ~= 0 then
      itStInfo = itStInfo.." "..RPD.textById("RangeStat")..": "..tostring(range).."\n"
    end
    
    for i = 1,14 do 
      local twoStats = armorS[i]
      if twoStats[1] ~= 0 then
     
        itStInfo = itStInfo.." "..armorStNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] ~= 0 then
            itStInfo = itStInfo..", "..tostring(twoStats[2]*100).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] ~= 0 then
        itStInfo = itStInfo.." "..armorStNames[i]..": "..tostring(twoStats[2]*100).."%\n"
      end
    end
   
    for i = 1, 28 do
      local twoStats = weaponS[i]
      if twoStats[1] ~= 0 then
     
        itStInfo = itStInfo.." "..weaponStNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] ~= 0 then
            itStInfo = itStInfo..", "..tostring(twoStats[2]*100).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] ~= 0 then
        itStInfo = itStInfo.." "..weaponStNames[i]..": "..tostring(twoStats[2]*100).."%\n"
      end
    end
    
    return itStInfo
   
  end,
 
 
 getItemStats = function(cycles, statMax)
  local statsList = {0, 0, 0, 0, 0, 0, 0, 0}
  local stats = {0, 0, 0, 0, 0, 0, 0, 0}
  local ran
  local ItemStatsInfo = ""
  local statsNames = {
  RPD.textById("Hp"),
  RPD.textById("Sp"),
  RPD.textById("luck"),
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("magDef"),
  RPD.textById("SpRegen")
  }
  for i = 1, cycles do
    ran = math.random(1,8)
    statsList[ran] = statsList[ran] +1 
  end
  
   local statMax_Fix
   for i = 1,8 do
     for j = 1,statsList[i] do
       
       if i == 6 then
         statMax_Fix = math.floor(statMax/2)
       else
         statMax_Fix = statMax
       end
       stats[i] = stats[i] + math.random(1,statMax_Fix)
     end
     if statsList[i] ~= 0 then
       ItemStatsInfo = ItemStatsInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
     end
   end
   return {ItemStatsInfo,stats}
 end,
 
 createItem = function(name, cell, count)
   for i = 1, count do
          local itemC = RPD.ItemFactory:itemByName(name)
          RPD.Dungeon.level:drop(itemC, cell)
        end
 end,
 
 
 itemByName = function(name)
   return RPD.ItemFactory:itemByName(name)
 end,
 
 
  intRoll = function(int1,int2)
    local rolled
    if int1 >= int2 then
      rolled = math.random(int2,int1)
    else
      rolled = math.random(int1,int2)
    end
    return rolled
  end,
 
 
  unpackAll = function(tables)
    local pack = {}
    for i = 1,#tables do
      local table = tables[i]
      for j = 1,#table do
        pack[#pack+1] = table[j]
      end
    end
    return pack
  end,
 
 
 distance = function(pos)
  local y
 local x
 local level=RPD.Dungeon.level
   local hx= level:cellX(RPD.Dungeon.hero:getPos())
   local hy= level:cellY(RPD.Dungeon.hero:getPos())
   local ex= level:cellX(pos)
   local ey= level:cellY(pos)
   if ex>hx then
    x=ex-hx
   else
    x=hx-ex
   end
   if ey>hy then
    y=ey-hy
   else
    y= hy-ey
   end
   return math.max(x,y)-1
 end,
 
 
 spawnMob = function(mob, pos, thisIsAPet)
local maybeMob = RPD.MobFactory:mobByName(mob)
maybeMob:setPos(pos)
if thisIsAPet then
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(maybeMob,RPD.Dungeon.hero));
else
RPD.Dungeon.level:spawnMob(maybeMob)
end
end
 
 }
return RPG