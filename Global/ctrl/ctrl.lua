require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local Ctrl = class(function(self, view)
    self.view = view
end)

-- callbackPressedKey: str -> None
-- Function called when user presses a key
function Ctrl.callbackPressedKey(_, _) end

-- callbackReleasedKey: str -> None
-- Function called when user releases a key
function Ctrl.callbackReleasedKey(_, _) end

-- update: int -> None
-- Function called every frame
function Ctrl.update(_, _) end

function Ctrl.getContextVars(_, _) end

return Ctrl
