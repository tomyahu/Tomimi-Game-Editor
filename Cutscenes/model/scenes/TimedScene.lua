require "lib.classes.class"
local BasicScene = require "Cutscenes.model.scenes.BasicScene"
--------------------------------------------------------------------------------------------------------

-- class: TimedScene
-- param: text:str -> the text asociated to the cutscene
-- param: image_path:str -> the path of the scene image
-- A timed single scene class
local TimedScene = extend(BasicScene, function(self, text, image_path)
    self.elapsed_time = 0
end)

-- updateTime: num -> None
-- updates the current time of the scene
function TimedScene.updateTime(self, dt)
    self.elapsed_time = self.elapsed_time + dt
end

-- resetElapsedTime: None -> None
-- resets the elapsed time
function TimedScene.resetElapsedTime(self)
    self.elapsed_time = 0
end

return TimedScene