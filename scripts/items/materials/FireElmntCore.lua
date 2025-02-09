--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local str =1.5

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 46,
            name          = RPD.textById("FireElmntCore_Name"),
            price         = 225,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              exp = 2,
              stats =
              {0,
               0,
               0,
               0,
               0,
               0,
               0,
               0},
               
              armor = 
              {{2,0.05},
               {0,0}, 
               
               {0,0},
               {-1,0.025},
               
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
               
               {1,0},
               {0,0},
               {0,0},
               {-0.5,0},
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
        
    bag = function() 
  		return "SeedPouch"
  	end,
  	
    
    typicalStr = function()
     return str
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range,str)
      
      return RPD.textById("FireElmntCore_Info").."\n"..sInfo
    end
    
    }
