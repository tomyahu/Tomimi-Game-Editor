require "Default.LOVEWrapper.sprite.Sprite"
--------------------------------------------------------------------------------------------------------
TimedSprite = Sprite.new();
TimedSprite.__index = TimedSprite

-- TimedSprite: TimedSprite
-- Creates a TimedSprite
function TimedSprite.new(frames, dt)
    local o = Sprite.new(frames);
    local self = setmetatable(o, TimedSprite)
    self.__index = self
    self.dt = dt
    self.current_time = 0
    return self
end

function TimedSprite.advanceFrame(self, dt)
    self.current_time = self.current_time + dt
    self.current_time = self.current_time - math.floor(self.current_time/(# self.frames))*self.dt
    self.current_frame  = math.floor(self.current_time/self.dt)
end

function TimedSprite.advanceFrame(self)
    self.current_frame = self.current_frame % (# self.frames)
    self.current_time = dt*self.current_frame
end