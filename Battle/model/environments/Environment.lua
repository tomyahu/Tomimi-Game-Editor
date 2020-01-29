require "lib.classes.class"
-------------------------------------------------------------------------------------------------------

-- class: Environment
-- param: path:str -> Path of the image od the background
-- A null ambient for a battle
local Environment = class(function(self, path)
    self.sprite_path = path
end)

--getter
function Environment.getSpritePath(self)
    return self.sprite_path
end

return Environment