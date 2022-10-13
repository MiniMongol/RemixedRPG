local RPD = require "scripts/lib/commonClasses"
local item = require "scripts/lib/item"

return item.init {
    desc  = function (self, item)
        return {
            image = 9,
            imageFile = "items/ammo.png",
            name = "PoisonArrow_Name",
            info = "PoisonArrow_Info",
            stackable = true,
            data = {
            canUseToShoot = true,
            addDmg = {1,2},
						buff = {"PoisonBuff",5,2.5}
            },
        }
    end,
  isFliesStraight = function() 
   return true
  end,
	bag = function() 
		return "Quiver"
	end
}