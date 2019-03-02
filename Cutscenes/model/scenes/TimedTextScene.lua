require "lib.classes.class"
require "Global.consts"
local TimedScene = require "Cutscenes.model.scenes.TimedScene"
--------------------------------------------------------------------------------------------------------

local TimedTextScene = extend(TimedScene, function(self, text, image_path, text_speed)
    self.dt = 1 / text_speed
end,

function(text, image_path, text_speed)
    return TimedScene.new(text, image_path)
end)

function TimedTextScene.getText(self)
    self:updateTime(GLOBAL_CONTEXT.dt)
    return string.sub(self.text, 0,math.floor(self.elapsed_time / self.dt))
end

return TimedTextScene