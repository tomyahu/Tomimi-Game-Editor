require "lib.classes.class"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------
local DialogControl = extend(NullControl, function(self, ctrl)
    self.dialog_manager = ctrl.dialog_manager
    self.controls_manager = ctrl.controls_manager
    self.ctrl = ctrl
    self.z_key_pressed = true
end,

function(ctrl)
    return NullControl.new()
end)

function DialogControl.update(self)
    if self.dialog_manager:isFinished() then
        local Regular_control_class = require("Overworld.ctrl.controls.RegularControl")
        self.controls_manager:setControls(Regular_control_class.new(self.ctrl))
    end

    if (love.keyboard.isDown("z")) and (not self.z_key_pressed) then
        if not self.dialog_manager:isFinished() then
            self.dialog_manager:advanceMessage()
        end
    end

    if love.keyboard.isDown("z") then
        self.z_key_pressed = true
    else
        self.z_key_pressed = false
    end

end


return DialogControl