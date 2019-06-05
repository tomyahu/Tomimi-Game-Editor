require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NullSprite
-- Is a sprite that isn't drawn on the screen
local NullSprite = class(function(self) end)

-- initialize: None -> None
-- Initializes the unprepared attributes of the sprite
function NullSprite.initialize(self)
end

-- draw: num, num, num, num -> None
-- Draws the sprite on the screen on a given position x,y and with a given scale
function NullSprite.draw(self, x, y, sx, sy)
end

-- finalize: None -> None
-- Finalices the prepared atributes of the sprite
function NullSprite.finalize(self)
end

-- getImagePath: None -> None
-- Gets the path of the image of the sprite
function NullSprite.getImagePath(self)
    return ""
end

-- setFrameSet: num -> None
-- Sets the frame set id of the sprite so the sprite plays a different animation
function NullSprite.setFrameSet(self, frame_set)
end

-- getCurrentFrame: None -> nil
-- Gets the current frame of the sprite, in this case there is no sprite so it returns nil
function NullSprite.getCurrentFrame(self)
    return nil
end

-- advanceFrame: None -> nil
-- Advances the frame in the current animation frame set by one (if the current frame is the final frame of the
-- animation it resets to the first frame)
function NullSprite.advanceFrame(self)
end

return NullSprite