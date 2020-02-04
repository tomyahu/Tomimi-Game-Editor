require "lib.classes.class"
require "Global.consts"
require "Battle.shaders"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: PartyStats
-- param: entities:list(Entity) -> a list of entities to display stats
local PartyStats = class(function(self, entities)
    self.hp_color = {0.3,0.5,0.1,1}
    self.mp_color = {0.1,0.4,1.0,1}
    self.sta_color = {0.5,0.4,0.05,1}

    local portrait_background_path = RESOURCES_PATH .. "/Battle/Miscelaneous/PortraitContainers/PortraitStatContainer.png"
    self.entity_portrait_background = sprite_factory:getRegularRectSprite(portrait_background_path, 128, 96, 1)
    self.entities = entities
    self.entities_portraits = {}
    for _, entity in pairs(self.entities) do
        local portrait_path = entity:getSpriteFolderPath() .. "portrait.png"
        table.insert(self.entities_portraits, sprite_factory:getRegularRectSprite(portrait_path, 128, 128, 1))
    end

    self.space_x = 102
    self.space_x_portraits = 10
    self.space_y = 15
    self.space_between_y = 30
end)

-- draw: None -> None
-- draws the party stats on the screen
function PartyStats.draw(self)
    local initial_offset_y = 160
    local offset_y = initial_offset_y
    for i = 1, (# self.entities) do
        -- Draw Stats
        local entity = self.entities[i]
        self:drawEntityStats(entity, offset_y)

        -- Draw Portraits
        self.entity_portrait_background:draw(getRelativePosX(0), getRelativePosY(offset_y - 2*self.space_y), getScale(), getScale())
        self.entities_portraits[i]:draw(getRelativePosX(self.space_x_portraits), getRelativePosY(offset_y - 1.3*self.space_y), self.space_y / 15 * getScale(), self.space_y / 15 * getScale())


        offset_y = offset_y + 3*self.space_y + self.space_between_y
    end
end

-- drawEntityStats: Entity, int -> None
-- draws the entity stats
function PartyStats.drawEntityStats(self, entity, offset_y)
    local hp = entity:getHp()
    local mp = entity:getMp()
    local stamina = entity:getStamina()

    -- create shader for stat bars
    love.graphics.setShader(STAT_BAR_SHADER)
    local screen = {love.graphics.getWidth( ), love.graphics.getHeight( ) }
    local canvas = love.graphics.newCanvas( getScale(), (self.space_y)*getScale() )

    -- Draw Hp
    local width = hp*10

    love.graphics.setColor(self.hp_color)
    love.graphics.draw(canvas, getRelativePosX(self.space_x), getRelativePosY(offset_y), 0, width, 1)

    -- Draw Mp
    offset_y = offset_y + self.space_y
    local width = mp*10

    love.graphics.setColor(self.mp_color)
    love.graphics.draw(canvas, getRelativePosX(self.space_x), getRelativePosY(offset_y), 0, width, 1)

    -- Draw Stamina
    offset_y = offset_y + self.space_y
    local width = stamina*10

    love.graphics.setColor(self.sta_color)
    love.graphics.draw(canvas, getRelativePosX(self.space_x), getRelativePosY(offset_y), 0, width, 1)

    love.graphics.setColor(1,1,1,1)
    love.graphics.setShader()
end

return PartyStats