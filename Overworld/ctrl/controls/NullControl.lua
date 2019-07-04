require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NullControl
-- Null Pattern for the Controls object family
local NullControl = class(function(self) end)

-- update: None -> None
-- Interprets the input from the player and acts accordingly (does nothing)
function NullControl.update(self) end

return NullControl