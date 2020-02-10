require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.fonts"
require "Battle.shaders"
require "Battle.consts"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
local EntityView = require("Battle.view.entity.EntityView")
--------------------------------------------------------------------------------------------------------


-- class: EntityView
-- param: entity:Entity -> The entity to visualize
-- Class made to generate the entity view
local EnemyEntityView = extend(EntityView, function(self, entity, default_x, default_y)
  self.guard_icon = SpriteFactory.getRegularRectSprite(BATTLE_GUARD_ICON, 32, 32, 1)
end,

function(entity, default_x, default_y)
  return EntityView.new(entity, default_x, default_y)
end)

-- draw: None -> None
-- Draws the enemy entity and their guard at their feet
function EnemyEntityView.draw(self)
  self.sprite:draw(getRelativePosX(self.current_x + self.sprite_width/2), getRelativePosY(self.current_y - self.sprite_height/2), -getScale(), getScale())

  self:drawGuard()
end

-- drawGuard: None -> None
-- Draws the guard meter on top of an enemy
function EnemyEntityView.drawGuard(self)
  local guard = self.entity:getCurrentGuard()

  self.guard_icon:draw(getRelativePosX(self.current_x - self.sprite_width/4 + 15), getRelativePosY(self.current_y + self.sprite_height*(1/2) - 4), getScale(), getScale())
  love.graphics.setFont(BATTLE_GUARD_FONT)
  love.graphics.setColor(51/255,77/255,96/255,1)
  love.graphics.printf(guard, getRelativePosX(self.current_x - self.sprite_width/2), getRelativePosY(self.current_y + self.sprite_height*(1/2) + 8), self.sprite_width, "center", 0, getScale(), getScale())
  love.graphics.setColor(1,1,1,1)
end


return EnemyEntityView
