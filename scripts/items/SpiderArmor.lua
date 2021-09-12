--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local RPG1 = require "scripts/lib/AdditionalFunctions"

local storage = require "scripts/lib/storage"

local item = require "scripts/lib/item"
local statsMax = 6
local quanStats = 3
local stra = 20
local tier = 3
local str 
local stats
local hero 
local statsInfo

return item.init{
    desc  = function (self, item)
      local a = RPG.getItemStats(quanStats,statsMax)
      statsInfo = a[1]
      stats = a[2]
      
        return {
            imageFile     = "items/armor.png",
            image         = 21,
            data          = {
            activationCount = 0,
            sInfo = statsInfo,
            dstats = stats
            },
            name          = RPD.textById("SpiderArmor_Name")..": "..tostring(math.max(stra-2*item:level(),1)),
            price         = 20*2^(tier-1)+10*2^(tier-1)*item:level(),
            stackable     = false,
            upgradable    = true,
            equipable     ="armor"
        }
    end,
    info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(stra-2*item:level(),1)
      local info = RPD.textById("SpiderArmor_Info").."\n\n"..RPD.textById("SpiderArmor_Name")..RPD.textById("ArmorInfo0")..tier..RPD.textById("ArmorInfo1")..tier*2+item:level()*tier..RPD.textById("ArmorInfo2")..str..RPD.textById("ArmorInfo3").."\n\n"..self.data.sInfo
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("ArmorLimit")
      end
    end,
    
    getVisualName = function()
      return "SpiderArmor"
    end,
	
	effectiveDr = function(self,item)
	  return tier*2 + item:level()*tier
	end,
	
	typicalDR = function(self,item)
	  return tier*2
	end,
	
	defenceProc = function(self, item, enemy, damage)
	  hero = RPD.Dungeon.hero
	  if math.random(0,100) >= 50 then
	    RPD.placeBlob(RPD.Blobs.Web, hero:getPos(), 4)
	  end
	  return damage
	end,
	
	charAct = function(self, item)
	  RPD.removeBuff(hero, RPD.Buffs.Roots)
	end,
   
    activate = function(self,item)
      hero = RPD.Dungeon.hero
	  str = math.max(stra-2*item:level(),1)
      if self.data.activationCount == 0 or RPG.luck == nil then
        for i = 1,5 do
          RPG1.addStats_B(self.data.dstats[i], i)
        end
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
        for i = 1,5 do
          RPG1.delStats_B(self.data.dstats[i], i)
        end
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
