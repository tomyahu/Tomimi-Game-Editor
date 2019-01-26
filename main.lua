require "Global.consts"
require "Global.application.application"
require "Menu._init"
require "Cutscenes._init"

require "util.algorithm.test.algorithmTests"

application:setCtrl(titleScreenMenuCtrl)
application:setView(titleScreenMenuView)

function love.load()
    application:setLocalContext(CurrentView:getContextVars())
end

function love.draw()
    CurrentView:draw(application:getCurrentLocalContext())
end

function love.keypressed(key)
    CurrentCtrl:callbackPressedKey(key)
    print(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "p" then
        love.window.setFullscreen( true )
    end
end

function love.update( dt )
    GLOBAL_CONTEXT.dt = dt
end
