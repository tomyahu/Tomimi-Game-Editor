require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
local Ctrl = require "Global.ctrl.ctrl"
local ambient_dictionary = "Battle.init.ambient_dictionary"
--------------------------------------------------------------------------------------------------------

-- class: BattleCtrl
-- param: view:View -> the view of the menu app
-- The controller of the battle app
local BattleCtrl = extend(Ctrl, function(self, view)
end,

function(view)
    return Ctrl.new(view)
end)

-- setup: None -> None
-- Function called at the begining of the execution of an application
function BattleCtrl.setup(self)
    local ambient = 
    --self.ambient = require(ambient_dictionary[ambient])
    --self.player_party = player_party
    --self.enemy_party = enemy_party
    
    --self.ambient:affectPartyAndEnemies(self.player_party, self.enemy_party)
end

return BattleCtrl