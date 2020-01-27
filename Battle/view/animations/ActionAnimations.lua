require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: ActionAnimations
-- param: source_animation_sequence:list(AnimationSequence) -> The animation to be performed by the source
-- param: target_animation_sequence:list(AnimationSequence) -> The animation to be performed by the targets
-- A class to manage an action's animations
local ActionAnimations = class(function(self, source_animation_sequence, target_animation_sequence)
    self.source_animation = source_animation_sequence
    self.target_animation = target_animation_sequence
end)

-- getters
function ActionAnimations.getSourceAnimationSequence(self)
    return self.source_animation
end

function ActionAnimations.getTargetAnimationSequence(self)
    return self.target_animation
end

return ActionAnimations