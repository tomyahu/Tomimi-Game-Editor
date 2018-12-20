require "class"
require "Menu.model.states.State"
--------------------------------------------------------------------------------------------------------
-- Automaton: Automaton
-- Creates new Automaton
Automaton = class(function(a, initialState)
    a.currentState = initialState
    a.stateNumber = 2
    a.states = {}
    a.states[1] = a.initialState
end)

-- setState: State -> None
-- Sets the state i of the automaton
function Automaton:setState(i, state)
    self.states[i] = state
end

-- getCurrentState: None -> State
-- Gets the current state
function Automaton:getCurrentState()
    return self.currentState
end

-- addState: State -> None
-- Adds a state to the automaton
function Automaton:addState(state)
    self.setState(self.stateNumber, state)
    self.stateNumber = self.stateNumber + 1
end

-- addTransition: int int int -> None
-- Adds a state to the automaton
function Automaton:addTransition(i, j, key)
    self.states[i].addTransition(key, self.states[j])
end

-- makeTransition: int
-- Makes a transition of state of the automaton
function Automaton:makeTransition(key)
    self.currentState = self.currentState.getState(key)
end
