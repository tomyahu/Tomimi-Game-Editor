require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: PartyStats
-- param: entities:list(Entity) -> a list of entities to display stats
local PartyStats = class(function(self, entities)
    self.hp_color = {0,1,0,1}
    self.mp_color = {0,0,1,1}
    self.sta_color = {1,1,0,1}

    self.entities = entities

    self.space_x = 96
    self.space_y = 15
    self.space_between_y = 30
end)

-- draw: None -> None
-- draws the party stats on the screen
function PartyStats.draw(self)
    local initial_offset_y = 160
    local offset_y = initial_offset_y
    for _, entity in pairs(self.entities) do
        self:drawEntityStats(entity, offset_y)
        offset_y = offset_y + 3*self.space_y + self.space_between_y
    end
end

-- drawEntityStats: Entity, int -> None
-- draws the entity stats
function PartyStats.drawEntityStats(self, entity, offset_y)
    local hp = entity:getHp()
    local mp = entity:getMp()
    local stamina = entity:getStamina()


    -- Draw Hp
    local width = hp*10
    love.graphics.setColor(self.hp_color)
    love.graphics.rectangle("fill", getRelativePosX(self.space_x), getRelativePosY(offset_y), width*getScale(), self.space_y*getScale())

    -- Draw Mp
    local width = mp*10
    love.graphics.setColor(self.mp_color)
    love.graphics.rectangle("fill", getRelativePosX(self.space_x), getRelativePosY(offset_y + self.space_y), width*getScale(), self.space_y*getScale())

    -- Draw Mp
    local width = stamina*10
    love.graphics.setColor(self.sta_color)
    love.graphics.rectangle("fill", getRelativePosX(self.space_x), getRelativePosY(offset_y + self.space_y*2), width*getScale(), self.space_y*getScale())
    love.graphics.setColor(1,1,1,1)
end

return PartyStats