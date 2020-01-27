require "lib.classes.class"
local Animation = require("Battle.view.animations.Animation")
--------------------------------------------------------------------------------------------------------

-- class: LinearMoveAnimation
-- param: end_x:num -> The end x position of the entity at the end of the animation
-- param: end_y:num -> The end y position of the entity at the end of the animation
-- param: time:num -> The amount of time the animation is going to take
-- An animation where the entity moves from its current position to an end position
local LinearMoveAnimation = extend(Animation, function(self, end_x, end_y, time)
    self.time = time

    self.end_x = end_x
    self.end_y = end_y

    self:reset()
end)

-- update: int -> None
-- updates animation variables
function LinearMoveAnimation.update(self, dt)
    Animation.update(self, dt)
    self.current_time = self.current_time + dt
end

-- updateEntityView: EntityView -> None
-- updates an entity view based on the stage of the animation
function Animation.updateEntityView(self, entity_view)
    local total_time = math.min(self.current_time, self.time)

    local dx = (self.end_x - self.start_x)/self.time + self.start_x
    local dy = (self.end_y - self.start_y)/self.time + self.start_y

    entity_view:setCurrentX(total_time*dx)
    entity_view:setCurrentY(total_time*dy)
end

-- reset: None -> None
-- resets the variables of the animation
function LinearMoveAnimation.reset(self)
    Animation.reset(self)

    self.start_time = 0
    self.current_time = 0

    self.start_x = self.entity_view:getCurrentX()
    self.start_y = self.entity_view:getCurrentY()
end

-- setters
function LinearMoveAnimation.setEndX(self, new_end_x)
    self.end_x = new_end_x
end

function LinearMoveAnimation.setEndY(self, new_end_y)
    self.end_y = new_end_y
end

-- getters
function LinearMoveAnimation.getEndX(self)
    return self.end_x
end

function LinearMoveAnimation.getEndY(self)
    return self.end_y
end

return LinearMoveAnimation