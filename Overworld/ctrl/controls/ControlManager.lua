require "lib.classes.class"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------
local ControlManager = class(function(self)
    self.controls = NullControl.new()
end)

function ControlManager.update(self)
    self.controls:update()
end

function ControlManager.setControls(self, new_controls)
    self.controls = new_controls
end

return ControlManager