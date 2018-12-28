require "Overworld.ctrl.GameController"
require "Menu.ctrl.MenuCtrl"
require "Menu.view.MenuView"

CurrentCtrl = MenuCtrl()
CurrentView = MenuView()

displayString = "Hello World"

function love.load()
    context = CurrentView.getContextVars()
end

function love.draw()
    CurrentView.draw(context)
end

function love.keypressed(key)
    CurrentCtrl.callbackPressedKey(key)
end