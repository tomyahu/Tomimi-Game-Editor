require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local State = class(function(self)
    self.transitions = {}
    self.transition_actions = {}
end)

-- addTransition: int, state -> None
-- Adds a transition to the state
function State.setTransition(self, key, state)
    self.transitions[key] = state
end

-- addTransitionAction: int, function(state) -> None
-- Adds an action to do with a transition
function State.addTransitionAction(self, key, fun)
    self.transition_actions[key] = fun
end

-- getState: int -> State
-- Obtains an state associated to a key
-- Returns itself if it doesn't exist
function State.getState(self,key)
    local aux = self.transitions[key]
    if aux == nil then
        aux = self
    end
    return aux
end

-- doTransitionAction: String -> None
-- Activates the current state action using a transition
function State.doTransitionAction(self, key)
    local aux = self.transition_actions[key]
    if not (aux == nil) then
        aux(self)
    end
end

return State