require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"

local View = require "Global.view.view"
local entity_factory = require("Battle.init.entity_factory")

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
    self.background_view = BackGroundView.new(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")
end

-- setup: None -> None
-- Tears up the local view vairables and cleans the contexts used
function BattleView.stop(self)
end

function BattleView.setPlayerParty(self, party)
  self.party_view = PartyView.new(party)
end

function BattleView.setEnemyParty(self, party)
  self.enemy_party_view = EnemyPartyView.new(party)
end

-- getter
function BattleView.getPlayerPartyView(self)
    return self.party_view
end

-- getter
function BattleView.getEnemyPartyView(self)
    return self.enemy_party_view
end

return BattleView