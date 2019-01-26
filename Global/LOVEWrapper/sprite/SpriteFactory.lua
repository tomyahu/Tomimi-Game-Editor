require "Global.LOVEWrapper.sprite.Sprite"
require "Global.LOVEWrapper.sprite.RectFrame"
--------------------------------------------------------------------------------------------------------
SpriteFactory = {};
SpriteFactory.__index = SpriteFactory

-- SpriteFactory: SpriteFactory
-- Creates a SpriteFactory
function SpriteFactory.new()
    local o = {};
    local self = setmetatable(o, SpriteFactory)
    self.__index = self
    return self
end

function SpriteFactory.getRegularRectSprite(image_path, width, height, frame_num)
    local width_per_frame = width/frame_num
    local frames = {}
    for i = 0,(frame_num-1) do
        frames[i] = RectFrame.new(i*width_per_frame, 0, width, height)
    end
    return Sprite.new(frames, image_path)
end