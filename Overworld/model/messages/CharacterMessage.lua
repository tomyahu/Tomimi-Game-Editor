require "lib.classes.class"
local Message = require "Overworld.model.messages.Message"
--------------------------------------------------------------------------------------------------------
local CharacterMessage = extend(Message, function(self, message, character)
    self.character = character
end,

function(message, character)
    return Message.new(message)
end)

function CharacterMessage.toString(self)
    return self.character .. ": " .. self.message
end

function CharacterMessage.getCharacter(self)
    return self.character
end

return CharacterMessage