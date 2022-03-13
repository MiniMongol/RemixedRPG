--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local RPG1 = require "scripts/lib/AdditionalFunctions"

local storage = require "scripts/lib/storage"

local onehandWeapon = require "scripts/lib/onehandWeapon"

local item = require "scripts/lib/item"

local statsMax = 3
local quanStats = 2
local stra = 10
local tier = 1
local maxDmg = 8
local minDmg = 4
local accuracy = 1.4
local delayFactor = 1
local str 
local stats
local hero 
local statsInfo
local config = onehandWeapon.makeWeapon("Dagger","WeaponAccu",stra,minDmg,maxDmg,tier,accuracy,delayFactor,1,"phys",{"cut","stab"},"NONE") 
config.desc  = function(self, item)
      local a = RPG.getItemStats(quanStats,statsMax)
      statsInfo = a[1]
      stats = a[2]
      
        return {
            imageFile     = "items.png",
            image         = 19,
            data          = {
            activationCount = 0,
            sInfo = statsInfo,
            dstats = stats
            },
            name          = RPD.textById("Dagger_Name")..": "..tostring(math.max(stra-2*item:level(),1)),
            price         = 20*2^(tier-1)+10*2^(tier-1)*item:level(),
            stackable     = false,
            upgradable    = true,
            equipable     ="weapon"
        }
    end
    return item.init(config)
