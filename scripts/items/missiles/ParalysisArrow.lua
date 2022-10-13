local RPD = require "scripts/lib/commonClasses"
local item = require "scripts/lib/item"

return item.init {
    desc  = function (self, item)
        return {
            image = 10,
            imageFile = "items/ammo.png",
            name = "ParalysisArrow_Name",
            info = "ParalysisArrow_Info",
            stackable = true,
            data = {
            canUseToShoot = true,
            addDmg = {1,2},
						buff = {"Paralysis",1,1}
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