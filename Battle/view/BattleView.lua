require "lib.classes.class"
require "Global.consts"
local View = require "Global.view.view"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
-------------------------------------------------------------------------------------------------------

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self)
    self.hero_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Party/MAC_IDLE.png")
    self.enemy_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Enemies/none.png")
    self.background_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")
end,

function()
    return View.new()
end)

-- draw: context -> None
-- Draws the current scene
function BattleView.draw(self)
    love.graphics.draw(self.background_image)
    love.graphics.draw(self.hero_image, 310, 400)
    love.graphics.draw(self.hero_image, 20, 450)
    love.graphics.draw(self.hero_image, 490, 400, 0, -1, 1)
end

return BattleView