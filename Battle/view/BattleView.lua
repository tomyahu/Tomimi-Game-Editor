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
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self)
    self.party_view = nil
    self.enemy_party_view = nil
    self.background_view = nil
    self.test1 = sprite_factory:getRegularRectSprite(RESOURCES_PATH .. "/LetsGo.png", 64, 32, 1)
    self.test2 = sprite_factory:getRegularRectSprite(RESOURCES_PATH .. "/LetsGoV2.png", 64, 32, 1)
    self.test3 = sprite_factory:getRegularRectSprite(RESOURCES_PATH .. "/SinisterSlashConnected.png", 64, 32, 1)
    self.test5 = sprite_factory:getRegularRectSprite(RESOURCES_PATH .. "/CON-CEN-TRA-TION.png", 64, 32, 1)

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

    self.test1:draw(getRelativePosX(40), getRelativePosY(40), 2*getScale(), 2*getScale())
    self.test3:draw(getRelativePosX(136), getRelativePosY(40), 2*getScale(), 2*getScale())

    self.test2:draw(getRelativePosX(400), getRelativePosY(40), 2*getScale(), 2*getScale())
    self.test3:draw(getRelativePosX(496), getRelativePosY(40), 2*getScale(), 2*getScale())

    self.test5:draw(getRelativePosX(650), getRelativePosY(40), 2*getScale(), 2*getScale())

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

return BattleView