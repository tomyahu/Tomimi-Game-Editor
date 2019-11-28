require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
local MenuBackgroundView = require("PauseMenu.view.menu_borders.MenuBackgroundView")
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: MenuBorderView
-- param: path:str -> The path of the image
local MenuBorderView = class(function(self, path, offset_x, offset_y, width, height, dimension)
    self.sprite = sprite_factory:getRegularRectSprite(path, dimension, dimension, 15)
    self.background_view = MenuBackgroundView.new(self.sprite, offset_x, offset_y, width, height, dimension)
    
    self.offset_x = offset_x
    self.offset_y = offset_y
    self.width = width
    self.height = height
    self.dimension = dimension
end)

-- draw: None -> None
-- Draws the full background image
function MenuBorderView.draw(self)
    -- background
    self.background_view:draw()

    -- top left
    self.sprite:setCurrentFrame(1)
    self.sprite:draw(getRelativePosX(self.offset_x), getRelativePosY(self.offset_y), getScale(), getScale())

    -- top right
    self.sprite:setCurrentFrame(2)
    self.sprite:draw(getRelativePosX(self.offset_x + self.dimension*self.width), getRelativePosY(self.offset_y), getScale(), getScale())

    -- bottom left
    self.sprite:setCurrentFrame(4)
    self.sprite:draw(getRelativePosX(self.offset_x), getRelativePosY(self.offset_y + self.dimension*self.height), getScale(), getScale())

    -- bottom right
    self.sprite:setCurrentFrame(3)
    self.sprite:draw(getRelativePosX(self.offset_x + self.dimension*self.width), getRelativePosY(self.offset_y + self.dimension*self.height), getScale(), getScale())

    -- horizontal borders
    self.sprite:setCurrentFrame(9)
    for i = 1, self.width-1 do
    self.sprite:draw(getRelativePosX(self.offset_x + self.dimension*i), getRelativePosY(self.offset_y), getScale(), getScale())
    self.sprite:draw(getRelativePosX(self.offset_x + self.dimension*i), getRelativePosY(self.offset_y + self.dimension*self.height), getScale(), getScale())
    end

    -- vertical borders
    self.sprite:setCurrentFrame(10)
    for i = 1, self.height-1 do
    self.sprite:draw(getRelativePosX(self.offset_x), getRelativePosY(self.offset_y + self.dimension*i), getScale(), getScale())
    self.sprite:draw(getRelativePosX(self.offset_x + self.dimension*self.width), getRelativePosY(self.offset_y + self.dimension*i), getScale(), getScale())
    end
end

-- getter
function MenuBorderView.getOffsetX(self)
  return self.offset_x
end

-- getter
function MenuBorderView.getOffsetY(self)
  return self.offset_y
end

-- getter
function MenuBorderView.getWidth(self)
  return self.width
end

-- getter
function MenuBorderView.getHeight(self)
  return self.height
end

-- getter
function MenuBorderView.getDimension(self)
  return self.dimension
end

return MenuBorderView