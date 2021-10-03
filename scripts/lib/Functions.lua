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
	spRegen = 0,
 },
 StatsA2 = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	spRegen = 0,
 },
 StatsB = {
 	luck = 0,
	physicStr = 0,
	magicStr = 0,
	fast = 0,
	spRegen = 0,
 },

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
   return RPG.physicStr or 0 +RPG.StatsB.physicStr +RPG.StatsA.physicStr +RPG.StatsA2.physicStr +RPG.physicStrBerserk
 end,
 
 magStr = function()
   return RPG.magicStr or 0 +RPG.StatsA.magicStr + RPG.StatsA2.magicStr +RPG.StatsB.magicStr
 end,
 
 AllFast = function()
   return RPG.fast or 0 +RPG.StatsA.fast +RPG.StatsA2.fast +RPG.StatsB.fast
 end,
 
 AllSpRegen = function()
   return RPG.spRegen or 0 +RPG.StatsA.spRegen +RPG.StatsA2.spRegen +RPG.StatsB.spRegen
 end,
 
 AllLuck = function()
   local luck = 0
   if RPG.luck then
     luck = RPG.luck
   end
   return luck +RPG.StatsA.luck +RPG.StatsA2.luck +RPG.StatsB.luck
 end,
 
 damage = function(enemy, dmg, element)
   local hero = RPD.Dungeon.hero
   local defense = {
   FireElemental = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Statue = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Wraith = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Piranha = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Mimic = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   MimicPie = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   IceElemental = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   WaterElemental = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   EarthElemental = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   AirElemental = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Crystal = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   ArmoredStatue = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   GoldenStatue = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Rat = {magDef = 2, fire = 0, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Gnoll = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Crab = {magDef = 5, fire = 0.5, water = 1.5, earth = 1.2, wind = 0.8, lighting = 0, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Albino = {magDef = 4, fire = 0.2, water, earth, wind, lighting = 0.5, poison, light = 0.5, dark, cut, cutstab, chop, stab, chopstab, crush},
   Woodlouise = {magDef = 5, fire = 0.5, water = 1.5, earth = 1.2, wind, lighting = 0, poison = 1.1, light = 0.5, dark, cut, cutstab, chop, stab, chopstab, crush},
   Goo = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Thief = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Skeleton = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Swarm = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush}, 
   Shadow = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush}, 
   Bandit = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Tengu = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Bat = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Brute = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Shaman = {magDef = 5, fire = 0.2, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Spinner = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Shielded = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush}, 
   DM300 = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Monk = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Warlock = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Golem = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Senior = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   King = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   
   Succubus = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Eye = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
   Scorpio = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
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
   = {magDef, fire, water, earth, wind, lighting, poison, light, dark, cut, cutstab, chop, stab, chopstab, crush},
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
   local defstats = defense[enemy:getMobClassName()]
   local depth = RPD.Dungeon.depth
   local mag = defstats["magDef"] + depth*1.2 or 0
   local coef = defstats[element] or 1
   
   if element ~= "phys" then
     enemy:damage(math.ceil(dmg-math.random(0.5*(mag*coef),mag*coef)),hero)
   else
     enemy:damage(dmg-math.ceil(math.random((enemy:dr()*coef)*0.5,enemy:dr()*coef)),hero)
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