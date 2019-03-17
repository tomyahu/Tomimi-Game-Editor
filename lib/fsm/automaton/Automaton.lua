require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local Automaton = class(function(self)
    self.currentState = nil
end)

-- setCurrentState: State -> None
-- Sets the current state of the automaton
function Automaton.setCurrentState(self,state)
    self.currentState = state
end

-- getCurrentState: None -> State
-- Gets the current state
function Automaton.getCurrentState(self)
    return self.currentState
end

-- makeTransition: int
-- Makes a transition of state of the automaton
function Automaton.makeTransition(self, key)
    self.currentState:doTransitionAction(key)
    self.currentState = self.currentState:getState(key)
end

return Automaton