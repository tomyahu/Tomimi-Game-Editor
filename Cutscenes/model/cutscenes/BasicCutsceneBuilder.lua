require "lib.classes.class"
local BasicCutscene = require "Cutscenes.model.cutscenes.BasicCutscene"
local BasicScene = require "Cutscenes.model.scenes.BasicScene"
--------------------------------------------------------------------------------------------------------

-- class: BasicCutsceneBuilder
-- Builder class to create basic cutscenes
local BasicCutsceneBuilder = class(function(self)
    self.scenes = {}
    self.scene_number = 0
end)

-- addScene: str, str -> None
-- add a new scene to the cutscene
function BasicCutsceneBuilder.addScene(self, text, image_path)
    self.scenes[self.scene_number] = BasicScene.new(text, image_path)
    self.scene_number = self.scene_number + 1
end

-- getCutscene: None -> BasicCutscene
-- Returns the built BasicCutscene
function BasicCutsceneBuilder.getCutscene(self)
    return BasicCutscene.new(self.scenes)
end

return BasicCutsceneBuilder