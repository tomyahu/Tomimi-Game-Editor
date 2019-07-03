require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: BasicScene
-- param: text:str -> the text asociated to the cutscene
-- param: image_path:str -> the path of the scene image
-- A basic single scene class
local BasicScene = class(function(self, text, image_path)
    self.text = text
    self.image_path = image_path
end)

-- getters
function BasicScene.getText(self)
    return self.text
end

function BasicScene.getImagePath(self)
    return self.image_path
end

return BasicScene