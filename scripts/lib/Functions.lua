local RPD = require "scripts/lib/commonClasses"

local RPG

 RPG = {
 Buffs = {
  Bleeding       = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Bleeding"),
  Terror       = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Terror"),
  Shadows         = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Shadows"),
  Amok            = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Amok")
 },

 strength = strength,
 intelligence = intelligence,
 dexterity = dexterity,
 vitality = vitality,
 wisdom = wisdom,
 luck = luck,
 luckA = 0,
 luckA2 = 0,
 luckB = 0,
 physicStr = 1,
 physicStrA = 0,
 physicStrA2 = 0,
 physicStrB = 0,
 physicStrBerserk = 0,
 magicStr = 1,
 magicStrA = 0,
 magicStrA2 = 0,
 magicStrB = 0,
 fast = 1,
 fastA = 0,
 fastA2 = 0,
 fastB = 0,
 spRegen = 1,
 spRegenA = 0,
 spRegenA2 = 0,
 spRegenB = 0,
 spellFast = 0,
 sPoints = 20,
 lvlToUp = 0,
 triger = 0,
 class = class,
 subClass = subClass,
 boneId = boneId,
 
 physStr = function()
   return RPG.physicStr or 0 +RPG.physicStrB +RPG.physicStrA +RPG.physicStrA2 +RPG.physicStrBerserk
 end,
 
 magStr = function()
   return RPG.magicStr or 0 +RPG.magicStrA + RPG.magicStrA2 +RPG.magicStrB
 end,
 
 AllFast = function()
   return RPG.fast or 0 +RPG.fastA +RPG.fastA2 +RPG.fastB
 end,
 
 AllSpRegen = function()
   return RPG.spRegen or 0 +RPG.spRegenA +RPG.spRegenA2 +RPG.spRegenB
 end,
 
 AllLuck = function()
   local luck = 0
   if RPG.luck then
     luck = RPG.luck
   end
   return luck +RPG.luckA +RPG.luckA2 +RPG.luckB
 end,
 
 damage = function(enemy, dmg, element)
   local hero = RPD.Dungeon.hero
   local defense = {
   Rat = {magDef = 2, fire = 0, water, earth, wind, lighting, poison, light, dark},
   Gnoll = {magDef = 6, fire = 0.2}
   }
   local defstats = defense[enemy:getMobClassName()]
   local mag = defstats["magDef"]
   local coef = defstats[element] or 1
   
   if element ~= "phys" then
     enemy:damage(math.ceil(dmg-math.random(0.5*(mag*coef),mag*coef)),hero)
   else
     enemy:damage(dmg-math.ceil(math.random(enemy:dr()*0.5,enemy:dr())),hero)
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
  local itStInfo = ""
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
       itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
     end
   end
   return {itStInfo,stats}
 end,
 
 setItemStats = function(stats)
   local itStInfo = ""
   local statsNames = {
  RPD.textById("PhysStr"),
  RPD.textById("MagStr"),
  RPD.textById("Fast"),
  RPD.textById("SpRegen"),
  RPD.textById("luck"),
  RPD.textById("Hp"),
  RPD.textById("Sp")}
   for i = 1,7 do
     if stats[i] ~= 0 then
       itStInfo = itStInfo.." "..statsNames[i]..": +"..tostring(stats[i]).."\n"
     end
   end
   return itStInfo
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