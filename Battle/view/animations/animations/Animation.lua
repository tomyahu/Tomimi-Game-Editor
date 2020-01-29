require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Animation
-- An animation corresponding to an entity doing something
local Animation = class(function(self)
    self:reset()
end)

-- update: int -> None
-- updates animation variables
function Animation.update(self, dt)
    self.current_time = self.current_time + dt
end

-- updateEntityView: EntityView -> None
-- updates an entity view based on the stage of the animation
function Animation.updateEntityView(self, entity_view)

end

-- reset: None -> None
-- resets the variables of the animation
function Animation.reset(self)
    self.start_time = 0
    self.current_time = 0
end

-- getters
function Animation.getStartTime(self)
    return self.start_time
end

function Animation.getCurrentTime(self)
    return self.current_time
end

return Animation