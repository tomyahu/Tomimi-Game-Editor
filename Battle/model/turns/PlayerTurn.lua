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
    self:makeAttackStartActionMenu()

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
        print("Attack selected.")
        menu_manager:setCurrentMenu(self.menues.start_attack_action_menu)
    end)

    -- TODO: Check if player has starting support moves, if not show this state as ??? with no action
    local support_state = SingleActionMenuState.new("Support", ACTION_BUTTON_1, function (_)
        error("Support selected.")
        menu_manager:setCurrentMenu(self.menues.start_support_action_menu)
    end)

    local flee_state = SingleActionMenuState.new("Run Away", ACTION_BUTTON_1, function (_)
        print("Run Away selected.")
        turn_manager:turnEnded({flee_action}, {{self.entity}})
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
        print("back to first menu")
    end

    -- TODO: Create menu for all starting actions
    for _, action in pairs(start_actions) do
        local action_state = ContentMenuState.new(action:getName(), action)

        action_state:addTransitionAction(ACTION_BUTTON_1, function(_)
            action_sequence_creator:addAction(action)

            -- TODO: If action is an ending action go to the target selection menu
            if action:isEndAction() then
                print(action:getName() .. " selected.")
                local target_menu = self:makeAttackTargetMenu(menu_pointer_table, action_sequence_creator:getActionSequence())
                menu_manager:setCurrentMenu(target_menu)
            else
                error("Combo Menu is not implemented yet")
                -- TODO: Otherwise create an attack combo menu with this menu as the previous menu and go to it
                local combo_menu = self:makeAttackComboMenu(menu_pointer_table, action_sequence_creator)
                menu_manager:setCurrentMenu(combo_menu)
            end

        end)

        action_state:addTransitionAction(ACTION_BUTTON_2, back_funtion)
        m_build:addState(action_state)
    end

    menu_pointer_table.menu = m_build:getMenu()
    self.menues.start_attack_action_menu = menu_pointer_table.menu
end

function PlayerTurn.makeAttackTargetMenu(self, menu_pointer_table, action_sequence)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()

    local m_build = DefaultMenuBuilder.new()

    local previous_menu = menu_pointer_table.menu

    local back_funtion = function()
        menu_manager:setCurrentMenu(previous_menu)
    end

    local is_there_a_single_enemy_action = false
    for _, action in pairs(action_sequence) do
        if action:getTarget() == BATTLE_TARGET_SINGLE_ENEMY then
            is_there_a_single_enemy_action = true
        end
    end

    local target_getter = ctrl:getTargetGetter()
    local target_options
    if is_there_a_single_enemy_action then
        target_options = target_getter:getTargetSingleEnemy(self.entity)
    else
        target_options = target_getter:getTargetAllEnemies(self.entity)
    end

    for _, target_set in pairs(target_options) do
        local state_name
        if (# target_set) == 1 then
            state_name = target_set[1]:getName()
        else
            state_name = "All Enemies"
        end

        local target_state = ContentMenuState.new(state_name, target_set)

        target_state:addTransitionAction(ACTION_BUTTON_1, function(_)
            local target_entities = {}
            for _, action in pairs(action_sequence) do
                if action:getTarget() == BATTLE_TARGET_SINGLE_ENEMY then
                    table.insert(target_entities, target_set)
                else
                    table.insert(target_entities, target_getter:getTargets(self.entity, action:getTarget())[1])
                end
            end

            menu_manager:setCurrentMenu(nil)
            turn_manager:turnEnded(action_sequence, target_entities)
        end)

        target_state:addTransitionAction(ACTION_BUTTON_2, back_funtion)

        m_build:addState(target_state)
    end

    return m_build:getMenu()
end

return PlayerTurn