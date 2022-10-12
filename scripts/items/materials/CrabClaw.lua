--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"
local itemInfo = RPD.textById("CrabClaw_Info")

return item.init{
desc  = function(self, item)
        return {
            imageFile     = "items/materials.png",
            image         = 18,
            name          = RPD.textById("CrabClaw_Name"),
            price         = 20,
            stackable     = true,
            data          = {
              name = "",
              armorUsable = false,
              weaponUsable = false,
              exp = 0.3,
              stats =
              {0,
               0,
               1,
               0,
               2,
               0,
               0,
               0},
               
              armor = 
              {{0.5,0},
               {-0.25,0}, 
               
               {0.75,0},
               {-0.25,0},
               
               {0.5,0},
               {0.5,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               
               {0,0},
               {0,0},
               {0,0},
               {0,0}},
              dr = 0.8,
              
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
               {0.5,0},
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
              {0.5,
               1},
              delay = 0.15,
              accuracy = 0.08,
              range = 0
            }
        }
    end,
    typicalStr = function()
     return 0.3
    end,
    
    
    info = function(self)
      local d = self.data
      local sInfo = RPG.getMaterialsInfo(d.stats, d.armor, d.weapon, d.dmg, d.dr, d.delay, d.accuracy, d.range)
      
      return itemInfo.."\n"..sInfo
    end
    
    }
