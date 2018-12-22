require "class"
require "Menu.model.states.State"
require "Menu.model.automaton.Automaton"
--------------------------------------------------------------------------------------------------------
-- AutomatonBuilder: AutomatonBuilder
-- Creates new AutomatonBuilder
AutomatonBuilder = class(function(ab)
    ab.automaton = Automaton(State())
    ab.states = {}
    ab.stateNumber = 0
end)

-- addState: State -> self
-- Adds a state to the automaton
function AutomatonBuilder:addState(state)
    self.states[self.stateNumber + 1] = state
    self.stateNumber = self.stateNumber + 1
    return self
end

-- addTransition: int int key -> self
-- Adds a transition to the automaton
function AutomatonBuilder:addTransition(i, j, key)
    self.states[i+1].setTransition(key, self.states[j+1])
    return self
end

-- setCurrentState: int -> self
-- Sets the current state of the automaton
function AutomatonBuilder:setCurrentState(i)
    self.automaton.setCurrentState(self.states[i+1])
    return self
end

-- getAutomaton: None -> Automaton
-- Gets the builder's automaton
function AutomatonBuilder:getAutomaton()
    return self.automaton
end