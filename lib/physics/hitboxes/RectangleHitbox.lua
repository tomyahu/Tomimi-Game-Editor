--------------------------------------------------------------------------------------------------------
RectangleHitbox = {};
RectangleHitbox.__index = RectangleHitbox

-- RectangleHitbox: RectangleHitbox
-- Creates a RectangleHitbox
function RectangleHitbox.new(x1, y1, x2, y2)
    local o = {};
    local self = setmetatable(o, RectangleHitbox)
    self.__index = self
    self.x1 = x1
    self.x2 = x2
    self.y1 = y1
    self.y2 = y2
    return self
end

function RectangleHitbox.checkCollision(self, hitbox)
    return hitbox:checkRectangleCollision(self)
end

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

function RectangleHitbox.movePosition(self, vx, vy)
    self.x1 = self.x1 + vx
    self.x2 = self.x2 + vx
    self.y1 = self.y1 + vy
    self.y2 = self.y2 + vy
end

function RectangleHitbox.setPosition(self, x1, y1)
    self.x2 = x1 + (self.x2 - self.x1)
    self.y2 = y1 + (self.y2 - self.y1)
    self.x1 = x1
    self.y1 = y1
end

function RectangleHitbox.getPosition(self)
    return self.x1, self.x2, self.y1, self.y2
end