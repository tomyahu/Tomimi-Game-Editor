require "Global.application.application"
--------------------------------------------------------------------------------------------------------
SolidObject = {};
SolidObject.__index = SolidObject

-- SolidRectangleObject: SolidRectangleObject
-- Creates a SolidRectangleObject
function SolidObject.new(hitboxes)
    local o = {};
    local self = setmetatable(o, SolidObject)
    self.__index = self
    self.hitboxes = hitboxes
    self.x = 0
    self.y = 0
    self.vx = 0
    self.vy = 0
    return self
end

function SolidObject.registerObject(self, group)
    local local_context = application:getCurrentLocalContext()
    if local_context[group] == nil then
        local_context[group] = {}
    end
    table.insert(local_context[group], self)
    application:setLocalContext(local_context)
end

function SolidObject.checkCollision(self, object)
    local isColliding = false
    for _, hitbox1 in pairs(self.hitboxes) do
        for _, hitbox2 in pairs(object.hitboxes) do
            isColliding = isColliding or hitbox1:checkCollision(hitbox2)
        end
    end
    return isColliding
end

function SolidObject.isStill(self)
    return self.vx == 0 and self.vy == 0
end

function SolidObject.setSpeed(self, vx, vy)
    self.vx = vx
    self.vy = vy
end

function SolidObject.getSpeed(self)
    return self.vx, self.vy
end

function SolidObject.resetPreviousPos(self)
    for _, hitbox1 in pairs(self.hitboxes) do
        hitbox1:movePosition(-self.vx, -self.vy)
    end
    self.x = self.x - self.vx
    self.y = self.y - self.vy

    self.vx = 0
    self.vy = 0
end

function SolidObject.setPosition(self, x1, y1)
    for _, hitbox in pairs(self.hitboxes) do
        local hx1, _, hy1, _ = hitbox:getPosition()
        hitbox:setPosition(x1 + hx1 - self.x, y1 + hy1 - self.y)
    end
    self.x = x1
    self.y = y1
end

function SolidObject.getPosition(self)
    return self.x, self.y
end

function SolidObject.movePosition(self)
    for _, hitbox in pairs(self.hitboxes) do
        hitbox:movePosition(self.vx, self.vy)
    end
end