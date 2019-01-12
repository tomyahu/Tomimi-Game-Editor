require "Cutscenes.model.cutscenes.BasicCutscene"
require "Cutscenes.model.scenes.BasicScene"
--------------------------------------------------------------------------------------------------------
BasicCutsceneBuilder = {}
BasicCutsceneBuilder.__index = BasicCutsceneBuilder

-- BasicCutsceneBuilder: BasicCutsceneBuilder
-- Creates a BasicCutsceneBuilder
function BasicCutsceneBuilder.new()
    local o = {}
    local self = setmetatable(o, BasicCutsceneBuilder)
    self.__index = self
    self.scenes = {}
    self.scene_number = 0
    return self
end

function BasicCutsceneBuilder.addScene(self, text, image_path)
    self.scenes[self.scene_number] = BasicScene.new(text, image_path)
    self.scene_number = self.scene_number + 1
end

function BasicCutsceneBuilder.getCutscene(self)
    return BasicCutscene.new(self.scenes)
end