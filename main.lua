require "ctrl.GameController"

ctrl = GameControler()

displayString = "Hello World"
function love.draw()
    love.graphics.print(displayString, 400, 300)
end

