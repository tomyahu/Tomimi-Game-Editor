require "lib.classes.class"
require "Battle.consts"
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
    self.name = "???"
    self.description = "???"
    self.item_requirements = {}
    self.start_piece = BATTLE_ACTION_PIECE_BORDER
    self.end_piece = BATTLE_ACTION_PIECE_BORDER
    self.target = BATTLE_TARGET_NONE
    self.type = BATTLE_ACTION_OTHER_TYPE
    self.action_fun = function(source_entity, target_entity) end
    self.icon_path = nil
    return self
end

-- getAction: None -> Action
-- Returns the result action of the builder
function ActionBuilder.getAction(self)
    if self.icon_path == nil then
        self.icon_path = BATTLE_ACTION_DEFAULT_ICON_DIR .. self.start_piece .. self.end_piece .. ".png"
    end

    return Action.new(
        self.id,
        self.name,
        self.description,
        self.item_requirements,
        self.start_piece,
        self.end_piece,
        self.target,
        self.type,
        self.action_fun,
        self.icon_path
    )
end

-- setters
function ActionBuilder.setId(self, new_id)
    self.id = new_id
    return self
end

function ActionBuilder.setName(self, new_name)
    self.name = new_name
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

function ActionBuilder.setTarget(self, new_target)
    self.target = new_target
    return self
end

function ActionBuilder.setType(self, new_type)
    self.type = new_type
    return self
end

function ActionBuilder.setActionFunction(self, new_action_fun)
    self.action_fun = new_action_fun
    return self
end

function ActionBuilder.setIconPath(self, new_icon_path)
    self.icon_path = new_icon_path
    return self
end

return ActionBuilder