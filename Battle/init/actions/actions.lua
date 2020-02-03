require "Global.application.application"
local ActionBuilder = require("Battle.model.actions.ActionBuilder")
require ("Battle.consts")
--------------------------------------------------------------------------------------------------------

local actions = {}
local action_build = ActionBuilder.new()

-- 1. Do Nothing -------------------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(1)
action_build:setName("Do Nothing")
action_build:setDescription("Wastes a turn doing nothing.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setTarget(BATTLE_TARGET_SELF)
action_build:setType(BATTLE_ACTION_ATTACK_TYPE)
action_build:setActionFunction( function(source_entity, target_entity)
    print(source_entity:getName() .. " passed the turn.")
end)
table.insert(actions, action_build:getAction())

-- 2. Run Away ---------------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(2)
action_build:setName("Run Away")
action_build:setDescription("Escapes from combat with a 50% chance.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setTarget(BATTLE_TARGET_SELF)
action_build:setActionFunction( function(source_entity, target_entity)
    
    if math.random() < 0.5 then
        local ctrl = application:getCurrentCtrl()
        ctrl:getTurnManager():setBattleOver(true)
    else
        print("Couldn't escape.")
    end
end)
table.insert(actions, action_build:getAction())

-- 3. Feel Proud -------------------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(3)
action_build:setName("Feel Proud")
action_build:setDescription("Feel proud about yourself, which is important every now and then.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setTarget(BATTLE_TARGET_SELF)
action_build:setType(BATTLE_ACTION_SUPPORT_TYPE)
action_build:setActionFunction( function(source_entity, target_entity)
    print(source_entity:getName() .. " felt proud of themself.")
end)
table.insert(actions, action_build:getAction())

return actions