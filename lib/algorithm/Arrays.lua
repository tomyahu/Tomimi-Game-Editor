function quicksortPairs(array)
    partitionPairs(array, 1, (# array))
end

function partitionPairs(array, i, j)
    if (i < j) then
        local piv = math.random(i, j)

        swap(array, i, piv)

        local left = i+1
        local right = j

        while(left < right) do

            while (array[left]:getFirst() < array[i]:getFirst() and left < right) do
                left = left + 1
            end

            while (array[right]:getFirst() >= array[i]:getFirst() and right > left) do
                right = right - 1
            end

            swap(array, left, right)
        end

        if (array[right]:getFirst() < array[i]:getFirst()) then
            swap(array, i, right)
        else
            swap(array, i, right - 1)
            right = right - 1
        end

        partitionPairs(array, i, right - 1)
        partitionPairs(array, right + 1, j)
    end
end

function swap(array, i, j)
    local aux = array[i]
    array[i] = array[j]
    array[j] = aux
end