require "lib.classes.class"
require "Global.consts"
require "Battle.shaders"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- class: PartyStats
-- param: entities:list(Entity) -> a list of entities to display stats
local PartyStats = class(function(self, entities)
    self.hp_color = {0.3,0.5,0.1,1}
    self.mp_color = {0.1,0.4,1.0,1}
    self.guard_color = {0.5,0.5,0.5,1}

    self.max_hp_color = {0.2,0.3,0.06,0.8}
    self.max_mp_color = {0.08,0.25,0.35,0.8}
    self.max_guard_color = {0.25,0.25,0.25,0.8}

    self.hp_text_color = {0.15,0.3,0.03,1}
    self.mp_text_color = {0.02,0.15,0.6,1}
    self.guard_text_color = {0.25,0.25,0.25,1}

    self.bar_max_width = 150

    local portrait_background_path = RESOURCES_PATH .. "/Battle/Miscelaneous/PortraitContainers/PortraitStatContainer.png"
    self.entity_portrait_background = SpriteFactory.getRegularRectSprite(portrait_background_path, 200, 100, 1)
    self.entities = entities
    self.entities_portraits = {}
    for _, entity in pairs(self.entities) do
        local portrait_path = entity:getSpriteFolderPath() .. "portrait.png"
        table.insert(self.entities_portraits, SpriteFactory.getRegularRectSprite(portrait_path, 80, 80, 1))
    end

    self.initial_offset_y = 150
    self.initial_offset_x = 0

    self.offset_x_stat_bars = 132
    self.offset_y_stat_bars = 36
    self.offset_x_portraits = 10
    self.offset_y_portraits = 16

    self.space_y_portrait_containers = 100
    self.space_y = 19

    self.canvas = love.graphics.newCanvas( getScale(), 18*getScale())
    self.aux_canvas = love.graphics.newCanvas()
end)

-- draw: None -> None
-- draws the party stats on the screen
function PartyStats.draw(self)
    local initial_offset_y = self.initial_offset_y
    local offset_y = initial_offset_y


    for i = 1, (# self.entities) do
        -- Draw Stats
        local entity = self.entities[i]
        self:drawEntityStats(entity, offset_y + self.offset_y_stat_bars)

        -- Draw Portraits
        self.entity_portrait_background:draw(getRelativePosX(0), getRelativePosY(offset_y), getScale(), getScale())
        self.entities_portraits[i]:draw(getRelativePosX(self.offset_x_portraits), getRelativePosY(offset_y + self.offset_y_portraits), getScale(), getScale())

        offset_y = offset_y + self.space_y_portrait_containers
    end
end

-- drawEntityStats: Entity, int -> None
-- draws the entity stats (stat bars and numbers)
function PartyStats.drawEntityStats(self, entity, offset_y)
    self:drawStatBars(entity, offset_y)
    self:drawStatText(entity, offset_y)
end

-- drawStatBars: Entity, int -> None
-- draws the entity's hp, max hp, mp, max mp, guard and max guard as bars next to the portrait container
function PartyStats.drawStatBars(self, entity, offset_y)
    local hp = entity:getHp()
    local mp = entity:getMp()
    local guard = entity:getCurrentGuard()

    local max_hp = entity:getMaxHp()
    local max_mp = entity:getMaxMp()
    local max_guard = entity:getMaxGuard()

    -- create shader for stat bars
    love.graphics.setShader(STAT_BAR_SHADER)

    -- Draw Bars
    -- Draw Hp
    local width = self.bar_max_width

    love.graphics.setColor(self.max_hp_color)
    love.graphics.draw(self.canvas, getRelativePosX(self.offset_x_stat_bars), getRelativePosY(offset_y), 0, width, 1)

    width = hp/max_hp*self.bar_max_width
    love.graphics.setColor(self.hp_color)
    love.graphics.draw(self.canvas, getRelativePosX(self.offset_x_stat_bars), getRelativePosY(offset_y), 0, width, 1)

    -- Draw Mp
    offset_y = offset_y + self.space_y

    width = self.bar_max_width
    love.graphics.setColor(self.max_mp_color)
    love.graphics.draw(self.canvas, getRelativePosX(self.offset_x_stat_bars), getRelativePosY(offset_y), 0, width, 1)

    width = mp/max_mp*self.bar_max_width
    love.graphics.setColor(self.mp_color)
    love.graphics.draw(self.canvas, getRelativePosX(self.offset_x_stat_bars), getRelativePosY(offset_y), 0, width, 1)

    -- Draw Guard
    offset_y = offset_y + self.space_y

    width = self.bar_max_width
    love.graphics.setColor(self.max_guard_color)
    love.graphics.draw(self.canvas, getRelativePosX(self.offset_x_stat_bars), getRelativePosY(offset_y), 0, width, 1)

    width = guard/max_guard*self.bar_max_width
    love.graphics.setColor(self.guard_color)
    love.graphics.draw(self.canvas, getRelativePosX(self.offset_x_stat_bars), getRelativePosY(offset_y), 0, width, 1)

    love.graphics.setColor(1,1,1,1)
    love.graphics.setShader()
end

-- drawStatBars: Entity, int -> None
-- draws the entity's hp, max hp, mp, max mp, guard and max guard as text next to the portrait container
function PartyStats.drawStatText(self, entity, offset_y)
    local hp = entity:getHp()
    local mp = entity:getMp()
    local guard = entity:getCurrentGuard()

    local max_hp = entity:getMaxHp()
    local max_mp = entity:getMaxMp()
    local max_guard = entity:getMaxGuard()

    local draw_x = self.offset_x_stat_bars + 3
    offset_y = offset_y + 2

    self.aux_canvas:renderTo(function()
        love.graphics.clear()

        -- Set font
        love.graphics.setFont(BATTLE_STATBAR_FONT)

        -- Draw Hp
        love.graphics.setColor(self.hp_text_color)
        love.graphics.printf(hp .. "/" .. max_hp, getRelativePosX(draw_x), getRelativePosY(offset_y), 100*getScale(), "left", 0, getScale())

        -- Draw Mp
        offset_y = offset_y + self.space_y
        love.graphics.setColor(self.mp_text_color)
        love.graphics.printf(mp .. "/" .. max_mp, getRelativePosX(draw_x), getRelativePosY(offset_y), 100*getScale(), "left", 0, getScale())

        -- Draw Guard
        offset_y = offset_y + self.space_y
        love.graphics.setColor(self.guard_text_color)
        love.graphics.printf(guard .. "/" .. max_guard, getRelativePosX(draw_x), getRelativePosY(offset_y), 100*getScale(), "left", 0, getScale())
        love.graphics.setColor(1,1,1,1)

        love.graphics.setShader()
    end)

    love.graphics.draw(self.aux_canvas, 0, 0)


end

return PartyStats