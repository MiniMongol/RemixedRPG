--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local itemName = ("ZombieFinger")

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 38,
            name          = RPD.textById(itemName.."_Name"),
            price         = 50,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              exp = 0.75,
              stats =
              {7,
               0,
               0,
               0,
               -2.5,
               0,
               0,
               0},
               
              armor = 
              {{-1.5,0},
               {-1,0}, 
               
               {-1,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {-1,0},
               {1.5,0},
               
               {0,0},
               {0,0},
               {0,0},
               {0,0}},
              dr = 0,
              
              weapon = 
              {{0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {1,0},
               {1,0},
               
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
     return 0.2
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return RPD.textById(itemName.."_Info").."\n"..sInfo
    end
    
    }
