require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local Dialog = class(function(self, messages)
    self.messages = messages
    self.current_message = 1
end)

function Dialog.getCurrentMessage(self)
    return self.messages[self.current_message]
end

function Dialog.isFinished(self)
    return (# self.messages) < self.current_message
end

function Dialog.advanceMessage(self)
    self.current_message = self.current_message + 1
end

function Dialog.reset(self)
    self.current_message = 1
end

return Dialog