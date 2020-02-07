require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.fonts"
require "Battle.shaders"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
local EntityView = require("Battle.view.entity.EntityView")
--------------------------------------------------------------------------------------------------------


-- class: EntityView
-- param: entity:Entity -> The entity to visualize
-- Class made to generate the entity view
local EnemyEntityView = extend(EntityView, function(self, entity, default_x, default_y)
  self.guard_canvas = love.graphics.newCanvas()
end,

function(entity, default_x, default_y)
  return EntityView.new(entity, default_x, default_y)
end)

function EnemyEntityView.draw(self)
  self.sprite:draw(getRelativePosX(self.current_x + self.sprite_width/2), getRelativePosY(self.current_y - self.sprite_height/2), -getScale(), getScale())

  self:drawGuard()
end

-- drawGuard: None -> None
-- Draws the guard meter on top of an enemy
function EnemyEntityView.drawGuard(self)
  local guard = self.entity:getCurrentGuard()

  local width = guard

  self.guard_canvas:renderTo(function()
    love.graphics.clear()
    love.graphics.setColor(1,1,1,1)
    love.graphics.setFont(BATTLE_GUARD_FONT)
    love.graphics.printf(guard, getRelativePosX(self.current_x - self.sprite_width/2), getRelativePosY(self.current_y + self.sprite_height*(1/2) + 2), self.sprite_width, "center")
  end)

  love.graphics.setShader(OUTLINE_SHADER)
  OUTLINE_SHADER:send("outline_color", {0,0,0,1})
  OUTLINE_SHADER:send("outline_size", 2)

  love.graphics.draw(self.guard_canvas, 0, 0)

  love.graphics.setShader()
end


return EnemyEntityView
