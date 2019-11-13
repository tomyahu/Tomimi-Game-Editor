require "lib.classes.class"
local Dialog = require "Overworld.model.dialog.Dialog"
local Message = require "Overworld.model.dialog.messages.Message"
local CharacterMessage = require "Overworld.model.dialog.messages.CharacterMessage"
local AvatarCharacterMessage = require "Overworld.model.dialog.messages.AvatarCharacterMessage"
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

-- addCharacterMessage: str, str -> None
-- Adds a message with character to the dialog being built
function DialogBuilder.addCharacterMessage(self, message_str, character_str)
    table.insert(self.messages, CharacterMessage.new(message_str, character_str))
end

-- addAvatarCharacterMessage: str, str -> None
-- Adds a message with character and an avatar to the dialog being built
function DialogBuilder.addAvatarCharacterMessage(self, message_str, character_str, avatar_path)
    table.insert(self.messages, AvatarCharacterMessage.new(message_str, character_str, avatar_path))
end

-- getDialog: None -> Dialog
-- Creates a dialog with the messages added and returns it
function DialogBuilder.getDialog(self)
    return Dialog.new(self.messages)
end

return DialogBuilder