require "Global.consts"
require "Global.application.application"
---------------------------------------------------------------------------
if SILENCE_DEV_MODE then
    love.audio.setVolume(0)
end

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

function love.load()
    application:init()
  
    application:setCtrl(initial_app["ctrl"])
    application:setView(initial_app["view"])

    application:getCurrentCtrl():setup()
    application:getCurrentView():setup()
end

function love.draw()
    application:getCurrentView():draw()
end

function love.keypressed(key)
    application:getCurrentCtrl():callbackPressedKey(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "s" then
        application:saveGlobalContext()
    end
end

function love.keyreleased(key)
    application:getCurrentCtrl():callbackReleasedKey(key)
end


function love.update( dt )
    application:setInGlobalContext('dt', dt)

    application:getCurrentCtrl():update(dt)
    application:getCurrentView():update(dt)
end
