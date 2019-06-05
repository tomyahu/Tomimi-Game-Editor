require "Global.consts"
local App = require "Global.application.App"
--------------------------------------------------------------------------------------------------------

-- getRelativePos: num, num -> num, num
-- Returns the position given on the game coordinate system.
function getRelativePos(x, y)
    local width_ratio = love.graphics.getWidth() / GAME_WIDTH
    local height_ratio = love.graphics.getHeight() / GAME_HEIGHT

    if width_ratio > height_ratio then
        return x*height_ratio + (width_ratio - height_ratio) * (GAME_WIDTH/2) , y*height_ratio
    else
        return x*width_ratio , y*width_ratio + (height_ratio - width_ratio) * (GAME_HEIGHT/2)
    end
end

-- getRelativeTransitionPos: num, num -> num, num
-- Returns the position given just making a transition on the relative coordinate system.
function getRelativeTransitionPos(x, y)
    local width_dif = love.graphics.getWidth() - GAME_WIDTH
    local height_dif = love.graphics.getHeight() - GAME_HEIGHT

    return x + width_dif/2, y + height_dif/2
end

-- getScale: None -> num
-- Takes the current game width and height, compares it to the window current size and with that computes the width and
-- height ratio. Finally returns the lowest of the two.
function getScale()
    local width_ratio = love.graphics.getWidth() / GAME_WIDTH
    local height_ratio = love.graphics.getHeight() / GAME_HEIGHT
    local min_ratio = math.min(width_ratio, height_ratio)
    return min_ratio
end

-- getRelativePosX: num -> num
-- Returns the position in x given on the game coordinate system.
function getRelativePosX(x)
    local newx, _ = getRelativePos(x,0)
    return newx
end

-- getRelativePosY: num -> num
-- Returns the position in y given on the game coordinate system.
function getRelativePosY(y)
    local _, newy = getRelativePos(0,y)
    return newy
end
