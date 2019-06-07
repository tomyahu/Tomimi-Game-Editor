require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: RectangleHitbox
-- param: x1:int -> the x coordinate top left corner of the hitbox
-- param: y1:int -> the y coordinate top left corner of the hitbox
-- param: x2:int -> the x coordinate bottom right corner of the hitbox
-- param: y2:int -> the y coordinate bottom right corner of the hitbox
local RectangleHitbox = class(function(self, x1, y1, x2, y2)
    self.x1 = x1
    self.x2 = x2
    self.y1 = y1
    self.y2 = y2
end)

-- checkCollission: Hitbox -> bool
-- Checks if there's a collision between this hitbox and a hitbox passed.
-- Uses Double Dispatch
function RectangleHitbox.checkCollision(self, hitbox)
    return hitbox:checkRectangleCollision(self)
end

-- checkRectangleCollision: RectangleHitbox -> bool
-- Checks if the current hitbox is colliding with a RectangleHitbox Hitbox.
function RectangleHitbox.checkRectangleCollision(self, hitbox)
    local hx1 = hitbox.x1
    local hx2 = hitbox.x2
    local hy1 = hitbox.y1
    local hy2 = hitbox.y2

    local condition1 = self.x2 > hx1
    local condition2 = self.x1 < hx2
    local condition3 = self.y2 > hy1
    local condition4 = self.y1 < hy2

    return condition1 and condition2 and condition3 and condition4
end

-- movePosition: num, num -> None
-- Moves the hitbox dx in x and dy in y relative to it's current position.
function RectangleHitbox.movePosition(self, dx, dy)
    self.x1 = self.x1 + dx
    self.x2 = self.x2 + dx
    self.y1 = self.y1 + dy
    self.y2 = self.y2 + dy
end

-- setPosition: num, num -> None
-- Sets the hitbox's current position relative to it's top left corner.
function RectangleHitbox.setPosition(self, x1, y1)
    self.x2 = x1 + (self.x2 - self.x1)
    self.y2 = y1 + (self.y2 - self.y1)
    self.x1 = x1
    self.y1 = y1
end

-- getPosition: None -> num, num, num, num
-- Returns the current x and y coordinates of the top left corner followed by the x and y coordinates of the bottom
-- right corner.
function RectangleHitbox.getPosition(self)
    return self.x1, self.x2, self.y1, self.y2
end

return RectangleHitbox