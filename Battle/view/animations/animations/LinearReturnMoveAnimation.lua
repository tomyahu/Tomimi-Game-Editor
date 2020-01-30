require "lib.classes.class"
local LinearMoveAnimation = require("Battle.view.animations.animations.LinearMoveAnimation")
--------------------------------------------------------------------------------------------------------

-- class: LinearReturnMoveAnimation
-- param: end_x:num -> The end x position of the entity at the end of the animation
-- param: end_y:num -> The end y position of the entity at the end of the animation
-- param: time:num -> The amount of time the animation is going to take
-- An animation where the entity moves from its current position to its default position
local LinearReturnMoveAnimation = extend(LinearMoveAnimation, function(self, time)
end,

function (time)
    return LinearMoveAnimation.new(0,0,time)
end)

--[[
function LinearReturnMoveAnimation.update(self, dt)
    LinearMoveAnimation.update(self, dt)
    print(self.start_x, self.start_y)
    print(self.end_x, self.end_y)
end]]--

-- reset: None -> None
-- resets the variables of the animation
function LinearReturnMoveAnimation.reset(self)
    LinearMoveAnimation.reset(self)

    self:setEndX(self.entity_view:getDefaultX())
    self:setEndY(self.entity_view:getDefaultY())
end

return LinearReturnMoveAnimation