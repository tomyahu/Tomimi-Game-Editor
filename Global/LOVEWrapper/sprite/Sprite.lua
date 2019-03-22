require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

local Sprite = class(function(self, frames, image_path)
    self.loveSprite = nil
    self.image_path = image_path
    self.frames = frames
    self.current_frame = 1
    self.current_frame_set = 1
end)

function Sprite.initialize(self)
    self.loveSprite = love.graphics.newImage(self.image_path)
end

function Sprite.draw(self, x, y, sx, sy)
    local frame_x = self:getCurrentFrame():getX()
    local frame_y = self:getCurrentFrame():getY()
    local frame_width = self:getCurrentFrame():getWidth()
    local frame_height = self:getCurrentFrame():getHeight()
    love.graphics.draw(self.loveSprite,love.graphics.newQuad(frame_x,frame_y,frame_width,frame_height,self.loveSprite:getDimensions()), x, y, 0, sx, sy)
end

function Sprite.finalize(self)
    self.loveSprite = nil
end

function Sprite.getImagePath(self)
    return self.image_path
end

function Sprite.setFrameSet(self, frame_set)
    self.current_frame_set = frame_set
    self.current_frame = 1
end

function Sprite.getCurrentFrame(self)
    return self.frames[self.current_frame_set][self.current_frame]
end

function Sprite.advanceFrame(self)
    self.current_frame = (self.current_frame + 1)
    if self.current_frame > (# self.frames[self.current_frame_set]) then
        self.current_frame = 1
    end
end

return Sprite
