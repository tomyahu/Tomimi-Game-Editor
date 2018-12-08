require "class"
--------------------------------------------------------------------------------------------------------
ArrayStack = class(function (stack)
    stack.size = 0
    stack.array = {}
end)

function ArrayStack:isEmpty()
    return stack.size == 0
end

function ArrayStack:top()
    if self.isEmpty then
        return nil
    else
        return self.array[self.size - 1]
    end
end

function ArrayStack:pop()
    fin = self.top()
    if not fin == nil then
        self.array[self.size - 1] = nil
        self.size = self.size - 1
    end
    return fin
end

function ArrayStack:push(o)
    self.array[self.size] = o
    self.size = self.size + 1
end