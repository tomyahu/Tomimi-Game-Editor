require "lib.classes.class"
local InteractuableSolidEntity = require "Overworld.model.entities.interactuable_entities.InteractuableSolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: ContactInteractuableEntity
-- param: sprite:Sprite -> the sprite of the entity
-- param: hitboxes:list(Hitbox) -> the list of hitboxes of the entity
-- param: interact_function:function(Player) -> the function that will be triggered, takes the player object
-- An entity that has an action that will be triggered on contact with the player
local ContactInteractuableEntity = extend(InteractuableSolidEntity, function(self, sprite, hitboxes, interact_function)
    self.interact_function = interact_function
end,

    function(sprite, hitboxes)
        return InteractuableSolidEntity.new(sprite, hitboxes)
    end)

-- interactWithPlayer: Player -> None
-- Runs the interact_function of the entity with the player passed as an argument
function ContactInteractuableEntity.interactWithPlayer(self, player)
    return self.interact_function(player)
end

-- registerAsContactInteractuableObject: None -> None
-- Registers the current object as an interactuable object on contact
function ContactInteractuableEntity.registerAsContactInteractuableObject(self)
    local group = 'ContactInteractuables'
    local local_context = application:getCurrentLocalContext()
    if local_context[group] == nil then
        local_context[group] = {}
    end
    table.insert(local_context[group], self)
    application:setLocalContext(local_context)
end

-- register: None -> None
-- Registers the current object in the group where it should be
function ContactInteractuableEntity.register(self)
    self:registerAsContactInteractuableObject()
end

return ContactInteractuableEntity