--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local str =2.5

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 4,
            name          = RPD.textById("SkeletonBone_Name"),
            price         = 30,
            stackable     = true,
            data          = {
              name = "bone",
              armorUsable = false,
              weaponUsable = true,
              exp = 0.4,
              stats =
              {0,
               0,
               2,
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
               
               {1.5,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {-1,0},
               {0.75,0},
               
               {1,0},
               {-0.75,0},
               {1.25,0},
               {-1,0}},
              dr = 0.7,
              
              weapon = 
              {{4,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               {0,0},
               
               {0.3,0},
               {0.15,0},
               {0.5,0.01},
               {0.15,0},
               
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
              {0.4,
               1.6},
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
      
      return RPD.textById("SkeletonBone_Info").."\n"..sInfo
    end
    
    }
