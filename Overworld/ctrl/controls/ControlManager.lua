require "lib.classes.class"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------

-- class: ControlManager
-- The basic manager of the current player controls
local ControlManager = class(function(self)
    self.controls = NullControl.new()
end)

-- update: None -> None
-- Calls the update function of the current controls
function ControlManager.update(self)
    self.controls:update()
end

-- setControls: Control -> None
-- Sets the current controls to new_controls
function ControlManager.setControls(self, new_controls)
    self.controls = new_controls
end

return ControlManager