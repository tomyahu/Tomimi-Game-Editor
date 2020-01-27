require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Animation
-- An animation corresponding to an entity doing something
local Animation = class(function(self)
    self.entity_view = nil
end)

-- update: int -> None
-- updates animation variables
function Animation.update(self, dt)
    if self.entity_view == nil then
        error("entity view has not been set yet or null entity setted")
    end
end

-- reset: None -> None
-- resets the variables of the animation
function Animation.reset(self)

end

-- isEntityViewSetted: None -> bool
-- Checks if the animation's entity view has been setted
function Animation.isEntityViewSetted(self)
    return self.entity_view ~= nil
end

-- setter
function Animation.setEntityView(self, new_entity_view)
    self.entity_view = new_entity_view
end

return Animation