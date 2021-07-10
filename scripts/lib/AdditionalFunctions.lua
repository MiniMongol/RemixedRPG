local RPD = require "scripts/lib/commonClasses"
local RPG = require "scripts/lib/Functions"
local storage = require "scripts/lib/storage"

local RPG1 = {

   showQuestWindow = function(self, text)
        local wnd = luajava.newInstance(RPD.Objects.Ui.WndQuest, self, text)
        RPD.GameScene:show(wnd)
    end,
    
   addStats = function(num, stat)
    if stat == 1 then
     RPG.physicStrA = RPG.physicStrA + num
    end
    if stat == 2 then
      RPG.magicStrA = RPG.magicStrA + num
    end
    if stat == 3 then
      RPG.fastA = RPG.fastA + num
    end
    if stat == 4 then
      RPG.spRegenA = RPG.spRegenA + num
    end
    if stat == 5 then
      RPG.luckA = RPG.luckA + num
    end
 end,
 
 delStats = function(num, stat)
    if stat == 1 then
      RPG.physicStrA = 0
    end
    if stat == 2 then
      RPG.magicStrA = 0
    end
    if stat == 3 then
      RPG.fastA = 0
    end
    if stat == 4 then
      RPG.spRegenA = 0
    end
    if stat == 5 then
      RPG.luckA = 0
   end
 end,
 
 pillChoise = function(dialog)
   RPD.chooseOption(dialog,
   "Выбор пилюли",
   "Тебе какая пилюля нужна, герой?",
   "Пилюля закалки тела\n(Семена Солнечника x1,\nСемена Земляного корня x1)"
   )
 end,
 
 trapChoise = function(dialog)
   local Spell = storage.gameGet("placetrap") or {}
   RPD.chooseOption(dialog,
   "TrapChoiseT ",
   "",
   "TrapChoise0",
   RPD.textById("TrapChoise1").." ["..Spell.UP.." очков]")
 end,
 
 trapChoiseOn = function(dialog,index)
   local Spell = storage.gameGet("placetrap") or {}
   if index == 0 then
     RPD.chooseOption(dialog,
     "TrapChoiseOnT",
     "",
   RPD.textById("TrapChoiseOn0").." ["..Spell.FT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn1").." ["..Spell.BT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn2").." ["..Spell.CT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn3").." ["..Spell.IT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn4").." ["..Spell.PT.." "..RPD.textById("Lvl").."]")
   else
     RPD.chooseOption(dialog,
     "TrapChoiseOnT",
     ""..Spell.UP.." очков улучшения",
   RPD.textById("TrapChoiseOn0").." ["..Spell.FT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn1").." ["..Spell.BT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn2").." ["..Spell.CT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn3").." ["..Spell.IT.." "..RPD.textById("Lvl").."]",
   RPD.textById("TrapChoiseOn4").." ["..Spell.PT.." "..RPD.textById("Lvl").."]")
   end
 end,

 statusWindow = function(dialog,states,index1)
 RPD.chooseOption( dialog,
                RPD.textById("status"),
                RPD.textById("str")..": "..tostring(RPG.strength).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("int")..": "..tostring(RPG.intelligence).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("dex")..": "..tostring(RPG.dexterity).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("sur")..": "..tostring(RPG.vitality).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("wis").." : "..tostring(RPG.wisdom).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("luck")..": "..tostring(RPG.AllLuck()).." [1 "..RPD.textById("SPcost").."]\n\n"..RPD.textById("PhysStr")..": "..tostring(RPG.physStr()).."\n"..RPD.textById("MagStr")..": "..tostring(RPG.magStr()).."\n"..RPD.textById("Fast")..": "..tostring(RPG.AllFast()).."\n "..tostring(RPG.AllSpRegen()).." "..RPD.textById("SpRegenMove"),
                "["..tostring(states[index1]).."]",
                RPD.textById("SpecUp").."["..tostring(RPG.sPoints).." "..RPD.textById("SpecUpCost")
        )
 end,
 
 statusWindowClass = function(dialog,states,index1)
 RPD.chooseOption( dialog,
              RPD.textById("status"),
                RPD.textById("str")..": "..tostring(RPG.strength).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("int")..": "..tostring(RPG.intelligence).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("dex")..": "..tostring(RPG.dexterity).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("sur")..": "..tostring(RPG.vitality).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("wis").." : "..tostring(RPG.wisdom).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("luck")..": "..tostring(RPG.AllLuck()).." [1 "..RPD.textById("SPcost").."]\n\n"..RPD.textById("PhysStr")..": "..tostring(RPG.physStr()).."\n"..RPD.textById("MagStr")..": "..tostring(RPG.magStr()).."\n"..RPD.textById("Fast")..": "..tostring(RPG.AllFast()).."\n "..tostring(RPG.AllSpRegen()).." "..RPD.textById("SpRegenMove"),
                "["..tostring(states[index1]).."]",
                RPD.textById("SpecUp").."["..tostring(RPG.sPoints).." "..RPD.textById("SpecUpCost"),
                "ClassPick"
        )
 end,
 classWindow = function(dialog)
 RPD.chooseOption( dialog,
                "ClassPick",
                "ClassPickD",
                "warrior",
                "rogue",
                "mage"
        )
 end,
 
 statusWindowSubclass = function(dialog,states,index1)
 RPD.chooseOption( dialog,
               RPD.textById("status"),
                RPD.textById("str")..": "..tostring(RPG.strength).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("int")..": "..tostring(RPG.intelligence).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("dex")..": "..tostring(RPG.dexterity).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("sur")..": "..tostring(RPG.vitality).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("wis").." : "..tostring(RPG.wisdom).." [1 "..RPD.textById("SPcost").."]\n"..RPD.textById("luck")..": "..tostring(RPG.AllLuck()).." [1 "..RPD.textById("SPcost").."]\n\n"..RPD.textById("PhysStr")..": "..tostring(RPG.physStr()).."\n"..RPD.textById("MagStr")..": "..tostring(RPG.magStr()).."\n"..RPD.textById("Fast")..": "..tostring(RPG.AllFast()).."\n "..tostring(RPG.AllSpRegen()).." "..RPD.textById("SpRegenMove"),
                "["..tostring(states[index1]).."]",
                RPD.textById("SpecUp").."["..tostring(RPG.sPoints).." "..RPD.textById("SpecUpCost"),
                "SubclassPick"
        )
 end,
 subclassWindow = function(dialog)
 local subclasses = {
   Warrior = {"Berserk","Paladin","BladeOfMind","Samurai"},
   Rogue = {"Archer","Killer","Ninja","Bandit"},
   Mage = {"BattleMage","Demonologist","Necromancer","Enchanter"}
   }
   local subclass = subclasses[RPG.class]
 RPD.chooseOption( dialog,
                "SubclassPick",
                "SubclassPickD",
                subclass[1],
                subclass[2],
                subclass[3],
                subclass[4]
        )
 end
 
 }
return RPG1