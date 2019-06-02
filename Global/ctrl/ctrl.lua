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

-- getContextVars: table -> None
-- Function called every time the application is changed to this application. It takes the current local context and
-- returns a new local context that is setted in the application manager.
-- TODO: Check if the local context is still used
function Ctrl.getContextVars(_, context) end

return Ctrl
