
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local RPG1                  = require "scripts/lib/AdditionalFunctions"

local armor = {}

armor.makeArmor = function(name,stra,tier,visualName)
    return{
info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(stra-2*item:level(),1)
      local info = RPD.textById(name.."_Info").."\n\n"..RPD.textById(name.."_Name")..RPD.textById("ArmorInfo0")..tier..RPD.textById("ArmorInfo1")..tier*2+item:level()*tier..RPD.textById("ArmorInfo2")..str..RPD.textById("ArmorInfo3").."\n\n"..self.data.sInfo
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("ArmorLimit")
      end
    end,
    
    getVisualName = function()
      return visualName or name
    end,
	
	effectiveDr = function(self,item)
	  return tier*2 + item:level()*tier
	end,
	
	typicalDR = function(self,item)
	  return tier*2
	end,
   
    activate = function(self,item)
      hero = RPD.Dungeon.hero
	  str = math.max(stra-2*item:level(),1)
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
      RPG1.delStats("StatsB")
      RPG.decreaseHtSp(self.data.dstats)
    end,

    typicalSTR = function(self,item,user)
	  str = math.max(stra-2*item:level(),1)
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
    
    isIdentified = function(self)
      return false
    end

}
end
return armor