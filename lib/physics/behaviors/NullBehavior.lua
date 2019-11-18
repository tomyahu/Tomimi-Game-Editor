require "lib.classes.class"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: NullBehavior
-- param: group:str -> the common group of the objects to be tested with this behavior
-- An object behavior that does nothing
-- Uses Null Pattern
local NullBehavior = class(function(self, group)
    self.group = group

    if application:getFromLocalContext(self.group) == nil and (not group == nil) then
        application:setInLocalContext(self.group, {})
    end
end)

-- allObjectsInteract: None -> None
-- Defines the interaction behavior followed by the group's objects.
function NullBehavior.allObjectsInteract(_) end

return NullBehavior