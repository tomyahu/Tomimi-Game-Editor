require "lib.classes.class"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local TimedSprite = require "Global.LOVEWrapper.sprite.TimedSprite"
--------------------------------------------------------------------------------------------------------

-- class: SpriteFactory
-- A factory class to make sprite creation easier
local SpriteFactory = class(function(self) end)

-- getRegularRectSprite: str, num, num, num -> Sprite
-- Creates a new single-animation sprite
function SpriteFactory.getRegularRectSprite(self, image_path, width, height, frame_num)
    local width_per_frame = width/frame_num
    local frames = {}
    for i = 0,(frame_num-1) do
        frames[i] = RectFrame.new(i*width_per_frame, 0, width, height)
    end
    return Sprite.new(frames, image_path)
end

-- getRegularRectTimedSprite: str, num, num, num -> Sprite
-- Creates a new single-animation timed sprite
function SpriteFactory.getRegularRectTimedSprite(self, image_path, width, height, frame_num)
    local width_per_frame = width/frame_num
    local frames = {}
    for i = 0,(frame_num-1) do
        frames[i] = TimedSprite.new(i*width_per_frame, 0, width, height)
    end
    return Sprite.new(frames, image_path)
end

-- TODO: Create functions to manage multi-animation sprites

return SpriteFactory