require "lib.classes.class"
require "Global.application.application"
require "Battle.consts"
local Turn = require("Battle.model.turns.Turn")
local ActionSequenceCreator = require("Battle.model.action_sequence.ActionSequenceCreator")
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
    Turn.start(self)
    local ctrl = application:getCurrentCtrl()

    -- Get Entity's possible actions
    local possible_actions = self.entity:getActions()

    -- Choose a random action sequence with the possible actions
    local action_sequence_creator = ActionSequenceCreator.new(possible_actions)
    local start_actions = action_sequence_creator:getStartActions()
    action_sequence_creator:addAction(start_actions[math.random(1, (# start_actions))])
    while not (action_sequence_creator:getLastAction():isEndAction()) do
        local compatible_actions = action_sequence_creator:getActionsCompatibleWithLastAction()
        action_sequence_creator:addAction(compatible_actions[math.random(1, (# compatible_actions))])
    end

    local actions = action_sequence_creator:getActionSequence()


    -- Choose random targets depending on the first action
    local target_getter = ctrl:getTargetGetter()
    local possible_enemy_targets = target_getter:getTargetSingleEnemy(self.entity)
    local enemy_target = possible_enemy_targets[math.random(1, (# possible_enemy_targets))]
    local possible_ally_targets = target_getter:getTargetSinglePartyMember(self.entity)
    local ally_target = possible_ally_targets[math.random(1,(# possible_ally_targets))]

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
    self:chooseActions(actions, entities)
end

return RandomActionTurn