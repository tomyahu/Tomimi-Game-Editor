require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: Sprite
-- param: frames:array(array(Frames)) -> the animation frames that display different animations
-- param: image_path:str -> the path of the image of the sprite
-- The default sprite class
local Sprite = class(function(self, frames, image_path)
    self.image_path = image_path
    self.loveSprite = love.graphics.newImage(self.image_path)
    self.frames = frames
    self.current_frame = 1
    self.current_frame_set = 1
end)

-- draw: num, num, num, num -> None
-- Draws the sprite on the screen on a given position x,y and with a given scale
function Sprite.draw(self, x, y, sx, sy)
    local frame_x = self:getCurrentFrame():getX()
    local frame_y = self:getCurrentFrame():getY()
    local frame_width = self:getCurrentFrame():getWidth()
    local frame_height = self:getCurrentFrame():getHeight()
    love.graphics.draw(self.loveSprite,love.graphics.newQuad(frame_x,frame_y,frame_width,frame_height,self.loveSprite:getDimensions()), x, y, 0, sx, sy)
end

-- finalize: None -> None
-- Finalices the prepared atributes of the sprite
function Sprite.finalize(self)
    self.loveSprite = nil
end

-- getImagePath: None -> None
-- Gets the path of the image of the sprite
function Sprite.getImagePath(self)
    return self.image_path
end

-- setFrameSet: num -> None
-- Sets the frame set id of the sprite so the sprite plays a different animation and sets the current frame of the
-- animation to the first frame
function Sprite.setFrameSet(self, frame_set)
    self.current_frame_set = frame_set
    self.current_frame = 1
end

-- getCurrentFrame: None -> nil
-- Gets the current frame of the sprite
function Sprite.getCurrentFrame(self)
    return self.frames[self.current_frame_set][self.current_frame]
end

-- setter
function Sprite.setCurrentFrame(self, new_current_frame)
  self.current_frame = new_current_frame
end

-- advanceFrame: None -> nil
-- Advances the frame in the current animation frame set by one (if the current frame is the final frame of the
-- animation it resets to the first frame)
function Sprite.advanceFrame(self)
    self.current_frame = (self.current_frame + 1)
    if self.current_frame > (# self.frames[self.current_frame_set]) then
        self.current_frame = 1
    end
end

-- getter
function Sprite.getWidth(self)
    return self.loveSprite:getWidth()
end

return Sprite
