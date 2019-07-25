require "Global.consts"
require "Global.application.application"
---------------------------------------------------------------------------
if TEST then
    require("test")
    love.event.quit()
end

-- Love Default Conf
love.graphics.setDefaultFilter('nearest', 'nearest')


local initial_app = require( APPS[INITIAL_APP] )

for appName, appInit in pairs(APPS) do
    application:registerApp(appName, appInit)
end

application:setCtrl(initial_app["ctrl"])
application:setView(initial_app["view"])

function love.load()
    CurrentCtrl:setup()
    CurrentView:setup()
end

function love.draw()
    CurrentView:draw()
end

function love.keypressed(key)
    CurrentCtrl:callbackPressedKey(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)
    CurrentCtrl:callbackReleasedKey(key)
end


function love.update( dt )
    local global_context = application:setInGlobalContext('dt', dt)

    CurrentCtrl:update(dt)
    CurrentView:update(dt)
end
