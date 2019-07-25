require "lib.classes.class"
require "Global.application.application"
local ContactInteractuableEntity = require "Overworld.model.entities.contact_entities.ContactInteractuableEntity"
--------------------------------------------------------------------------------------------------------

-- class: ChangeRoomPad
-- param: sprite:Sprite -> the sprite of the change room pad
-- param: hitboxes:list(Hitbox) -> the hitboxes list of the pad
-- param: room_index:str -> the room index to change to
-- param: newx:int -> the x coordinate of the pad position
-- param: newy:int -> the character name of the message
-- A pad that on contact takes the player to another room
local ChangeRoomPad = extend(ContactInteractuableEntity, function(self, sprite, hitboxes, room_index, x, y)
end,

function(sprite, hitboxes, room_index, x, y)
    local reaction_fun = function(player)
        local ctrl = application:getCurrentCtrl()
        ctrl:changeRoom(room_index)
        player:setPos(x, y)
    end
    return ContactInteractuableEntity.new(sprite, hitboxes, reaction_fun)
end)

return ChangeRoomPad