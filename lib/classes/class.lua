-- class: function -> class
-- Takes the constructor of the class, the constructor must be in the form function(self, ...) where
-- self refers to the same object being created.
function class(constructor)
    if not (type(constructor) == "function") then
        error("Parameter constructor must be a function.")
    end

    local TheClass = {}

    function TheClass.new(...)
        local o = {}
        local self = setmetatable(o, TheClass)
        constructor(self, ...)
        self.class = TheClass
        return self
    end

    TheClass.__index = TheClass

    return TheClass
end

-- extend: class, function, function -> class
-- Takes a parent class, the constructor of the class and a function that takes the same arguments as the constructor
-- and returns a new parent object. This exist in case the user wants to pass special arguments to the super class.
--
-- When the function takes 2 arguments it does the same as if superFun was function(...) return parent:new(...) end
function extend(parent, constructor, superFun)
    if not (type(parent) == "table") then
        error("Parameter parent must be a table, not " .. type(parent))
    elseif not (type(constructor) == "function") then
        error("Parameter constructor must be a function.")
    elseif not ((type(superFun) == "function") or (superFun == nil))then
        error("Parameter superFun must be a function.")
    end

    -- otra opcion es editar el diccionario de setmetatable para que no sea TheClass, si no que sea una funcion que haga
    -- el lookup y listo

    local TheClass = parent:new();
    TheClass.__index = TheClass

    function TheClass.new(...)
        local o
        local super
        if superFun == nil then
            o = parent.new(...)
            --o = {}
            super = parent.new(...)
        else
            o = superFun(...)
            super = parent.new(...)
            --o = {}
            --super = superFun(...)
            if not (type(o) == "table") then
                error("Function superFun must return a new parent object.")
            end
        end
        local self = setmetatable(o, TheClass)

        --[[
        local self = setmetatable(o, {
            __index = function(s, key)
                local current_obj = s
                local class_methods = {}
                local obj_vars = {}
                for k,v in pairs(current_obj.class) do
                    class_methods[k] = true
                end

                while (not (current_obj.super == nil)) and (class_methods[key] == nil) do
                    current_obj = current_obj.super
                    class_methods = {}
                    for k,v in pairs(current_obj.class) do
                        class_methods[k] = true
                    end
                end

                if class_methods[key] then
                    return function(self, ...) return current_obj.class[key](s, ...) end
                else
                    return table[key]
                end
            end
        }) ]] --

        constructor(self, ...)

        self.super = super
        self.class = TheClass
        return self
    end

    return TheClass
end