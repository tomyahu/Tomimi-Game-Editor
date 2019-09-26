require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
local Ctrl = require "Global.ctrl.ctrl"
local Party = require("Battle.model.party.Party")
local ambient_dictionary = "Battle.init.ambient_dictionary"
--------------------------------------------------------------------------------------------------------

-- class: BattleCtrl
-- param: view:View -> the view of the menu app
-- The controller of the battle app
local BattleCtrl = extend(Ctrl, function(self, view)
    self.player_party = Party.new({})
    self.enemy_party = Party.new({})
end,

function(view)
    return Ctrl.new(view)
end)

-- setup: None -> None
-- Function called at the begining of the execution of an application
function BattleCtrl.setup(self)
    local save = application:getCurrentSave()
    -- TODO: Set the players party entities
    self.player_party = nil
    
    -- TODO: Set the enemy party entities
    self.enemy_party = nil
    
    -- TODO: Set the ambient of the battle
    local ambient = save["CurrentBattleAmbient"]
    --self.ambient = require(ambient_dictionary[ambient])
    --self.ambient:affectPartyAndEnemies(self.player_party, self.enemy_party)
    
    -- TODO: clean enemies, ambient and advantage/disadvantage condition from global context
end

-- stop: None -> None
-- Function called at the end of the execution of an application
function BattleCtrl.stop(self)
    -- TODO: Give experience to the player based in what they did
    -- TODO: Update the player's items
end

return BattleCtrl