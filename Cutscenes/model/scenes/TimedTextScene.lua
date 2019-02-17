require "Global.consts"
local TimedScene = require "Cutscenes.model.scenes.TimedScene"
--------------------------------------------------------------------------------------------------------
local TimedTextScene = TimedScene.new();
TimedTextScene.__index = TimedTextScene

-- TimedTextScene: TimedTextScene
-- Creates a TimedTextScene
function TimedTextScene.new(text, image_path, text_speed)
    local o = TimedScene.new(text, image_path);
    local self = setmetatable(o, TimedTextScene)
    self.__index = self
    self.dt = 1/text_speed
    return self
end

function TimedTextScene.getText(self)
    self:updateTime(GLOBAL_CONTEXT.dt)
    return string.sub(self.text, 0,math.floor(self.elapsed_time / self.dt))
end

return TimedTextScene