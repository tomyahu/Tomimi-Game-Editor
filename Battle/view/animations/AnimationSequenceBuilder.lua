require "lib.classes.class"
local AnimationSequence = require("Battle.view.animations.AnimationSequence")
--------------------------------------------------------------------------------------------------------

-- class: AnimationSequenceBuilder
-- A builder class for a sequence of animations to be played
local AnimationSequenceBuilder = class(function(self)
    self.actors = {}
    self.animations = {}
end)

-- addAnimation: Animation, num(0,), num(0,) -> AnimationSequenceBuilder
-- Adds an animation with specific start and end time
function AnimationSequenceBuilder.addAnimation(self, animation, start_time, end_time)
    if animation == nil then
        error("Expected a table for animation, got null value.")
    end

    if start_time == nil then
        error("Expected a number for start_time, got null value.")
    end

    if end_time == nil then
        error("Expected a number for end_time, got null value.")
    end

    local aux = {}
    table.insert(aux, start_time)
    table.insert(aux, end_time)

    self.animations[animation] = aux
    return self
end

-- getAnimations: None -> AnimationSequence
-- Gets an Animation Sequence for a sequence of animations
function AnimationSequenceBuilder.getAnimations(self)
    return AnimationSequence.new(self.animations)
end

return AnimationSequenceBuilder