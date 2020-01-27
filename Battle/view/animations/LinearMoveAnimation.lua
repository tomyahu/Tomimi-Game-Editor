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

    local total_time = math.min(self.current_time, self.time)

    local dx = (self.end_x - self.start_x)/self.time + self.start_x
    local dy = (self.end_y - self.start_y)/self.time + self.start_y

    self.entity_view:setCurrentX(total_time*dx)
    self.entity_view:setCurrentY(total_time*dy)
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

return LinearMoveAnimation