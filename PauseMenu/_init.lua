require "Global.consts"
require "Global.application.application"

local PauseMenuCtrl = require "PauseMenu.ctrl.PauseMenuCtrl"
local PauseMenuView = require "PauseMenu.view.PauseMenuView"
----------------------------------------------------------------------------------------

local font = love.graphics.newFont("Resources/Fonts/RegularFonts/PIXEARG_.TTF", 18)

-- TODO: Definir Menu
local menu = nil

local pause_menu_view = PauseMenuView.new(RESOURCES_PATH .. "/PauseMenu/PauseMenuBackground.png", menu, font)
local pause_menu_ctrl = PauseMenuCtrl.new(PauseMenuView, titleScreenMenu)

return {["ctrl"] = pause_menu_ctrl, ["view"] = pause_menu_view}