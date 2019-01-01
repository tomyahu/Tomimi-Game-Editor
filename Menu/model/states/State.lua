--------------------------------------------------------------------------------------------------------
State = {}
State.__index = State

-- State: State
-- Creates new State
function State.new()
    local o = {}
    local self = setmetatable(o, State)
    self.__index = self
    self.transitions = {}
    return self
end

-- addTransition: int -> None
-- Adds a transition to the state
function State.setTransition(self,key, state)
    self.transitions[key] = state
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

-- doAction: None -> None
-- Activates the current state action
function State.doAction(self) end
