require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Animation
-- param: entity_view: EntityView -> The view of the entity to perform the animation
-- An animation corresponding to an entity doing something
local Animation = class(function(self, entity_view)
    self.entity_view = entity_view
end)

-- update: int -> None
-- updates animation variables
function Animation.update(self, dt)

end

-- reset: None -> None
-- resets the variables of the animation
function Animation.reset(self)

end

return Animation