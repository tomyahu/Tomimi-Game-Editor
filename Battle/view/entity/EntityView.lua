require "lib.classes.class"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: EntityView
-- param: entity:Entity -> The entity to visualize
-- Class made to generate the entity view
local EntityView = class(function(self, entity)
    self.entity = entity
    self.sprite = sprite_factory:getRegularRectSprite(entity:getSpritePath(), 64, 64, 1)
end)

-- draw: int, int -> None
-- Draws the entity's sprite on the screen
function EntityView.draw(self, x, y)
    self.sprite:draw(x, y, 1, 1)
end

return EntityView