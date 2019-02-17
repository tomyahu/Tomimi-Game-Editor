local BasicScene = require "Cutscenes.model.scenes.BasicScene"
--------------------------------------------------------------------------------------------------------
local TimedScene = BasicScene.new();
TimedScene.__index = TimedScene

-- TimedScene: TimedScene
-- Creates a TimedScene
function TimedScene.new(text, image_path)
    local o = BasicScene.new(text, image_path);
    local self = setmetatable(o, TimedScene)
    self.__index = self
    self.elapsed_time = 0
    return self
end

function TimedScene.updateTime(self, dt)
    self.elapsed_time = self.elapsed_time + dt
end

function TimedScene.resetElapsedTime(self)
    self.elapsed_time = 0
end

return TimedScene