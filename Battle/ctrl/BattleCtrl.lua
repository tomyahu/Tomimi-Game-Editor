require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
local Entity = require("Battle.model.entities.Entity")
local entities = require("Global.entities")
local Ctrl = require("Global.ctrl.ctrl")
local Party = require("Battle.model.party.Party")
local AmbientFactory = require("Battle.init.ambients.AmbientFactory")
local TurnManager = require("Battle.ctrl.managers.TurnManager")
local PlayerTurn = require("Battle.model.turns.PlayerTurn")
local RandomActionTurn = require("Battle.model.turns.RandomActionTurn")
local MenuManager = require("Battle.ctrl.managers.MenuManager")
local TargetGetter = require("Battle.model.entity_getter.TargetGetter")
--------------------------------------------------------------------------------------------------------

-- class: BattleCtrl
-- param: view:View -> the view of the menu app
-- The controller of the battle app
local BattleCtrl = extend(Ctrl, function(self, view)
    self.turn_manager = TurnManager.new({})
    self.menu_manager = MenuManager.new()

    self.player_party = Party.new({}, 0)
    self.enemy_party = Party.new({}, 0)

    self.target_getter = TargetGetter.new(self)

    self.ambient = AmbientFactory.getAmbientWithKey("debug_ambient1")
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
    self.player_party = self:createPartyFromDict(player_party_entities_metadata)

    -- Set the enemy party entities
    local enemy_party_entities_metadata = save["Battle"]["EnemyPartyMetadata"]
    self.enemy_party = self:createPartyFromDict(enemy_party_entities_metadata)
    
    -- Set the ambient of the battle
    local ambient_id = save["Battle"]["Ambient"]
    self.ambient = AmbientFactory.getAmbientWithKey(ambient_id)

    -- Set turn manager
    local battle_turns = {}
    for _, entity in pairs(self.player_party:getMembers()) do
        table.insert(battle_turns, PlayerTurn.new(entity))
    end
    for _, entity in pairs(self.enemy_party:getMembers()) do
        table.insert(battle_turns, RandomActionTurn.new(entity))
    end

    for _, turn in pairs(battle_turns) do
        print(turn:toString())
    end

    self.turn_manager:setTurns(battle_turns)
    self.turn_manager:resetCurrentTurn()
    self.turn_manager:setBattleOver(false)

    print(self.turn_manager:getCurrentTurn():toString())

    self.turn_manager:getCurrentTurn():start()

    -- set views
    self.view:setPlayerParty(self.player_party)
    self.view:setEnemyParty(self.enemy_party)
    self.view:setBackground(self.ambient)
end
-- callbackPressedKey: str -> None
-- Function called when user presses a key
function BattleCtrl.callbackPressedKey(self, key)
    self.menu_manager:callbackPressedKey(key)
end

-- createPartyFromDict: dict -> Party
-- Takes a dictionary containing a party of 3 and creates a party object with its components
function BattleCtrl.createPartyFromDict(self, entities_meta)
    local party_entities = {}

    for i, _ in pairs(entities_meta) do
        local id = entities_meta[i]["id"]
        local meta = entities_meta[i]["meta"]

        local stats = entities[id]

        for name, val in pairs(meta) do
            stats[name] = val
        end

        party_entities[i] = Entity.new(stats)
    end

    return Party.new(party_entities, 3)
end

-- stop: None -> None
-- Function called at the end of the execution of an application
function BattleCtrl.stop(self)

end

--getters
function BattleCtrl.getTurnManager(self)
    return self.turn_manager
end

function BattleCtrl.getMenuManager(self)
    return self.menu_manager
end

function BattleCtrl.getPlayerParty(self)
    return self.player_party
end

function BattleCtrl.getEnemyParty(self)
    return self.enemy_party
end

function BattleCtrl.getAmbient(self)
    return self.get_ambient
end

function BattleCtrl.getTargetGetter(self)
    return self.target_getter
end

return BattleCtrl