require "lib.classes.class"
require "Global.application.application"
require "Battle.consts"
local Turn = require("Battle.model.turns.Turn")
--------------------------------------------------------------------------------------------------------

-- class: RandomActionTurn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle where the ability to do is chosen at random
local RandomActionTurn = extend(Turn, function(self, entity)
    self.entity = entity
end)

local target_behaviour = {}
target_behaviour[BATTLE_TARGET_SELF] = function(self) return {self.entity} end

-- TODO: Complete the ones below
-- TODO: Create a class that can find possible entities to hit for each targeting value
target_behaviour[BATTLE_TARGET_SINGLE_PARTY_MEMBER] = function(self) return {} end
target_behaviour[BATTLE_TARGET_ALL_PARTY_MEMBER] = function(self) return {} end
target_behaviour[BATTLE_TARGET_SINGLE_ENEMY] = function(self) return {} end
target_behaviour[BATTLE_TARGET_ALL_ENEMIES] = function(self) return {} end

-- start: None -> None
-- Starts a new edition of the turn of this entity
function RandomActionTurn.start(self)
    local ctrl = application:getCurrentCtrl()

    -- TODO: Get Entity's possible actions
    -- TODO: Check the case where there are non special actions

    local possible_actions = self.entity:getActions()

    -- Choose one action at random
    local actions = { possible_actions[math.random(1,(# possible_actions))] }

    -- Choose random targets depending for every action
    local entities = {}
    for _, action in pairs(actions) do
        if target_behaviour[action:getTarget()] == nil then
            error("Tried to get target entities for an action with an unrecognize targeting value.")
        end

        table.insert(entities, target_behaviour[action:getTarget()](self))
    end

    -- Call the Turn manager with the new abilities
    ctrl:getTurnManager():turnEnded(actions, entities)
end

return RandomActionTurn