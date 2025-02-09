
local RPD = require "scripts/lib/commonClasses"
local item = luajava.bindClass("com.watabou.pixeldungeon.items.bags.SeedPouch")

return item.init {
    desc  = function (self, item)
        return {
            image         = 11,
            imageFile     = "items.png",
            name          = "Bag",
            info          = "",
            defaultAction = "Bag_ACOpen"
        }
    end
}
