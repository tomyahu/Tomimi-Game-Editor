require "lib.classes.class"
local Dialog = require "Overworld.model.dialog.Dialog"
local Message = require "Overworld.model.dialog.messages.Message"
--------------------------------------------------------------------------------------------------------

-- class: DialogBuilder
-- A builder class for the dialog
local DialogBuilder = class(function(self)
    self.messages = {}
end)

-- addMessage: str -> None
-- Adds a message to the dialog being built
function DialogBuilder.addMessage(self, message_str)
    table.insert(self.messages, Message.new(message_str))
end

-- getDialog: None -> Dialog
-- Creates a dialog with the messages added and returns it
function DialogBuilder.getDialog(self)
    return Dialog.new(self.messages)
end

return DialogBuilder