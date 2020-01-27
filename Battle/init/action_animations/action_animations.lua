local actions = require("Battle.init.actions.actions")
local AnimationSequenceBuilder = require("Battle.view.animations.AnimationSequenceBuilder")
local ActionAnimations = require("Battle.view.animations.AnimationSequenceBuilder")
--------------------------------------------------------------------------------------------------------

local animation_dict = {}

-- TODO: Create default animation to create for all actions
local default_animation = nil


-- Fill all actions with default animation
for _, action in pairs(actions) do
    animation_dict[action] = default_animation
end

return animation_dict
