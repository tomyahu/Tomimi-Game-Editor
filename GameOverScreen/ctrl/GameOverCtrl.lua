require "lib.classes.class"
require "Global.controls"
require "Global.application.application"
local MenuCtrl = require "Menu.ctrl.MenuCtrl"
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"
--------------------------------------------------------------------------------------------------------

-- class: GameOverCtrl
-- param: view:GameOverView -> The view of the game over screen
-- the controller of the game over screen
local GameOverCtrl = extend(MenuCtrl, function(self, view)
    -- Make menu with only accept option
    local menu_build = DefaultMenuBuilder.new()
    menu_build:addState(
        SingleActionMenuState.new("Exit", ACTION_BUTTON_1, function (_)
            application:appChange("TitleMenu")
        end))

    self.menu = menu_build:getMenu()
end)

return GameOverCtrl