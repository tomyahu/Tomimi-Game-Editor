require "Menu.ctrl.MenuCtrl"
require "Menu.view.LotRMTitleMenuView"
require "Menu.model.menues.DefaultMenuBuilder"
require "Menu.model.menues.DefaultMenuBuilder"
require "Menu.model.menuStates.SingleActionMenuState"

require "Menu.resources.FontBank"

require "Default.application.application"

local mBuild = DefaultMenuBuilder.new()

-- Title Menu --------------------------------------------------
local conf_state = MenuState.new("Configuration")
local new_game_state = MenuState.new("New game")

mBuild:addState(new_game_state)
mBuild:addState(MenuState.new("Continue"))
mBuild:addState(conf_state)
mBuild:addState(
    SingleActionMenuState.new("Exit","return", function (state)
        love.event.quit()
    end))

titleScreenMenu = mBuild:getMenu()

-- Configuration Menu --------------------------------------------------
local volume_state = MenuState.new("Volume: 100%")
volume_state:addTransitionAction("right", function (state)
    if state.volume == nil then
        state.volume = 100
    end

    state.volume = math.min(state.volume + 5, 100)

    love.audio.setVolume( state.volume / 100 )

    state.name = "Volume: " .. state.volume .. "%"
end)
volume_state:addTransitionAction("left", function (state)
    if state.volume == nil then
        state.volume = 100
    end

    state.volume = math.max(state.volume - 5, 0)

    love.audio.setVolume( state.volume / 100 )

    state.name = "Volume: " .. state.volume .. "%"
end)

local fullscreen_state = SingleActionMenuState.new("Toggle Fullscreen: OFF", "return", function (state)
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

mBuild = DefaultMenuBuilder.new()
mBuild:addState(volume_state)
mBuild:addState(fullscreen_state)
mBuild:addState(back_state)

confScreenMenu = mBuild:getMenu()
----------------------------------------------------------------


titleScreenMenuCtrl = MenuCtrl.new(titleScreenMenu)
titleScreenMenuView = LotRMTitleMenuView.new("Resources/Menu/background.png", titleScreenMenu, title_screen_font)

new_game_state:addTransitionAction("return", function (state)
    application:appChange("Cutscenes")
end)

conf_state:addTransitionAction("return", function (state)
    titleScreenMenuCtrl:setMenu(confScreenMenu)
    titleScreenMenuView:setMenu(confScreenMenu)
end)

back_state:addTransitionAction("return", function (state)
    titleScreenMenuCtrl:setMenu(titleScreenMenu)
    titleScreenMenuView:setMenu(titleScreenMenu)
end)

application:registerApp("MainMenu", titleScreenMenuView, titleScreenMenuCtrl)