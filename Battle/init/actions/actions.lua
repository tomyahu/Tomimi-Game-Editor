require "Global.application.application"
local ActionBuilder = require("Battle.model.actions.ActionBuilder")
local RegularAttackActionBuilder = require("Battle.model.actions.RegularAttackActionBuilder")
require ("Battle.consts")
--------------------------------------------------------------------------------------------------------

local actions = {}
local action_build = ActionBuilder.new()
local regular_attack_action_build = RegularAttackActionBuilder.new()

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
action_build:setDescription("Escapes from combat with a 25% chance.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setTarget(BATTLE_TARGET_SELF)
action_build:setActionFunction( function(source_entity, target_entity)
    local ctrl = application:getCurrentCtrl()
    local view = application:getCurrentView()
    local message_displayer = view:getMessageDisplayer()

    if math.random() < 0.25 and ctrl:canEscape() then
        ctrl:escape()
        message_displayer:displayMessage("Successfully ran away.", 1)
    else
        message_displayer:displayMessage("Couldn't escape.", 1)
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
regular_attack_action_build:reset()
regular_attack_action_build:setId(4)
regular_attack_action_build:setName("Lets Go!")
regular_attack_action_build:setDescription("Jumps at the target and atempts a vetical slash.")
regular_attack_action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
regular_attack_action_build:setEndPiece(BATTLE_ACTION_PIECE_T)
regular_attack_action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
regular_attack_action_build:setGuardDamage(2)
regular_attack_action_build:setDirectDamage(5)

table.insert(actions, regular_attack_action_build:getAction())

-- 5. Sinister Slash (Mac Ability) -------------------------------------------------------------------------------------
regular_attack_action_build:reset()
regular_attack_action_build:setId(5)
regular_attack_action_build:setName("Sinister Slash")
regular_attack_action_build:setDescription("A mysterious strike that comes from the left.")
regular_attack_action_build:setStartPiece(BATTLE_ACTION_PIECE_T)
regular_attack_action_build:setEndPiece(BATTLE_ACTION_PIECE_C)
regular_attack_action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
regular_attack_action_build:setGuardDamage(1)
regular_attack_action_build:setDirectDamage(5)
table.insert(actions, regular_attack_action_build:getAction())

-- 6. Dragon Horn (Mac Ability) ----------------------------------------------------------------------------------------
regular_attack_action_build:reset()
regular_attack_action_build:setId(6)
regular_attack_action_build:setName("Dragon Horn")
regular_attack_action_build:setDescription("A direct strike from the center tilted a little up like a horn.")
regular_attack_action_build:setStartPiece(BATTLE_ACTION_PIECE_C)
regular_attack_action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
regular_attack_action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
regular_attack_action_build:setGuardDamage(3)
regular_attack_action_build:setDirectDamage(5)
table.insert(actions, regular_attack_action_build:getAction())

-- 7. True Escape ------------------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(7)
action_build:setName("True Escape")
action_build:setDescription("Escapes from combat with a 100% chance.")
action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
action_build:setTarget(BATTLE_TARGET_SELF)
action_build:setType(BATTLE_ACTION_SUPPORT_TYPE)
action_build:setActionFunction( function(source_entity, target_entity)
    local view = application:getCurrentView()
    local message_displayer = view:getMessageDisplayer()

    local ctrl = application:getCurrentCtrl()
    if ctrl:canEscape() then
        ctrl:escape()
        message_displayer:displayMessage("Successfully ran away.", 1)
    else
        message_displayer:displayMessage("This battle is un-escapable.", 1)
    end
end)
table.insert(actions, action_build:getAction())

-- 8. Guard Breaker ----------------------------------------------------------------------------------------------------
regular_attack_action_build:reset()
regular_attack_action_build:setId(8)
regular_attack_action_build:setName("Guard Breaker")
regular_attack_action_build:setDescription("Breaks a single target's guard, used for debug.")
regular_attack_action_build:setStartPiece(BATTLE_ACTION_PIECE_BORDER)
regular_attack_action_build:setEndPiece(BATTLE_ACTION_PIECE_BORDER)
regular_attack_action_build:setTarget(BATTLE_TARGET_SINGLE_ENEMY)
regular_attack_action_build:setGuardDamage(9999999)
regular_attack_action_build:setDirectDamage(0)
table.insert(actions, regular_attack_action_build:getAction())

return actions