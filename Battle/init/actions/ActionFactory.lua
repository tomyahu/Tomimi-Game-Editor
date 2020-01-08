require "lib.classes.class"
local actions = require("Battle.init.actions.actions")
--------------------------------------------------------------------------------------------------------

-- class: ActionFactory
-- A flyweight factory class for actions
local ActionFactory = class(function(self)
end)

-- getActionWithID: int -> Action
-- gets an action from the action list
function ActionFactory.getActionWithID(id)
    return actions[id]
end

return ActionFactory
