require "lib.classes.class"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: EntityView
-- param: entity:Entity -> The entity to visualize
-- Class made to generate the entity view
local EntityView = class(function(self, entity, default_x, default_y)
    self.default_x = default_x
    self.default_y = default_y

    self.current_x = default_x
    self.current_y = default_y
    self.entity = entity
    self.sprite = sprite_factory:getRegularRectSprite(entity:getSpritePath(), 64, 64, 1)
end)

-- draw: int, int -> None
-- Draws the entity's sprite on the screen
function EntityView.draw(self)
    self.sprite:draw(self.current_x, self.current_y, 1, 1)
end

-- getCurrentPosition: None -> dict(x:int, y:int)
-- Gets the entity position as integers
function EntityView.getCurrentPosition(self)
    local position = {}
    position.x = self.current_x
    position.y = self.current_y
    return position
end

return EntityView