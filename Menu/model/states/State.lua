require "class"
--------------------------------------------------------------------------------------------------------
-- State: State
-- Creates new State
State = class(function(s)
    s.transitions = {}
end)

-- addTransition: int -> None
-- Adds a transition to the state
function State:addTransition(key, state)
    self.transitions[key] = state
end

-- getState: int -> State
-- Obtains an state associated to a key
-- Returns itself if it doesn't exist
function State:getState(key)
    local aux = self.transitions[key]
    if aux == nil then
        aux = self
    end
    return aux
end

-- doAction: None -> None
-- Activates the current state action
function State:doAction() end
