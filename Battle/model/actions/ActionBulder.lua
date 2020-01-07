require "lib.classes.class"
local Action = require("Battle.model.actions.Action")
--------------------------------------------------------------------------------------------------------

-- class: ActionBuilder
-- A builder class for an action
local ActionBuilder = class(function(self)
    self:reset()
end)

-- reset: None -> ActionBuilder
-- Resets the internnal parameters of the action builder
function ActionBuilder.reset(self)
    self.id = 1
    self.description = ""
    self.item_requirements = {}
    self.start_piece = "N"
    self.end_piece = "N"
    self.action_fun = function(source_entity, target_entity) end
    return self
end

-- getAction: None -> Action
-- Returns the result action of the builder
function ActionBuilder.getAction(self)
    return Action.new(
        self.id,
        self.description,
        self.item_requirements,
        self.start_piece,
        self.end_piece,
        self.action_fun
    )
end

-- setters
function ActionBuilder.setId(self, new_id)
    self.id = new_id
    return self
end

function ActionBuilder.setDescription(self, new_description)
    self.description = new_description
    return self
end

function ActionBuilder.addItemRequirement(self, new_item_id, cuantity)
    self.item_requirements[new_item_id] = cuantity
    return self
end

function ActionBuilder.setStartPiece(self, new_start_piece)
    self.start_piece = new_start_piece
    return self
end

function ActionBuilder.setEndPiece(self, new_end_piece)
    self.end_piece = new_end_piece
    return self
end

function ActionBuilder.setActionFunction(self, new_action_fun)
    self.action_fun = new_action_fun
    return self
end

return ActionBuilder