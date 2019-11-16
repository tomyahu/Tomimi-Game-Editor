require "lib.classes.class"
local CharacterMessage = require "Overworld.model.dialog.messages.CharacterMessage"
--------------------------------------------------------------------------------------------------------

-- class: AvatarCharacterMessage
-- param: message:str -> the main text of the message
-- param: character:str -> the character name of the message
-- param: avatar_path:str -> the path of the avatar of the message
-- A message object with the avatar and character name
local AvatarCharacterMessage = extend(CharacterMessage, function(self, message, character, avatar_path)
    self.avatar_path = avatar_path
end,

function(message, character, avatar_path)
    return CharacterMessage.new(message, character)
end)

-- getter
function AvatarCharacterMessage.getAvatarPath(self)
    return self.avatar_path
end

-- getter
function AvatarCharacterMessage.getClass(self)
    return AvatarCharacterMessage
end

return AvatarCharacterMessage