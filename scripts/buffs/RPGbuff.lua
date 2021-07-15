---
--- Created by Mongol
--- VK: mongolinsult
---

local RPD  = require "scripts/lib/commonClasses"

local RPG  = require "scripts/lib/Functions"

local Que  = require "scripts/lib/Queue"

local storage = require "scripts/lib/storage"

local hero = RPD.Dungeon.hero

local level = RPD.Dungeon.hero

local luckBonus = 1

local num = 0

local stats = ""

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "",
            info          = "",
        }
    end,
    
    charAct = function(self,buff)
      local Stats = storage.gameGet(stats) or {}
      hero = RPD.Dungeon.hero
      local Spells = require "scripts/spells/CustomSpellsList"
      local weapon = hero:getBelongings().weapon
      Spells.Combat = Que.getMas("spelllist")
      
      if weapon:getClassName() == "DummyItem" then
        RPG.physicStrA = 0
        RPG.magicStrA = 0
        RPG.fastA = 0
        RPG.luckA = 0
        RPG.spRegenA = 0
      end
      
      if hero:getBelongings():getItem("TomeOfMastery") ~= nil then
         hero:getBelongings():getItem("TomeOfMastery"):detach(hero:getBelongings()
.backpack)
    end
      
      local levelW = RPD.Dungeon.level:getWidth()
        local levelH = RPD.Dungeon.level:getHeight()
      if RPD.Dungeon.depth ~= 0 then
        for i = 0, levelW do
          for j = 0, levelH do
            local cell = RPD.Dungeon.level:cell(i,j)
            local enemy = RPD.Actor:findChar(cell)
            if enemy and enemy ~= RPD.Dungeon.hero and enemy:buffLevel("PowerBuff") == 0 and enemy:getMobClassName() ~= "Swarm" then
              RPD.permanentBuff(enemy,"PowerBuff")
              enemy:ht(enemy:ht() + math.ceil(1.2*RPD.Dungeon.depth))
              enemy:hp(enemy:ht())
            end
          end
        end
      end
    
      if RPG.strength == nil then
     
        RPG.strength = Stats.str
        RPG.intelligence = Stats.int
        RPG.dexterity = Stats.dex
        RPG.vitality = Stats.vit
        RPG.wisdom = Stats.wis
        RPG.luck = Stats.luc
     
        RPG.sPoints = Stats.sP
        RPG.spRegen = Stats.spR
        RPG.physicStr = Stats.phyS
        RPG.magicStr = Stats.magS
        RPG.fast = Stats.fast
        RPG.lvlToUp = Stats.lvlT
        RPG.class = Stats.class
        RPG.subclass = Stats.subclass
      end
	  
	  if RPG.lvlToUp - hero:lvl() >= 1 then
	    local save = storage.gameGet(tostring(hero:lvl())) or {}
	    RPG.strength = save.str
        RPG.intelligence = save.int
        RPG.dexterity = save.dex
        RPG.vitality = save.vit
        RPG.wisdom = save.wis
        RPG.luck = save.luc
     
        RPG.sPoints = save.sP
        RPG.spRegen = save.spR
        RPG.physicStr = save.phyS
        RPG.magicStr = save.magS
        RPG.fast = save.fast
        RPG.lvlToUp = save.lvlT
        RPG.class = save.class
        RPG.subclass = save.subclass
		Que.pushMas("spelllist", save.spells)
		storage.gamePut(stats, {str = RPG.strength, int = RPG.intelligence, dex = RPG.dexterity, vit = RPG.vitality, wis = RPG.wisdom, luc = RPG.luck, lvlT = RPG.lvlToUp, magS = RPG.magicStr, phyS = RPG.physicStr, fast = RPG.fast, sP = RPG.sPoints, spR = RPG.spRegen, class = RPG.class, subclass = RPG.subclass})
	  end
     
      if hero:lvl() > RPG.lvlToUp then
        RPG.lvlToUp = hero:lvl()
        hero:ht(hero:ht()-5)
        if hero:hp() >= hero:ht() then
          hero:hp(hero:ht())
        end
        hero:setMaxSkillPoints(hero:getSkillPointsMax()-1)
        RPG.sPoints = RPG.sPoints+5
        RPD.glog(RPD.textById("LvlUp"))
        if hero:lvl()%5 == 0 then
          RPG.sPoints = RPG.sPoints+3
          RPD.glog(RPD.textById("LvlUpHappy"))
        end   
        storage.gamePut(stats, {str = RPG.strength, int = RPG.intelligence, dex = RPG.dexterity, vit = RPG.vitality, wis = RPG.wisdom, luc = RPG.luck, lvlT = RPG.lvlToUp, magS = RPG.magicStr, phyS = RPG.physicStr, fast = RPG.fast, sP = RPG.sPoints, spR = RPG.spRegen, class = RPG.class, subclass = RPG.subclass})
		storage.gamePut(tostring(hero:lvl()), {str = RPG.strength, int = RPG.intelligence, dex = RPG.dexterity, vit = RPG.vitality, wis = RPG.wisdom, luc = RPG.luck, lvlT = RPG.lvlToUp, magS = RPG.magicStr, phyS = RPG.physicStr, fast = RPG.fast, sP = RPG.sPoints, spR = RPG.spRegen, class = RPG.class, subclass = RPG.subclass, spells = Que.getMas("spelllist")})	
      end
    
      if RPG.subclass == "Berserk" then
        RPG.physicStrB = (hero:ht()-hero:hp())*0.4
      end
      
      num = num+1
      if num >= 5 then
        hero:setSkillPoints(RPD.Dungeon.hero:getSkillPoints()+RPG.AllSpRegen())
        num = 0
       end
     end,
    
    speedMultiplier = function(self, buff)
        depth = RPD.Dungeon.depth
        return math.max(0.1,(1.7 + RPG.AllFast()*0.04) - (0.9 + 0.03*depth))
    end,
    
    regenerationBonus = function(self,buff)
        return 1 + buff.target:ht()*0.08
    end,
    
    attackProc = function(self,buff,enemy,damage)
      level = RPD.Dungeon.level
      if RPG.subclass == "Bandit" or RPG.subclass == "Necromancer" then
        luckBonus = 1.5
      end
      
      if RPG.subclass == "Ninja" then
        if enemy:buffLevel("KiMark") == 1 then
          enemy:damage(RPG.magStr()*0.35, buff.target)
          buff.target:heal(RPG.magStr()*0.3, buff.target)
          RPD.Sfx.CellEmitter:get(buff.target:getPos()):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.HEALING ), 3)
        end
      end
      
      if RPG.physicStr ~= nil then
        if math.random(0,150+enemy:defenseSkill()*1.5) <= RPG.AllLuck()*luckBonus + hero:attackSkill() then
        
          if enemy:hp() - ((damage + math.ceil(RPG.physStr()*0.2))*2 - enemy:dr()) <= 0 and RPG.subclass == "Bandit" then
            RPG.createItem("Gold", enemy:getPos(), RPG.AllLuck() + RPD.Dungeon.depth)
          end
      
          enemy:getSprite():showStatus(0xffff00,RPD.textById("crit"))
          return (damage + math.ceil(RPG.physStr()*0.2))*2
        else
        
          if enemy:hp() - ((damage + math.ceil(RPG.physStr()*0.2))-enemy:dr()) <= 0 and RPG.subclass == "Bandit" then
            RPG.createItem("Gold", enemy:getPos(), RPG.AllLuck() + RPD.Dungeon.depth)
          end
          
          return damage+math.ceil(RPG.physStr()*0.2)
        end
      else
        return damage
      end
    end,
    
    defenceProc = function(self, buff, enemy, damage)
    hero = RPD.Dungeon.hero
     if RPG.dexterity ~= nil then
     if math.random(1,150+enemy:attackSkill()) <= (RPG.AllLuck()*0.5)*luckBonus + RPG.AllFast()*0.25 then
     hero:getSprite():showStatus(0xffff00,RPD.textById("block"))
      RPD.glog(RPD.textById("Block0")..math.ceil(RPG.AllFast()*0.1 + hero:ht()*0.1 + RPG.physStr()*0.15)..RPD.textById("Block1"))
      return damage - math.ceil(RPG.AllFast()*0.1 + RPG.physStr()*0.15 + hero:ht()*0.1)
      else
      return damage
      end
     else
      return damage
     end
    end
}