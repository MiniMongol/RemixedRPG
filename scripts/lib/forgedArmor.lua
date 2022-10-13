
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"
local smithy = require "scripts/lib/smithing"
local item = require "scripts/lib/item"

local forgedArmor = {}
local str

forgedArmor.makeArmor = function(self)
    return{
    
      desc = function(self, item)
        
        return {
            stackable     = false,
            upgradable    = true,
            equipable     ="armor",
            data = smithy.finalStats,
            imageFile     ="forgedArmor.png"
        }
      end,
    
    info = function(self,item)
      hero = RPD.Dungeon.hero
      
      str = math.max(self.data.str-2*item:level(),1)
        p = 20*2^(self.data.tier-1)+10*2^(self.data.tier-1)*item:level()
      local iDr = self.data.dr + self.data.tier*item:level()
      local info = RPD.textById("ClothArmor_Info").."\n\n"..RPD.textById(self.data.name)..RPD.textById("ArmorInfo0")..self.data.tier..RPD.textById("ArmorInfo1")..iDr..RPD.textById("ArmorInfo2")..str..RPD.textById("ArmorInfo3").."\n\n"..self.data.info
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("ArmorLimit")
      end
    end,
    
    image = function(self)
      return self.data.icon
    end,
    
    name = function(self)
      return self.data.name
    end,
	
	effectiveDr = function(self,item)
	  return self.data.dr + item:level()*self.data.tier
	end,
	
	typicalDR = function(self,item)
	  return self.data.dr
	end,
   
    activate = function(self,item)
      hero = RPD.Dungeon.hero
	  str = math.max(self.data.str-2*item:level(),1)
      if self.data.activationCount == 0 or RPG.luck == nil then
          RPG.addStats(self.data.dstats,"StatsB")
      end
      if self.data.activationCount == 0 then
        RPG.increaseHtSp(self.data.dstats)
      end
      self.data.activationCount = 1
    end,
    
    deactivate = function(self,item)
      hero = RPD.Dungeon.hero
      self.data.activationCount = 0
      RPG.delStats("StatsB")
      RPG.decreaseHtSp(self.data.dstats)
    end,

    typicalSTR = function(self,item,user)
	  str = math.max(self.data.str-2*item:level(),1)
      return str
    end,
    
    requiredSTR = function(self,item,user)
      return str
    end,

    onSelect = function(cell,selector)
    end,

    actions = function(self, item, hero)
      return {}
    end,

    execute = function(self, item, hero, action)
    end,
		
		price = function(self,item)
      return 20*2^(self.data.tier-1)+10*2^(self.data.tier-1)*item:level() +RPG.conversionStatsToGold(self.data.stats,self.data.addstats,0,0,0,"armor")
    end
}
end
return forgedArmor