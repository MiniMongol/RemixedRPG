--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local itemName = ("ZombieGnollMeat")

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 34,
            name          = RPD.textById(itemName.."_Name"),
            price         = 120,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              exp = 1.8,
              stats =
              {15,
               0,
               0,
               0,
               0,
               0,
               0,
               9},
               
              armor = 
              {{0,-0.05},
               {0,0}, 
               {0,0},
               {0,0},
               {0,0},
               {1.25,0.04},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0}},
              dr = 4,
              
              weapon = 
              {{0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0}},
              dmg = 
              {0,
               0},
              delay = 0,
              accuracy = 0,
              range = 0
            }
        }
    end,
    typicalStr = function()
     return 4
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return RPD.textById(itemName.."_Info").."\n"..sInfo
    end
    
    }
