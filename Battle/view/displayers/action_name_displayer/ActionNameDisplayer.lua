require "lib.classes.class"
require "Global.consts"
require "Global.fonts"
local UIHCenteredText = require("lib.ui.text.UIHCenteredText")
--------------------------------------------------------------------------------------------------------

-- class: ActionNameDisplayer
-- The view displayer for action names
local ActionNameDisplayer = class(function(self)
    self.text = UIHCenteredText.new("", GAME_WIDTH/2, 50, BATTLE_FONT, {1,1,1,1})
end)

-- draw: None -> None
-- draws the action name on the screen
function ActionNameDisplayer.draw(self)
    self.text:draw()
end

-- setter
function ActionNameDisplayer.setText(self, text)
    self.text:setMsg(text)
end

return ActionNameDisplayer