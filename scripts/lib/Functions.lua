local RPD = require "scripts/lib/commonClasses"
local RPG


 RPG = {
 
 forgedItem = forgedItem,
 mainMatCount = 3,
 
 Objects ={
 Ui={
 WndInfoItem = luajava.bindClass("com.watabou.pixeldungeon.windows.WndInfoItem"),
 DCellListener = luajava.bindClass("com.watabou.pixeldungeon.scenes.DefaultCellListener"),
 WndBag = luajava.bindClass("com.watabou.pixeldungeon.windows.WndBag")
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
	"water",
	"ice",
	"earth",
	"wind",
	"lightning",
	"poison", 
	"light", 
	"dark",
	"psy",
	"cut",
	"chop", 
	"stab"},
 
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
   FireElemental = {magDef = 15, fire=2, water=0.8, ice=0.5, ice, earth, wind=0.9, lightning=1.1, poison, light, dark, cut,  chop, stab,  crush=0.8},
   Statue = {magDef=10, fire, water, ice, earth, wind=0.8, lightning=1.5, poison, light, dark, cut=1.5,  chop, stab=0.85,  crush=0.7},
   Wraith = {magDef=5, fire, water, ice, earth, wind=0.9, lightning=0.7,  crush=1.5},
   Piranha = {magDef=10, fire=0.5, water=1.5, ice, earth=0.9, wind=0.9, lightning=0.5, poison=0.8, light, dark, cut,  chop=0.9, stab=0.8,  crush=0.9},
   Mimic = {magDef = 15, fire=0.9, water, ice, earth, wind, lightning=0.8, poison=0.8, light=0.5, dark, cut=1.3,  chop, stab=0.8,  crush},
   MimicPie = {magDef=10, fire=0.8, water=0.9, ice, earth=0.7, wind, lightning=0.9, poison=0.8, light=0.5, dark, cut=0.5,  chop=0.5, stab=0.7,  crush=0.8},
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
   Gnoll = {magDef = 5, fire = 0.2, water, ice, earth, wind, lightning=0.8, poison=0.8, light, dark, cut=0.8,  .85, chop=0.8, stab=0.8,  crush=0.8},
   Crab = {magDef = 5, fire = 0.5, water = 1.5, ice, earth = 1.2, wind = 0.8, lightning = 0.8, poison=0.8, light, dark, cut=1.3,  chop=0.9, stab=0.7,  crush=0.8},
   Albino = {magDef = 4, fire = 0.2, water, ice, earth, wind, lightning = 0.8, poison, light = 0.5, dark, cut=0.6,  .65, chop=0.6, stab=0.7,  crush=0.6},
   Woodlouise = {magDef = 5, fire = 0.5, water = 1.5, ice, earth = 1.2, wind, lightning = 0, poison = 1.1, light = 0.5, dark, cut=1.2, chop, stab=0.7,  crush=0.9},
   Goo = {magDef=10, fire=0.8, water=1.5, ice, earth=1.5, wind=1.5, lightning=0.5, poison=1.5, light=0.5, dark=1.5, cut=1.2,  chop=0.9, stab=1.2,  crush=0.9},
   RatKing = {magDef = 8, fire = 0.2, water, ice, earth, wind, lightning = 0.8, poison, light = 0.5, dark, cut=0.6,  .65, chop=0.6, stab=0.7,  crush=0.6},
   
   Thief = {magDef = 8, fire = 0.5, water, ice, earth=0.8, wind, lightning=0.8, poison=0.8, light=0.9, dark, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.8},
   Skeleton = {magDef = 10, fire =1.2, water=0.9, ice, earth=0.9, wind=0.9, lightning=1.5, poison=5, light=0.5, dark=1.5, cut=1.5,  chop=0.7, stab=0.8,  crush=0.6},
   Swarm = {magDef = 5, fire = 0.2, water=0.5, ice, earth=0.9, wind=0.7, lightning=0.5, poison=0.5, light=0.5, dark, cut=0.9,  chop=0.9, stab=1.1,  crush=0.8}, 
   Shadow = {magDef = 10, fire = 1.5, water=1.5, ice, earth=1.5, wind=1.5, lightning=1.5, poison=5, light=0.5, dark=1.5, cut=1.5,  chop=1.5, stab=1.5,  crush=1.5}, 
   Bandit = {magDef = 10, fire = 0.5, water, ice, earth=0.9, wind, lightning=0.5, poison=0.5, light=0.5, dark=1.5, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.9},
   Tengu = {magDef=15, fire=0.8, water=1.3, ice, earth=0.9, wind=1.2, lightning=0.7, poison=1.2, light=0.8, dark=1.5, cut=1.2,  chop=0.9, stab=0.8,  crush=0.9},
   
   Bat = {magDef = 20, fire = 0.2, water, ice, earth=0.9, wind=1.5, lightning=0.8, poison=1.2, light=0.5, dark=1.5, cut=0.8,  chop=0.8, stab,  crush=0.8},
   Brute = {magDef = 25, fire = 0.5, water, ice, earth, wind, lightning=0.9, poison=0.9, light, dark, cut=0.9,  chop=0.8, stab=0.9,  crush=1.2},
   Shaman = {magDef = 15, fire = 0.5, water, ice, earth, wind=0.8, lightning=0.7, poison=0.5, light, dark, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.8},
   Spinner = {magDef=10, fire=0.5, water, ice, earth=0.8, wind, lightning=0.8, poison=1.5, light=0.9, dark, cut=0.7,  .75, chop=0.7, stab=0.8,  crush=0.6},
   Shielded = {magDef=30, fire=0.5, water, ice, earth=1.2, wind=0.9, lightning=0.7, poison=1.2, light, dark, cut=1.3, chop=1.2, stab=0.3,  crush=0.9}, 
   DM300 = {magDef=20, fire=1.5, water=0.7, ice, earth=1.5, wind=0.9, lightning=0.7, poison=5, light, dark, cut=1.5,  chop=1.3, stab=0.9,  crush},
   
   Monk = {magDef=35, fire=0.5, water, ice, earth=1.1, wind=1.1, lightning=0.8, poison=1.2, light, dark, cut=0.9,  chop=0.9, stab=0.9,  crush=0.95},
   Warlock = {magDef=30, fire=0.5, water, ice, earth=0.8, wind=0.8, lightning=0.7, poison=0.5, light=0.5, dark=1.5, cut=0.8,  .75, chop=0.75, stab=0.7,  crush=0.8},
   Golem = {magDef=45, fire=1.5, water=0.6, ice, earth=1.5, wind=0.8, lightning=1.5, poison=2.5, light, dark, cut=1.1,  .95, chop=0.9, stab=0.85,  crush=0.7},
   Senior = {magDef=40, fire=0.5, water, ice, earth=1.1, wind=1.1, lightning=0.8, poison=1.2, light, dark, cut=0.95,  .95, chop, stab=0.9,  crush=1.1},
   King = {magDef=30, fire=0.7, water, ice, earth=1.1, wind=0.9, lightning=0.8, poison, light=0.5, dark, cut=0.8,  .75, chop=0.8, stab=0.75,  crush=0.9},
   
   Succubus = {magDef=30, fire=0.8, water=0.8, ice, earth, wind, lightning=0.9, poison=1.2, light=0.5, dark=1.5, cut=0.8,  .75, chop=0.8, stab=0.7,  crush=0.8},
   Eye = {magDef=25, fire=0.6, water=1.1, ice, earth=0.8, wind=0.9, lightning=0.7, poison=0.7, light=0.5, dark=1.5, cut=0.5,  .45, chop=0.6, stab=0.4,  crush=0.8},
   Scorpio = {magDef=10, fire=0.2, water, ice, earth=0.7, wind=0.8, lightning=0.7, poison=1.5, light=0.5, dark=1.5, cut=0.7,  chop=0.65, stab=0.5,  crush=0.4},
   Acidic = {magDef=10, fire=0.2, water, ice, earth=0.7, wind=0.8, lightning=0.7, poison=1.5, light=0.5, dark=1.5, cut=0.7,  chop=0.6, stab=0.5,  crush=0.4},
   ShadowLord = {magDef=45, fire=0.8, water, ice, earth, wind, lightning=0.6, poison=1.2, light=0.5, dark=1.5, cut=1.2,  chop=1.1, stab=1.2,  crush=0.9},
   
   SuspiciousRat = {magDef=20, fire=0.5, water, ice, earth, wind=0.8, lightning=0.6, poison=0.5, light=0.6, dark=1.2, cut=0.6,  chop=0.6, stab=0.5,  crush=0.8},
   PseudoRat = {magDef=60, fire=0.6, water, ice, earth, wind, lightning=0.8, poison=1.2, light=0.3, dark=1.5, cut=1.2,  chop=1.2, stab=0.9,  crush},
   ZombieGnoll = {magDef=50, fire=0.6, water, ice, earth, wind, lightning=0.8, poison=1.5, light=0.6, dark=1.1, cut=0.9,  chop=0.8, stab=0.8,  crush},
   Worm = {magDef=50, fire=0.4, water=1.2, ice=0.8, earth=1.5, wind=0.8, lightning=1.2, poison=1.5, light=0.7, dark=1.2, cut=0.9,  chop=0.8, stab,  crush},
   Nightmare = {magDef=30, fire=0.8, water, ice, earth, wind, lightning=1.1, poison=1.2, light=0.3, dark=1.5, cut=1.1,  chop, stab=1.1,  crush=0.9},
   MimicAmulet = {magDef=65, fire=0.8, water, ice, earth=0.9, wind=0.9, lightning=0.8, poison=0.9, light=0.5, dark=1.5, cut=1.1,  chop=1.1, stab=0.9,  crush},
   SpiritOfPain= {magDef=65, fire=0.8, water=0.8, ice, earth, wind, lightning=0.7, poison=1.2, light=0.3, dark=1.5, cut=1.1,  chop, stab=1.1,  crush},
   YogsBrain= {magDef=45, fire=0.8, water=0.6, ice=1.2, earth=0.9, wind=0.9, lightning=1.5, poison=0.8, light=0.5, dark=1.2, cut=0.7,  chop=0.6, stab=0.8,  crush=0.9},
   YogsEye= {magDef=70, fire=0.7, water=1.2, ice=0.6, earth=0.7, wind=0.7, lightning=0.7, poison=0.6, light=0.2, dark=1.5, cut=0.5,  chop=0.6, stab=0.6,  crush=0.8},
   YogsHeart= {magDef=50, fire=0.8, water, ice=0.8, earth=1.2, wind, lightning=0.7, poison=1.3, light=0.5, dark=1.5, cut=0.9,  chop=0.9, stab=0.8,  crush=1.1},
   YogsTeeth= {magDef=55, fire, water=0.9, ice=0.9, earth, wind, lightning=0.85, poison, light=0.5, dark=1.5, cut,  chop=0.9, stab=0.8,  crush=0.7},
   Yog = {magDef=70, fire=0.8, water=1.2, ice=0.6, earth=0.7, wind=0.7, lightning=0.7, poison=0.6, light=0.2, dark=1.5, cut=0.5,  chop=0.6, stab=0.6,  crush=0.8},
   
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
 
 selectItem = function(mode,title)
   local hero = RPD.Dungeon.hero
   local cellListener = RPG.Objects.Ui.DCellListener
   local listener = cellListener:onSelect(hero:getPos(),hero)
   RPD.GameScene:selectItem(hero,listener,mode,title)
   
   return hero:getBelongings():getSelectedItem()
 end,
 
 statsFromMaterials = function(materials,mode)
   local stats = {0,0,0,0,0,0}
   local addStatsGroups = 
   {
     armor = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}},
     weapon = {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}
   }
   local allAdd = addStatsGroups[mode]
   local info
   local str = 0
   local minDmg = 0
   local maxDmg = 0
   local delayFactor = 1
   local accuracy = 1
   local range = 0
   local replayMat = {}
   local groups = 
   {
   materials[1],
   materials[2],
   materials[3]
   }
   
   for i = 1, 3 do
   
     local Materials = groups[i]
     
     for ii = 1, #Materials do
       local same = false
       
       for r = 1, #replayMat+1  do
         local replay = replayMat[r]
         if Materials[ii] == replay[1] then
           same = true
         end
       end
       
       if same == false then
       local nextReplay = replayMat[#replayMat+1]
         for r = ii, #Materials do
           if Materials[ii] == Materials[r] then
             nextReplay[1] = Materials[ii]
             nextReplay[2] = (nextReplay[2] or 0) + 1
           end
         end
       end
    end
    
    for i = 1, #replayMat do
    
       local material = replayMat[i]
       local mainStats = material[1].data.stats
       local addStats = material[1].data[mode]
       str = str + material[1]:typicalStr()*material[2]
       minDmg = minDmg + material[1].data.dmg[1]*material[2]
       maxDmg = maxDmg + material[1].data.dmg[2]*material[2]
       delayFactor = delayFactor - material[1].data.delay*material[2]
       accuraty = accuracy + material[1].data.accuracy*material[2]
       range = range + material[1].data.range*material[2]
       dr = dr + material[1].data.dr*material[2]
       
       for j = 1, 6 do
       
         stats[j] = stats[j] + mainStats[j]*material[2]
         
       end
       
       for j = 1, 14 do
       
         local allStat = allAdd[j]
         local modeStat = addStats[j]
         
         for jj = 1,2 do
         
           allStat[jj] = allStat[jj] + modeStat[jj]*material[2]
           
         end
         
       end
     end
   end
   
   for i = 1, 6 do
     stats[i] = RPG.smartInt(stats[i])
   end
   for i = 1, 14 do
     local stat = allAdd[i]
     for i = 1,2 do
       stat[i] = RPG.smartInt(stat[i])
     end
   end
   
   local drOrDmg =
   {
     armor = RPG.smartInt(dr),
     weapon = {RPG.smartInt(minDmg),RPG.smartInt(maxDmg)}
   }
   local infoFunction =
   {
     armor = RPG.getItemInfo(stats + allAdd),
     weapon = RPG.getWeaponInfo(stats,allAdd)
   }
   
   local skip
   local max ={}
   local mat1
   local mat2
   if #replayMat > 1 then
   
   for i = 1,2 do
     mat1 = replayMat[1]
   
     for ii = 2,#replayMat do
       mat2 = replayMat[ii]
       
       if (mat2[2] > mat1[2] and mat2[1] ~= max[1]) or mat1[1] == max[1]  then
      
         mat1 = mat2
       end
     end
     
     max[i] = mat1[1]
   end
   else
   
   mat1 = replayMat[1]
   max[1] = mat1[1]
   max[2] = max[1]
     end
   
   local materialIcon =
   {
     iron = 1,
     steel = 2,
     leather = 3,
     cloth = 4
   }
    local icon
     
    icon = materialIcon[max[1]:fileName()]*RPG.mainMatCount + materialIcon[max[2]:fileName()]
    
    local tierHelp = drOrDmg[mode]
    local tier
    if mode == "weapon" then
      tier = 1+RPG.smartInt((tierHelp[#tierHelp]-8)/3)
    else
      tier = 1+RPG.smartInt((tierHelp[#tierHelp]-2)/2)
    end
   
   if mode == weapon then
     return {str = RPG.smartInt(str),info = infoFunction[mode],icon = icon, tier = tier, dmg = drOrDmg[mode], delay = delayFactor, accuracy = accuracy, range = range, dStats = stats, addStats = addStatsGroups[mode]}
   else
     dStats = {unpack(stats),unpack(addStatsGroups[mode])}
     return {str = RPG.smartInt(str),info = infoFunction[mode],icon = icon, tier = tier, dr = drOrDmg[mode], dStats = dStats}
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
     mag = (defstats["magDef"] or 0) + depth*1.2 
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
      magRoll = math.floor(math.random(1.5*(mag*coef),(mag*coef+1)))
   end
   
   if dr > 0 then
     drRoll = math.floor(math.random((dr*coef)*0.5,(dr*coef)))
   else
     drRoll = math.floor(math.random((dr*coef)*1.5,(dr*coef+1)))
   end
   
   if type ~= "phys" then
     enemy:getSprite():showStatus(0xffff00,(elmnt[1] or elmnt).."/"..(elmnt[2] or "")..":")
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
	 if #ItemStats > 6 then
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
 
 getItemInfo = function(stats)
   local itStInfo = ""
   local statsNames = {
  RPD.textById("Hp"),
  RPD.textById("Sp"),
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("SpRegen"),
  RPD.textById("luck"),
  RPD.textById("magDef"),
  RPD.textById("fireD"),
  RPD.textById("waterD"),
  RPD.textById("iceD"),
  RPD.textById("earthD"),
  RPD.textById("poisonD"),
  RPD.textById("lightningD"),
  RPD.textById("psyD"),
  RPD.textById("windD"),
  RPD.textById("lightD"),
  RPD.textById("darkD"),
  RPD.textById("cutD"),
  RPD.textById("stabD"),
  RPD.textById("chopD"),
  RPD.textById("crushD"),
  }
   for i = 0,7 do
     if stats[i] ~= 0 then
       itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
     end
   end
   
   for i = 8, 21 do
      local twoStats = stats[i]
      if twoStats[1] ~= 0 then
     
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] ~= 0 then
            itStInfo = itStInfo..", "..tostring(twoStats[2]).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] ~= 0 then
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[2]).."%\n"
      end
    end
    
   return itStInfo
 end,
 
 getWeaponInfo = function(stats,addStats)
   local itStInfo = ""
   local statsNames = {
  RPD.textById("Hp"),
  RPD.textById("Sp"),
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("SpRegen"),
  RPD.textById("luck"),
  RPD.textById("magDef"),
  RPD.textById("fireDmg"),
  RPD.textById("waterDmg"),
  RPD.textById("iceDmg"),
  RPD.textById("earthDmg"),
  RPD.textById("poisonDmg"),
  RPD.textById("lightningDmg"),
  RPD.textById("psyDmg"),
  RPD.textById("windDmg"),
  RPD.textById("lightDmg"),
  RPD.textById("darkDmg"),
  RPD.textById("cutDmg"),
  RPD.textById("stabDmg"),
  RPD.textById("chopDmg"),
  RPD.textById("crushDmg"),
  }
   for i = 1,8 do
     if stats[i] ~= 0 then
       itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
     end
   end
   
   for i = 9, 22 do
      local twoStats = addStats[i-8]
      if twoStats[1] ~= 0 then
     
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[1])
          if twoStats[2] ~= 0 then
            itStInfo = itStInfo..", "..tostring(twoStats[2]).."%\n"
          else
            itStInfo = itStInfo.."\n"
        end
      elseif twoStats[2] ~= 0 then
        itStInfo = itStInfo.." "..statsNames[i]..": "..tostring(twoStats[2]).."%\n"
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
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("SpRegen"),
  RPD.textById("luck"),
  RPD.textById("magDef")
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