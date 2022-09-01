
local RPD = require "scripts/lib/commonClasses"
local item = require "scripts/lib/item"

return item.init {
    desc  = function (self, item)
        return {
            image = 7,
            imageFile = "items/ammo.png",
            name = "CommonArrow_Name",
            info = "CommonArrow_Info",
            stackable = true,
            data = {
            canUseToShoot = true,
            addDmg = {0,0},
            buff = {"PoisonBuff",5,3}
            },
        }
    end,
  isFliesStraight = function() 
   return true
  end
}
