require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: String
-- Library class with static methods to work with strings
local String = class(function(self) end)

-- split: str, str -> list(str)
-- Returns a list of strings that has every segment of the initial string separated by sep in order
-- sep is "%s" that correspond to whitespace by default
-- This method was made by user973713 and edited by Adrian - Reinstate Monica in stack overflow
-- (https://stackoverflow.com/questions/1426954/split-string-in-lua)
function String.split (inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

return String