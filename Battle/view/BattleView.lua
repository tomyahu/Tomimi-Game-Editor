require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"

local View = require "Global.view.view"
local Party = require("Battle.model.party.Party")
local BackGroundView = require("Battle.view.background.BackgroundView")
local PartyView = require("Battle.view.party.PartyView")
local EnemyPartyView = require("Battle.view.party.EnemyPartyView")
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")

local MenuFactory = require("Battle.view.menues.MenuFactory")
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self, menu_sprite_sheet_path, font)
    self.party_view = nil
    self.enemy_party_view = nil
    self.background_view = nil

    local menu_factory = MenuFactory.new(menu_sprite_sheet_path, font)
    self.menu_view = menu_factory:getBasicMenu(nil, 220, 380)
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
    self.menu_view:draw()
end

-- setup: None -> None
-- Sets up the local view vairables
function BattleView.setup(self)
end

-- setup: None -> None
-- Tears up the local view vairables and cleans the contexts used
function BattleView.stop(self)
end

-- TODO: Document this methods
function BattleView.setPlayerParty(self, party)
  self.party_view = PartyView.new(party)
end

function BattleView.setEnemyParty(self, party)
  self.enemy_party_view = EnemyPartyView.new(party)
end

function BattleView.setBackground(self, ambient)
  self.background_view = BackGroundView.new(ambient:getSpritePath())
end

-- getter
function BattleView.getPlayerPartyView(self)
    return self.party_view
end

-- getter
function BattleView.getEnemyPartyView(self)
    return self.enemy_party_view
end

-- getter
function BattleView.getMenuView(self)
    return self.menu_view
end

return BattleView