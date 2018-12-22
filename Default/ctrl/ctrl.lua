require "class"
require "Default.ctrl.Manager"
--------------------------------------------------------------------------------------------------------
-- Ctrl: Ctrl
-- Creates a Ctrl
Ctrl = class(function(ctrl)
    ctrl.managers = {}
end)

-- callbackPressedKey: str -> None
-- Function called when user presses a key
function Ctrl:callbackPressedKey(key)
    local aux = self.managers[key]
    if not (aux == nil) then
        aux.doAction()
    end
end
