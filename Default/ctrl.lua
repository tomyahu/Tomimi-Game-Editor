require "class"
require "Default.Manager"
--------------------------------------------------------------------------------------------------------
-- Ctrl: Ctrl
-- Creates a Ctrl
Ctrl = class(function(ctrl)
    ctrl.managers = {}
    ctrl.managers['default'] = Manager()
end)

-- callbackPressedKey: str -> None
-- Function called when user presses a key
function Ctrl:callbackPressedKey(key)
    local aux = self.managers[key]
    if aux == nil then
        self.managers['default'].doAction()
    else
        aux.doAction()
    end
end
