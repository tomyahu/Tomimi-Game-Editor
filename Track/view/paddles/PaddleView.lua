require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: PaddleView
-- Creates a new PaddleView to visualize the paddle
local PaddleView = class(function(self)
    self.paddle_image = love.graphics.newImage("Resources/Track/paddle_little1.png")
    self.activated_paddle_image = love.graphics.newImage("Resources/Track/paddle_little2.png")
end)

-- drawPaddleLane: Padlle -> None
-- draws the lane of the Paddle
function PaddleView.drawPaddleLane(self, paddle)

    if not (paddle:getStateStr() == "InactiveState") then
        love.graphics.setColor(1,1,1,0.1)
        love.graphics.rectangle("fill", getRelativePosX(0), getRelativePosY(paddle:getY()), 800*getScale(), 78*getScale() )
        love.graphics.setColor(1,1,1,1)
    end
end

-- draw: Paddle -> None
-- draws the paddle sprite depending on its state
function PaddleView.draw(self, paddle)
    if paddle:getStateStr() == "NormalState" then
        self:drawPaddle(paddle)
    else
        self:drawActivatedPaddle(paddle)
    end
end

-- drawPaddle: None -> None
-- draws a normal paddle
function PaddleView.drawPaddle(self, paddle)
    love.graphics.draw(self.paddle_image,getRelativePosX(paddle:getX()),getRelativePosY(paddle:getY()),0, 3*getScale())
end

-- drawActivatedPaddle: None -> None
-- draws an activated paddle
function PaddleView.drawActivatedPaddle(self, paddle)
    love.graphics.draw(self.activated_paddle_image,getRelativePosX(paddle:getX()),getRelativePosY(paddle:getY()),0, 3*getScale())
end

return PaddleView