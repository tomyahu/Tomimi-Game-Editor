require "Overworld.ctrl.GameController"

displayString = "Hello World"
function love.draw()
    love.graphics.print(displayString, 400, 300)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end