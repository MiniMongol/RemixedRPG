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
 physicStr = 1,
 physicStrA = 0,
 physicStrB = 0,
 magicStr = 1,
 magicStrA = 0,
 fast = 1,
 fastA = 0,
 spRegen = 1,
 spRegenA = 0,
 spellFast = 0,
 sPoints = 20,
 lvlToUp = 0,
 triger = 0,
 class = class,
 subClass = subClass,
 boneId = boneId,
 
 physStr = function()
   return RPG.physicStr+RPG.physicStrB+RPG.physicStrA
 end,
 
 magStr = function()
   return RPG.magicStr+RPG.magicStrA
 end,
 
 AllFast = function()
   return RPG.fast+RPG.fastA
 end,
 
 AllSpRegen = function()
   return RPG.spRegen+RPG.spRegenA
 end,
 
 AllLuck = function()
   return RPG.luck + RPG.luckA
 end,
 
 itemStrBonus = function(str)
   local hero = RPD.Dungeon.hero
   return (RPG.physStr()-str)*0.2
 end,
 
 baseSpeed = function()
   return math.max(0.1,(0.8+RPG.AllFast()*0.04) - 0.03*RPD.Dungeon.depth)
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
 
   for i = 1,7 do
     for j = 1,statsList[i] do
       stats[i] = stats[i] + math.random(1,statMax)
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