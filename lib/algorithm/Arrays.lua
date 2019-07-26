require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- TODO: Create method to get min and max from an array
-- TODO: add assertions if array is an array
-- Ordering --------------------------------------------------------------------------------------------
-- Quicksort --

local Arrays = class(function(self) end)

-- Quicksort for pair based arrays (arrays of pairs)
function Arrays.quicksortPairs(self, array)
    self:partitionPairs(array, 1, (# array))
end

function Arrays.partitionPairs(self, array, i, j)
    if (i < j) then
        -- Choose piv as the element right in the middle (or middle left if it doesn't exists)
        local piv = (i + j) /2

        -- swaps pivs and i element
        self:swap(array, i, piv)

        local left = i+1
        local right = j

        -- Partitions sub array using quickselect with the piv
        while(left < right) do

            while (array[left]:getFirst() < array[i]:getFirst() and left < right) do
                left = left + 1
            end

            while (array[right]:getFirst() >= array[i]:getFirst() and right > left) do
                right = right - 1
            end

            self:swap(array, left, right)
        end

        -- Puts piv in the position it should be
        if (array[right]:getFirst() < array[i]:getFirst()) then
            self:swap(array, i, right)
        else
            self:swap(array, i, right - 1)
            right = right - 1
        end

        -- Recurse
        self:partitionPairs(array, i, right - 1)
        self:partitionPairs(array, right + 1, j)
    end
end

function Arrays.swap(self, array, i, j)
    local aux = array[i]
    array[i] = array[j]
    array[j] = aux
end


function Arrays.max(self, array)
    local acc = array[1]
    local index = 1

    for i=2, (# array) do
        if acc < array[i] then
            acc = array[i]
            index = i
        end
    end

    return index, acc
end

function Arrays.min(self, array)
    local acc = array[1]
    local index = 1

    for i=2, (# array) do
        if acc > array[i] then
            acc = array[i]
            index = i
        end
    end

    return index, acc
end

return Arrays.new()