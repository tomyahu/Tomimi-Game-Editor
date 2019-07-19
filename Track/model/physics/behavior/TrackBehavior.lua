require "lib.classes.class"
local NullBehavior = require "lib.physics.behaviors.NullBehavior"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: TrackBehavior
-- param: group:str -> the group of the local context the behavior is associated to
-- param: player:Player -> the player object
-- The behaviour that defines how the player interacts with the solid objects of the overworld
local TrackBehavior = extend(NullBehavior, function(self, paddle)
    self.paddle = paddle
    self.paddle_object = paddle:getSolidObject()
    self.group = "Notes"
end,

    function(group, player)
        return NullBehavior.new(group)
    end)

-- AllObjectsInteract: None -> None
-- Detects which notes collide with the player and if they collide it calls its hit function
function TrackBehavior.AllObjectsInteract(self)
    local local_context_group = application:getFromLocalContext(self.group)
    local global_context = application:getGlobalContext()


    -- Updates the colliding notes state
    for _, note in pairs(local_context_group) do
        local note_object = note:getSolidObject()
        if self.paddle:getStateStr() == "ActiveState" and note_object:checkCollision(self.paddle_object) then
            note:hit()
        else
            note:doNothing()
        end
    end
end

function TrackBehavior.setPaddle(self, new_paddle)
    self.paddle = new_paddle
    self.paddle_object = new_paddle:getSolidObject()
end


return TrackBehavior
