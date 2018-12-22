require "Overworld.ctrl.GameController"
require "Menu.ctrl.MenuCtrl"
require "Menu.view.MenuView"

CurrentCtrl = MenuCtrl()
CurrentView = MenuView()

displayString = "Hello World"
function love.draw()
    CurrentView.draw()
end

function love.keypressed(key)
    CurrentCtrl.callbackPressedKey(key)
end