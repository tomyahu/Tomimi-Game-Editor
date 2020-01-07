require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Action
-- param: id:int -> the id of the action
-- param: description:str -> the description of the action
-- param: item_requirements:list(<int, int>) -> a list of the ids of the items that are required for this action to be
--                                         performed and the cuantity of each of them
-- param: start_piece:str -> The starting connection of this action
-- param: end_piece:str -> The ending connection of this action
-- param: action_fun:function -> the effect of this action
-- An action in a battle that has an effect
local Action = class(function(self, id, description, item_requirements, start_piece, end_piece, action_fun)
    self.id = id
    self.description = description
    self.item_requirements = item_requirements
    self.start_piece = start_piece
    self.end_piece = end_piece
    self.action_fun = action_fun
end)

-- activate: Entity, Entity -> None
-- Activates the effect of the skill from the source entity on a target entity
function Action.activate(self, source_entity, target_entity)
    self.action_fun(source_entity, target_entity)
end

-- compatiblePrevious: Action -> bool
-- Returns a boolean that represents if this action is compatible with the previous action
function Action.compatiblePrevious(self, other_action)
    if self:isStartAction() then
        return false
    end
    return (self.start_piece == other_action:getEndPiece)
end

-- compatibleNext: Action -> bool
-- Returns a boolean that represents if this action is compatible with the next action
function Action.compatibleNext(self, other_action)
    if self:isEndAction() then
        return false
    end
    return (self.end_piece == other_action:getStartPiece)
end

-- isStartAction: None -> None
-- Checks if an action corresponds to an action that can be used at the start of an action stream
function Action.isStartAction(self)
    return self.start_piece == "N"
end

-- isEndAction: None -> None
-- Checks if an action corresponds to an action that can be used at the end of an action stream
function Action.isEndAction(self)
    return self.end_piece == "N"
end

-- getters
function Action.getDescription(self)
    return self.description
end

function Action.getItemRequirements(self)
    return self.item_requirements
end

function Action.getStartPiece(self)
    return self.start_piece
end

function Action.getEndPiece(self)
    return self.end_piece
end

return Action