require "lib.classes.class"
local Animation = require("Battle.view.animations.animations.Animation")
--------------------------------------------------------------------------------------------------------

-- class: MessageDisplayAnimation
-- param: msg:str -> the message to draw in the view's message displayer
-- param: time:num(0,) -> the time in seconds the message will be displayed
-- An animation where a message is written in the view's message displayer
local MessageDisplayAnimation = extend(Animation, function(self, msg, time)
    self.msg = msg
    self.time = time
end)

-- reset: None -> None
-- sets the message given in the message displayer
function MessageDisplayAnimation.reset(self)
    Animation.reset(self)

    local view = application:getCurrentView()
    view:getMessageDisplayer():displayMessage(self.msg, self.time)
end


return MessageDisplayAnimation