require "Overworld.ctrl.GameController"

displayString = "Hello World"
function love.draw()
    love.graphics.print(displayString, 400, 300)
end
