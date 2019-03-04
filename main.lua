require "Global.consts"
require "Global.application.application"

----------------------------------------------------------------------------------
-- import your initial app here
local initial_app = require "Menu._init"
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Register your Apps here
-- Apps Registered
----------------------------------------------------------------------------------

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
