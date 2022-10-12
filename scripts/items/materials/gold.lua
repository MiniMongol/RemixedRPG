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
            image         = 5,
            name          = RPD.textById("GloomyGold_Name"),
            price         = 50,
            stackable     = true,
            data          = {
              name = "gold",
              armorUsable = false,
              weaponUsable = true,
              exp = 0.4,
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
              {{0,0},
               {0,0}, 
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0.5,0},
               {1,0},
               
               {0,0},
               {0,0},
               {0,0},
               {0,0}},
              dr = 1.2,
              
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
               
               {0.15,0},
               {0.18,0},
               {0.15,0},
               {0.15,0.005},
               
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
               1.75},
              delay = 0,
              accuracy = 0,
              range = 0
            }
        }
    end,
    typicalStr = function()
     return 2.8
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return RPD.textById("GloomyGold_Info").."\n"..sInfo
    end
    
    }
