--------------------------------------------------------------------------------------------------------
RectFrame = {};
RectFrame.__index = RectFrame

-- RectFrame: RectFrame
-- Creates a RectFrame
function RectFrame.new(x, y, width, height)
    local o = {};
    local self = setmetatable(o, RectFrame)
    self.__index = self
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    return self
end

function RectFrame.getX(self)
    return self.x
end

function RectFrame.getY(self)
    return self.y
end

function RectFrame.getWidth(self)
    return self.width
end

function RectFrame.getHeight(self)
    return self.height
end
