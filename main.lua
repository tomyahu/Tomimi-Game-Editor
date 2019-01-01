require "Overworld.ctrl.GameController"
require "Menu.ctrl.MenuCtrl"
require "Menu.view.MenuView"
require "Menu.model.menues.DefaultMenuBuilder"
require "Menu.model.menuStates.ExitMenuState"
require "Menu.model.menues.DefaultMenuBuilder"


mBuild = DefaultMenuBuilder.new()
mBuild:addState(MenuState.new("Start"))
mBuild:addState(MenuState.new("Load"))
mBuild:addState(ExitMenuState.new("Exit"))

theMenu = mBuild:getMenu()

CurrentCtrl = MenuCtrl.new(theMenu)
CurrentView = MenuView.new("Resources/Menu/background.png", theMenu)

function love.load()
    context = CurrentView:getContextVars()
end

function love.draw()
    CurrentView:draw(context)
end

function love.keypressed(key)
    CurrentCtrl:callbackPressedKey(key)
end