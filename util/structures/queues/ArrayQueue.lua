--------------------------------------------------------------------------------------------------------
ArrayQueue = {}
ArrayQueue.__index = ArrayQueue

function ArrayQueue.new()
    local o = {}
    local self = setmetatable(o, ArrayQueue)
    self.__index = self
    self.size = 0
    self.capacity = 0
    self.start = 0
    self.array = {}
    return self
end

function ArrayQueue.isEmpty(self)
    return self.size == 0
end

function ArrayQueue.dequeue(self)
    local fin
    if not self.isEmpty() then
        fin = self.array[queue.start]
        self.array[queue.start] = nil
        self.start = (self.start + 1) % self.capacity
        self.size = self.size - 1
    end
    return fin
end

function ArrayQueue.enqueue(self, o)
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

function ArrayQueue:getEnd(self)
    return (self.start + self.size - 1) % self.capacity
end