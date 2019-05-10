require "lib.classes.class"
local RegularControl = require "Overworld.ctrl.controls.RegularControl"
--------------------------------------------------------------------------------------------------------
local DialogManager = class(function(self, view, ctrl)
    self.current_dialog = nil
    self.view = view
    self.ctrl = ctrl
end)

function DialogManager.setCurrentDialog(self, new_dialog)
    self.current_dialog = new_dialog
    self.current_dialog:reset()
    self.view:setCurrentMessage(self:getCurrentMessage())
end

function DialogManager.getCurrentDialog(self)
    return self.current_dialog
end

function DialogManager.getCurrentMessage(self)
    if self.current_dialog == nil then
        return nil
    else
        return self.current_dialog:getCurrentMessage()
    end
end

function DialogManager.isFinished(self)
    if self.current_dialog == nil then
        return true
    else
        return self.current_dialog:isFinished()
    end
end

function DialogManager.advanceMessage(self)
    if not (self.current_dialog == nil) then
        local finished = self.current_dialog:isFinished()

        self.current_dialog:advanceMessage()
        if not self.current_dialog:isFinished() then
            self.view:setCurrentMessage(self:getCurrentMessage())
        end

        if (not finished) and self.current_dialog:isFinished() then
            self.ctrl:setControls(RegularControl.new(self.ctrl))
            self.view:setCurrentMessage(nil)
        end
    end
end

return DialogManager