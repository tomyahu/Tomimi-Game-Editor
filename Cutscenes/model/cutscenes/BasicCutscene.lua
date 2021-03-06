require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: BasicCutscene
-- param: scenes:BasicScene -> the scenes of the cutscene
-- A cutscene class with scenes
local BasicCutscene = class(function(self, scenes)
    self.scenes = scenes
    self.current_scene = 0
end)

-- advanceScene: None -> bool
-- advances to the next scene
function BasicCutscene.advanceScene(self)
    if self.current_scene < # self.scenes then
        self.current_scene = self.current_scene + 1
        return true
    else
        self:resetCutscene()
        return false
    end
end

-- getCurrentScene: None -> BasicScene
-- Gets the cutscene's current scene
function BasicCutscene.getCurrentScene(self)
    return self.scenes[self.current_scene]
end

-- resetCutscene: None -> None
-- resets the current cutscene to the first scene
function BasicCutscene.resetCutscene(self)
    self.current_scene = 0
end

-- getter
function BasicCutscene.getScenes(self)
    return self.scenes
end

return BasicCutscene