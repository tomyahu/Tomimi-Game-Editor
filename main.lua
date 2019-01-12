require "Default.consts"
require "Menu._init"
require "Cutscenes._init"

setCtrl(titleScreenMenuCtrl)
setView(titleScreenMenuView)

function love.load()
    setContext(CurrentView:getContextVars())
end

function love.draw()
    CurrentView:draw(Context)
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
