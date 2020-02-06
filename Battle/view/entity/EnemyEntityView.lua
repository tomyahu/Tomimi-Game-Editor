require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
local EntityView = require("Battle.view.entity.EntityView")
--------------------------------------------------------------------------------------------------------


-- class: EntityView
-- param: entity:Entity -> The entity to visualize
-- Class made to generate the entity view
local EnemyEntityView = extend(EntityView, function(self, entity, default_x, default_y)
end,

function(entity, default_x, default_y)
  return EntityView.new(entity, default_x, default_y)
end)

function EnemyEntityView.draw(self)
  self.sprite:draw(getRelativePosX(self.current_x + self.sprite_width/2), getRelativePosY(self.current_y - self.sprite_height/2), -getScale(), getScale())
end

return EnemyEntityView
