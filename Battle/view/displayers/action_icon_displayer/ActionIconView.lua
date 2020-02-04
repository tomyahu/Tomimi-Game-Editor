require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- class: ActionIconView
-- param: action:Action -> the action whose icon is going to be represented
-- The view for an action icon
local ActionIconView = class(function(self, action)
    self.action = action
    self.icon_sprite = SpriteFactory.getRegularRectSprite(action:getIconPath(), 64, 32, 1)
end)

-- draw: None -> None
-- draws the action icon
function ActionIconView.draw(self, x, y)
    self.icon_sprite:draw(getRelativePosX(x), getRelativePosY(y), 2*getScale(), 2*getScale())
end

return ActionIconView