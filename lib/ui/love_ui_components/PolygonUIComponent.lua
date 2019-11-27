require "lib.classes.class"
local LoveUIComponent = require("lib.ui.love_ui_components.LoveUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: PolygonUIComponent
-- param: mode:("fill" or "line") -> defines the way to define the polygon, "fill" fills the area and
--                                      "line" just draws the outline
-- param: x:num -> the offset x coordinate to move all vertices
-- param: y:num -> the offset y coordinate to move all vertices
-- param: color:{num, num, num, num} -> the color of the polygon
-- param: vertices:list(num) -> an array of intercalated x and y coordinates that represent the polygon's vertices
-- A wrapper of love's polygon drawable
local PolygonUIComponent = extend(LoveUIComponent, function(self, mode, x, y, color, vertices)
    local offset = {self.x, self.y}
    self.raw_vertices = vertices
    self.vertices = {}
    for i = 1,(# vertices) do
        table.insert(self.vertices, vertices[i] + offset[(i-1)%2 + 1])
    end
end)

-- draw: None -> None
-- Draws the polygon defined by the object's variables
function PolygonUIComponent.draw(self)
    LoveUIComponent.draw(self)
    love.graphics.polygon( self.mode, self.vertices )
end

-- getters
function PolygonUIComponent.getRawVertices(self)
    return self.raw_vertices
end

function PolygonUIComponent.getVertices(self)
    return self.vertices
end

-- setters
function PolygonUIComponent.setX(self, new_x)
    for i = 1,(# self.raw_vertices),2 do
        self.vertices[i] = self.raw_vertices[i] - self.x + new_x
    end
    self.x = new_x
end

function PolygonUIComponent.setY(self, new_y)
    for i = 2,(# self.raw_vertices),2 do
        self.vertices[i] = self.raw_vertices[i] - self.y + new_y
    end
    self.y = new_y
end

function PolygonUIComponent.setRawVertices(self, new_raw_vertices)
    self.raw_vertices = new_raw_vertices

    local offset = {self.x, self.y}
    self.vertices = {}
    for i = 1,(# self.raw_vertices) do
        table.insert(self.vertices, self.raw_vertices[i] + offset[(i-1)%2 + 1])
    end
end

return PolygonUIComponent