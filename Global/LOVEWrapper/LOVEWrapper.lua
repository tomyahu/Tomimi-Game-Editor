require "Global.consts"
require "Global.application.App"

-- getRelativePos(x,y): num, num -> num, num
-- returns the position given on the game coordinate system.
function getRelativePos(x, y)
    local width_ratio = love.graphics.getWidth() / GAME_WIDTH
    local height_ratio = love.graphics.getHeight() / GAME_HEIGHT

    if width_ratio > height_ratio then
        return x*(height_ratio + (width_ratio - height_ratio) / 2) , y*height_ratio
    else
        return x*width_ratio , y*(width_ratio + (height_ratio - width_ratio) / 2)
    end
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
