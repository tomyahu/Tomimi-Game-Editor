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
function Ctrl.callbackPressedKey(_, _) end

-- callbackReleasedKey: str -> None
-- Function called when user releases a key
function Ctrl.callbackReleasedKey(_, _) end

-- update: int -> None
-- Function called every frame
function Ctrl.update(_, _) end
