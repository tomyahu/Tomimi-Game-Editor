require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Animation
-- param: entity_view: EntityView -> The view of the entity to perform the animation
-- An animation corresponding to an entity doing something
local Animation = class(function(self, entity_view)
    self.entity_view = entity_view
    self.ended = false
end)

-- update: int -> None
-- updates animation variables
function Animation.update(self, dt)

end

-- reset: None -> None
-- resets the variables of the animation
function Animation.reset(self)
    self.ended = false
end

-- getter
function Animation.hasEnded(self)
    return self.ended
end

return Animation