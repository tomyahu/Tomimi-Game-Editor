require "lib.classes.class"
require "Global.application.application"
require "Battle.consts"
local Turn = require("Battle.model.turns.Turn")
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"

local MenuState = require "Menu.model.menuStates.MenuState"
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"
local ContentMenuState = require "Menu.model.menuStates.ContentMenuState"
--------------------------------------------------------------------------------------------------------

-- class: PlayerTurn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle where the player chooses the abilities to use
local PlayerTurn = extend(Turn, function(self, entity)
    self.entity = entity
    self.menu = self:makeMenu()
end)

-- start: None -> None
-- Starts a new edition of the turn of this entity
function PlayerTurn.start(self)
    local ctrl = application:getCurrentCtrl()

    local menu_manager = ctrl:getMenuManager()

    -- Set menu to the manager
    menu_manager:setCurrentMenu(self.menu)
end

-- makeMenu: None -> Menu
function PlayerTurn.makeMenu(self)
    local aux = {}
    local ctrl = application:getCurrentCtrl()
    local menu_manager = ctrl:getMenuManager()
    local turn_manager = ctrl:getTurnManager()

    local back_function = function(_)
        menu_manager:setCurrentMenu(aux["action_menu"])
        print("back to first menu")
    end


    local target_menues = {}

    local target_build = DefaultMenuBuilder.new()

    local self_menu_state = ContentMenuState.new(self.entity:getName(), {self.entity})
    self_menu_state:addTransitionAction(ACTION_BUTTON_1, function(_)
        local selected_actions = aux["selected_actions"]
        menu_manager:setCurrentMenu(nil)
        print("action done")
        turn_manager:turnEnded(selected_actions, {{self.entity}})
    end)
    self_menu_state:addTransitionAction(ACTION_BUTTON_2, back_function)

    target_build:addState(self_menu_state)


    target_menues[BATTLE_TARGET_SELF] = target_build:getMenu()

    local m_build = DefaultMenuBuilder.new()

    local actions = self.entity:getActions()
    for _, action in pairs(actions) do
        local action_state = SingleActionMenuState.new(action:getName(), ACTION_BUTTON_1, function (_)
            print(action:getName() .. " action selected")
            local target_type = action:getTarget()
            aux["selected_actions"] = {action}
            menu_manager:setCurrentMenu(target_menues[BATTLE_TARGET_SELF])
        end)
        m_build:addState(action_state)
    end

    aux["action_menu"] = m_build:getMenu()

    return aux["action_menu"]
end

return PlayerTurn