--------------------------------------------------------------------------------------------------------
Sprite = {};
Sprite.__index = Sprite

-- Sprite: Sprite
-- Creates a Sprite
function Sprite.new(frames, image_path)
    local o = {};
    local self = setmetatable(o, Sprite)
    self.image_path = image_path
    self.frames = frames
    self.current_frame = 0
    self.__index = self
    return self
end

function Sprite.advanceFrame(self)
    self.current_frame = self.current_frame % (# self.frames)
end

function Sprite.getCurrentFrame(self)
    return self.frames[self.current_frame]
end

function Sprite.getImagePath(self)
    return self.image_path
end