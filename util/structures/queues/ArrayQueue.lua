require "class"
--------------------------------------------------------------------------------------------------------
ArrayQueue = class(function (queue)
    queue.size = 0
    queue.capacity = 0
    queue.start = 0
    queue.array = {}
end)

function ArrayQueue:isEmpty()
    return self.size == 0
end

function ArrayQueue:dequeue()
    local fin = nil
    if not self.isEmpty() then
        fin = self.array[queue.start]
        self.array[queue.start] = nil
        self.start = (self.start + 1) % self.capacity
        self.size = self.size - 1
    end
    return fin
end

function ArrayQueue:enqueue(o)
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

function ArrayQueue:getEnd()
    return (self.start + self.size - 1) % self.capacity
end