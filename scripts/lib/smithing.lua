local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"
local item = require "scripts/lib/item"
local forgedArmor = require "scripts/lib/forgedArmor"
local hero
local smithy

smithy = {
  mainWnd = mainWnd,
  weaponWnd = weaponWnd,
  armorWnd = armorWnd,
  meleeWnd = meleeWnd,
  chooseMaterials = chooseMaterials,
  missileWnd = missileWnd,
  choosenObject = choosenObject,
  chooseIconGroup = chooseIcomGroup,
  iconGroup = iconGroup,
  mode = mode,
  choosenMaterials={{},{},{}},

mainWnd = function(index)
  local chooses = 
  {
    Add.smithWeapon(smithy.weaponWnd),
    Add.smithArmor(smithy.armorWnd)
  }

  return chooses[index+1]
end,

weaponWnd = function(index)
  mode = "weapon"
  local chooses =
  {
    Add.meleeChoose(smithy.meleeWnd),
    Add.missileChoose(smithy.missileWnd)
  }
end,

meleeWnd = function(index)
  local chooses =
  {
    "Sword",
    "LongSword",
    "Dagger",
    "Spear",
    "Hammer",
    "Axe"
  }

  choosenObject = chooses[index+1]
  Add.chooseMaterialsSmith(smithy.chooseMaterials)
end,

missileWnd = function(index)
  local chooses =
  {
    "Bow",
    "Crossbow"
  }
  
  choosenObject = chooses[index+1]
  Add.smithChooseMaterials(smithy.chooseMaterials)
end,

armorWnd = function(index)
  local chooses =
  {
    "LightArmor",
    "MediumArmor",
    "HeavyArmor"
  }
  mode = chooses[index+1]

  choosenObject = chooses[index+1]
  Add.smithChooseMaterials(smithy.chooseMaterials)
end,

chooseMaterials = function(index)
  local WndBag = RPG.Objects.Ui.WndBag
  materialCount = 
  {
    Sword={7,4},
    LongSword={10,4},
    Dagger={3,4},
    Spear={3,4,2},
    Hammer={12,4},
    Axe={8,4},
    Bow={4,4},
    Crossbow={6,4},
    LightArmor={5,4},
    MediumArmor={8,4},
    HeavyArmor={10,4}
  }
  moreCheck =
  {
    Spear = 3
  }
  
  local mCount = materialCount[choosenObject]
  local check = moreCheck[choosenObject]
  
    if index == 0 then
      local materialGroup = smithy.choosenMaterials[index+1]
      
      
      for i = 1,mCount[index+1] do
        local selectedItem = RPG.selectItem(WndBag.Mode.ALL,"chooseTheMaterials")
        
        while selectedItem.data.useable[smithy.mode] == false do
          RPD.playSound("falseChoose.mp3")
          selectedItem = RPG.selectItem(WndBag.Mode.ALL,"chooseTheMaterials")
        end
        materialGroup[i] = selectedItem
      
      Add.chooseMaterials(smithy.chooseMaterials)
      end
      
      elseif index > 3 then
      
        for i = 1,mCount[index+1] do
        local selectedItem = RPG.selectItem(WndBag.Mode.ALL,"chooseTheMaterials")
        materialGroup[i] = selectedItem
        Add.chooseMaterials(smithy.chooseMaterials)
      end
      
      end
      
      if index == 3 and #choosenMaterials[1] == mCount[1] and (choosenMaterials[check] or true) == (mCount[check] or true) then
        hero = RPD.Dungeon.hero
        local itemStats = RPG.statsFromMaterials(smithy.choosenMaterials,smithy.mode)
        local items =
        {
          LightArmor = RPD.item("forgedArmor"),
          MediumArmor = RPD.item("forgedArmor"),
          HeavyArmor= RPD.item("forgedArmor"),
          weapon = ""
        }
        forgedItem = items[mode]
        forgedItem.data = {activationCount = 0,unpack(itemStats)}
        hero:collect(forgedItem,1)
      else
      RPD.glog("cantForge")
      end
    end


}
return smithy