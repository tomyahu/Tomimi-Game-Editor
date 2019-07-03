require "lib.classes.class"
local BasicCutsceneBuilder = require "Cutscenes.model.cutscenes.BasicCutsceneBuilder"
local TimedCutscene = require "Cutscenes.model.cutscenes.TimedCutscene"
local TimedTextScene = require "Cutscenes.model.scenes.TimedTextScene"
--------------------------------------------------------------------------------------------------------

-- class: BasicCutsceneBuilder
-- param: speed:num -> the speed at which the cutscene is progressing
-- Builder class to create timed cutscenes
local TimedCutsceneBuilder = extend(BasicCutsceneBuilder, function(self, speed)
    self.speed = speed
end,

function(speed)
    return BasicCutsceneBuilder.new()
end)

-- addScene: str, str -> None
-- add a new scene to the cutscene
function TimedCutsceneBuilder.addScene(self, text, image_path)
    self.scenes[self.scene_number] = TimedTextScene.new(text, image_path, self.speed)
    self.scene_number = self.scene_number + 1
end

-- getCutscene: None -> TimedCutscene
-- Returns the built TimedCutscene
function TimedCutsceneBuilder.getCutscene(self)
    return TimedCutscene.new(self.scenes)
end

return TimedCutsceneBuilder