require "lib.classes.class"
local BasicCutscene = require "Cutscenes.model.cutscenes.BasicCutscene"
--------------------------------------------------------------------------------------------------------

-- class: TimedCutscene
-- param: scenes:TimedScene -> the scenes of the cutscene
-- A cutscene class with timed scenes
local TimedCutscene = extend(BasicCutscene, function(self, scenes)
end)

-- resetCutscene: None -> None
-- resets the current cutscene to the first scene and the elapsed time of the scene
function TimedCutscene.resetCutscene(self)
    self.current_scene = 0
    for _,scene in pairs(self.scenes) do
        scene:resetElapsedTime()
    end
end

return TimedCutscene