require "Global.consts"
local App = require "Global.application.App"

-- getRelativePos(x,y): num, num -> num, num
-- returns the position given on the game coordinate system.
function getRelativePos(x, y)
    local width_ratio = love.graphics.getWidth() / GAME_WIDTH
    local height_ratio = love.graphics.getHeight() / GAME_HEIGHT

    if width_ratio > height_ratio then
        return x*height_ratio + (width_ratio - height_ratio) * (GAME_WIDTH/2) , y*height_ratio
    else
        return x*width_ratio , y*width_ratio + (height_ratio - width_ratio) * (GAME_HEIGHT/2)
    end
end

-- getRelativeTransitionPos(x,y): num, num -> num, num
-- returns the position given just making a transition on the relative coordinate system.
function getRelativeTransitionPos(x, y)
    local width_dif = love.graphics.getWidth() - GAME_WIDTH
    local height_dif = love.graphics.getHeight() - GAME_HEIGHT

    return x + width_dif/2, y + height_dif/2
end

function getScale()
    local width_ratio = love.graphics.getWidth() / GAME_WIDTH
    local height_ratio = love.graphics.getHeight() / GAME_HEIGHT
    local min_ratio = math.min(width_ratio, height_ratio)
    return min_ratio
end

function getRelativePosX(x)
    local newx, _ = getRelativePos(x,0)
    return newx
end

function getRelativePosY(y)
    local _, newy = getRelativePos(0,y)
    return newy
end
