require "lib.classes.class"
require "Battle.consts"
local RegularAttackAction = require("Battle.model.actions.RegularAttackAction")
local ActionBuilder = require("Battle.model.actions.ActionBuilder")
--------------------------------------------------------------------------------------------------------

-- class: RegularAttackActionBuilder
-- A builder class for a regular attack action action
local RegularAttackActionBuilder = extend(ActionBuilder, function(self)
end)

-- reset: None -> ActionBuilder
-- Resets the internnal parameters of the action builder
function RegularAttackActionBuilder.reset(self)
    ActionBuilder.reset(self)
    self.guard_damage = 0
    self.direct_damage = 0
end

-- getAction: None -> Action
-- Returns the result action of the builder
function RegularAttackActionBuilder.getAction(self)
    if self.icon_path == nil then
        self.icon_path = BATTLE_ACTION_DEFAULT_ICON_DIR .. self.start_piece .. self.end_piece .. ".png"
    end

    return RegularAttackAction.new(
        self.id,
        self.name,
        self.description,
        self.item_requirements,
        self.start_piece,
        self.end_piece,
        self.target,
        self.icon_path,
        self.guard_damage,
        self.direct_damage
    )
end

-- setters
function RegularAttackActionBuilder.setType(self, new_type)
    error("Can't set type of regular attack action")
end

function RegularAttackActionBuilder.setActionFunction(self, new_action_fun)
    error("Can't set function of regular attack action")
end

function RegularAttackActionBuilder.setGuardDamage(self, new_guard_damage)
    self.guard_damage = new_guard_damage
end

function RegularAttackActionBuilder.setDirectDamage(self, new_direct_damage)
    self.direct_damage = new_direct_damage
end

return RegularAttackActionBuilder