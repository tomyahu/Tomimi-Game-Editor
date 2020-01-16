require "lib.classes.class"
require "Global.application.application"
require "Battle.consts"
local Turn = require("Battle.model.turns.Turn")
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"

local MenuState = require "Menu.model.menuStates.MenuState"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"
local ContentMenuState = require "Menu.model.menuStates.ContentMenuState"
local ActionSequenceCreator = require("Battle.model.action_sequence.ActionSequenceCreator")
--------------------------------------------------------------------------------------------------------

-- class: PlayerTurn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle where the player chooses the abilities to use
local PlayerTurn = extend(Turn, function(self, entity)
    self.entity = entity
    self.menues = self:makeMenu()
end)

-- start: None -> None
-- Starts a new edition of the turn of this entity
function PlayerTurn.start(self)
    local ctrl = application:getCurrentCtrl()
    self.menues = self:makeMenu()

    local menu_manager = ctrl:getMenuManager()

    -- Set menu to the manager
    menu_manager:setCurrentMenu(self.menues["start_action_menu"])
end

-- makeMenu: None -> Menu
-- TODO: Document this
function PlayerTurn.makeMenu(self)
    local aux = {}
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()


    -- Create Start Action Menu
    local start_action_menu = self:getStartActionMenuWithActions(aux)
    aux["start_action_menu"] = start_action_menu

    return aux
end

-- getStartActionMenuWithActions: dict -> Menu
-- The menu when an action is started.
-- TODO: If non ending actions was selected move to combo menu, else move to target menu
-- TODO: Reimplement this changing menues to self.data
function PlayerTurn.getStartActionMenuWithActions(self, menues)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()

    local m_build = DefaultMenuBuilder.new()

    local possible_actions = self.entity:getActions()
    menues["action_sequence_creator"] = ActionSequenceCreator.new(possible_actions)

    local actions = menues["action_sequence_creator"]:getStartActions()
    local target_getter = ctrl:getTargetGetter()

    for _, action in pairs(actions) do
        local action_state = SingleActionMenuState.new(action:getName(), ACTION_BUTTON_1, function (_)
            print(action:getName() .. " action selected as start action.")
            local target_type = action:getTarget()
            menues["action_sequence_creator"]:addAction(action)

            local targets = target_getter:getTargets(self.entity, action:getTarget())

            menues["target_menu"] = self:getSelectorMenuWithTargets(menues, targets)

            menu_manager:setCurrentMenu(menues["target_menu"])
        end)
        m_build:addState(action_state)
    end

    return m_build:getMenu()
end

-- getSelectorMenuWithTargets: dict, list(list(Entity)) -> Menu
-- gets a menu to select a target for an action sequence
-- TODO: Reimplement this changing menues to self.data
-- TODO: move this to the end, if special action was selected do what the
function PlayerTurn.getSelectorMenuWithTargets(self, menues, targets)
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()

    local target_build = DefaultMenuBuilder.new()

    local back_function = function(_)
        menu_manager:setCurrentMenu(menues["start_action_menu"])
        print("back to first menu")
    end

    local target_states = {}
    for i, target in pairs(targets) do
        local new_target_state = ContentMenuState.new(i, target)

        new_target_state:addTransitionAction(ACTION_BUTTON_1, function(_)
            -- TODO: if action sequence creator has end action... end turn
            if menues["action_sequence_creator"]:getLastAction():isEndAction() then
                -- end turn
                turn_manager:turnEnded(menues["action_sequence_creator"]:getActionSequence(), {target})
            else
                --else go to combo action menu
                menues["targets"] = target

                local possible_actions = menues["action_sequence_creator"]:getActionsCompatibleWithLastAction()
                menues["combo_action_menu"] = self:getComboMenuWithActions(possible_actions)

                menu_manager:setCurrentMenu(menues["combo_action_menu"])
            end
        end)

        new_target_state:addTransitionAction(ACTION_BUTTON_2, back_function)

        target_build:addState(new_target_state)
    end

    return target_build:getMenu()
end

-- getComboMenuWithActions: list(Action) -> Menu
-- Gets a next combo menu based on the given actions
function PlayerTurn.getComboMenuWithActions(self, actions)
end

return PlayerTurn