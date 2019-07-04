require "lib.classes.class"
local Message = require "Overworld.model.messages.Message"
--------------------------------------------------------------------------------------------------------

-- class: CharacterMessage
-- param: message:str -> the main text of the message
-- param: character:str -> the character name of the message
-- A message object with the character name
local CharacterMessage = extend(Message, function(self, message, character)
    self.character = character
end,

function(message, character)
    return Message.new(message)
end)

-- to string function
function CharacterMessage.toString(self)
    return self.character .. ": " .. self.message
end

-- getter
function CharacterMessage.getCharacter(self)
    return self.character
end

return CharacterMessage