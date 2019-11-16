require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Message
-- param: message:str -> the main text of the message
-- A message object with just the basic text
local Message = class(function(self, message)
    self.message = message
end)

-- to string function
function Message.toString(self)
    return self.message
end

-- getter
function Message.getMessage(self)
    return self.message
end

-- getter
function Message.getClass(self)
    return Message
end

return Message