--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local itemName = ("MagicSnowball")

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 45,
            name          = RPD.textById(itemName.."_Name"),
            price         = 80,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              exp = 1
              stats =
              {0,
               7.5,
               0,
               0,
               6,
               2,
               3.5,
               0},
               
              armor = 
              {{-1.25,-0.01},
               {-1.25,-0.01}, 
               
               {1,0},
               {1.75,0.025},
               
               {0,0},
               {0,0},
               
               {-1.25,-0.01},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               {0,0},
               {0,0}},
              dr = 1.25,
              
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
     return 2.5
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return RPD.textById(itemName.."_Info").."\n"..sInfo
    end
    
    }
