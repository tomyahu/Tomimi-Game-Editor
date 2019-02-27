require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------
local View = class(function(self) end)

-- View: View
-- Creates a View
function View.new()
    local o = {}
    local self = setmetatable(o, View)
    self.__index = self
    return self
end

function View.draw(_,_) end

function View.getContextVars(_, _) end

return View