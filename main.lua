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
    application:setLocalContext(CurrentCtrl:getContextVars())
    application:setLocalContext(CurrentView:getContextVars(application.getCurrentLocalContext()))
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
    local global_context = application:getGlobalContext()
    global_context.dt = dt
    application:setGlobalContext(global_context)
    
    CurrentCtrl:update(dt)
end
