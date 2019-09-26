require "lib.classes.class"
require "Global.consts"
local View = require "Global.view.view"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
-------------------------------------------------------------------------------------------------------

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self)
end,

function()
    return View.new()
end)

-- draw: context -> None
-- Draws the current scene
function BattleView.draw(self)
    local hero_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Party/MAC_IDLE.png")
    local enemy_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Enemies/none.png")
    local background_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")

    love.graphics.draw(background_image)
    love.graphics.draw(hero_image, 30, 400)
    love.graphics.draw(enemy_image, 630, 400)
end

return BattleView