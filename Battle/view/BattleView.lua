require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"

local View = require "Global.view.view"
local entity_factory = require("Battle.init.entity_factory")

local BackGroundView = require("Battle.view.background.BackgroundView")
local EntityView = require("Battle.view.entity.EntityView")
local EnemyPartyView = require("Battle.view.party.EnemyPartyView")
local PartyView = require("Battle.view.party.PartyView")

-------------------------------------------------------------------------------------------------------

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self)
    self.party_view = nil
    self.enemy_party_view = nil
    self.background_view = nil

    self.hero_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Party/MAC_IDLE.png")
    self.enemy_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Enemies/none.png")
    self.background_image = love.graphics.newImage(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")
end,

function()
    return View.new()
end)

-- draw: context -> None
-- Draws the current scene
function BattleView.draw(self)
    love.graphics.draw(self.background_image)
end

function BattleView.setup(self)
    local party = {}
    local party_entity1 = entity_factory:getEntity("Naranjarina")
    local party_entity2 = entity_factory:getEntity("Naranjarina")
    table.insert(party, EntityView.new(party_entity1))
    table.insert(party, EntityView.new(party_entity2))

    local enemy_party = {}
    local enemy_party_entity1 = entity_factory:getEntity("None")
    local enemy_party_entity2 = entity_factory:getEntity("None")
    table.insert(enemy_party, EntityView.new(enemy_party_entity1))
    table.insert(enemy_party, EntityView.new(enemy_party_entity2))

    self.party_view = PartyView.new(party)
    self.enemy_party_view = EnemyPartyView.new(enemy_party)
    self.background_view = BackGroundView.new(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")
end

function BattleView.stop(self)
end

return BattleView