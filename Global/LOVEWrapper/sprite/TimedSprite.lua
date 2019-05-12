require "lib.classes.class"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
--------------------------------------------------------------------------------------------------------

local TimedSprite = extend(Sprite, function(self, frames, image_path)
    self.dt = 1
    self.current_time = 0
end,

function(frames, image_path)
    return Sprite.new(frames, image_path)
end)

function TimedSprite.advanceTime(self, dt)
    self.current_time = self.current_time + dt
    if self.current_time >= (# self.frames[self.current_frame_set]) then
        self.current_time = self.current_time - math.floor(self.current_time/self.dt)*self.dt
    end
    self.current_frame  = math.floor(self.current_time/self.dt) + 1
end

function TimedSprite.advanceFrame(self)
    self.current_frame = (self.current_frame + 1)
    if self.current_frame > (# self.frames[self.current_frame_set]) then
        self.current_frame = 1
    end
    self.current_time = self.current_frame - 1
end

function TimedSprite.setFrameSet(self, frame_set)
    Sprite.setFrameSet(self, frame_set)
    self.current_time = 0
end

return TimedSprite