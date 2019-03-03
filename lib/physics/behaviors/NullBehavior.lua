require "lib.classes.class"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

local NullBehavior = class(function(self, group)
    self.group = group

    local local_context = application:getCurrentLocalContext()
    if local_context[self.group] == nil and (not group == nil) then
        local_context[self.group] = {}
    end
end)

function NullBehavior.AllObjectsInteract(_) end

return NullBehavior