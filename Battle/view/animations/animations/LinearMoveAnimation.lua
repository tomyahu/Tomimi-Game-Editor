require "lib.classes.class"
local Animation = require("Battle.view.animations.animations.Animation")
--------------------------------------------------------------------------------------------------------

-- class: LinearMoveAnimation
-- param: end_x:num -> The end x position of the entity at the end of the animation
-- param: end_y:num -> The end y position of the entity at the end of the animation
-- param: time:num -> The amount of time the animation is going to take
-- An animation where the entity moves from its current position to an end position
local LinearMoveAnimation = extend(Animation, function(self, end_x, end_y, time)
    self.time = time
    self.entity_view = nil

    self.start_x = 0
    self.start_y = 0

    self.end_x = end_x
    self.end_y = end_y

    self:reset()
end)

-- update: int -> None
-- updates animation entity
function LinearMoveAnimation.update(self, dt)
    Animation.update(self, dt)

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

    self:setStartX(self.entity_view:getCurrentX())
    self:setStartY(self.entity_view:getCurrentY())
end

-- setters
function LinearMoveAnimation.setEntityView(self, entity_view)
    self.entity_view = entity_view
end

function LinearMoveAnimation.setEndX(self, new_end_x)
    self.end_x = new_end_x
end

function LinearMoveAnimation.setEndY(self, new_end_y)
    self.end_y = new_end_y
end

function LinearMoveAnimation.setStartX(self, new_start_x)
    self.start_x = new_start_x
end

function LinearMoveAnimation.setStartY(self, new_start_y)
    self.start_y = new_start_y
end

-- getters
function LinearMoveAnimation.getEndX(self)
    return self.end_x
end

function LinearMoveAnimation.getEndY(self)
    return self.end_y
end

function LinearMoveAnimation.getStartX(self)
    return self.start_x
end

function LinearMoveAnimation.getStartY(self)
    return self.start_y
end

return LinearMoveAnimation