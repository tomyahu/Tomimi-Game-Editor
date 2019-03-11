require "lib.classes.class"
local CharacterMessage = require "Overworld.model.dialog.CharacterMessage"
--------------------------------------------------------------------------------------------------------
local AvatarCharacterMessage = extend(CharacterMessage, function(self, message, character, avatar_path)
    self.avatar_path = avatar_path
end,

function(message, character, avatar_path)
    return CharacterMessage.new(message, character)
end)

function AvatarCharacterMessage.getAvatarPath(self)
    return self.avatar_path
end

return AvatarCharacterMessage