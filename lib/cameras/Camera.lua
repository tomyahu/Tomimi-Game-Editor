require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
-- TODO: Add camera with effects like zoom-in, zoom-out, spin, etc.
--------------------------------------------------------------------------------------------------------

-- class: Camera
-- param: x:num -> The center x position of the camera from left to right
-- param: y:num -> The center y position of the camera from top to bottom
-- param: zoom:num -> The zoom value of the camera which controls how close is the camera to the screen
-- A camera object to traverse the view of the scene following a specific object.
local Camera = class(function(self, x, y, zoom)
    self.centerx = x
    self.centery = y
    self.zoom = zoom
end)

-- setCenter: num, num -> None
-- Sets the center coordinates of the camera.
function Camera.setCenter(self, x, y)
    self.centerx = x
    self.centery = y
end

-- setZoom: num -> None
-- Sets the zoom of the camera.
function Camera.setZoom(self, zoom)
    self.zoom = zoom
end

-- draw: Sprite, num, num, num, num -> None
-- Draws a sprite in the camera's perspective.
function Camera.draw(self, sprite, x, y, sx, sy)
    if sx == nil then sx = 1 end
    if sy == nil then sy = 1 end

    local zoom = getScale()

    local newx = (x* self.zoom + (GAME_WIDTH/2) - self.centerx* self.zoom)
    local newy = (y* self.zoom + (GAME_HEIGHT/2) - self.centery* self.zoom)

    local newx, newy = getRelativeTransitionPos(newx, newy)
    sprite:draw(newx, newy, self.zoom * sx, self.zoom * sy)
end

return Camera