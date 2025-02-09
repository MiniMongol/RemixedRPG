--
-- Created by Mongol
-- VK: mongolinsult
-- 

local RPD = require "scripts/lib/commonClasses"

local RPG = require "scripts/lib/Functions"

local Add = require "scripts/lib/AdditionalFunctions"

local storage = require "scripts/lib/storage"

local forgedMagicWand = require "scripts/lib/forgedMagicWand"

local item = require "scripts/lib/item"


local config = forgedMagicWand.makeWeapon()
return item.init(config)