--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local itemName = ("PseudoRatFang")

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 33,
            name          = RPD.textById(itemName.."_Name"),
            price         = 250,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              exp = 3,
              stats =
              {0,
               0,
               9,
               0,
               0,
               0,
               0,
               0},
               
              armor = 
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
               {0,0}},
              dr = 0,
              
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
               {0,0.05},
               {0,0.05},
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
              {1.8,
               3},
              delay = 0,
              accuracy = 0.3,
              range = 0
            }
        }
    end,
    typicalStr = function()
     return 6
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return RPD.textById(itemName.."_Info").."\n"..sInfo
    end
    
    }
