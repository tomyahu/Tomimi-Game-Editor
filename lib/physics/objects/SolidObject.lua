require "lib.classes.class"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: SolidObject
-- param: hitboxes:array(Hitbox) -> the object set of hitboxes
-- An object composed of hitboxes to detect collisions between it and other objects of the same type
local SolidObject = class(function(self, hitboxes)
    self.hitboxes = hitboxes
    self.dt = 0.0000000000001
    self.x = 0
    self.y = 0
    self.vx = 0
    self.vy = 0
end)

-- registerObject: str -> None
-- Registers the object in the group given in the local context.
function SolidObject.registerObject(self, group)
    local local_context = application:getCurrentLocalContext()
    if local_context[group] == nil then
        local_context[group] = {}
    end
    table.insert(local_context[group], self)
    application:setLocalContext(local_context)
end

-- checkCollision: SolidObject -> bool
-- Returns true if the current object and the object given are colliding and false otherwise.
function SolidObject.checkCollision(self, object)
    local isColliding = false
    for _, hitbox1 in pairs(self.hitboxes) do
        for _, hitbox2 in pairs(object.hitboxes) do
            isColliding = isColliding or hitbox1:checkCollision(hitbox2)
        end
    end
    return isColliding
end

-- setDt: num -> None
-- sets the current frame dt for the game
function SolidObject.setDt(self, dt)
    self.vx = self.vx * self.dt / dt
    self.vy = self.vy * self.dt / dt
    self.dt = dt
end

-- isStill: None -> bool
-- Returns true if the object is not moving and false otherwise.
function SolidObject.isStill(self)
    return self.vx == 0 and self.vy == 0
end

-- setSpeed: num, num -> None
-- Sets the horizontal and vertical speed of the object.
function SolidObject.setSpeed(self, vx, vy)
    self.vx = vx
    self.vy = vy
end

-- getter
function SolidObject.getSpeed(self)
    return self.vx, self.vy
end

-- resetPreviousPos: None -> None
-- Moves the object in the oposite direction of it's speed and seets the speed to 0.
function SolidObject.resetPreviousPos(self)
    for _, hitbox1 in pairs(self.hitboxes) do
        hitbox1:movePosition(-self.vx, -self.vy)
    end
    self.x = self.x - self.vx
    self.y = self.y - self.vy

    self.vx = 0
    self.vy = 0
end

-- setPosition: num, num -> None
-- Sets the top left position of the object and all it's hitboxes relative to it.
function SolidObject.setPosition(self, x1, y1)
    for _, hitbox in pairs(self.hitboxes) do
        local hx1, _, hy1, _ = hitbox:getPosition()
        hitbox:setPosition(x1 + hx1 - self.x, y1 + hy1 - self.y)
    end
    self.x = x1
    self.y = y1
end

-- getter
function SolidObject.getPosition(self)
    return self.x, self.y
end

-- movePosition: None -> None
-- Makes the object advance towards its speed is telling.
function SolidObject.movePosition(self)
    for _, hitbox in pairs(self.hitboxes) do
        hitbox:movePosition(self.vx, self.vy)
    end
end

return SolidObject