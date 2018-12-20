require "class"
--------------------------------------------------------------------------------------------------------
-- State: State
-- Creates new State
State = class(function(s)
    s.transitions = {}
end)

-- addTransition: str -> State
-- Adds a transition to the state
function State:addTransition(key, state)
    self.transitions[key] = state
end

-- getState: str
-- Obtains an state associated to a key
-- Returns nil if it doesn't exist
function State:getState(key)
    return self.transitions[key]
end
