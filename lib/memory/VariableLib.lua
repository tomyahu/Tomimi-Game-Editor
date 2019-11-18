require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: VariableLib
-- A library class to work with global and local memory
local VariableLib = class(function(self) end)

-- getGlobalVars: None -> table
-- returns a reference to the global variable table
function VariableLib.getGlobalVars()
    return _G
end

return VariableLib.new()