require "lib.classes.class"
require "Battle.consts"
--------------------------------------------------------------------------------------------------------

-- class: Action
-- param: id:int -> the id of the action
-- param: name:str -> the name of the action
-- param: description:str -> the description of the action
-- param: item_requirements:list(<int, int>) -> a list of the ids of the items that are required for this action to be
--                                         performed and the cuantity of each of them
-- param: start_piece:str -> The starting connection of this action
-- param: end_piece:str -> The ending connection of this action
-- param: target:str -> The targets this action can be used on
-- param: type:str -> The action's type (can be attack, support and other)
-- param: action_fun:function -> the effect of this action
-- param: icon_path:str -> the path of the icon of this action
-- An action in a battle that has an effect
local Action = class(function(self, id, name, description, item_requirements, start_piece, end_piece, target, type, action_fun, icon_path)
    self.id = id
    self.name = name
    self.description = description
    self.item_requirements = item_requirements
    self.start_piece = start_piece
    self.end_piece = end_piece
    self.target = target
    self.type = type
    self.action_fun = action_fun
    self.icon_path = icon_path
end)

-- activate: Entity, list(Entity), any -> None
-- Activates the effect of the skill from the source entity on a target entity
function Action.activate(self, source_entity, target_entity, extra)
    self.action_fun(source_entity, target_entity, extra)
end

-- compatiblePrevious: Action -> bool
-- Returns a boolean that represents if this action is compatible with the previous action
function Action.compatiblePrevious(self, other_action)
    if self:isStartAction() then
        return false
    end
    return (self.start_piece == other_action:getEndPiece()) and (self.type == other_action:getType())
end

-- compatibleNext: Action -> bool
-- Returns a boolean that represents if this action is compatible with the next action
function Action.compatibleNext(self, other_action)
    if self:isEndAction() then
        return false
    end
    return (self.end_piece == other_action:getStartPiece()) and (self.type == other_action:getType())
end

-- isStartAction: None -> bool
-- Checks if the current action corresponds to an action that can be used at the start of an action sequence
function Action.isStartAction(self)
    return self.start_piece == BATTLE_ACTION_PIECE_BORDER
end

-- isEndAction: None -> bool
-- Checks if the current action corresponds to an action that can be used at the end of an action sequence
function Action.isEndAction(self)
    return self.end_piece == BATTLE_ACTION_PIECE_BORDER
end

-- isAttackAction: None -> bool
-- Checks if the current actions corresponds to an attack action
function Action.isAttackAction(self)
    return self.type == BATTLE_ACTION_ATTACK_TYPE
end

-- isSupportAction: None -> bool
-- Checks if the current actions corresponds to a support action
function Action.isSupportAction(self)
    return self.type == BATTLE_ACTION_SUPPORT_TYPE
end

-- getters
function Action.getID(self)
    return self.id
end

function Action.getName(self)
    return self.name
end

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

function Action.getTarget(self)
    return self.target
end

function Action.getType(self)
    return self.type
end

function Action.getIconPath(self)
    return self.icon_path
end

return Action