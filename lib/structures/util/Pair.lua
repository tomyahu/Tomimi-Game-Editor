--------------------------------------------------------------------------------------------------------
Pair = {}
Pair.__index = Pair

-- Pair: Pair void void -> Pair
-- Crea un nuevo par
function Pair.new(first, second)
    local o = {}
    local self = setmetatable(o, Pair)
    self.__index = self
    self.first = first
    self.second = second
    return self
end

-- getters
function Pair.getFirst(self)
    return self.first
end

function Pair.getSecond(self)
    return self.second
end

-- setters
function Pair.setFirst(self, newFirst)
    self.first = newFirst
end

function Pair.setSecond(self, newSecond)
    self.second = newSecond
end
