--
--Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local RPG1 = require "scripts/lib/AdditionalFunctions"

local storage = require "scripts/lib/storage"

local item = require "scripts/lib/item"
local statsMax = 9
local quanStats = 3
local stra = 45
local tier = 4
local maxDmg = 15
local minDmg = 6
local dmgType = "chop"
local hero
local str
local stats
local statsInfo = " "

return item.init{
    desc  = function (self, item)
      local a = RPG.getItemStats(quanStats,statsMax)
      statsInfo = a[1]
      stats = a[2]
        return {
            imageFile     = "items.png",
            image         = 22,
            data          = {
            activationCount = 0,
            sInfo = statsInfo,
            dstats = stats
            },
            name          = RPD.textById("BattleAxe_Name")..": "..tostring(math.max(stra-2*item:level(),1)),
            price         = 20*2^(tier-1)+10*2^(tier-1)*item:level(),
            stackable     = false,
            upgradable    = true,
            equipable     ="weapon"
        }
    end,
    info = function(self,item)
      hero = RPD.Dungeon.hero
      str = math.max(stra-2*item:level(),1)
      local info = RPD.textById("BattleAxe_Info").."\n\n"..RPD.textById("BattleAxe_Name")..RPD.textById("WeaponInfo0")..tier..RPD.textById("WeaponInfo1")..math.ceil((maxDmg+minDmg+tier*item:level()*2)/2)..RPD.textById("WeaponInfo2")..str..RPD.textById("WeaponInfo3")..RPD.textById("").."\n\n"..self.data.sInfo
      if RPG.physStr() >= str then
        return info
      else
        return info..RPD.textById("WeaponLimit")
      end
    end,
    
    getAttackAnimationClass = function()
    return "HEAVY"
    end,
    
    blockSlot = function()
      return "LEFT_HAND"
    end,
    
    getVisualName = function()
      return "BattleAxe"
    end,
      
    activate = function(self)
      hero = RPD.Dungeon.hero
      if self.data.activationCount == 0 or RPG.luck == nil then
          RPG1.addStats(self.data.dstats,"StatsA")
      end
      if self.data.activationCount == 0 then
        hero:ht(hero:ht() + self.data.dstats[6])
        hero:setMaxSkillPoints(hero:getSkillPointsMax() + self.data.dstats[7])
      end
      self.data.activationCount = 1
    end,
    
    deactivate = function(self)
      hero = RPD.Dungeon.hero
        self.data.activationCount = 0
          RPG1.delStats("StatsA")
        hero:ht(hero:ht() - self.data.dstats[6])
        if hero:hp() > hero:ht() then
          hero:hp(hero:ht())
        end
        hero:setMaxSkillPoints(hero:getSkillPointsMax() - self.data.dstats[7])
        if hero:getSkillPoints() > hero:getSkillPointsMax() then
          hero:setSkillPoints(hero:getSkillPointsMax())
        end
    end,
    
    goodForMelee = function()
      return true
    end,
    
    range = function()
      return 1
    end,
    
    onSelect = function(cell,selector)
    end,
    
    accuracyFactor = function(self,item,user)
     str = math.max(stra-2*item:level(),1)
     return 1.5 + RPG.itemStrBonus(str)
    end,
    
    attackDelayFactor = function(self,item,user)
     str = math.max(stra-2*item:level(),1)
     return 1 - RPG.itemStrBonus(str)
    end,
    
    typicalSTR = function(self,item,user)
	  str = math.max(stra-2*item:level(),1)
     return str
    end,
    
    requiredSTR = function(self,item,user)
     return str
    end,
    
    attackProc = function(self,item,hero,enemy,dmg)
      local hero = RPD.Dungeon.hero
	  local damageRoll = math.random(minDmg+tier*item:level(),maxDmg+tier*item:level())	  
      return RPG.getDamage(enemy,damageRoll,dmgType)
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
