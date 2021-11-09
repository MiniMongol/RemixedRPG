
local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local RPG1                  = require "scripts/lib/AdditionalFunctions"

local armor = {}

armor.makeArmor = function(name,stra,tier,visualName)
    if visualName == "" or visualName == nil then
      visualName = name
    end
    return{
info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(stra-2*item:level(),1)
      local info = RPD.textById("ClothArmor_Desc").."\n\n"..RPD.textById("ClothArmor_Name")..RPD.textById("ArmorInfo0")..tier..RPD.textById("ArmorInfo1")..tier*2+item:level()*tier..RPD.textById("ArmorInfo2")..str..RPD.textById("ArmorInfo3").."\n\n"..self.data.sInfo
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("ArmorLimit")
      end
    end,
    
    getVisualName = function()
      return "ClothArmor"
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
          RPG1.addStats(self.data.dstats,"StatsB")
      end
      if self.data.activationCount == 0 then
        hero:ht(hero:ht() + self.data.dstats[6])
        hero:setMaxSkillPoints(hero:getSkillPointsMax() + self.data.dstats[7])
      end
      self.data.activationCount = 1
    end,
    
    deactivate = function(self,item)
      hero = RPD.Dungeon.hero
        self.data.activationCount = 0
          RPG1.delStats("StatsB")
        hero:ht(hero:ht() - self.data.dstats[6])
        if hero:hp() > hero:ht() then
          hero:hp(hero:ht())
        end
        hero:setMaxSkillPoints(hero:getSkillPointsMax() - self.data.dstats[7])
        if hero:getSkillPoints() > hero:getSkillPointsMax() then
          hero:setSkillPoints(hero:getSkillPointsMax())
        end
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