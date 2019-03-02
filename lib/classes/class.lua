-- class: function -> class
-- Takes the constructor of the class, the constructor must be in the form function(self, ...) where
-- self refers to the same object being created.
function class(constructor)
    local TheClass = {}
    TheClass.__index = TheClass

    function TheClass.new(...)
        local o = {}
        local self = setmetatable(o, TheClass)
        self.__index = self
        constructor(self, ...)
        return self
    end

    return TheClass
end

-- extend: class, function, function -> class
-- Takes a parent class, the constructor of the class and a function that takes the same arguments as the constructor
-- and returns a new parent object. This exist in case the user wants to pass special arguments to the super class.
--
-- When the function takes 2 arguments it does the same as if superFun was function(...) return parent:new(...) end
function extend(parent, constructor, superFun)
    local TheClass = parent:new();
    TheClass.__index = TheClass

    function TheClass.new(...)
        local o
        if superFun == nil then
            o = parent.new(...)
        else
            o = superFun(...)
        end
        local self = setmetatable(o, TheClass)
        self.__index = self
        constructor(self, ...)
        return self
    end

    return TheClass
end