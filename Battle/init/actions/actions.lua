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
    local view = application:getCurrentView()
    local message_displayer = view:getMessageDisplayer()

    if math.random() < 0.5 then
        local ctrl = application:getCurrentCtrl()
        ctrl:getTurnManager():setBattleOver(true)

        message_displayer:displayMessage("Successfully ran away.", 2)
    else
        message_displayer:displayMessage("Couldn't escape.", 2)
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
end)
table.insert(actions, action_build:getAction())

-- 4. Lets Go! (Mac Ability) -------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(4)
action_build:setName("Lets Go!")
action_build:setDescription("Jumps at the target and atempts a vetical slash.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setEndPiece(BATTLE_ACTION_PIECE_T)
action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
action_build:setType(BATTLE_ACTION_ATTACK_TYPE)
action_build:setActionFunction( function(source_entity, target_entity)
    print("Lets Go!")
end)
table.insert(actions, action_build:getAction())

-- 5. Sinister Slash (Mac Ability) -------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(5)
action_build:setName("Sinister Slash")
action_build:setDescription("A mysterious strike that comes from the left.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_T)
action_build:setEndPiece(BATTLE_ACTION_PIECE_C)
action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
action_build:setType(BATTLE_ACTION_ATTACK_TYPE)
action_build:setActionFunction( function(source_entity, target_entity)
    print("misterious...")
end)
table.insert(actions, action_build:getAction())

-- 6. Dragon Horn (Mac Ability) ----------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(6)
action_build:setName("Dragon Horn")
action_build:setDescription("A direct strike from the center tilted a little up like a horn.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_C)
action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
action_build:setType(BATTLE_ACTION_ATTACK_TYPE)
action_build:setActionFunction( function(source_entity, target_entity)
    print("roar!")
end)
table.insert(actions, action_build:getAction())

return actions