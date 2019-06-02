require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local NullSprite = class(function(self) end)

function NullSprite.initialize(self)
end

function NullSprite.draw(self, x, y, sx, sy)
end

function NullSprite.finalize(self)
end

function NullSprite.getImagePath(self)
    return ""
end

function NullSprite.setFrameSet(self, frame_set)
end

function NullSprite.getCurrentFrame(self)
    return nil
end

function NullSprite.advanceFrame(self)
end

return NullSprite