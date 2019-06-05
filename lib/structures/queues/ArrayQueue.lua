require "lib.classes.class"
-- TODO: Implement queue with node list
--------------------------------------------------------------------------------------------------------

-- class: ArrayQueue
-- A queue object implemented with an array
local ArrayQueue = class(function(self)
    self.size = 0
    self.capacity = 0
    self.start = 0
    self.array = {}
end)

-- isEmpty: None -> None
-- Checks if the queue is empty
function ArrayQueue.isEmpty(self)
    return self.size == 0
end

-- pop: None -> any
-- Extracts the first element of the queue and returns it
function ArrayQueue.pop(self)
    local fin
    if not self.isEmpty() then
        fin = self.array[queue.start]
        self.array[queue.start] = nil
        self.start = (self.start + 1) % self.capacity
        self.size = self.size - 1
    end
    return fin
end

-- push: any -> None
-- pushes a new element into the array:
function ArrayQueue.push(self, o)
    if self.size == self.capacity then
        for i = self.getEnd() + 1, self.capacity - 1 do
            self.array[i + self.capacity] = self.array[i]
            self.array[i] = nil
        end
        self.capacity = self.capacity * 2
    end
    self.size = self.size + 1
    self.array[self.getEnd()] = o
end

-- getEnd: None -> num
-- Gets the ending position of an array
function ArrayQueue.getEnd(self)
    return (self.start + self.size - 1) % self.capacity
end

return ArrayQueue