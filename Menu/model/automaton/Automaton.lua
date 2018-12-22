require "Menu.model.states.State"
--------------------------------------------------------------------------------------------------------
-- Automaton: Automaton
-- Creates new Automaton
Automaton = class(function(a)
    a.currentState = nil
end)

-- setCurrentState: State -> None
-- Sets the current state of the automaton
function Automaton:setCurrentState(state)
    self.currentState = state
end

-- getCurrentState: None -> State
-- Gets the current state
function Automaton:getCurrentState()
    return self.currentState
end

-- makeTransition: int
-- Makes a transition of state of the automaton
function Automaton:makeTransition(key)
    self.currentState = self.currentState.getState(key)
end
