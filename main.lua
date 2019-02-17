require "Global.consts"
require "Global.application.application"
local initial_app = require "Menu._init"

require "lib.algorithm.test.algorithmTests"

-- Apps Registered
application:registerApp("TitleMenu", "Menu._init")
application:registerApp("Cutscenes", "Cutscenes._init")
application:registerApp("Overworld", "Overworld._init")

application:setCtrl(initial_app["ctrl"])
application:setView(initial_app["view"])

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
