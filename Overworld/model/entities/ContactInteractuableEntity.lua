require "lib.classes.class"
local InteractuableSolidEntity = require "Overworld.model.entities.InteractuableSolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local ContactInteractuableEntity = extend(InteractuableSolidEntity, function(self, sprite, hitboxes, interact_function)
    self.interact_function = interact_function
end,

    function(sprite, hitboxes)
        return InteractuableSolidEntity.new(sprite, hitboxes)
    end)

function ContactInteractuableEntity.interactWithPlayer(self, player)
    return self.interact_function(player)
end

function ContactInteractuableEntity.registerAsContactInteractuableObject(self)
    local group = 'ContactInteractuables'
    local local_context = application:getCurrentLocalContext()
    if local_context[group] == nil then
        local_context[group] = {}
    end
    table.insert(local_context[group], self)
    application:setLocalContext(local_context)
end

function ContactInteractuableEntity.register(self)
    self:registerAsContactInteractuableObject()
end

return ContactInteractuableEntity