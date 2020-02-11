require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
local Entity = require("Battle.model.entities.Entity")
local entities = require("Global.entities")
local Ctrl = require("Global.ctrl.ctrl")
local Party = require("Battle.model.party.Party")
local EnvironmentFactory = require("Battle.init.environments.EnvironmentFactory")
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

    self.environment = EnvironmentFactory.getEnvironmentWithKey("debug_environment1")
    self.item_rewards = {}

    self.can_escape = true
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

    -- Set the rewards when the battle is won
    self.item_rewards = save["Battle"]["Rewards"]["Items"]

    -- Set the values if the battle is escapable
    self.can_escape = save["Battle"]["CanEscape"]
    
    -- Set the environment of the battle
    local environment_id = save["Battle"]["Environment"]
    self.environment = EnvironmentFactory.getEnvironmentWithKey(environment_id)

    -- Set turn manager
    local battle_turns = {}
    for _, entity in pairs(self.player_party:getMembers()) do
        table.insert(battle_turns, PlayerTurn.new(entity))
    end
    for _, entity in pairs(self.enemy_party:getMembers()) do
        table.insert(battle_turns, RandomActionTurn.new(entity))
    end

    self.turn_manager:setTurns(battle_turns)
    self.turn_manager:resetCurrentTurn()
    self.turn_manager:setBattleOver(false)

    self.turn_manager:getCurrentTurn():start()

    -- set views
    self.view:setPlayerParty(self.player_party)
    self.view:setEnemyParty(self.enemy_party)
    self.view:setBackground(self.environment)
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

-- doGameOverSequence: None -> None
-- Shows the game over screen and returns to the main menu
function BattleCtrl.doGameOverSequence(self)
    application:appChange("GameOverMenu")
end

-- doVictorySequence: None -> None
-- Shows the victory screen, awards the party with some battle rewards and returns to the Overworld App
-- TODO: Implement this
function BattleCtrl.doVictorySequence(self)
    -- TODO: Set menu with only accept state to go to the next app
    -- TODO: Add rewards to items
    application:appChange("Overworld")
end

-- escape: None -> None
-- escapes the battle if the battle is escapable
function BattleCtrl.escape(self)
    if self.canEscape then
        self:getTurnManager():setBattleOver(true)
    end
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

function BattleCtrl.getEnvironment(self)
    return self.environment
end

function BattleCtrl.getTargetGetter(self)
    return self.target_getter
end

function BattleCtrl.canEscape(self)
    return self.canEscape
end

return BattleCtrl