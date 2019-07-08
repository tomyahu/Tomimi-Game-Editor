require "Global.consts"
require "Global.application.application"
---------------------------------------------------------------------------
if TEST then
    require("test")
    love.event.quit()
end


local initial_app = require( APPS[INITIAL_APP] )

for appName, appInit in pairs(APPS) do
    application:registerApp(appName, appInit)
end

application:setCtrl(initial_app["ctrl"])
application:setView(initial_app["view"])

function love.load()
    application:setLocalContext(application:getCurrentCtrl():getContextVars())
    application:setLocalContext(application:getCurrentView():getContextVars(application.getCurrentLocalContext()))
    --print(love.joystick.saveGamepadMappings( "helo.txt" ))
end

function love.draw()
    love.graphics.setShader(application.getCurrentShader())
    love.graphics.setShader()
    application:getCurrentView():draw(application:getCurrentLocalContext())
end

function love.keypressed(key)
    application:getCurrentCtrl():callbackPressedKey(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)
    application:getCurrentCtrl():callbackReleasedKey(key)
end


function love.update( dt )
    local global_context = application:getGlobalContext()
    global_context.dt = dt
    application:setGlobalContext(global_context)
    
    application:getCurrentCtrl():update(dt)
end
