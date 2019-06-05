require "lib.classes.class"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
--------------------------------------------------------------------------------------------------------

-- class: TimedSprite
-- param: frames:array(array(Frames)) -> the animation frames that display different animations
-- param: image_path:str -> the path of the image of the sprite
-- A sprite class that has a method called advanceTime that takes a number and adds it to the current time, when the
-- time has advanced one unit it changes frame
local TimedSprite = extend(Sprite, function(self, frames, image_path)
    self.dt = 1
    self.current_time = 0
end,

function(frames, image_path)
    return Sprite.new(frames, image_path)
end)

-- setFrameSet: num -> None
-- Sets the frame set id of the sprite so the sprite plays a different animation, sets the current frame of the
-- animation to the first frame and the sprite's current time to 0
function TimedSprite.setFrameSet(self, frame_set)
    Sprite.setFrameSet(self, frame_set)
    self.current_time = 0
end

-- advanceFrame: None -> nil
-- Advances the frame in the current animation frame set by one (if the current frame is the final frame of the
-- animation it resets to the first frame) and sets the current time to the current frame value minus one
function TimedSprite.advanceFrame(self)
    self.current_frame = (self.current_frame + 1)
    if self.current_frame > (# self.frames[self.current_frame_set]) then
        self.current_frame = 1
    end
    self.current_time = self.current_frame - 1
end

-- advanceTime: num -> None
-- Adds dt to the current time, if the current time surpasses one whole unit the current frame is updated
function TimedSprite.advanceTime(self, dt)
    self.current_time = self.current_time + dt
    if self.current_time >= (# self.frames[self.current_frame_set]) then
        self.current_time = self.current_time - math.floor(self.current_time/self.dt)*self.dt
    end
    self.current_frame  = math.floor(self.current_time/self.dt) + 1
end

return TimedSprite