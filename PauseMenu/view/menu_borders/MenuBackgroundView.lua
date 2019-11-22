require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- class: MenuBackgroundView
-- param: path:str -> The path of the image
local MenuBackgroundView = class(function(self, sprite, offset_x, offset_y, width, height, dimension)
    self.sprite = sprite
    self.dimension = dimension
    
    self.offset_x = offset_x
    self.offset_y = offset_y
    self.width = width 
    self.height = height
end)

-- draw: None -> None
-- Draws the full background image
function MenuBackgroundView.draw(self)  
  self.sprite:setCurrentFrame(15)
  for i = 0, self.width-1 do
    for j = 0, self.height-1 do
      self.sprite:draw(getRelativePosX(self.offset_x + i*self.dimension), getRelativePosY(self.offset_y + j*self.dimension), getScale())
    end
  end
  
  self.sprite:setCurrentFrame(13)
  for i = 0, self.width-1 do
    for j = 1, self.height do
      self.sprite:draw(getRelativePosX(self.offset_x + i*self.dimension), getRelativePosY(self.offset_y + j*self.dimension), getScale())
    end
  end
  
  self.sprite:setCurrentFrame(14)
  for i = 1, self.width do
    for j = 0, self.height-1 do
      self.sprite:draw(getRelativePosX(self.offset_x + i*self.dimension), getRelativePosY(self.offset_y + j*self.dimension), getScale())
    end
  end
  
  self.sprite:setCurrentFrame(12)
  for i = 1, self.width do
    for j = 1, self.height do
      self.sprite:draw(getRelativePosX(self.offset_x + i*self.dimension), getRelativePosY(self.offset_y + j*self.dimension), getScale())
    end
  end
end

return MenuBackgroundView