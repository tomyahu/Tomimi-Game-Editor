require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: AnimationSequence
-- param: animations:dict(Animation, {num, num}) -> a list of animations with start and end time
-- param: entity_view:EntityView -> the entity to perform the animation
-- param: target_views:list(EntityView -> the list of enemy entities to perform the animation
local AnimationSequence = class(function(self, animations, entity_view, target_views)
    self.animations = {}
    self.start_times = {}
    self.end_times = {}

    for animation, times in pairs(animations) do
        table.insert(self.animations, animation)
        self.start_times[animation] = times[1]
        self.end_times[animation] = times[2]
    end

    self:setEntityView(entity_view)
    self:setTargetViews(target_views)

    self:reset()
end)

-- update: num -> None
-- updates the current animations playing
function AnimationSequence.update(self, dt)
    -- Delete all animations that have started and have an end time less than the current time
    self:deleteCurrentFinishedAnimations()

    -- Update current time
    self.current_time = self.current_time + dt

    -- Add all animations that haven't been started with start time less than current time
    local animations_to_play = self:getAnimationsToPlay()
    for _, animation in pairs(animations_to_play) do
        table.insert(self.current_animations, animation)
    end

    -- Update all animations
    for _, animation in pairs(self.current_animations) do
        animation:update(math.min(self.current_time - self.start_times[animation], dt))
    end
end

-- updateEntityView: EntityView -> None
-- Updates an entity view in the current animation sequence
function AnimationSequence.updateEntityView(self, entity_view)
    for _, animation in pairs(self.current_animations) do
        animation:updateEntityView(entity_view)
    end
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
        local end_time = self.end_times[animation]

        if (self.started_animations[animation]) and end_time < self.current_time then
            table.remove(self.current_animations, i)
        end
    end
end

-- reset: None -> None
-- Resets the animation sequence
function AnimationSequence.reset(self)
    self.current_time = 0

    self.started_animations = {}
    for _, animation in pairs(self.animations) do
        self.started_animations[animation] = false
    end

    self.current_animations = {}
end

-- hasEnded: None -> bool
-- Checks if all animations of the sequence have ended
function AnimationSequence.hasEnded(self)
    local ended = true

    for _, animation in pairs(self.animations) do
        local end_time = self.end_times[animation]

        ended = ended and (end_time < self.current_time)
    end

    return ended
end

-- setter
function AnimationSequence.setEntityView(self, entity_view)
    self.entity_view = entity_view

    for _, animation in pairs(self.animations) do
        animation:setEntityView(self.entity_view)
    end
end

-- setter
function AnimationSequence.setTargetViews(self, target_views)
    self.target_views = target_views

    for _, animation in pairs(self.animations) do
        animation:setTargetViews(self.target_views)
    end
end

return AnimationSequence