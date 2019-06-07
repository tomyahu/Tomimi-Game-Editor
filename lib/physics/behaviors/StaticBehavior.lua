require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: StaticBehavior
-- param: group:str -> the common group of the objects to be tested with this behavior
-- An object behavior that resets all positions of objects where there is a collition.
local StaticBehavior = extend(NullBehavior, function(self, group) end)

-- allObjectsInteract: None -> None
-- Defines the interaction behavior followed by the group's objects. In this case all object are reseted to their
-- previous positions if they collide.
function StaticBehavior.AllObjectsInteract(self)
    local local_context = application:getCurrentLocalContext()
    local done = false

    local aux_objects = local_context[self.group]

    while not done do
        local still_objects = {}
        local moving_objects = {}

        for _, object in pairs(aux_objects) do
            if object:isStill() then
                table.insert(still_objects, object)
            else
                table.insert(moving_objects, object)
            end
        end

        -- If a moving object collides with a still objects it resets it previous position and sets its speed to 0
        for _, moving_object in pairs(moving_objects) do
            for _, still_object in pairs(still_objects) do
                if moving_object:checkCollision(still_object) then
                    moving_object:resetPreviousPos()
                end
            end
        end

        aux_objects = still_objects
        done = (# aux_objects) == 0
    end

end

return StaticBehavior