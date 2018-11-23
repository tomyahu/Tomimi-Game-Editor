require "class"
--------------------------------------------------------------------------------------------------------
-- Pair: Pair void void -> Pair
-- Crea un nuevo par
Pair = class(function(pair, first, second)
    pair.first = first
    pair.second = second
end)

-- getters
function Pair:getFirst()
    return self.first
end

function Pair:getSecond()
    return self.second
end

-- setters
function Pair:setFirst(newFirst)
    self.first = newFirst
end

function Pair:setFirst(newSecond)
    self.second = newSecond
end
