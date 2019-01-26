function quicksortPairs(array)
    partitionPairs(array, 1, (# array))
end

function partitionPairs(array, i, j)
    if (i < j) then
        local piv = math.random(i, j)

        swap(array, i, piv)

        local left = i
        local right = j

        while(left < right) do

            while (array[left]:getFirst() <= array[i]:getFirst() and left < j) do
                left = left + 1
            end

            while (array[right]:getFirst() > array[i]:getFirst() and right > i) do
                right = right - 1
            end

            if (left < right) then
                swap(array, left, right)
            end
        end

        swap(array, i, right)

        partitionPairs(array, i, left - 1)
        partitionPairs(array, left + 1, j)
    end
end

function swap(array, i, j)
    local aux = array[i]
    array[i] = array[j]
    array[j] = aux
end