require "lib.classes.class"
require "Global.consts"
local EntityView = require("Battle.view.entity.EntityView")
local PartyStats = require("Battle.view.party.party_stats.PartyStats")
--------------------------------------------------------------------------------------------------------

-- class: PartyView
-- param: party:Party -> The player party
-- The view class of the party's entities
local PartyView = class(function(self, party)
    self.party = party

    self.party_stats = PartyStats.new(party:getMembers())

    self.position1 = {}
    self.position1.x = 124/800*GAME_WIDTH
    self.position1.y = 414/600*GAME_HEIGHT

    self.position2 = {}
    self.position2.x = 164/800*GAME_WIDTH
    self.position2.y = 464/600*GAME_HEIGHT

    self.position3 = {}
    self.position3.x = 84/800*GAME_WIDTH
    self.position3.y = 514/600*GAME_HEIGHT

    local entity_number = party:getMemberNum()
    self.entity_views = {}

    if (entity_number < 1) or (entity_number > 3) then
        error("Party view declared with " .. entity_number .. " entities, can only be 1, 2 or 3")
    end

    if not (party:getMember(1) == nil) then
        self.entity_views[1] = EntityView.new(party:getMember(1), self.position1.x, self.position1.y)
    end
    if not (party:getMember(2) == nil) then
        self.entity_views[2] = EntityView.new(party:getMember(2), self.position2.x, self.position2.y)
    end
    if not (party:getMember(3) == nil) then
        self.entity_views[3] = EntityView.new(party:getMember(3), self.position3.x, self.position3.y)
    end
end)

-- draw: None -> None
-- Draws the entities of the party
function PartyView.draw(self)
    self.party_stats:draw()

    self:drawEntities()
end

-- drawEntities: None -> None
-- Draws the entities in the battle
function PartyView.drawEntities(self)
    for _, entity_view in pairs(self.entity_views) do
        entity_view:draw()
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
    for index, entity_view in pairs(self.entity_views) do
        entity_positions[index] = entity_view:getCurrentPosition()
    end
    return entity_positions
end

return PartyView