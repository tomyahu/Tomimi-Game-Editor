require "lib.classes.class"
local BasicScene = require "Cutscenes.model.scenes.BasicScene"
--------------------------------------------------------------------------------------------------------

local TimedScene = extend(BasicScene, function(self, text, image_path)
    self.elapsed_time = 0
end)

function TimedScene.updateTime(self, dt)
    self.elapsed_time = self.elapsed_time + dt
end

function TimedScene.resetElapsedTime(self)
    self.elapsed_time = 0
end

return TimedScene