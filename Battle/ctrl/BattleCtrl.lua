require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
local Ctrl = require "Global.ctrl.ctrl"
local Party = require("Battle.model.party.Party")
local ambient_dictionary = require("Battle.init.ambient_dictionary")
local entity_factory = require("Battle.init.entity_factory")
--------------------------------------------------------------------------------------------------------

-- class: BattleCtrl
-- param: view:View -> the view of the menu app
-- The controller of the battle app
local BattleCtrl = extend(Ctrl, function(self, view)
    self.player_party = Party.new({}, 0)
    self.enemy_party = Party.new({}, 0)
    self.ambient = ambient_dictionary["debug_ambient1"]
end,

function(view)
    return Ctrl.new(view)
end)

-- setup: None -> None
-- Function called at the begining of the execution of an application
function BattleCtrl.setup(self)
    local save = application:getCurrentSave()
    -- Set the players party entities
    local player_party_entities_metadata = save["Battle"]["PlayerPartyMetadata"]
    local player_party_entities = {}

    for i = 1,(# player_party_entities_metadata) do
        local id = player_party_entities_metadata[i]["id"]
        local meta = player_party_entities_metadata[i]["meta"]
        table.insert(player_party_entities, entity_factory:getEntity(id, meta))
    end

    self.player_party = Party.new(player_party_entities, 3)

    -- Set the enemy party entities
    local enemy_party_entities_metadata = save["Battle"]["EnemyPartyMetadata"]
    local enemy_party_entities = {}

    for i = 1,(# enemy_party_entities_metadata) do
        local id = enemy_party_entities[i]["id"]
        local meta = enemy_party_entities[i]["meta"]
        table.insert(enemy_party_entities, entity_factory:getEntity(id, meta))
    end

    self.enemy_party = Party.new(enemy_party_entities, 3)
    
    -- Set the ambient of the battle
    local ambient_id = save["Battle"]["Ambient"]

    self.ambient = require(ambient_dictionary[ambient_id])
    self.ambient:affectPartyAndEnemies(self.player_party, self.enemy_party)
    
    -- TODO: clean enemies and ambient from global context
    save["Battle"]["EnemyPartyMetadata"] = nil
    save["Battle"]["Ambient"] = nil
    application:setCurrentSave(save)
end

-- stop: None -> None
-- Function called at the end of the execution of an application
function BattleCtrl.stop(self)
    -- TODO: Give experience to the player based in what they did
    -- TODO: Update the player's items
end

return BattleCtrl