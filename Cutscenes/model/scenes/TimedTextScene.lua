require "lib.classes.class"
require "Global.consts"
require "Global.application.application"
local TimedScene = require "Cutscenes.model.scenes.TimedScene"
--------------------------------------------------------------------------------------------------------

-- class: TimedTextScene
-- param: text:str -> the text asociated to the cutscene
-- param: image_path:str -> the path of the scene image
-- param: text_speed:int -> the speed at which the text will advance
-- A timed single scene class where the text changes with the elapsed time
local TimedTextScene = extend(TimedScene, function(self, text, image_path, text_speed)
    self.dt = 1 / text_speed
end,

function(text, image_path, text_speed)
    return TimedScene.new(text, image_path)
end)

-- getText: None -> str
-- Gets the current string of the scene
function TimedTextScene.getText(self)
    local global_context = application:getGlobalContext()
    self:updateTime(global_context.dt)
    return string.sub(self.text, 0,math.floor(self.elapsed_time / self.dt))
end

return TimedTextScene