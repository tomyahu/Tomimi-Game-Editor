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
    frames[1] = {}
    for i = 1,(frame_num) do
        frames[1][i] = RectFrame.new((i-1)*width_per_frame, 0, width, height)
    end
    local sprite = Sprite.new(frames, image_path)
    sprite:initialize()
    return sprite
end

-- getRegularRectTimedSprite: str, num, num, num -> Sprite
-- Creates a new single-animation timed sprite
function SpriteFactory.getRegularRectTimedSprite(self, image_path, width, height, frame_num)
    local width_per_frame = width/frame_num
    local frames = {}
    frames[1] = {}
    for i = 1,(frame_num) do
        frames[1][i] = TimedSprite.new((i-1)*width_per_frame, 0, width, height)
    end
    local sprite = Sprite.new(frames, image_path)
    sprite:initialize()
    return sprite
end

-- TODO: Create functions to manage multi-animation sprites

return SpriteFactory