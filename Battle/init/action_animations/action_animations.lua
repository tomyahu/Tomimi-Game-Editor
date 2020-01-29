require "Global.consts"

local actions = require("Battle.init.actions.actions")
local AnimationSequenceBuilder = require("Battle.view.animations.animation_sequence.AnimationSequenceBuilder")
local ActionAnimations = require("Battle.view.animations.action_animations.ActionAnimations")

local LinearMoveAnimation = require("Battle.view.animations.animations.LinearMoveAnimation")
local LinearReturnMoveAnimation = require("Battle.view.animations.animations.LinearReturnMoveAnimation")
--------------------------------------------------------------------------------------------------------

local animation_dict = {}

-- An animation where nothing is done
local null_animation_builder = AnimationSequenceBuilder.new()

-- Create default animation to create for all actions
local default_animation_builder = AnimationSequenceBuilder.new()
default_animation_builder:addAnimation(LinearMoveAnimation.new(GAME_WIDTH/2, 400/600*GAME_HEIGHT, 0.5), 0, 0.5)
default_animation_builder:addAnimation(LinearReturnMoveAnimation.new(0.5), 1.5, 2)


-- Fill all actions with default animation
for _, action in pairs(actions) do
    animation_dict[action] = ActionAnimations.new(default_animation_builder, null_animation_builder)
end

return animation_dict
