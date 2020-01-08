local ActionBuilder = require("Battle.model.actions.ActionBuilder")
--------------------------------------------------------------------------------------------------------

local actions = {}
local action_build = ActionBuilder.new()

-- 1. Do Nothing -------------------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(1)
action_build:setName("Do Nothing")
action_build:setDescription("Wastes a turn doing nothing.")
action_build:setStartPiece("N")
action_build:setEndPiece("N")
action_build:setActionFunction( function(source_entity, target_entity)
end)
table.insert(actions, action_build:getAction())

-- 2. Perfect Escape ---------------------------------------------------------------------------------------------------
action_build:reset()
action_build:setId(2)
action_build:setName("Perfect Escape")
action_build:setDescription("Escapes from combat with a 100% chance.")
action_build:setStartPiece("N")
action_build:setEndPiece("N")
action_build:setActionFunction( function(source_entity, target_entity)
    -- TODO: get ctrl and call escape function
end)
table.insert(actions, action_build:getAction())

return actions