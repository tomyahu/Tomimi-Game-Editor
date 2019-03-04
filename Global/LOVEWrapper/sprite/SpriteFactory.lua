require "lib.classes.class"
require "Global.LOVEWrapper.sprite.Sprite"
require "Global.LOVEWrapper.sprite.RectFrame"
--------------------------------------------------------------------------------------------------------

local SpriteFactory = class(function(self) end)

function SpriteFactory.getRegularRectSprite(image_path, width, height, frame_num)
    local width_per_frame = width/frame_num
    local frames = {}
    for i = 0,(frame_num-1) do
        frames[i] = RectFrame.new(i*width_per_frame, 0, width, height)
    end
    return Sprite.new(frames, image_path)
end

return SpriteFactory