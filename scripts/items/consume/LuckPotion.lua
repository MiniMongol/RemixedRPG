--
--Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local item = require "scripts/lib/item"

local storage = require "scripts/lib/storage"

local kind = "LuckPotion"
local act = RPD.Actions.drink


return item.init{
    desc  = function (self, item)
        return {
            image         = 68,
            imageFile     = "rpgitems.png",
            name          = RPD.textById(kind.."_Name"),
            info          = RPD.textById(kind.."_Info"),
            price         = 2,
            upgradable = false,
            stackable = true,
            defaultAction = act
            
        }
    end,
  
actions = function(self, item, hero)
return {act}
end,

    execute = function(self, item, hero, action)
      if action == act then
        RPD.affectBuff(hero,"RemoveLuck",10)
        RPG.luck = RPG.luck + 10000
        item:getUser():getBelongings()
:getItem("consume/"..kind):detach(item:getUser():getBelongings()
.backpack)
      end
      
    end
}
