require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: AnimationSequence
-- param: animations:dict(Animation, {time, time}) a list of animations with start and end time
-- A sequence of animations to be played
local AnimationSequence = class(function(self, animations)
    self.start_time = 0

    self.animations = {}
    self.start_times = {}
    self.end_times = {}

    for animation, times in pairs(animations) do
        table.insert(self.animations, animation)
        self.start_times[animation] = times[1]
        self.end_times[animation] = times[2]
    end

    self:reset()
end)

function AnimationSequence.update(self, dt)
    -- Update current time
    self.current_time = self.current_time + dt

    -- Add all animations that haven't been started with start time less than current time
    local animations_to_play = self:getAnimationsToPlay()
    for _, animation in pairs(animations_to_play) do
        table.insert(self.current_animations, animation)
    end

    -- Update all animations
    for _, animation in pairs(self.current_animations) do
        animation:update(dt)
    end

    -- Delete all animations that have started and have an end time less than the current time
    self:deleteCurrentFinishedAnimations()
end

-- getAnimationsToPlay: None -> list(Animations)
-- Gets a list of all animations that haven't been started with start time less than current time
-- and updates their status
function AnimationSequence.getAnimationsToPlay(self)
    local animations_to_play = {}

    for i = 1, (#self.animations) do
        local animation = self.animations[i]
        local start_time = self.start_times[animation]

        if (not self.started_animations[animation]) and start_time < self.current_time then
            table.insert(animations_to_play, animation)
            animation:reset()
            self.started_animations[animation] = true
        end
    end

    return animations_to_play
end

-- deleteCurrentFinishedAnimations: None -> None
-- Deletes all animations that have started and have an end time less than the current time
function AnimationSequence.deleteCurrentFinishedAnimations(self)
    for i = (# self.current_animations), 1, -1 do
        local animation = self.current_animations[i]
        local end_time = self.start_times[animation]

        if (self.started_animations[animation]) and end_time < self.current_time then
            table.remove(self.current_animations, i)
        end
    end
end

-- reset: None -> None
-- Resets the animation sequence
function AnimationSequence.reset(self)
    self.ended = false
    self.current_time = self.start_time

    for _, animation in pairs(self.animations) do
        animation:reset()
    end

    self.started_animations = {}
    for _, animation in pairs(self.animations) do
        self.started_animations[animation] = false
    end

    self.current_animations = {}
end

-- getter
function AnimationSequence.hasEnded(self)
    return self.ended
end

return AnimationSequence