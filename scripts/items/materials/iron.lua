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
            imageFile     = "items.png",
            image         = 19,
            name          = RPD.textById("Iron_Name"),
            price         = 20,
            stackable     = true,
            data          = {
              stats =
              {0,
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
               {0.15,0.02},
               {0.1,0.01},
               {0,0.005},
               {0.08,0}},
              dr = 0.25,
              
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
               {0,0.15},
               {0.1,0.02},
               {0,0.005},
               {0,0.02}},
              dmg = 
              {0.25,
               0.55},
              delay = 0,
              accuracy = 0,
              range = 0
            }
        }
    end,
    typicalSyr = function()
     return 1.5
    end
    
    }
