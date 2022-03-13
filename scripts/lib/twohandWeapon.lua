
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"
local item = require "scripts/lib/item"

local twohandWeapon = {}

twohandWeapon.makeWeapon = function(name,mod,stra,minDmg,maxDmg,tier,accuracy,delayFactor,range,dmgType,dmgMod,anim,visualName)
    return {
      info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(stra-2*item:level(),1)
      local info = RPD.textById(name.."_Info").."\n\n"..RPD.textById(name.."_Name")..RPD.textById("WeaponInfo0")..tier..RPD.textById("WeaponInfo1")..math.ceil((maxDmg+minDmg+tier*item:level()*2)/2)..RPD.textById("WeaponInfo2")..str..RPD.textById("WeaponInfo3")..RPD.textById(mod) .."\n\n"..self.data.sInfo
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("WeaponLimit")
      end
    end,
    
    getVisualName = function()
      return (visualName or name)
    end,
    
    getAttackAnimationClass = function()
			return anim
		end,
    
    blockSlot = function()
      return "LEFT_HAND"
    end,
    
    activate = function(self,item)
      hero = RPD.Dungeon.hero
      if self.data.activationCount == 0 and item.user == hero then
      	RPG.addStats(self.data.dstats,"StatsA")
      end
      if self.data.activationCount == 0 then
        RPG.increaseHtSp(self.data.dstats)
      end
      self.data.activationCount = 1
    end,
    
    deactivate = function(self,item)
      hero = RPD.Dungeon.hero
      self.data.activationCount = 0
      RPG.delStats("StatsA")
      RPG.decreaseHtSp(self.data.dstats)
    end,
    
    accuracyFactor = function(self,item,user)
      str = math.max(stra-2*item:level(),1)
      return accuracy + RPG.itemStrBonus(str)
    end,
    
    attackDelayFactor = function(self,item,user)
      str = math.max(stra-2*item:level(),1)
      return delayFactor - RPG.itemStrBonus(str)
    end,
    
    typicalSTR = function(self,item,user)
	 		str = math.max(stra-2*item:level(),1)
      return str
    end,
    
    requiredSTR = function(self,item,user)
      return str
    end,
	
	damageRoll = function(self,item,user)
  	local dmgRoll = math.random(minDmg +tier*item:level(),maxDmg +tier*item:level())
      local dmg = RPG.getDamage(user:getEnemy(),dmgRoll,dmgType,dmgMod)
    return dmg,dmg
    end,
    
    goodForMelee = function()
      return true
    end,
    
    range = function()
      return range
    end,
    
    onSelect = function(cell,selector)
    end,

    actions = function(self, item, hero)
      return {}
    end,

    execute = function(self, item, hero, action)
    end,
    
    isIdentified = function(self)
      return false
    end
    }
end

return twohandWeapon