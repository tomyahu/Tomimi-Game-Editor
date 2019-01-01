--------------------------------------------------------------------------------------------------------
ArrayStack = {}
ArrayStack.__index = ArrayStack

function ArrayStack.new()
    local o = {}
    local self = setmetatable(o, ArrayStack)
    self.__index = self
    self.size = 0
    self.array = {}
    return self
end

function ArrayStack.isEmpty(self)
    return self.size == 0
end

function ArrayStack.top(self)
    if self.isEmpty then
        return nil
    else
        return self.array[self.size - 1]
    end
end

function ArrayStack.pop(self)
    local fin = self.top()
    if not fin == nil then
        self.array[self.size - 1] = nil
        self.size = self.size - 1
    end
    return fin
end

function ArrayStack.push(self, o)
    self.array[self.size] = o
    self.size = self.size + 1
end
