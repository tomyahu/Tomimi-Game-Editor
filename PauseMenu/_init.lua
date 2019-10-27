require "Global.consts"
require "Global.application.application"

local MenuState = require "Menu.model.menuStates.MenuState"
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"

local PauseMenuCtrl = require "PauseMenu.ctrl.PauseMenuCtrl"
local PauseMenuView = require "PauseMenu.view.PauseMenuView"
----------------------------------------------------------------------------------------
-- Set Font
local font = love.graphics.newFont("Resources/Fonts/RegularFonts/PIXEAB__.TTF", 18)

-- Define Menu
local mBuild = DefaultMenuBuilder.new()
local save_state = SingleActionMenuState.new("Save", "return", function (_)
        -- TODO: Play *saved* sound
        application:saveGlobalContext()
    end)
local back_state = SingleActionMenuState.new("Back", "return", function (_)
        application:appChange("Debug_Overworld")
    end)

mBuild:addState(save_state)
mBuild:addState(back_state)

local menu = mBuild:getMenu()

local pause_menu_view = PauseMenuView.new(RESOURCES_PATH .. "/PauseMenu/PauseMenuBackground.png", menu, font, RESOURCES_PATH .. "/PauseMenu/MenuBorders.png")
local pause_menu_ctrl = PauseMenuCtrl.new(PauseMenuView, menu)

return {["ctrl"] = pause_menu_ctrl, ["view"] = pause_menu_view}