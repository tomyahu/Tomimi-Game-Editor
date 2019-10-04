require "lib.classes.class"
require "Global.consts"
local EntityView = require("Battle.view.entity.EntityView")
--------------------------------------------------------------------------------------------------------

-- TODO: Create party object in model and pass it here instead of entities
-- class: PartyView
-- param: entity_views:list(EntityView) -> A list of entity views
-- The view class of the party's entities
local PartyView = class(function(self, entities)
    self.position1 = {}
    self.position1.x = 60/800*GAME_WIDTH
    self.position1.y = 350/600*GAME_HEIGHT

    self.position2 = {}
    self.position2.x = 40/800*GAME_WIDTH
    self.position2.y = 400/600*GAME_HEIGHT

    self.position3 = {}
    self.position3.x = 20/800*GAME_WIDTH
    self.position3.y = 450/600*GAME_HEIGHT

    local entity_number = (# entities)
    self.entity_views = {}

    if entity_number == 1 then
        table.insert(self.entity_views, EntityView.new(entities[1], self.position2.x, self.position2.y))
    elseif entity_number == 2 then
        table.insert(self.entity_views, EntityView.new(entities[1], self.position1.x, self.position1.y))
        table.insert(self.entity_views, EntityView.new(entities[2], self.position3.x, self.position3.y))
    elseif entity_number == 3 then
        table.insert(self.entity_views, EntityView.new(entities[1], self.position1.x, self.position1.y))
        table.insert(self.entity_views, EntityView.new(entities[2], self.position2.x, self.position2.y))
        table.insert(self.entity_views, EntityView.new(entities[3], self.position3.x, self.position3.y))
    else
        error("Party view declared with " .. entity_number .. " entities, can only be 1, 2 or 3")
    end
end)

-- draw: None -> None
-- Draws the entities of the party
function PartyView.draw(self)
    for entity_view in pairs(self.entity_views) do
        entity_view.draw()
    end
end

-- getter
function PartyView.getEntityViews(self)
    return self.entity_views
end

-- getEntityNumber: None -> num
-- Returns the entity number in the party
function PartyView.getEntityNumber(self)
    return (# self.entity_views)
end

-- getEntityPositions: None -> list(dict(x:int, y:int))
-- Returns the current position of the party entities
function PartyView.getEntityPositions(self)
    local entity_positions = {}
    for entity_view in pairs(self.entity_views) do
        table.insert(entity_positions, entity_view:getCurrentPosition())
    end
    return entity_positions
end

return PartyView