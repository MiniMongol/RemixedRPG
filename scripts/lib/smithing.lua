local RPD                  = require "scripts/lib/commonClasses"
local RPG                  = require "scripts/lib/Functions"
local Add                  = require "scripts/lib/AdditionalFunctions"

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
  quantityForItem = quantityForItem,
  iconGroup = iconGroup,
  mode = mode,
  wType = wType,
  quantityToChoose = 0,
  allQuantity = {0,0,0},
  selectedItem = selectedItem,
  finalStats = finalStats,
  
  finalMaterials={{},{},{}},

mainWnd = function(index)
  smithy.quantityToChoose = 0
  smithy.allQuantity = {0,0,0}
  if index == 0 then
    Add.smithWeapon(smithy.weaponWnd)
    else
    Add.smithArmor(smithy.armorWnd)
    end
end,

weaponWnd = function(index)
  smithy.mode = "weapon"
  if index == 0 then
    Add.smithMelee(smithy.meleeWnd)
  else
    Add.smithRange(smithy.missileWnd)
  end
end,

meleeWnd = function(index)
  local type = {
  "oneHanded",
  "twoHanded"
  }
  if index == 0 then
    Add.smithOnehand(smithy.onehandWnd)
  else
    Add.smithTwohand(smithy.twohandWnd)
  end
  smithy.wType = type[index+1]
end,

onehandWnd = function(index)
  local chooses =
  {
    "Sword",
    "Dagger",
    "Axe",
    "Mace"
  }

  smithy.choosenObject = chooses[index+1]
  Add.smithChooseMaterials(smithy.chooseMaterials)
end,

twohandWnd = function(index)
  local chooses =
  {
    "Longsword",
    "Spear",
    "Halberd",
    "Hammer"
  }

  smithy.choosenObject = chooses[index+1]
  Add.smithChooseMaterials(smithy.chooseMaterials)
end,

missileWnd = function(index)
  local chooses =
  {
    "Bow",
    "Crossbow"
  }
  
  smithy.choosenObject = chooses[index+1]
  Add.smithChooseMaterials(smithy.chooseMaterials)
end,

armorWnd = function(index)
  smithy.mode = "armor"
  local chooses =
  {
    "LightArmor",
    "MediumArmor",
    "HeavyArmor"
  }
  

  smithy.choosenObject = chooses[index+1]
  Add.smithChooseMaterials(smithy.chooseMaterials)
end,

chooseMaterials = function(index)
  local WndBag = RPG.Objects.Ui.WndBag
  materialCount = 
  {
    Sword={7,4},
    Longsword={10,4},
    Dagger={3,4},
    Spear={3,4,2},
    Mace={8,4},
    Hammer={12,4},
    Axe={8,4},
    Halberd={10,4,2},
    Bow={5,4},
    Crossbow={7,4},
    LightArmor={5,4},
    MediumArmor={8,4},
    HeavyArmor={10,4}
  }
  moreCheck =
  {
    Spear = 3,
    Halberd = 3
  }
  
  local mCount = materialCount[smithy.choosenObject]
  local check = moreCheck[smithy.choosenObject]
  local finalGroup = smithy.finalMaterials[index+1]
  local quantityOfChoosed = {0,0,0}
  local selectedItem
  
  for i = 1,3 do
  
    local fMaterialsGroup = smithy.finalMaterials[i]
    
    for ii =1,#fMaterialsGroup do
    
      local fMaterial = fMaterialsGroup[ii]
      quantityOfChoosed[i] = quantityOfChoosed[i] + (fMaterial[2] or 0)
      
    end
  end
  
  
  if index == 3 then
      
        smithy.quantityToChoose = smithy.quantityToChoose+1
      elseif index == 4 then
      
        if smithy.quantityToChoose ~= 0 then
          smithy.quantityToChoose = smithy.quantityToChoose-1
          
        end
      end
    
    
    if (mCount[index+1] or 0) - (quantityOfChoosed[index+1] or 0) >= smithy.quantityToChoose and smithy.quantityToChoose ~= 0 then
    
    
      if index == 0 then
      
        RPG.selectItemForSmithing(luajava.bindClass(WndBag).Mode.ALL,"chooseTheMaterials",index+1,smithy.quantityToChoose)
        smithy.quantityToChoose = 0
        
        elseif index < 3 then
        
          if (index == 2 and check ~= nil) or index ~= 2 then
          
          RPG.selectItemForSmithing(luajava.bindClass(WndBag).Mode.ALL,"chooseTheMaterials",index+1,smithy.quantityToChoose)
          smithy.quantityToChoose = 0
          
          end
        end
        elseif index ~= 5 then
        Add.smithChooseMaterials(smithy.chooseMaterials)
      end
      
      
      if index == 5 and quantityOfChoosed[1] == mCount[1] and (quantityOfChoosed[check] or true) == (mCount[check] or true) then
        hero = RPD.Dungeon.hero
        
        local is = RPG.statsFromMaterials(smithy.finalMaterials,smithy.mode)
        
        smithy.finalStats = {activationCount = 0, choosedArrows = "CommonArrows", str = is.str,info=is.info, name = is.name, icon = is.icon, tier = is.tier, dr = is.dr, maxDmg = is.maxDmg, minDmg = is.minDmg, accuracy = is.accuracy, delay = is.delay, range = is.range, dstats = is.dstats, addstats = is.addStats, type = is.type, element = is.element, wType = smithy.wType, pCoef = 20*2^(is.tier-1) + 10*2^(is.tier-1), choosenObject = smithy.choosenObject}
        
        if smithy.mode == "armor" then
          armor = RPD.item("forgedArmor")
          hero:collect(armor,1)
        else
          weapon = RPD.item("forged"..smithy.choosenObject)
          hero:collect(weapon,1)
        end
        
        smithy.finalMaterials={{},{},{}}
        RPD.playSound("snd_evoke.ogg")
      elseif index == 5 then
        RPD.playSound("snd_wrong.ogg")
        RPD.glog("cantForge")
      end
    end


}
return smithy