require "lib.classes.class"
require "Global.consts"
require "Global.application.application"
require "Global.LOVEWrapper.LOVEWrapper"
require "Battle.shaders"
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
    self.sprite = sprite_factory:getRegularRectSprite(entity:getSpritePath(), 128, 128, 1)
end)

-- draw: int, int -> None
-- Draws the entity's sprite on the screen
function EntityView.draw(self)
    local ctrl = application:getCurrentCtrl()
    local turn_manager = ctrl:getTurnManager()


    local draw_x = self.current_x
    if turn_manager:getCurrentTurn():getEntity() == self.entity then
        draw_x = draw_x + 10
        local canvas = love.graphics.newCanvas(WINDOW_WIDTH, WINDOW_HEIGHT)

        love.graphics.setCanvas(canvas)
            self.sprite:draw(getRelativePosX(draw_x), getRelativePosY(self.current_y), getScale(), getScale())
        love.graphics.setCanvas()

        love.graphics.setShader(OUTLINE_SHADER)
            OUTLINE_SHADER:send("outline_color", {1,1,1,1})
            OUTLINE_SHADER:send("outline_size", getScale()*4/GAME_WIDTH)

            love.graphics.draw(canvas, 0, 0)
        love.graphics.setShader()
    else
        self.sprite:draw(getRelativePosX(draw_x), getRelativePosY(self.current_y), getScale(), getScale())
    end

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