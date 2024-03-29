--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local RPG1 = require "scripts/lib/AdditionalFunctions"

local armor = require "scripts/lib/armor"

local storage = require "scripts/lib/storage"

local item = require "scripts/lib/item"

local statsMax = 12
local quanStats = 4
local stra = 65
local tier = 7
local str 
local stats
local hero 
local statsInfo
local config = armor.makeArmor("GothicArmor",stra,tier)

config.desc = function(self, item)
      local a = RPG.getItemStats(quanStats,statsMax)
      statsInfo = a[1]
      stats = a[2]
      
        return {
            imageFile     = "items/armor.png",
            image         = 20,
            data          = {
            activationCount = 0,
            sInfo = statsInfo,
            dstats = stats
            },
            name          = RPD.textById("GothicArmor_Name")..": "..tostring(math.max(stra-2*item:level(),1)),
            price         = 20*2^(tier-1)+10*2^(tier-1)*item:level(),
            stackable     = false,
            upgradable    = true,
            equipable     ="armor"
        }
    end
		return item.init(config)