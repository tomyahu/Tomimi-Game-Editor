require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local NullBehavior = {};
NullBehavior.__index = NullBehavior

-- NullBehavior: NullBehavior
-- Creates a NullBehavior
function NullBehavior.new(group)
    local o = {};
    local self = setmetatable(o, NullBehavior)
    self.__index = self
    self.group = group

    local local_context = application:getCurrentLocalContext()
    if local_context[self.group] == nil and (not group == nil) then
        local_context[self.group] = {}
    end

    return self
end

function NullBehavior.AllObjectsInteract(self) end

return NullBehavior