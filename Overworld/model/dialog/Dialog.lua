require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Dialog
-- param: messages:list(Message) -> the list of messages of the dialog
-- A dialog object that contains a set list of messages and manages which is the current message of the dialog
local Dialog = class(function(self, messages)
    self.messages = messages
    self.current_message = 1
end)

-- getCurrentMessage: None -> Message
-- Get the current message of the dialog
function Dialog.getCurrentMessage(self)
    return self.messages[self.current_message]
end

-- isFinished: None -> bool
-- Returns a boolean that says if the dialog is over or not
function Dialog.isFinished(self)
    return (# self.messages) < self.current_message
end

-- advanceMessage: None -> None
-- Advances the current message of the dialog
function Dialog.advanceMessage(self)
    self.current_message = self.current_message + 1
end

-- reset: None -> None
-- Resets the dialog's current message
function Dialog.reset(self)
    self.current_message = 1
end

return Dialog