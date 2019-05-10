require "lib.classes.class"
local Dialog = require "Overworld.model.dialog.Dialog"
local Message = require "Overworld.model.dialog.messages.Message"
--------------------------------------------------------------------------------------------------------
local DialogBuilder = class(function(self)
    self.messages = {}
end)

function DialogBuilder.addMessage(self, message_str)
    table.insert(self.messages, Message.new(message_str))
end

function DialogBuilder.getDialog(self)
    return Dialog.new(self.messages)
end

return DialogBuilder