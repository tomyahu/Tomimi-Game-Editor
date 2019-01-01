--------------------------------------------------------------------------------------------------------
Ctrl = {}
Ctrl.__index = Ctrl

-- Ctrl: Ctrl
-- Creates a Ctrl
function Ctrl.new()
    local o = {}
    local self = setmetatable(o, Ctrl)
    self.__index = self
    return self
end

-- callbackPressedKey: str -> None
-- Function called when user presses a key
function Ctrl.callbackPressedKey(self, key)

end
