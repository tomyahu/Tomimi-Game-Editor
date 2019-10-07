require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"

local View = require "Global.view.view"
local entity_factory = require("Battle.init.entity_factory")
local Party = require("Battle.model.party.Party")

local BackGroundView = require("Battle.view.background.BackgroundView")
local PartyView = require("Battle.view.party.PartyView")
local EnemyPartyView = require("Battle.view.party.EnemyPartyView")

-------------------------------------------------------------------------------------------------------

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self)
    self.party_view = nil
    self.enemy_party_view = nil
    self.background_view = nil
end,

function()
    return View.new()
end)

-- draw: context -> None
-- Draws the current scene
function BattleView.draw(self)
    self.background_view:draw()
    self.party_view:draw()
    self.enemy_party_view:draw()
end

-- setup: None -> None
-- Sets up the local view vairables
function BattleView.setup(self)
    -- TODO: Move this to controller
    local party = {}
    local party_entity1 = entity_factory:getEntity("Naranjarina")
    local party_entity2 = entity_factory:getEntity("Naranjarina")
    party[1] = party_entity1
    party[3] = party_entity2

    local enemy_party = {}
    local enemy_party_entity1 = entity_factory:getEntity("None")
    local enemy_party_entity2 = entity_factory:getEntity("None")
    table.insert(enemy_party, enemy_party_entity1)
    table.insert(enemy_party, enemy_party_entity2)

    self.party_view = PartyView.new(Party.new(party, 3))
    self.enemy_party_view = EnemyPartyView.new(Party.new(enemy_party, 3))
    self.background_view = BackGroundView.new(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")
end

-- setup: None -> None
-- Tears up the local view vairables and cleans the contexts used
function BattleView.stop(self)
end

-- getter
function BattleView.getPartyView(self)
    return self.party_view
end

-- getter
function BattleView.getEnemyPartyView(self)
    return self.enemy_party_view
end

return BattleView