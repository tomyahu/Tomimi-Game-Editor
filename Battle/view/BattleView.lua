require "lib.classes.class"
require "Battle.consts"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"

local View = require ("Global.view.view")
local Party = require("Battle.model.party.Party")
local BackGroundView = require("Battle.view.background.BackgroundView")
local PartyView = require("Battle.view.party.PartyView")
local EnemyPartyView = require("Battle.view.party.EnemyPartyView")
local ActionSceneManager = require("Battle.view.managers.ActionSceneManager")
local EntityViewGetter = require("Battle.view.entity.EntityViewGetter")
local ActionNameDisplayer = require("Battle.view.displayers.action_name_displayer.ActionNameDisplayer")
local MessageDisplayer = require("Battle.view.displayers.message_displayer.MessageDisplayer")
local ActionIconsDisplayer = require("Battle.view.displayers.action_icon_displayer.ActionIconsDisplayer")
local SoundManager = require("Battle.view.managers.SoundManager")

local MenuFactory = require("Battle.view.menues.MenuFactory")
--------------------------------------------------------------------------------------------------------

-- class: BattleView
-- The view of the battle app
local BattleView = extend(View, function(self, menu_sprite_sheet_path, font, battle_music)
    self.party_view = nil
    self.enemy_party_view = nil
    self.background_view = nil
    self.entity_view_getter = EntityViewGetter.new()
    self.action_scene_manager = ActionSceneManager.new()
    self.sound_manager = SoundManager.new(battle_music)

    self.action_name_displayer = ActionNameDisplayer.new(menu_sprite_sheet_path)
    self.message_displayer = MessageDisplayer.new(menu_sprite_sheet_path)
    self.action_icons_displayer = ActionIconsDisplayer.new()

    local menu_factory = MenuFactory.new(menu_sprite_sheet_path, font)
    self.menu_view = menu_factory:getBasicMenu(nil, 220, 380)

    self.victory_screen = false
end,

function()
    return View.new()
end)

-- update: num -> None
-- updates the view internal values
function BattleView.update(self, dt)
    self.action_scene_manager:update(dt)
    self.message_displayer:update(dt)
end

-- draw: None -> None
-- Draws the current scene
function BattleView.draw(self)
    -- TODO: If this scales refactor it to a state pattern
    if self.victory_screen then
        self:drawVictoryScreen()
    else
        self:drawBattle()
    end
end

-- drawBattle: None -> None
-- draws the entities during a battle
function BattleView.drawBattle(self)
    self.background_view:draw()
    self.party_view:draw()
    self.enemy_party_view:draw()

    -- UI
    self.message_displayer:draw()
    self.menu_view:draw()
    self.action_name_displayer:draw()
    self.action_icons_displayer:draw()
end

-- drawVictoryScreen: None -> None
-- Draws the victory screen
function BattleView.drawVictoryScreen(self)
    self.background_view:draw()
    self.party_view:draw()

    -- UI
    -- TODO: Draw item rewards
end

-- setup: None -> None
-- Sets up the local view vairables
function BattleView.setup(self)
    self.message_displayer:reset()
    self.action_name_displayer:reset()
    self.sound_manager:playMusic()
    self.victory_screen = false
end

-- setup: None -> None
-- Tears up the local view vairables and cleans the contexts used
function BattleView.stop(self)
    self.sound_manager:stopMusic()
end

-- setPlayerParty: Party -> None
-- sets the party given as the player party in the view
function BattleView.setPlayerParty(self, party)
    self.party_view = PartyView.new(party)

    for _, member_view in pairs(self.party_view:getEntityViews()) do
        self.entity_view_getter:addEntity(member_view:getEntity(), member_view)
    end
end

-- setEnemyParty: Party -> None
-- sets the party given as the enemy party in the view
function BattleView.setEnemyParty(self, party)
    self.enemy_party_view = EnemyPartyView.new(party)

    for _, member_view in pairs(self.enemy_party_view:getEntityViews()) do
        self.entity_view_getter:addEntity(member_view:getEntity(), member_view)
    end
end

-- setBackground: Environment -> None
-- sets the environment given to the view´s background
function BattleView.setBackground(self, environment)
  self.background_view = BackGroundView.new(environment:getSpritePath())
end

-- setter
function BattleView.setVictoryScreen(self, victory_screen)
    self.victory_screen = victory_screen
end

-- getters
function BattleView.getPlayerPartyView(self)
    return self.party_view
end

function BattleView.getEnemyPartyView(self)
    return self.enemy_party_view
end

function BattleView.getMenuView(self)
    return self.menu_view
end

function BattleView.getActionSceneManager(self)
    return self.action_scene_manager
end

function BattleView.getEntityViewGetter(self)
    return self.entity_view_getter
end

function BattleView.getActionNameDisplayer(self)
    return self.action_name_displayer
end

function BattleView.getMessageDisplayer(self)
    return self.message_displayer
end

function BattleView.getActionIconsDisplayer(self)
    return self.action_icons_displayer
end

return BattleView