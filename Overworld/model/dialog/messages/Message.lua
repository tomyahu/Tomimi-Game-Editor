require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local Message = class(function(self, message)
    self.message = message
end)

function Message.toString(self)
    return self.message
end

return Message