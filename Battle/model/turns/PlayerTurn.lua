require "lib.classes.class"
require "Global.application.application"
require "Battle.consts"
local Turn = require("Battle.model.turns.Turn")
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"

local MenuState = require "Menu.model.menuStates.MenuState"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"
local ContentMenuState = require "Menu.model.menuStates.ContentMenuState"
local ActionSequenceCreator = require("Battle.model.action_sequence.ActionSequenceCreator")

local ActionFactory = require("Battle.init.actions.ActionFactory")
--------------------------------------------------------------------------------------------------------

local flee_action = ActionFactory.getActionWithID(2)

-- class: PlayerTurn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle where the player chooses the abilities to use
local PlayerTurn = extend(Turn, function(self, entity)
    self.entity = entity
    self.menues = {}
    self.selected_target = entity
end)

-- start: None -> None
-- Starts a new edition of the turn of this entity
function PlayerTurn.start(self)
    local ctrl = application:getCurrentCtrl()
    self:makeMenues()
    print("made menues")

    local menu_manager = ctrl:getMenuManager()

    -- Set menu to the manager
    menu_manager:setCurrentMenu(self.menues.action_menu)
end

-- makeMenues: None -> Menu
-- TODO: Document this
function PlayerTurn.makeMenues(self)
    -- Create Basic Action Type Menu
    self:makeBasicActionMenu()

    -- Create Attack Action Menu
    self.makeAttackStartActionMenu()

    -- TODO: Create Support Action Menu
end


-- makeBasicActionMenu: None -> None
-- Creates the first menu to show up when its the player turn
function PlayerTurn.makeBasicActionMenu(self)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()

    local m_build = DefaultMenuBuilder.new()

    -- TODO: Check if player has starting attack moves, if not show this state as ??? with no action
    local attack_state = SingleActionMenuState.new("Attack", ACTION_BUTTON_1, function (_)
        error("Attack selected.")
        menu_manager:setCurrentMenu(self.menues.start_attack_action_menu)
    end)

    -- TODO: Check if player has starting support moves, if not show this state as ??? with no action
    local support_state = SingleActionMenuState.new("Support", ACTION_BUTTON_1, function (_)
        error("Support selected.")
        menu_manager:setCurrentMenu(self.menues.start_support_action_menu)
    end)

    local flee_state = SingleActionMenuState.new("Run Away", ACTION_BUTTON_1, function (_)
        print("Run Away selected.")
        turn_manager:turnEnded({flee_action}, {self.entity})
    end)

    m_build:addState(attack_state)
    m_build:addState(support_state)
    m_build:addState(flee_state)

    self.menues.action_menu = m_build:getMenu()
end

-- makeAttackStartActionMenu: None -> None
-- Creates the menu that shows up when the attack option is selected in the first menu
function PlayerTurn.makeAttackStartActionMenu(self)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()

    local menu_pointer_table = {}

    local m_build = DefaultMenuBuilder.new()

    -- Get starting attack actions
    local entity_actions = self.entity:getActions()
    local action_sequence_creator = ActionSequenceCreator.new(entity_actions)

    local start_actions = action_sequence_creator:getStartAttackActions()

    -- Create back funtion
    local back_funtion = function()
        menu_manager:setCurrentMenu(self.menues.action_menu)
    end

    -- TODO: Create menu for all starting actions
    for _, action in pairs(start_actions) do
        local action_state = ContentMenuState.new(action:getName(), action)

        action:addTransitionAction(ACTION_BUTTON_1, function(_)
            action_sequence_creator:addAction(action)

            -- TODO: If action is an ending action go to the target selection menu
            if action:isEndAction() then
                error("Target Selection Menu is not implemented yet")
                local target_menu = self:makeTargetMenu(menu_pointer_table, action_sequence_creator:getActionSequence())
                menu_manager:setCurrentMenu(target_menu)
            end

            error("Combo Menu is not implemented yet")
            -- TODO: Otherwise create an attack combo menu with this menu as the previous menu and go to it
            local combo_menu = self:makeAttackComboMenu(menu_pointer_table, action_sequence_creator)
            menu_manager:setCurrentMenu(combo_menu)

        end)
        m_build:addState(action_state)
    end

    menu_pointer_table.menu = m_build:getMenu()
    self.menues.start_attack_action_menu = menu_pointer_table.menu
end

return PlayerTurn