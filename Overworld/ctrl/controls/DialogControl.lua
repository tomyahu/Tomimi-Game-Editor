require "lib.classes.class"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------

-- class: DialogControl
-- param: ctrl:Ctrl -> the controller of the overworld application
-- The controls that are available when there is a dialog going on
local DialogControl = extend(NullControl, function(self, ctrl)
    self.dialog_manager = ctrl.dialog_manager
    self.controls_manager = ctrl.controls_manager
    self.ctrl = ctrl
    self.z_key_pressed = true
end,

function(ctrl)
    return NullControl.new()
end)

-- update: None -> None
-- Interprets the input from the player and acts accordingly
function DialogControl.update(self)
    -- If the dialog finished the player goes back to the regular controls
    if self.dialog_manager:isFinished() then
        local Regular_control_class = require("Overworld.ctrl.controls.RegularControl")
        self.controls_manager:setControls(Regular_control_class.new(self.ctrl))
    end

    -- If the z key is pressed advance the current dialog
    if (love.keyboard.isDown("z")) and (not self.z_key_pressed) then
        if not self.dialog_manager:isFinished() then
            self.dialog_manager:advanceMessage()
        end
    end

    -- This part is here to check if the z key was just pressed or not
    if love.keyboard.isDown("z") then
        self.z_key_pressed = true
    else
        self.z_key_pressed = false
    end

end


return DialogControl