require "lib.test.assert"
require "lib.algorithm.Arrays"
local Pair = require "lib.structures.util.Pair"

-- Quicksort
for j = 1,10 do
    -- Create array with random pairs
    local a = {}
    for i=1,10,1 do
        a[i] = Pair.new(math.random(),math.random())
    end

    -- Order the array with quicksortPairs
    quicksortPairs(a)
    local b = tostring(a[1]:getFirst())

    -- Check if the array is ordered
    for i=1,9,1 do
        assertTrue((a[i]:getFirst()) < (a[i+1]:getFirst()))
    end
end
