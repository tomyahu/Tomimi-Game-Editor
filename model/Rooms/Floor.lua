require "class"
--------------------------------------------------------------------------------------------------------
-- Floor: None -> Floor
-- Creates a new floor
Floor = class(function(fl, path)
    fl.image = love.graphics.newImage(path)
end)

-- draw: None -> None
-- Dibuja el piso actual
function Floor:draw()
    love.graphics.draw(self.image)
end

