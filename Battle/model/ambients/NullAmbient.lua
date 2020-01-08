require "lib.classes.class"
-------------------------------------------------------------------------------------------------------

-- class: NullAmbient
-- param: path:str -> Path of the image od the background
-- A null ambient for a battle
local NullAmbient = class(function(self, path)
    self.sprite_path = path
end)

--getter
function NullAmbient.getSpritePath(self)
    return self.sprite_path
end

return NullAmbient