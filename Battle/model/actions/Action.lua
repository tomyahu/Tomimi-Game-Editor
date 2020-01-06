require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Action
-- An action in a battle that has an effect
local Action = class(function(self, description, item_requirements, start_piece, end_piece)
    self.description = description
    self.item_requirements = item_requirements
    self.start_piece = start_piece
    self.end_piece = end_piece
end)

-- activate: Entity, Entity -> None
-- Activates the effect of the skill from the source entity on a target entity
function Action.activate(self, source_entity, target_entity)
end

-- compatiblePrevious: Action -> bool
-- Returns a boolean that represents if this action is compatible with the previous action
function Action.compatiblePrevious(self, other_action)
    if self.start_piece == "N" then
        return false
    end
    return (self.start_piece == other_action:getEndPiece)
end

-- compatibleNext: Action -> bool
-- Returns a boolean that represents if this action is compatible with the next action
function Action.compatibleNext(self, other_action)
    if self.end_piece == "N" then
        return false
    end
    return (self.end_piece == other_action:getStartPiece)
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