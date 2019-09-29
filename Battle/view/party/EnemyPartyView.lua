require "lib.classes.class"
local PartyView = require("Battle.view.party.PartyView")
--------------------------------------------------------------------------------------------------------

-- class: EnemyPartyView
-- param: entity_views:list(EntityView) -> A list of entity views
-- The view class of the party's entities
local EnemyPartyView = extend(PartyView,
function(self, entity_views)
    self.center_disengaged_position = {}
    self.center_disengaged_position.x = GAME_WIDTH - 40/800*GAME_WIDTH
    self.center_disengaged_position.y = 400/600*GAME_HEIGHT

    self.disengaged_position1 = {}
    self.disengaged_position1.x = GAME_WIDTH - 60/800*GAME_WIDTH
    self.disengaged_position1.y = 350/600*GAME_HEIGHT

    self.disengaged_position2 = {}
    self.disengaged_position2.x = GAME_WIDTH - 20/800*GAME_WIDTH
    self.disengaged_position2.y = 450/600*GAME_HEIGHT

    self.engaged_position = {}
    self.engaged_position.x = GAME_WIDTH - 490/800*GAME_WIDTH
    self.engaged_position.y = 400/600*GAME_HEIGHT
end,

function(entity_views)
    return PartyView.new(entity_views)
end)

return EnemyPartyView