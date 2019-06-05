require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Pair
-- param: first:any -> The first parameter of the pair
-- param: second:any -> The second parameter of the pair
-- A basic pair object
local Pair = class(function(self, first, second)
    self.first = first
    self.second = second
end)

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

return Pair