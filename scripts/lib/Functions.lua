local RPD = require "scripts/lib/commonClasses"

local RPG

 RPG = {
 Buffs = {
  Bleeding       = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Bleeding"),
  Terror       = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Terror"),
  Shadows         = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Shadows"),
  Amok            = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Amok")
 },
 StatsA = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	spRegen = 0
 },
 StatsA2 = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	spRegen = 0
 },
 StatsB = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	spRegen = 0
 },
 defense = {
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
   b= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   c= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Rat = {magDef = 2, fire = 0, water, earth, wind, lighting=0.8, poison=0.8, light, dark, cut=0.6, cutstab=0.65, chop=0.6, stab=0.7, chopstab=0.65, crush=0.6},
   Gnoll = {magDef = 5, fire = 0.2, water, earth, wind, lighting=0.8, poison=0.8, light, dark, cut=0.9, cutstab=0.85, chop=0.8, stab=0.8, chopstab=0.8, crush=0.8},
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
   Acidic = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   ShadowLord = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   SuspiciousRat = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   PseudoRat = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   ZombieGnoll = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Worm = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Nightmare = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   MimicAmulet = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiritOfPain= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   YogsBrain= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   YogsEye= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   YogsHeart= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   YogsTeeth= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Yog = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   SpiderServant = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderGuard = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderExploding = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderMind= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderMindAmber= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderNest= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderEgg= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
  f = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   SpiderQueen = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Kobold = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   KoboldIcemancer= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   ColdSpirit = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
	IceGuardianCore= {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   IceGuardian = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   DeathKnight = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   DreadKnight = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   EnslavedSoul = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   ExplodingSkull = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   JarOfSouls = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Zombie = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   RunicSkull = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Lich = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   a = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush}
   
   }

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
 spellFast = 0,
 sPoints = 20,
 lvlToUp = 0,
 triger = 0,
 class = class,
 subClass = subClass,
 boneId = boneId,
 
 physStr = function()
   return RPG.physicStr+RPG.StatsB["physicStr"] +RPG.StatsA["physicStr"] +RPG.StatsA2["physicStr"]+RPG.physicStrBerserk
 end,
 
 magStr = function()
   return RPG.magicStr +RPG.StatsA["magicStr"] +RPG.StatsA2["magicStr"] +RPG.StatsB["magicStr"]
 end,
 
 AllFast = function()
   return RPG.fast +RPG.StatsA["fast"] +RPG.StatsA2["fast"] +RPG.StatsB["fast"]
 end,
 
 AllSpRegen = function()
   return RPG.spRegen +RPG.StatsA["spRegen"] +RPG.StatsA2["spRegen"] +RPG.StatsB["spRegen"]
 end,
 
 AllLuck = function()
   local luck = 0
   if RPG.luck then
     luck = RPG.luck
   end
   return luck +RPG.StatsA["luck"] +RPG.StatsA2["luck"] +RPG.StatsB["luck"]
 end,
 
 handCheck = function(item)
   local hero = RPD.Dungeon.hero
   if hero:getBelongings():itemSlot(item) == "LEFT_HAND" then
     return true
	 else
	 return nilsa
   end
 end,
 
 damage = function(enemy, dmg, element)
   local hero = RPD.Dungeon.hero
   local defence = RPG.defence
   local defstats = defense[enemy:getMobClassName()]
   local depth = RPD.Dungeon.depth
   local mag = defstats["magDef"] + depth*1.2 or 0
   local coef = defstats[element] or 1
   
   if element ~= "phys" then
     enemy:damage(math.floor(dmg-math.random(0.5*(mag*coef),mag*coef)),hero)
   else
     enemy:damage(dmg-math.floor(math.random((enemy:dr()*coef)*0.5,enemy:dr()*coef)),hero)
   end
   
 end,
 
 getDamage = function(enemy, dmg, element)
   local hero = RPD.Dungeon.hero
   local defence = RPG.defence
   local defstats = defense[enemy:getMobClassName()]
   local depth = RPD.Dungeon.depth
   local mag = defstats["magDef"] + depth*1.2 or 0
   local coef = defstats[element] or 1
   
   if element ~= "phys" then
     return dmg-math.floor(math.random(0.5*(mag*coef),mag*coef))
   else
     return dmg-math.floor(math.random((enemy:dr()*coef)*0.5,enemy:dr()*coef))
   end
   
 end,
 
 itemStrBonus = function(str)
   local hero = RPD.Dungeon.hero
   return (RPG.physStr() -str)*0.1
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
 
 getItemStats = function(cycles, statMax)
  local statsList = {0, 0, 0, 0, 0, 0, 0, 0}
  local stats = {0, 0, 0, 0, 0, 0, 0, 0}
  local ran
  local ItemStatsInfo = ""
  local statsNames = {
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("SpRegen"),
  RPD.textById("luck"),
  RPD.textById("Hp"),
  RPD.textById("Sp")}
  for i = 1, cycles do
    ran = math.random(1,7)
    statsList[ran] = statsList[ran] +1 
  end
  
   local statMax_Fix
   for i = 1,7 do
     for j = 1,statsList[i] do
       
       if i == 4 then
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