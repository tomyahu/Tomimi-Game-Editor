require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: PaddleView
-- Creates a new PaddleView to visualize the paddle
local PaddleView = class(function(self)
    self.paddle_image = love.graphics.newImage("Resources/Track/paddle1.png")
    self.activated_paddle_image = love.graphics.newImage("Resources/Track/paddle2.png")
end)

-- draw: Paddle -> None
-- draws the paddle sprite depending on its state
function PaddleView.draw(self, paddle)
    if paddle:getStateStr() == "NormalState" then
        self:drawPaddle()
    else
        self:drawActivatedPaddle()
    end
end

-- drawPaddle: None -> None
-- draws a normal paddle
function PaddleView.drawPaddle(self)
    love.graphics.draw(self.paddle_image,100,100,0, 2*getScale())
end

-- drawActivatedPaddle: None -> None
-- draws an activated paddle
function PaddleView.drawActivatedPaddle(self)
    love.graphics.draw(self.activated_paddle_image,100,100,0, 2*getScale())
end

return PaddleView