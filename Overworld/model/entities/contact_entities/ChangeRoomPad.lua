require "lib.classes.class"
require "Global.application.application"
local ContactInteractuableEntity = require "Overworld.model.entities.ContactInteractuableEntity"
--------------------------------------------------------------------------------------------------------
local ChangeRoomPad = extend(ContactInteractuableEntity, function(self, sprite, hitboxes, room_index, newx, newy)
end,

function(sprite, hitboxes, room_index, newx, newy)
    local reaction_fun = function(player)
        local ctrl = application:getCurrentCtrl()
        ctrl:changeRoom(room_index)
        player:setPos(newx, newy)
    end
    return ContactInteractuableEntity.new(sprite, hitboxes, reaction_fun)
end)

return ChangeRoomPad