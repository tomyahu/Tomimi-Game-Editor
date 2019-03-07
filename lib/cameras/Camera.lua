require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------
local Camera = class(function(self, x, y, zoom)
    self.centerx = x
    self.centery = y
    self.zoom = zoom
end)

function Camera.setCenter(self, x, y)
    self.centerx = x
    self.centery = y
end

function Camera.setZoom(self, zoom)
    self.zoom = zoom
end

function Camera.draw(self, sprite, x, y, sx, sy)
    if sx == nil then sx = 1 end
    if sy == nil then sy = 1 end

    local zoom = getScale()

    local newx = (x + (GAME_WIDTH/2) - self.centerx) * self.zoom
    local newy = (y + (GAME_HEIGHT/2) - self.centery) * self.zoom

    local newx, newy = getRelativePos(newx, newy)
    sprite:draw(newx, newy, self.zoom * sx, self.zoom * sy)
end

return Camera