require "lib.classes.class"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: InteractuableSolidEntity
-- param: sprite:Sprite -> the sprite of the entity
-- param: hitboxes:list(Hitbox) -> the list of hitboxes of the entity
-- An entity of the overworld that does something when the player interacts with it
local InteractuableSolidEntity = extend(SolidEntity, function(self, sprite, hitboxes)
end,

function(sprite, hitboxes)
    return SolidEntity.new(sprite, hitboxes)
end)

-- interactWithPlayer: Player -> None
-- By default it does nothing when the player interacts with it
function InteractuableSolidEntity.interactWithPlayer(self, player)
    return
end

-- registerAsInteractuableObject: None -> None
-- Registers the current object as an interactuable object
function InteractuableSolidEntity.registerAsInteractuableObject(self)
    local group = 'Interactuables'
    local local_context = application:getCurrentLocalContext()
    if local_context[group] == nil then
        local_context[group] = {}
    end
    table.insert(local_context[group], self)
    application:setLocalContext(local_context)
end

-- register: None -> None
-- Registers the current object in the group where it should be
function InteractuableSolidEntity.register(self)
    self:registerAsSolidObject()
    self:registerAsInteractuableObject()
end

return InteractuableSolidEntity