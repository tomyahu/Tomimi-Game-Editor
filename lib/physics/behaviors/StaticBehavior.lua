require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

local StaticBehavior = extend(NullBehavior, function(self, group) end)

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