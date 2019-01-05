require "Menu._init"

CurrentCtrl = titleScreenMenuCtrl
CurrentView = titleScreenMenuView

function love.load()
    context = CurrentView:getContextVars()
end

function love.draw()
    CurrentView:draw(context)
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
