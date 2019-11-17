require "Global.consts"
require "Global.fonts"
require "Global.controls"
require "Global.application.application"

local MenuCtrl = require "Menu.ctrl.MenuCtrl"
local SimpleTitleMenuView = require "Menu.view.SimpleTitleMenuView"
local MenuState = require "Menu.model.menuStates.MenuState"
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"
----------------------------------------------------------------------------------------

local title_screen_font = DIALOG_FONT

local mBuild = DefaultMenuBuilder.new()

-- Title Menu --------------------------------------------------
local conf_state = MenuState.new("Configuration")
local debug_room_state = MenuState.new("Debug Room")

if application:getFromGlobalContext("DEBUG") or DEBUG then
    mBuild:addState(debug_room_state)
end
mBuild:addState(conf_state)
mBuild:addState(
    SingleActionMenuState.new("Exit", ACTION_BUTTON_1, function (_)
        love.event.quit()
    end))

local titleScreenMenu = mBuild:getMenu()

-- Configuration Menu --------------------------------------------------
local volume_state = MenuState.new("Volume: 100%")
volume_state:addTransitionAction(RIGHT_BUTTON, function (state)
    if state.volume == nil then
        state.volume = 100
    end

    state.volume = math.min(state.volume + 5, 100)

    love.audio.setVolume( state.volume / 100 )

    state.name = "Volume: " .. state.volume .. "%"
end)
volume_state:addTransitionAction(LEFT_BUTTON, function (state)
    if state.volume == nil then
        state.volume = 100
    end

    state.volume = math.max(state.volume - 5, 0)

    love.audio.setVolume( state.volume / 100 )

    state.name = "Volume: " .. state.volume .. "%"
end)

local fullscreen_state = SingleActionMenuState.new("Toggle Fullscreen: OFF", ACTION_BUTTON_1, function (state)
    if state.is_fullscreen == nil then
        state.is_fullscreen = false
    end

    state.is_fullscreen = not state.is_fullscreen
    love.window.setFullscreen( state.is_fullscreen, "desktop" )

    if state.is_fullscreen then
        state.name = "Toggle Fullscreen: ON"
    else
        state.name = "Toggle Fullscreen: OFF"
    end

end)
local back_state = MenuState.new("Back")

local mBuild = DefaultMenuBuilder.new()
mBuild:addState(volume_state)
--mBuild:addState(fullscreen_state)
mBuild:addState(back_state)

local confScreenMenu = mBuild:getMenu()
----------------------------------------------------------------

local titleScreenMenuView = SimpleTitleMenuView.new(RESOURCES_PATH .. "/Menu/background.png", titleScreenMenu, title_screen_font)
local titleScreenMenuCtrl = MenuCtrl.new(titleScreenMenuView, titleScreenMenu)

debug_room_state:addTransitionAction(ACTION_BUTTON_1, function (_)
    -- Create Debug Save
    local save = {}
    save["Overworld"] = {}
    save["Overworld"]["Room"] = "Room1"
    save["Overworld"]["Position"] = {}
    save["Overworld"]["Position"]["x"] = 300
    save["Overworld"]["Position"]["y"] = 300
    save["Overworld"]["Position"]["y"] = 300

    save["Battle"] = {}
    save["Battle"]["PlayerPartyMetadata"] = {}
    
    local player1 = {}
    player1["id"] = "Naranjarina"
    player1["meta"] = {}
    
    save["Battle"]["PlayerPartyMetadata"][1] = player1
    save["Battle"]["PlayerPartyMetadata"][3] = player1
    
    save["Battle"]["EnemyPartyMetadata"] = {}
    save["Battle"]["EnemyPartyMetadata"][1] = player1
    save["Battle"]["EnemyPartyMetadata"][2] = player1
    
    save["Battle"]["Ambient"] = "debug_ambient1"
    
    -- items
    save["Items"] = {}

    local item_1 = {}
    item_1["id"] = 1
    item_1["count"] = 1

    local item_2 = {}
    item_2["id"] = 2
    item_2["count"] = 3

    local item_3 = {}
    item_3["id"] = 3
    item_3["count"] = 1

    table.insert(save["Items"], item_1)
    table.insert(save["Items"], item_2)
    table.insert(save["Items"], item_3)

    -- Save Debug ID
    application:setCurrentSaveID("Debug")

    application:setCurrentSave(save)

    application:appChange("Debug_Overworld")
end)

conf_state:addTransitionAction(ACTION_BUTTON_1, function (_)
    titleScreenMenuCtrl:setMenu(confScreenMenu)
end)

back_state:addTransitionAction(ACTION_BUTTON_1, function (_)
    titleScreenMenuCtrl:setMenu(titleScreenMenu)
end)

return {["ctrl"] = titleScreenMenuCtrl, ["view"] = titleScreenMenuView}