--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 4,
            name          = RPD.textById("Bone_Name"),
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
               {0.15,0},
               {0.25,0.01},
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
              {1.25,
               1.7},
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
      
      return RPD.textById("Bone_Info").."\n"..sInfo
    end
    
    }
