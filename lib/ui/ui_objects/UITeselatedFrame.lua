require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local UIObject = require("lib.ui.ui_objects.UIObject")
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- class: UITeselatedFrame
-- param: x:num -> the x coordinate of the top left border tile of the frame
-- param: y:num -> the y coordinate of the top left border tile of the frame
-- param: image_path:str -> the path of the frame tileset
-- param: width:int(1,) -> the number of cells wide the frame is
-- param: height:int(1,) -> the number of cells tall the frame is
-- param: dimension:int(1,) -> the number of pixels each cell in the image is
-- A teselated Frame created from an image with 15 square cells where the first 11 are in the form of
--      [╔╗╝╚╠╣╩╦═║╬] and the last 4 are the top left, top right, bottom left and bottom right parts of a background tile
local UITeselatedFrame = extend(UIObject, function(self, x, y, image_path, width, height, dimension)
    self.image_path = image_path
    self.sprite = SpriteFactory.getRegularRectSprite(image_path, dimension, dimension, 15)
    self.width = width
    self.height = height
    self.dimension = dimension
    self.canvas = love.graphics.newCanvas()
    self.canvas:renderTo(function()
        self:drawBackground()
        self:drawBorders()
    end)
end)

-- draw: None -> None
-- draws the background and borders of the frame
function UITeselatedFrame.draw(self)
    love.graphics.draw(self.canvas)
end

-- drawBorders: None -> None
-- draws the border tiles of the frame
function UITeselatedFrame.drawBorders(self)
    -- top left
    self.sprite:setCurrentFrame(1)
    self.sprite:draw(getRelativePosX(self.x), getRelativePosY(self.y), getScale(), getScale())

    -- top right
    self.sprite:setCurrentFrame(2)
    self.sprite:draw(getRelativePosX(self.x + self.dimension*self.width), getRelativePosY(self.y), getScale(), getScale())

    -- bottom left
    self.sprite:setCurrentFrame(4)
    self.sprite:draw(getRelativePosX(self.x), getRelativePosY(self.y + self.dimension*self.height), getScale(), getScale())

    -- bottom right
    self.sprite:setCurrentFrame(3)
    self.sprite:draw(getRelativePosX(self.x + self.dimension*self.width), getRelativePosY(self.y + self.dimension*self.height), getScale(), getScale())

    -- horizontal borders
    self.sprite:setCurrentFrame(9)
    for i = 1, self.width-1 do
        self.sprite:draw(getRelativePosX(self.x + self.dimension*i), getRelativePosY(self.y), getScale(), getScale())
        self.sprite:draw(getRelativePosX(self.x + self.dimension*i), getRelativePosY(self.y + self.dimension*self.height), getScale(), getScale())
    end

    -- vertical borders
    self.sprite:setCurrentFrame(10)
    for i = 1, self.height-1 do
        self.sprite:draw(getRelativePosX(self.x), getRelativePosY(self.y + self.dimension*i), getScale(), getScale())
        self.sprite:draw(getRelativePosX(self.x + self.dimension*self.width), getRelativePosY(self.y + self.dimension*i), getScale(), getScale())
    end
end

-- drawBorders: None -> None
-- draws the background tiles of the frame
function UITeselatedFrame.drawBackground(self)
    self.sprite:setCurrentFrame(15)
    for i = 0, self.width-1 do
        for j = 0, self.height-1 do
            self.sprite:draw(getRelativePosX(self.x + i*self.dimension), getRelativePosY(self.y + j*self.dimension), getScale())
        end
    end

    self.sprite:setCurrentFrame(13)
    for i = 0, self.width-1 do
        for j = 1, self.height do
            self.sprite:draw(getRelativePosX(self.x + i*self.dimension), getRelativePosY(self.y + j*self.dimension), getScale())
        end
    end

    self.sprite:setCurrentFrame(14)
    for i = 1, self.width do
        for j = 0, self.height-1 do
            self.sprite:draw(getRelativePosX(self.x + i*self.dimension), getRelativePosY(self.y + j*self.dimension), getScale())
        end
    end

    self.sprite:setCurrentFrame(12)
    for i = 1, self.width do
        for j = 1, self.height do
            self.sprite:draw(getRelativePosX(self.x + i*self.dimension), getRelativePosY(self.y + j*self.dimension), getScale())
        end
    end
end

-- getters
function UITeselatedFrame.getWidth(self)
    return self.width
end

function UITeselatedFrame.getHeight(self)
    return self.height
end

function UITeselatedFrame.getDimension(self)
    return self.dimension
end

function UITeselatedFrame.getSprite(self)
    return self.sprite
end

function UITeselatedFrame.getImagePath(self)
    return self.image_path
end

-- setters
function UITeselatedFrame.setX(self, new_x)
    UIObject.setX(self, new_x)
    self:redefineCanvas()
end

function UITeselatedFrame.setY(self, new_y)
    UIObject.setX(self, new_x)
    self:redefineCanvas()
end

function UITeselatedFrame.setWidth(self, new_width)
    self.width = new_width
    self:redefineCanvas()
end

function UITeselatedFrame.setHeight(self, new_height)
    self.height = new_height
    self:redefineCanvas()
end

function UITeselatedFrame.setDimension(self, new_dimension)
    self.dimension = new_dimension
    self:redefineCanvas()
end

function UITeselatedFrame.setImagePath(self, new_image_path)
    self.image_path = new_image_path
    self.sprite = SpriteFactory.getRegularRectSprite(self.image_path, self.dimension, self.dimension, 15)
    self:redefineCanvas()
end

-- redefineCanvas: None -> None
-- redefines the contents of the canvas
function UITeselatedFrame.redefineCanvas(self)
    self.canvas = love.graphics.newCanvas()
    self.canvas:renderTo(function()
        self:drawBackground()
        self:drawBorders()
    end)
end

return UITeselatedFrame