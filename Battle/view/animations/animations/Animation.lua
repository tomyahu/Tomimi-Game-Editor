require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Animation
-- An animation corresponding to an entity doing something
local Animation = class(function(self)
    self.entity_view = nil
    self.target_views = nil

    self.start_time = 0
    self.current_time = 0
end)

-- update: int -> None
-- updates animation variables
function Animation.update(self, dt)
    self.current_time = self.current_time + dt
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

-- setters
function Animation.setEntityView(self, entity_view)
    self.entity_view = entity_view
end

function Animation.setTargetViews(self, target_views)
    self.target_views = target_views
end

return Animation