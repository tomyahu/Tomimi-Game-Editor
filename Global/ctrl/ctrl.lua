require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Ctrl
-- param: view:View -> the view of the controller's application
-- Ctrl is the controller class of an App in the MVC model
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

-- setup: None -> None
-- Function called at the begining of the execution of an application
function Ctrl.setup(self) end

-- stop: None -> None
-- Function called at the end of the execution of an application
function Ctrl.stop(self) end

return Ctrl
