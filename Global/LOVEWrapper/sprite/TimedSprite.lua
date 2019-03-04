require "lib.classes.class"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
--------------------------------------------------------------------------------------------------------

local TimedSprite = extend(Sprite, function(self, frames, dt)
    self.dt = dt
    self.current_time = 0
end,

function(frames, dt)
    return Sprite.new(frames)
end)

function TimedSprite.advanceFrame(self, dt)
    self.current_time = self.current_time + dt
    self.current_time = self.current_time - math.floor(self.current_time/(# self.frames))*self.dt
    self.current_frame  = math.floor(self.current_time/self.dt)
end

function TimedSprite.advanceFrame(self)
    self.current_frame = self.current_frame % (# self.frames)
    self.current_time = dt*self.current_frame
end

return TimedSprite