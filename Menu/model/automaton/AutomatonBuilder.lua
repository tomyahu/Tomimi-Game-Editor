require "class"
require "Menu.model.states.State"
require "Menu.model.automaton.Automaton"
--------------------------------------------------------------------------------------------------------
-- AutomatonBuilder: AutomatonBuilder
-- Creates new AutomatonBuilder
AutomatonBuilder = class(function(ab)
    ab.automaton = Automaton(State())
end)

-- addState: State -> self
-- Adds a state to the automaton
function AutomatonBuilder:addState(state)
    self.automaton.addState(state)
    return self
end

-- addTransition: int int key -> self
-- Adds a transition to the automaton
function AutomatonBuilder:addTransition(i, j, key)
    self.automaton.addTransition(i, j, key)
    return self
end

-- setInitialState: State -> self
-- Sets the initial state of the automaton
function AutomatonBuilder:setInitialState(state)
    self.automaton.setState(1, state)
    return self
end

-- getAutomaton: None -> Automaton
-- Gets the builder's automaton
function AutomatonBuilder:getAutomaton()
    return self.automaton
end