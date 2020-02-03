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
    if self.text ~= "" then
        self.text:draw()
    end
end

-- reset: None -> None
-- resets the action name displayer so that it doesn't display anything
function ActionNameDisplayer.reset(self)
    self:setText("")
end

-- setter
function ActionNameDisplayer.setText(self, text)
    self.text:setMsg(text)
end

return ActionNameDisplayer