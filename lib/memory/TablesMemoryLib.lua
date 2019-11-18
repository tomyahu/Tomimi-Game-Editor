require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: TablesMemoryLib
-- A library class for table operations regarding memory
local TablesMemoryLib = class(function(self) end)

-- copy: any, table/nil -> table
-- returns a deep copy of the table 'obj' handling the tricky escenarios of
--      tables as keys
--      preserving metatables
--      recursive tables
function TablesMemoryLib.copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[TablesMemoryLib.copy(k, s)] = TablesMemoryLib.copy(v, s) end
    return res
end

return TablesMemoryLib.new()