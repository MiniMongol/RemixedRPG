
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"

local forgedArmor = {}
local data

forgedArmor.makeArmor = function()
    return{
    
    desc = function(self, item)
      data = self.data
        return {
            stackable     = false,
            upgradable    = true,
            equipable     ="armor",
            data = {}
        }
    end,
    
    
    info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(data.str-2*item:level(),1)
      local info = RPD.textById("Cloth_Info").."\n\n"..RPD.textById("Cloth_Name")..RPD.textById("ArmorInfo0")..data.tier..RPD.textById("ArmorInfo1")..data.tier*2+item:level()*data.tier..RPD.textById("ArmorInfo2")..str..RPD.textById("ArmorInfo3").."\n\n"..data.statsD
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("ArmorLimit")
      end
    end,
    
    getVisualName = function()
      return data.visualName or data.name
    end,
    
    price = function(self,item)
      return 20*2^(data.tier-1)+10*2^(data.tier-1)*item:level()
    end,
    
    image = function()
      return data.image
    end,
    
    icon = function()
      return data.icon
    end,
	
	effectiveDr = function(self,item)
	  return data.dr + item:level()*data.tier
	end,
	
	typicalDR = function(self,item)
	  return data.dr
	end,
   
    activate = function(self,item)
      hero = RPD.Dungeon.hero
	  str = math.max(data.str-2*item:level(),1)
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
	  str = math.max(data.str-2*item:level(),1)
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
    end
}
end
return forgedArmor