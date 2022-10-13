
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"
local smithy = require "scripts/lib/smithing"
local item = require "scripts/lib/item"

local forgedWeapon = {}
local str
local minDmg
local maxDmg


forgedWeapon.makeWeapon = function()
    return{
    desc = function(self, item)
        
        return {
            stackable     = false,
            upgradable    = true,
            data = smithy.finalStats,
            imageFile = "items/forgedAxe.png",
            equipable = "weapon"
        }
        
    end,
    
    
    info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(self.data.str-2*item:level(),1)
      maxDmg = self.data.maxDmg +self.data.tier*item:level()*1.2
      minDmg = self.data.minDmg +self.data.tier*item:level()
      
      local info = RPD.textById("WeaponInfo0")..self.data.tier..RPD.textById("WeaponInfo1")..minDmg.." — "..maxDmg..RPD.textById("WeaponInfo2")..str..RPD.textById("WeaponInfo3").."\n\n"..self.data.info
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
      return ""
    end,
  
   
    slot = function(self, item, belongings)
        if belongings:slotBlocked(RPD.Slots.weapon) then
          return RPD.Slots.leftHand
        else
          return RPD.Slots.weapon
        end
    end,
  
    
    activate = function(self,item)
      hero = RPD.Dungeon.hero
      
      if self.data.activationCount == 0 and item.user == hero then
      if RPG.handCheck(item) then
          RPG.addStats(self.data.dstats,"StatsA2")
          else
          RPG.addStats(self.data.dstats,"StatsA")
      end
      end
      if self.data.activationCount == 0 then
        RPG.increaseHtSp(self.data.dstats)
      end
      self.data.activationCount = 1
    end,
    
    
    deactivate = function(self,item)
        hero = RPD.Dungeon.hero
        self.data.activationCount = 0
        if RPG.handCheck(item) then
            RPG.delStats("StatsA2")
            else
            RPG.delStats("StatsA")
        end
        RPG.decreaseHtSp(self.data.dstats)
    end,
	
	
	damageRoll = function(self,item,user,enemy)
      local hero = RPD.Dungeon.hero
      maxDmg = self.data.maxDmg +self.data.tier*item:level()*1.2
      minDmg = self.data.minDmg +self.data.tier*item:level()
      
      local dmgRoll = math.random(minDmg,maxDmg)
      local d = self.data
      local id = 
      {
        cut = 10,
        chop = 11,
        stab = 12,
        crush = 13
      }
      local dmgFrSt1 = d.addstats[id[d.element[1] or d.element]]
      local dmgFrSt2 = d.addstats[id[d.element[2]]] or {0,dmgFrSt1[2]}
      local dmg = RPG.getDamage(user:getEnemy(),dmgRoll *((dmgFrSt1[2]+dmgFrSt2[2])/200 +1) + dmgFrSt1[1] +dmgFrSt2[1],self.data.type,self.data.element)
      
      RPG.weaponOtherDmg(user:getEnemy(), dmg, self.data.addstats) 
			enemy:getSprite():showStatus(0xffff00,(self.data.element[1] or self.data.element).."/"..(self.data.element[2] or "")..":")
      return dmg,dmg
    end,
   
    
    accuracyFactor = function(self,item,user)
      str = math.max(self.data.str-2*item:level(),1)
      return self.data.accuracy + RPG.itemStrBonus(str)-0.15
    end,
   
    
    attackDelayFactor = function(self,item,user)
      str = math.max(self.data.str-2*item:level(),1)
      return math.max(self.data.delay - RPG.itemStrBonus(str)+0.15,0.25)
    end,
  
    
    typicalSTR = function(self,item,user)
	  str = math.max(self.data.str-2*item:level(),1)
      return str
    end,
	
	
    requiredSTR = function(self,item,user)
      return str
    end,
  
    
    goodForMelee = function(self)
      return true
    end,
    
    
    range = function(self)
      return self.data.range
    end,
    
    price = function(self,item)
      return 20*2^(self.data.tier-1)+10*2^(self.data.tier-1)*item:level() +RPG.conversionStatsToGold(self.data.stats,self.data.addstats,self.data.delay,self.data.accuracy,self.data.range,"weapon")
    end
    
     
}
end
return forgedWeapon