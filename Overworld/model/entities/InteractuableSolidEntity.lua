require "lib.classes.class"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local InteractuableSolidEntity = extend(SolidEntity, function(self, sprite, hitboxes)
end,

function(sprite, hitboxes)
    return SolidEntity.new(sprite, hitboxes)
end)

function InteractuableSolidEntity.interactWithPlayer(self, player)
    return
end

function InteractuableSolidEntity.registerAsInteractuableObject(self)
    local group = 'Interactuables'
    local local_context = application:getCurrentLocalContext()
    if local_context[group] == nil then
        local_context[group] = {}
    end
    table.insert(local_context[group], self)
    application:setLocalContext(local_context)
end

function InteractuableSolidEntity.register(self)
    self:registerAsSolidObject()
    self:registerAsInteractuableObject()
end

return InteractuableSolidEntity