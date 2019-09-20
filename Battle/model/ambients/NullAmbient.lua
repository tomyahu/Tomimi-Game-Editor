require "lib.classes.class"
-------------------------------------------------------------------------------------------------------

-- class: NullAmbient
-- param: path:str -> Path of the image od the background
-- A null ambient for a battle
local NullAmbient = class(function(self, path)
    self.sprite_path = path
end)

-- affectPartyAndEnemies: None -> None
-- Applies the effects of the ambient to the player and enemy parties
function NullAmbient.affectPartyAndEnemies(self, player_party, enemy_party) end

--getter
function NullAmbient.getSpritePath(self)
    return self.sprite_path
end

return NullAmbient