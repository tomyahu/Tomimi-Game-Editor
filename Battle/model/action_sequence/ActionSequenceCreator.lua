require "lib.classes.class"
-------------------------------------------------------------------------------------------------------

-- class: ActionSequenceCreator
-- param: actions:list(Action) -> A list of actions available for a character
-- An action sequence builder
local ActionSequenceCreator = class(function(self, actions)
    self.used_actions = {}
    for _, action in pairs(actions) do
        self.used_actions[action] = false
    end

    self.action_sequence = {}
    self.action_sequence_size = 0
end)

-- getStartActions: str -> list(Actions)
-- Gets a list of all the start actions available
function ActionSequenceCreator.getStartActions(self)
    local available_actions = {}
    for action, state in pairs(self.used_actions) do
        if (not state) and action:isStartAction() then
            table.insert(available_actions, action)
        end
    end
    return available_actions
end

-- getEndActions: str -> list(Actions)
-- Gets a list of all the end actions available
function ActionSequenceCreator.getEndActions(self)
    local available_actions = {}
    for action, state in pairs(self.used_actions) do
        if (not state) and action:isEndAction() then
            table.insert(available_actions, action)
        end
    end
    return available_actions
end

-- getActionsWithStartType: str -> list(Actions)
-- Gets a list of all the actions tha have not been used yet with the specified start piece type
function ActionSequenceCreator.getActionsWithStartType(self, type)
    local available_actions = {}
    for action, state in pairs(self.used_actions) do
        if (not state) and (action:getStartPiece() == type) then
            table.insert(available_actions, action)
        end
    end
    return available_actions
end

-- getActionsWithEndType: str -> list(Actions)
-- Gets a list of all the actions tha have not been used yet with the specified end piece type
function ActionSequenceCreator.getActionsWithEndType(self, type)
    local available_actions = {}
    for action, state in self.used_actions do
        if (not state) and (action:getEndPiece() == type) then
            table.insert(available_actions, action)
        end
    end
    return available_actions
end

-- addAction: Action -> None
-- Adds an action to the action sequence
function ActionSequenceCreator.addAction(self, action)
    if self.used_actions[action] then
        error("This action has already been used.")
    end

    -- Check if it is compatible with last action (If there are no actions it is also compatible)
    local last_action = self:getLastAction()

    if last_action == nil then
        if action:isStartAction() then
            self.action_sequence_size = self.action_sequence_size + 1
            self.action_sequence[self.action_sequence_size] = action
            self.used_actions[action] = true
            return
        else
            error("Tried to add a non starting action to an empty action sequence.")
        end
    end

    if (not last_action:compatibleNext(action)) and (self.action_sequence_size > 0) then
        print(last_action:compatibleNext(action))
        error("Tried to add an incompatible action to the action sequence.")
    end
    if (self.action_sequence_size == 0) and (not action:isStartAction()) then
        error("Tried to start an action sequence without a start action.")
    end

    self.action_sequence_size = self.action_sequence_size + 1
    self.action_sequence[self.action_sequence_size] = action
    self.used_actions[action] = true
end

function ActionSequenceCreator.removeLastAction(self)
    if self.action_sequence_size == 0 then
        return
    end

    self.used_actions[self:getLastAction()] = false
    self.action_sequence[self.action_sequence_size] = nil
    self.action_sequence_size = self.action_sequence_size - 1
end

function ActionSequenceCreator.getActionSequence(self)
    -- Check if it finishes with end action.
    if self:getLastAction():getEndPiece() ~= "N" then
        error("Tried to return action sequence where last action isnt an end action.")
    end

    return self.action_sequence
end

function ActionSequenceCreator.getLastAction(self)
    return self.action_sequence[self.action_sequence_size]
end

return ActionSequenceCreator
