
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"
local smithy = require "scripts/lib/smithing"
local item = require "scripts/lib/item"

local forgedWeapon = {}
local str
local minDmg
local maxDmg
local dmgFrSt1
local dmgFrSt2
local dmgRoll
local dmg
local hits = 0
local prevEnemy = ""


forgedWeapon.makeWeapon = function()
    return{
    desc = function(self, item)
        
        return {
            stackable     = false,
            upgradable    = true,
            data = smithy.finalStats,
            imageFile = "items/forgedHatchet.png",
            equipable = "weapon"
        }
        
    end,
    
    
    info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(self.data.str -2*item:level(),1)
      maxDmg = RPG.smartInt(self.data.maxDmg +self.data.tier*item:level())
      minDmg = RPG.smartInt(math.min((self.data.minDmg +self.data.tier*item:level())*1.3,maxDmg))
      
      local info = self.data.name..RPD.textById("WeaponInfo0")..self.data.tier..RPD.textById("WeaponInfo1")..minDmg.." — "..maxDmg..RPD.textById("WeaponInfo2")..str..RPD.textById("WeaponInfo3").."\n\n"..self.data.info
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("WeaponLimit")
      end
    end,
    
    
    image = function(self)
      return self.data.icon
    end,
    
    
    name = function(self)
      return self.data.name
    end,
    
    
    getVisualName = function()
      return "BattleAxe"
    end,
    
    
    statsRequirementsSatisfied = function(self,item)
      str = math.max(self.data.str-2*item:level(),1)
      if str <= RPG.physStr() then
        return true 
      else 
        return false
      end
    end,
    
    
    getAttackAnimationClass = function()
	    return "HEAVY"
	  end,
   
   
    slot = function(self, item, belongings)
        return RPD.Slots.weapon
    end,
    
    
    blockSlot = function(self)
        return "LEFT_HAND"
    end,
    
    
    activate = function(self,item,user)
      hero = RPD.Dungeon.hero
      if self.data.activationCount == 0 and user == hero then
          RPG.addStats(self.data.dstats,"StatsA")
          RPG.increaseHtSp(self.data.dstats) 
          self.data.activationCount = 1
      end
    end,
    
    
    deactivate = function(self,item)
        hero = RPD.Dungeon.hero
        if self.data.activationCount == 1 then
          RPG.delStats("StatsA")
          self.data.activationCount = 0
          RPG.decreaseHtSp(self.data.dstats)
        end
    end,
	
	
	damageRoll = function(self,item,user)
      local hero = RPD.Dungeon.hero
      maxDmg = self.data.maxDmg +self.data.tier*item:level()
      minDmg = math.min((self.data.minDmg +self.data.tier*item:level())*1.3,maxDmg)
      
      dmgRoll = math.random(minDmg,maxDmg)
      local d = self.data
      local id = 
      {
        cut = 10,
        chop = 11,
        stab = 12,
        crush = 13
      }
      dmgFrSt1 = d.addstats[id[d.element[1] or d.element]]
      dmgFrSt2 = d.addstats[id[d.element[2]]] or {0,dmgFrSt1[2]}
      
        dmg = RPG.getDamage(user:getEnemy(),dmgRoll *((dmgFrSt1[2]+dmgFrSt2[2])/200 +1) + dmgFrSt1[1] +dmgFrSt2[1],self.data.type,self.data.element)
        
        RPG.dmgText("phys",self.data.element,user:getEnemy())
			
      return dmg,dmg
    end,
    
    postAttack = function(self,item,enemy) 
      RPG.weaponOtherDmg(enemy,dmg,self.data.addstats) 
      local user = RPD.Dungeon.hero
      local chanceRoll = math.random(1,12)
      if chanceRoll <= 3 +hits +self.data.rareScale and dmg > 0 then 
        hits = 0
        RPD.topEffect(user:getPos(),"dissection_effect")
    
      local level = RPD.Dungeon.level
      local x = level:cellX(user:getPos())
      local y = level:cellY(user:getPos())
      local weaponA = user:getBelongings().weapon
      local weaponB = user:getBelongings().leftHand
     
      for i = x-1,x+1 do
       for j = y-1,y+1 do
        local pos = level:cell(i,j)
        local enemyOnWay = RPD.Actor:findChar(pos)
        if enemyOnWay and enemyOnWay ~= RPD.Dungeon.hero and enemyOnWay ~= enemy then
          RPG.damage(enemyOnWay,RPG.smartInt(weaponA:damageRoll(hero)*(0.8 +0.1*self.data.rareScale) + weaponB:damageRoll(hero)*0.65 + RPG.physStr()*0.1), "phys",self.data.element)
        end
      end
    end
        
      elseif prevEnemy == enemy or hits == 0 then
        hits = hits +1
      else 
        hits = 1
      end
      
      prevEnemy = enemy
    end,
    
    
    accuracyFactor = function(self,item,user)
      str = math.max(self.data.str -2*item:level(),1)
      return self.data.accuracy + RPG.itemStrBonus(str)*0.5
    end,
    
    
    attackDelayFactor = function(self,item,user)
      str = math.max(self.data.str -2*item:level(),1)
      return math.max(self.data.delay*1.5 -RPG.itemStrBonus(str)*0.75,0.25)
    end,
    
    
    typicalSTR = function(self,item,user)
	  str = math.max(self.data.str -2*item:level(),1)
      return str
    end,
	
	
    requiredSTR = function(self,item,user)
      return str
    end,
    
    
    goodForMelee = function(self)
      return true
    end,
    
    
    range = function(self)
      return self.data.range +1
    end,
		
		
		price = function(self,item)
      mediumDmg = RPG.smartInt( (self.data.minDmg+self.data.maxDmg)/3 )
      return mediumDmg*(item:level()+1)*self.data.tier + RPG.conversionStatsToGold(self.data.dstats,self.data.addstats,self.data.delay,self.data.accuracy,self.data.range,"weapon")
    end
    
     
}
end
return forgedWeapon