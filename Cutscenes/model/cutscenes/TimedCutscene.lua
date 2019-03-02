require "lib.classes.class"
local BasicCutscene = require "Cutscenes.model.cutscenes.BasicCutscene"
--------------------------------------------------------------------------------------------------------

local TimedCutscene = extend(BasicCutscene, function(self, scenes)
end)

-- resetCutscene: None -> None
-- resets the current cutscene to the first scene
function TimedCutscene.resetCutscene(self)
    self.current_scene = 0
    for _,scene in pairs(self.scenes) do
        scene:resetElapsedTime()
    end
end

return TimedCutscene