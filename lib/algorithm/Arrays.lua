-- TODO: Create method to get min and max from an array
-- Ordering -----------------------------------------------------------------------------------------------------
-- Quicksort --

-- Quicksort for pair based arrays (arrays of pairs)
function quicksortPairs(array)
    partitionPairs(array, 1, (# array))
end

function partitionPairs(array, i, j)
    if (i < j) then
        -- Choose piv as the element right in the middle (or middle left if it doesn't exists)
        local piv = (i + j) /2

        -- swaps pivs and i element
        swap(array, i, piv)

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

            swap(array, left, right)
        end

        -- Puts piv in the position it should be
        if (array[right]:getFirst() < array[i]:getFirst()) then
            swap(array, i, right)
        else
            swap(array, i, right - 1)
            right = right - 1
        end

        -- Recurse
        partitionPairs(array, i, right - 1)
        partitionPairs(array, right + 1, j)
    end
end

function swap(array, i, j)
    local aux = array[i]
    array[i] = array[j]
    array[j] = aux
end