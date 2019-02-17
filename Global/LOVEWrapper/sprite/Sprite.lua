require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------
Sprite = {};
Sprite.__index = Sprite

-- Sprite: Sprite
-- Creates a Sprite
function Sprite.new(frames, image_path)
    local o = {};
    local self = setmetatable(o, Sprite)
    self.loveSprite = nil
    self.image_path = image_path
    self.__index = self
    self.frames = frames
    self.current_frame = 0
    return self
end

function Sprite.initialize(self)
    self.loveSprite = love.graphics.newImage(self.image_path)
end

function Sprite.draw(self, x, y, sx, sy)
    local frame_x = self:getCurrentFrame():getX()
    local frame_y = self:getCurrentFrame():getY()
    local frame_width = self:getCurrentFrame():getWidth()
    local frame_height = self:getCurrentFrame():getHeight()
    love.graphics.draw(self.loveSprite,love.graphics.newQuad(frame_x,frame_y,frame_width,frame_height,self.loveSprite:getDimensions()), x, y, 0, getScale()*sx, getScale()*sy)
end

function Sprite.finalize(self)
    self.loveSprite = nil
end

function Sprite.getImagePath(self)
    return self.image_path
end

function Sprite.getCurrentFrame(self)
    return self.frames[self.current_frame]
end

function Sprite.advanceFrame(self)
    self.current_frame = (self.current_frame + 1) % (# self.frames)
end
