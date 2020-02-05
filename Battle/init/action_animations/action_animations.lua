require "Global.consts"

local actions = require("Battle.init.actions.actions")
local AnimationSequenceBuilder = require("Battle.view.animations.animation_sequence.AnimationSequenceBuilder")
local ActionAnimations = require("Battle.view.animations.action_animations.ActionAnimations")

local LinearMoveAnimation = require("Battle.view.animations.animations.LinearMoveAnimation")
local LinearReturnMoveAnimation = require("Battle.view.animations.animations.LinearReturnMoveAnimation")
local MessageDisplayAnimation = require("Battle.view.animations.animations.MessageDisplayAnimation")
local ApplyActionAnimation = require("Battle.view.animations.animations.ApplyActionAnimation")
--------------------------------------------------------------------------------------------------------

local animation_dict = {}

-- An animation where nothing is done
local null_animation_builder = AnimationSequenceBuilder.new()

-- Fill all actions with default animation
for _, action in pairs(actions) do
    -- Create default animation to create for all actions
    local default_animation_builder = AnimationSequenceBuilder.new()
    default_animation_builder:addAnimation(LinearMoveAnimation.new(GAME_WIDTH/2, 450/600*GAME_HEIGHT, 0.5), 0, 0.5)
    default_animation_builder:addAnimation(LinearReturnMoveAnimation.new(0.5), 1.5, 2)
    default_animation_builder:addAnimation(ApplyActionAnimation.new(action, {}), 1.5, 1.5)
    animation_dict[action] = ActionAnimations.new(default_animation_builder, null_animation_builder)
end

------------------------------------------------------------------------------------------------------------------------
-- 2. Run Away Animation -----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
local run_away_action = actions[2]
local run_away_animation_builder = AnimationSequenceBuilder.new()
run_away_animation_builder:addAnimation(LinearMoveAnimation.new(GAME_WIDTH/2, 450/600*GAME_HEIGHT, 0.5), 0, 0.5)
run_away_animation_builder:addAnimation(
    ApplyActionAnimation.new(run_away_action),
    0.5,
    1.5
)
run_away_animation_builder:addAnimation(LinearReturnMoveAnimation.new(0.5), 1.5, 2)

animation_dict[run_away_action] = ActionAnimations.new(run_away_animation_builder, null_animation_builder)


------------------------------------------------------------------------------------------------------------------------
-- 3. Feel Proud Animation ---------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
local feel_proud_action = actions[3]
local feel_proud_animation_builder = AnimationSequenceBuilder.new()
feel_proud_animation_builder:addAnimation(LinearMoveAnimation.new(GAME_WIDTH/2, 450/600*GAME_HEIGHT, 0.5), 0, 0.5)
feel_proud_animation_builder:addAnimation(
    MessageDisplayAnimation.new("The Naranjarina is feeling proud of themself. Good for you Naranjarina.", 2),
    0.5,
    2.5
)
feel_proud_animation_builder:addAnimation(LinearReturnMoveAnimation.new(0.5), 2.5, 3)

animation_dict[feel_proud_action] = ActionAnimations.new(feel_proud_animation_builder, null_animation_builder)

------------------------------------------------------------------------------------------------------------------------
-- 7. True Escape Animation --------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
local true_escape_action = actions[7]
local true_escape_animation_builder = AnimationSequenceBuilder.new()
true_escape_animation_builder:addAnimation(LinearMoveAnimation.new(GAME_WIDTH/2, 450/600*GAME_HEIGHT, 0.5), 0, 0.5)
true_escape_animation_builder:addAnimation(
ApplyActionAnimation.new(true_escape_action),
0.5,
1.5
)
true_escape_animation_builder:addAnimation(LinearReturnMoveAnimation.new(0.5), 1.5, 2)

animation_dict[true_escape_action] = ActionAnimations.new(true_escape_animation_builder, null_animation_builder)




----
return animation_dict