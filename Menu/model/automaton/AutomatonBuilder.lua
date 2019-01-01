require "Menu.model.states.State"
require "Menu.model.automaton.Automaton"
--------------------------------------------------------------------------------------------------------
AutomatonBuilder = {}
AutomatonBuilder.__index = AutomatonBuilder

-- AutomatonBuilder: AutomatonBuilder
-- Creates new AutomatonBuilder
function AutomatonBuilder.new()
    local o = {}
    local self = setmetatable(o, AutomatonBuilder)
    self.__index = self
    self.automaton = Automaton.new()
    self.states = {}
    self.stateNumber = 0
    return self
end

-- addState: State -> self
-- Adds a state to the automaton
function AutomatonBuilder.addState(self,state)
    self.states[self.stateNumber + 1] = state
    self.stateNumber = self.stateNumber + 1
    return self
end

-- addTransition: int int key -> self
-- Adds a transition to the automaton
function AutomatonBuilder.addTransition(self,i, j, key)
    self.states[i+1].setTransition(key, self.states[j+1])
    return self
end

-- setCurrentState: int -> self
-- Sets the current state of the automaton
function AutomatonBuilder.setCurrentState(self,i)
    self.automaton.setCurrentState(self.states[i+1])
    return self
end

-- getAutomaton: None -> Automaton
-- Gets the builder's automaton
function AutomatonBuilder.getAutomaton(self)
    return self.automaton
end