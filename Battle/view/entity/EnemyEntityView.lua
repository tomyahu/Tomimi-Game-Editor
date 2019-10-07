require "lib.classes.class"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
local EntityView = require("Battle.view.entity.EntityView")
--------------------------------------------------------------------------------------------------------


-- class: EntityView
-- param: entity:Entity -> The entity to visualize
-- Class made to generate the entity view
local EnemyEntityView = extend(EntityView,
function(self, entity, default_x, default_y)
end,

function(entity, default_x, default_y)
  return EntityView.new(entity, default_x, default_y)
end)

function EnemyEntityView.draw(self)
  self.sprite:draw(self.current_x, self.current_y, -1, 1)
end

return EnemyEntityView
