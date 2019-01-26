require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------
View = {}
View.__index = View

-- View: View
-- Creates a View
function View.new()
    local o = {}
    local self = setmetatable(o, View)
    self.__index = self
    return self
end

function View.draw(self,context) end

function View.getContextVars(self) end