require "Default.consts"
require "Default.application.application"
require "Menu._init"
require "Cutscenes._init"

application:setCtrl(titleScreenMenuCtrl)
application:setView(titleScreenMenuView)

function love.load()
    application:setContext(CurrentView:getContextVars())
end

function love.draw()
    CurrentView:draw(application:getCurrentContext())
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
