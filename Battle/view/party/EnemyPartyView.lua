require "lib.classes.class"
local PartyView = require("Battle.view.party.PartyView")
local EnemyEntityView = require("Battle.view.entity.EnemyEntityView")
--------------------------------------------------------------------------------------------------------

-- class: EnemyPartyView
-- param: entity_views:list(EntityView) -> A list of entity views
-- The view class of the party's entities
local EnemyPartyView = extend(PartyView,
function(self, party)
    self.position1 = {}
    self.position1.x = GAME_WIDTH - 60/800*GAME_WIDTH
    self.position1.y = 350/600*GAME_HEIGHT

    self.position2 = {}
    self.position2.x = GAME_WIDTH - 100/800*GAME_WIDTH
    self.position2.y = 400/600*GAME_HEIGHT

    self.position3 = {}
    self.position3.x = GAME_WIDTH - 20/800*GAME_WIDTH
    self.position3.y = 450/600*GAME_HEIGHT

    local entity_number = party:getMemberNum()
    self.entity_views = {}

    if (entity_number < 1) or (entity_number > 3) then
        error("Party view declared with " .. entity_number .. " entities, can only be 1, 2 or 3")
    end

    if not (party:getMember(1) == nil) then
        self.entity_views[1] = EnemyEntityView.new(party:getMember(1), self.position1.x, self.position1.y)
    end
    if not (party:getMember(2) == nil) then
        self.entity_views[2] = EnemyEntityView.new(party:getMember(2), self.position2.x, self.position2.y)
    end
    if not (party:getMember(3) == nil) then
        self.entity_views[3] = EnemyEntityView.new(party:getMember(3), self.position3.x, self.position3.y)
    end
end,

function(party)
    return PartyView.new(party)
end)

return EnemyPartyView