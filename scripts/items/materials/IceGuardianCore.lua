--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local itemName = ("IceGuardianCore")

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 36,
            name          = RPD.textById(itemName.."_Name"),
            price         = 0,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              stats =
              {20,
               0,
               15,
               0,
               5,
               10,
               0,
               0},
               
              armor = 
              {{-6,-0.15},
               {6,0.2}, 
               
               {8,0.2},
               {0,0},
               
               {0,0},
               {0,0},
               
               {-5,-0.15},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {-1,-0.02},
               {-4,-0.12},
               {-3,-0.06}},
              dr = 3,
              
              weapon = 
              {{0,0},
               {0,0},
               
               {0,0},
               {5,0.15},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {4,0.05},
               {8,0.2},
               {8,0.05},
               
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
              {3,
               5},
              delay = 0,
              accuracy = 1,
              range = 1.4
            }
        }
    end,
    typicalStr = function()
     return 25
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return RPD.textById(itemName.."_Info").."\n"..sInfo
    end
    
    }
