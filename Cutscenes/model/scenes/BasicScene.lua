--------------------------------------------------------------------------------------------------------
BasicScene = {}
BasicScene.__index = BasicScene

-- BasicScene: BasicScene
-- Creates a BasicScene
function BasicScene.new(text, image_path)
    local o = {}
    local self = setmetatable(o, BasicScene)
    self.__index = self
    self.text = text
    self.image_path = image_path
    return self
end

function BasicScene.getText(self)
    return self.text
end

function BasicScene.getImagePath(self)
    return self.image_path
end