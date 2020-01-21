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
-- Creates the menues associated to the player's turn
function PlayerTurn.makeMenues(self)
    -- Create Basic Action Type Menu
    self:makeBasicActionMenu()

    -- Create Attack Action Menu
    self:makeAttackStartActionMenu()

    -- Create Support Action Menu
    self:makeSupportStartActionMenu()
end


-- makeBasicActionMenu: None -> None
-- Creates the first menu to show up when its the player turn
function PlayerTurn.makeBasicActionMenu(self)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()

    local m_build = DefaultMenuBuilder.new()

    -- Check if player has starting attack moves
    -- if not, show this state with the name ??? with no action when activating it
    local entity_actions = self.entity:getActions()
    local action_sequence_creator = ActionSequenceCreator.new(entity_actions)
    local start_attack_actions = action_sequence_creator:getStartAttackActions()

    local attack_state
    if (# start_attack_actions) > 0 then
        attack_state = SingleActionMenuState.new("Attack", ACTION_BUTTON_1, function (_)
            print("Attack selected.")
            menu_manager:setCurrentMenu(self.menues.start_attack_action_menu)
        end)
    else
        attack_state = SingleActionMenuState.new("???", ACTION_BUTTON_1, function (_)
            print("There are no attack actions available.")
        end)
    end

    -- Check if player has starting support moves
    -- if not, show this state with the name ??? with no action when activating it
    local start_support_actions = action_sequence_creator:getStartSupportActions()

    local support_state
    if (# start_support_actions) > 0 then
        support_state = SingleActionMenuState.new("Support", ACTION_BUTTON_1, function (_)
            menu_manager:setCurrentMenu(self.menues.start_support_action_menu)
        end)
    else
        support_state = SingleActionMenuState.new("???", ACTION_BUTTON_1, function (_)
            print("There are no support actions available.")
        end)
    end

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
    -- Get starting attack actions
    local entity_actions = self.entity:getActions()
    local action_sequence_creator = ActionSequenceCreator.new(entity_actions)
    local start_actions = action_sequence_creator:getStartAttackActions()

    local aux = {}
    aux.menu = self.menues.action_menu

    local menu_pointer_table = self:makeActionSelectionMenu(aux, action_sequence_creator, start_actions)
    self.menues.start_attack_action_menu = menu_pointer_table.menu
end

-- makeSupportStartActionMenu: None -> None
-- Creates the menu that shows up when the support option is selected in the first menu
function PlayerTurn.makeSupportStartActionMenu(self)
    -- Get starting attack actions
    local entity_actions = self.entity:getActions()
    local action_sequence_creator = ActionSequenceCreator.new(entity_actions)
    local start_actions = action_sequence_creator:getStartSupportActions()

    local aux = {}
    aux.menu = self.menues.action_menu

    local menu_pointer_table = self:makeActionSelectionMenu(aux, action_sequence_creator, start_actions)
    self.menues.start_support_action_menu = menu_pointer_table.menu
end

-- makeComboActionMenu: None -> None
-- Creates the menu that shows up abilities that are compatible with the previous abilities
function PlayerTurn.makeComboActionMenu(self, menu_pointer_table, action_sequence_creator)
    -- Get compatible attack actions
    local compatible_actions = action_sequence_creator:getActionsCompatibleWithLastAction()

    local menu_pointer_table = self:makeActionSelectionMenu(menu_pointer_table, action_sequence_creator, compatible_actions)
    self.menues.start_attack_action_menu = menu_pointer_table.menu
end

-- makeActionSelectionMenu: {Menu}, ActionSequenceCreator, list(Action) -> {Menu}
-- Creates a menu to select from a list of actions
function PlayerTurn.makeActionSelectionMenu(self, menu_pointer_table, action_sequence_creator, start_actions)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()

    -- Create funtion to go back to the first menu
    local back_funtion = function()
        menu_manager:setCurrentMenu(menu_pointer_table.menu)

        -- TODO: Change this to audio queue
        print("back to previous menu")
    end

    -- Create pointer table to the menu that will be created
    local menu_pointer_table = {}

    -- Create menu builder
    local m_build = DefaultMenuBuilder.new()

    -- Create menu for all starting actions
    for _, action in pairs(start_actions) do
        local action_state = ContentMenuState.new(action:getName(), action)

        action_state:addTransitionAction(ACTION_BUTTON_1, function(_)
            -- TODO: Add audio queue for this
            action_sequence_creator:addAction(action)

            -- TODO: Delete this
            print(action:getName() .. " selected.")

            -- If action is an ending action go to the target selection menu
            if action:isEndAction() then
                local target_menu = self:makeTargetMenu(menu_pointer_table, action_sequence_creator)
                menu_manager:setCurrentMenu(target_menu)
            else
                -- Otherwise create an attack combo menu with this menu as the previous menu and go to it
                local combo_menu = self:makeComboActionMenu(menu_pointer_table, action_sequence_creator)
                menu_manager:setCurrentMenu(combo_menu)
            end

        end)

        action_state:addTransitionAction(ACTION_BUTTON_2, back_funtion)
        m_build:addState(action_state)
    end

    menu_pointer_table.menu = m_build:getMenu()
    return menu_pointer_table
end

-- makeTargetMenu: {Menu}, ActionSequenceCreator -> {Menu}
-- Creates a menu to select from a list of targets
function PlayerTurn.makeTargetMenu(self, menu_pointer_table, action_sequence_creator)
    local action_sequence = action_sequence_creator:getActionSequence()
    local action_sequence_type = action_sequence[(# action_sequence)]:getType()

    local is_attack_action_sequence = action_sequence_type == BATTLE_ACTION_ATTACK_TYPE
    local is_support_action_sequence = action_sequence_type == BATTLE_ACTION_SUPPORT_TYPE

    if is_attack_action_sequence then
        return self:makeAttackTargetMenu(menu_pointer_table, action_sequence_creator)
    end

    if is_support_action_sequence then
        return self:makeSupportTargetMenu(menu_pointer_table, action_sequence_creator)
    end

    error("Unrecognized type of sequence: " .. action_sequence_type .. ".")
end

-- makeAttackTargetMenu: {Menu}, ActionSequenceCreator -> Menu
-- Makes a target menu to see which enemy is the target of the attack action sequence
function PlayerTurn.makeAttackTargetMenu(self, menu_pointer_table, action_sequence_creator)
    local ctrl = application:getCurrentCtrl()
    local target_getter = ctrl:getTargetGetter()

    return self:makeTargetMenuAux(menu_pointer_table, action_sequence_creator, target_getter:getTargetSingleEnemy(self.entity), BATTLE_TARGET_SINGLE_ENEMY)
end

-- makeSupportTargetMenu: {Menu}, ActionSequenceCreator -> Menu
-- Makes a target menu to see which ally is the target of the support action sequence
function PlayerTurn.makeSupportTargetMenu(self, menu_pointer_table, action_sequence_creator)
    local ctrl = application:getCurrentCtrl()
    local target_getter = ctrl:getTargetGetter()

    return self:makeTargetMenuAux(menu_pointer_table, action_sequence_creator, target_getter:getTargetSinglePartyMember(self.entity), BATTLE_TARGET_SINGLE_PARTY_MEMBER)
end

-- makeTargetMenuAux: {Menu}, ActionSequenceCreator, list(list(Entity)), str -> Menu
-- Auxiliary function on making a target menu
function PlayerTurn.makeTargetMenuAux(self, menu_pointer_table, action_sequence_creator, target_sets, target_type_decision)
    if (# target_sets) == 0 then
        return self:makeConfirmationMenu(menu_pointer_table, action_sequence_creator)
    end

    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()
    local target_getter = ctrl:getTargetGetter()

    local action_sequence = action_sequence_creator:getActionSequence()

    local m_build = DefaultMenuBuilder.new()

    local previous_menu = menu_pointer_table.menu

    local back_funtion = function()
        action_sequence_creator:removeLastAction()
        menu_manager:setCurrentMenu(previous_menu)
    end

    for _, target_set in pairs(target_sets) do
        local state_name = target_set[1]:getName()
        local target_state = ContentMenuState.new(state_name, target_set)

        target_state:addTransitionAction(ACTION_BUTTON_1, function(_)
            local target_entities = {}
            for _, action in pairs(action_sequence) do
                if action:getTarget() == target_type_decision then
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

-- makeConfirmationMenu: {Menu}, ActionSequenceCreator -> Menu
-- Creates a menu to confirm a sequence of actions
function PlayerTurn.makeConfirmationMenu(self, menu_pointer_table, action_sequence_creator)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()
    local target_getter = ctrl:getTargetGetter()

    local action_sequence = action_sequence_creator:getActionSequence()

    local m_build = DefaultMenuBuilder.new()

    local previous_menu = menu_pointer_table.menu

    local back_funtion = function()
        action_sequence_creator:removeLastAction()
        menu_manager:setCurrentMenu(previous_menu)
    end

    local target_state = ContentMenuState.new("Go!")

    target_state:addTransitionAction(ACTION_BUTTON_1, function(_)
        local target_entities = {}
        for _, action in pairs(action_sequence) do
            table.insert(target_entities, target_getter:getTargets(self.entity, action:getTarget())[1])
        end

        menu_manager:setCurrentMenu(nil)
        turn_manager:turnEnded(action_sequence, target_entities)
    end)

    target_state:addTransitionAction(ACTION_BUTTON_2, back_funtion)

    return m_build:getMenu()
end

return PlayerTurn