require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local BasicScene = class(function(self, text, image_path)
    self.text = text
    self.image_path = image_path
end)

function BasicScene.getText(self)
    return self.text
end

function BasicScene.getImagePath(self)
    return self.image_path
end

return BasicScene