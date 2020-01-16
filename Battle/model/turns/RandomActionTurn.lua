require "lib.classes.class"
require "Global.application.application"
require "Battle.consts"
local Turn = require("Battle.model.turns.Turn")
local ActionSequenceCreator = require("Battle.model.action_sequence.ActionSquenceCreator")
--------------------------------------------------------------------------------------------------------

-- class: RandomActionTurn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle where the ability to do is chosen at random
local RandomActionTurn = extend(Turn, function(self, entity)
    self.entity = entity
end)

-- start: None -> None
-- Starts a new edition of the turn of this entity
function RandomActionTurn.start(self)
    local ctrl = application:getCurrentCtrl()

    -- Get Entity's possible actions
    -- TODO: Check the case where there are non special actions
    local possible_actions = self.entity:getActions()

    -- Choose one action at random
    local action_sequence_creator = ActionSequenceCreator.new(possible_actions)
    local start_actions = action_sequence_creator:getStartActions()
    action_sequence_creator:addAction(start_actions[math.random(1, (# start_actions))])
    while action_sequence_creator:getLastAction():isEndAction() do
        local last_action_type = action_sequence_creator:getLastAction():getEndPiece()
        local next_action = action_sequence_creator:getActionsWithStartType(last_action_type)
        local compatible_actions = action_sequence_creator:addAction(next_action)
        action_sequence_creator:addAction(compatible_actions[math.random(1, (# compatible_actions))])
    end

    local actions = action_sequence_creator:getActionSequence()


    -- Choose random targets depending on the first action
    local target_getter = ctrl:getTargetGetter()
    local enemy_target = target_getter:getEntityEnemyPartyMembers(self.entity)[math.random(1, (# target_getter:getEntityEnemyPartyMembers(self.entity)))]
    local ally_target = target_getter:getEntityPartyMembers(self.entity)[math.random(1,target_getter:getEntityPartyMembers(self.entity))]

    local target_behaviour = {}
    target_behaviour[BATTLE_TARGET_SELF] = {self.entity}
    target_behaviour[BATTLE_TARGET_SINGLE_PARTY_MEMBER] = ally_target
    target_behaviour[BATTLE_TARGET_ALL_PARTY_MEMBER] = target_getter:getTargets(self.entity, BATTLE_TARGET_ALL_PARTY_MEMBER)[1]
    target_behaviour[BATTLE_TARGET_SINGLE_ENEMY] = enemy_target
    target_behaviour[BATTLE_TARGET_ALL_ENEMIES] = target_getter:getTargets(self.entity, BATTLE_TARGET_ALL_ENEMIES)[1]

    local entities = {}
    for _, action in pairs(actions) do
        if target_behaviour[action:getTarget()] == nil then
            error("Tried to get target entities for an action with an unrecognize targeting value.")
        end

        table.insert(entities, target_behaviour[action:getTarget()])
    end

    -- Call the Turn manager with the new abilities
    ctrl:getTurnManager():turnEnded(actions, entities)
end

return RandomActionTurn