require "Cutscenes.model.cutscenes.BasicCutscene"
--------------------------------------------------------------------------------------------------------
TimedCutscene = BasicCutscene.new();
TimedCutscene.__index = TimedCutscene

-- TimedCutscene: TimedCutscene
-- Creates a TimedCutscene
function TimedCutscene.new(scenes)
    local o = BasicCutscene.new(scenes);
    local self = setmetatable(o, TimedCutscene)
    self.__index = self
    return self
end

-- resetCutscene: None -> None
-- resets the current cutscene to the first scene
function TimedCutscene.resetCutscene(self)
    self.current_scene = 0
    for i,scene in pairs(self.scenes) do
        scene:resetElapsedTime()
    end
end