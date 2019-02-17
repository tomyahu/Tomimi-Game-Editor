require "Global.consts"
require "Global.application.application"
require "Menu._init"
require "Cutscenes._init"
require "Overworld._init"

require "lib.algorithm.test.algorithmTests"

application:setCtrl(titleScreenMenuCtrl)
application:setView(titleScreenMenuView)

function love.load()
    application:setLocalContext(CurrentView:getContextVars())
    --print(love.joystick.saveGamepadMappings( "helo.txt" ))
end

function love.draw()
    CurrentView:draw(application:getCurrentLocalContext())
end

function love.keypressed(key)
    CurrentCtrl:callbackPressedKey(key)
    --print("Pressed: ",key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)
    CurrentCtrl:callbackReleasedKey(key)
    --print("Released: ", key)
end


function love.update( dt )
    GLOBAL_CONTEXT.dt = dt
    CurrentCtrl:update(dt)
end
