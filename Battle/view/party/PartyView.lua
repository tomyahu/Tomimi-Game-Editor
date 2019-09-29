require "lib.classes.class"
require "Global.consts"
--------------------------------------------------------------------------------------------------------

-- class: PartyView
-- param: entity_views:list(EntityView) -> A list of entity views
-- The view class of the party's entities
local PartyView = class(function(self, entity_views)
    self.entity_views = entity_views

    self.center_disengaged_position = {}
    self.center_disengaged_position.x = 40/800*GAME_WIDTH
    self.center_disengaged_position.y = 400/600*GAME_HEIGHT

    self.disengaged_position1 = {}
    self.disengaged_position1.x = 60/800*GAME_WIDTH
    self.disengaged_position1.y = 350/600*GAME_HEIGHT

    self.disengaged_position2 = {}
    self.disengaged_position2.x = 20/800*GAME_WIDTH
    self.disengaged_position2.y = 450/600*GAME_HEIGHT

    self.engaged_position = {}
    self.engaged_position.x = 310/800*GAME_WIDTH
    self.engaged_position.y = 400/600*GAME_HEIGHT
end)

return PartyView