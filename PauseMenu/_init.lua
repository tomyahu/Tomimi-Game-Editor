require "Global.consts"
require "Global.fonts"
require "Global.controls"
require "Global.application.application"

local MenuState = require "Menu.model.menuStates.MenuState"
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"

local PauseMenuCtrl = require "PauseMenu.ctrl.PauseMenuCtrl"
local PauseMenuView = require "PauseMenu.view.PauseMenuView"
----------------------------------------------------------------------------------------
-- Set Font
local font = DIALOG_FONT

-- Define Menu
local mBuild = DefaultMenuBuilder.new()
local items_state = SingleActionMenuState.new("Items", ACTION_BUTTON_1, function (_)
        local ctrl = application:getCurrentCtrl()
        ctrl:openItemMenu()
    end)
local party_state = SingleActionMenuState.new("Party", ACTION_BUTTON_1, function (_)
    local ctrl = application:getCurrentCtrl()
    ctrl:openPartyMenu()
end)
local save_state = SingleActionMenuState.new("Save", ACTION_BUTTON_1, function (_)
        -- Create sound
        local src1 = love.audio.newSource(RESOURCES_PATH .. "/sounds/LotRM-Save-Game.wav", "static")
        
        -- Get configuration and adjust volume
        local configuration = application:getFromGlobalContext("CONFIGURATION")
        src1:setVolume(configuration["SOUND"]["Effects"])
        
        src1:play()
        
        -- Save game
        application:saveGlobalContext()
        
        -- Display "Game Saved" Notification
        local view = application:getCurrentView()
        view:displayNotification("Game Saved.")
    end)
local back_state = SingleActionMenuState.new("Back", ACTION_BUTTON_1, function (_)
        application:appChange("Debug_Overworld")
    end)

mBuild:addState(items_state)
mBuild:addState(party_state)
mBuild:addState(save_state)
mBuild:addState(back_state)

local menu = mBuild:getMenu()

local pause_menu_view = PauseMenuView.new(RESOURCES_PATH .. "/PauseMenu/PauseMenuBackground.png", menu, font, RESOURCES_PATH .. "/PauseMenu/MenuBorders.png")
local pause_menu_ctrl = PauseMenuCtrl.new(pause_menu_view, menu)

return {["ctrl"] = pause_menu_ctrl, ["view"] = pause_menu_view}