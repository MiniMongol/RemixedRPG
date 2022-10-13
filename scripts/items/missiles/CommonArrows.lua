
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
            addDmg = {1,2}
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
