--
--
--
--

local RPD = require "scripts/lib/commonClasses"
local storage = require "scripts/lib/storage"
local itemLib = require "scripts/lib/item"

return itemLib.init{
    desc  = function (self, item)
      storage.gamePut("name",{itemName = "Gold"})
      storage.gamePut("count",{itemCount = 10})

        return {
            image         = 0,
            imageFile     = "terminal.png",
            name          = "Терминал",
            info          = "Позволяет получить любой предмет в любом количестве!",
            stackable     = false,
            defaultAction = "Give Item",
            price         = 0,
            isArtifact    = true,
        }
    end,


    actions = function(self, item, hero)

            return {"Input item",
                    "Input count",
                    "Give item"}
    end,

    
    execute = function(self, item, hero, action)

        local owner = item:getOwner()
        local n = storage.gameGet("name") 
        local c = storage.gameGet("count")

        if action == "" then

            local ads = require("scripts/lib/ads")

            if ads.rewardVideoReady() then
                ads.rewardVideoShow(RPD.createItem("Gold",'{"quantity":500}'))
            else
                RPD.glogn("Reward video not ready")
            end

            ads.interstitialShow()

        end
        
        if action == "Input item" then
          RPD.System.Input:showInputDialog("Название предмета:", "")
          
        end
        
        
        if action == "Input count" then
          itemName = tostring(RPD.System.Input:getInputString())
          if itemName ~= nil then
            storage.gamePut("name",{itemName = itemName})
          end

          RPD.System.Input:showInputDialog("Количество предметов:", "(Вводить только число)")
        end
        
        
        if action == "Give item" then
            local itemCount = tonumber(RPD.System.Input:getInputString())
            if itemCount ~= nil then
              storage.gamePut("count",{itemCount = itemCount})
            end
            
            hero = RPD.Dungeon.hero
            local item = RPD.item(n.itemName,c.itemCount)
            hero:collect(item)
        end

    end,


    glowing = function(self, item)
            return itemLib.makeGlowing(0xFF7A792B, 3)
    end
}
