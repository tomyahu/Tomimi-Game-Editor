require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Animation
-- An animation corresponding to an entity doing something
local Animation = class(function(self)
end)

-- update: int -> None
-- updates animation variables
function Animation.update(self, dt)
end

-- updateEntityView: EntityView -> None
-- updates an entity view based on the stage of the animation
function Animation.updateEntityView(self, entity_view)

end

-- reset: None -> None
-- resets the variables of the animation
function Animation.reset(self)

end

return Animation