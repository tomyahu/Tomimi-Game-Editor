require "class"
--------------------------------------------------------------------------------------------------------
-- Floor: Floor str -> Floor
-- Creates a new floor
Floor = class(function(fl, path)
    fl.image = love.graphics.newImage(path)
end)

-- draw: None -> None
-- Dibuja el piso actual
function Floor:draw()
    love.graphics.draw(self.image)
end

--------------------------------------------------------------------------------------------------------
-- NullFloor: None -> Floor
-- Creates a new floor
NullFloor = class(Floor, function(fl)
    Floor.init("")
    fl.image = nil
end)

-- draw: None -> None
-- No dibuja nada
function Floor:draw()
end

