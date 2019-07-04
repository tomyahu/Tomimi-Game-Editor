require "lib.classes.class"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------

-- class: PreRegularControl
-- param: ctrl:Ctrl -> the controller of the overworld application
-- The controls that are available in a state previous to the default controls in the overworld
local PreRegularControl = extend(NullControl, function(self, ctrl)
    self.ctrl = ctrl
end,

function(ctrl)
    return NullControl.new()
end)

-- update: None -> None
-- Interprets the input from the player and acts accordingly
function PreRegularControl.update(self)
    local Regular_control_class = require("Overworld.ctrl.controls.RegularControl")
    self.ctrl:setControls(Regular_control_class.new(self.ctrl))
end

return PreRegularControl