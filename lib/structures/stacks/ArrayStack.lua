require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: ArrayStack
-- A stack object implemented with an array
local ArrayStack = class(function(self)
    self.size = 0
    self.array = {}
end)

-- isEmpty: None -> bool
-- Returns true if the stack is empry and false otherwise
function ArrayStack.isEmpty(self)
    return self.size == 0
end

-- top: None -> any
-- Returns the top element of the stack without extracting it
function ArrayStack.top(self)
    if self.isEmpty then
        return nil
    else
        return self.array[self.size - 1]
    end
end

-- pop: None -> any
-- Extracts the top element of the stack and returns it
function ArrayStack.pop(self)
    local fin = self.top()
    if not fin == nil then
        self.array[self.size - 1] = nil
        self.size = self.size - 1
    end
    return fin
end

-- push: any -> None
-- Puts a new element in the stack
function ArrayStack.push(self, o)
    self.array[self.size] = o
    self.size = self.size + 1
end

return ArrayStack