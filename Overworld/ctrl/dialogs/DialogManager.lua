require "lib.classes.class"
local RegularControl = require "Overworld.ctrl.controls.RegularControl"
--------------------------------------------------------------------------------------------------------

-- class: DialogManager
-- param: view:View -> the view of the overworld application
-- param: ctrl:Ctrl -> the controller of the overworld application
-- The manager of the dialogs shown in the application
local DialogManager = class(function(self, view, ctrl)
    self.current_dialog = nil
    self.view = view
    self.ctrl = ctrl
end)

-- setCurrentDialog: Dialog -> None
-- Sets the current dialog to new_dialog
function DialogManager.setCurrentDialog(self, new_dialog)
    self.current_dialog = new_dialog
    self.current_dialog:reset()
    self.view:setCurrentMessage(self:getCurrentMessage())
end

-- getCurrentDialog: None -> Dialog
-- Gets the current dialog
function DialogManager.getCurrentDialog(self)
    return self.current_dialog
end

-- getCurrentMessage: None -> str
-- Gets the current message to show
function DialogManager.getCurrentMessage(self)
    if self.current_dialog == nil then
        return nil
    else
        return self.current_dialog:getCurrentMessage()
    end
end

-- isFinished: -> bool
-- Returns a boolean that says if the dialog has ended or not
function DialogManager.isFinished(self)
    if self.current_dialog == nil then
        return true
    else
        return self.current_dialog:isFinished()
    end
end

-- advanceMessage: None -> None
-- Advances a message in the current dialog
function DialogManager.advanceMessage(self)
    -- If the current dialog is not null
    if not (self.current_dialog == nil) then
        -- Check if the current dialog has ended
        local finished = self.current_dialog:isFinished()

        -- Advances the current message of the dialog
        self.current_dialog:advanceMessage()
        if not self.current_dialog:isFinished() then
            -- If the dialog hasn't finished display the current message
            self.view:setCurrentMessage(self:getCurrentMessage())
        end

        -- if the dialog wasn't finished before the message advancing, change the controls back to the regular controls
        -- and dont show any message
        if (not finished) and self.current_dialog:isFinished() then
            self.ctrl:setControls(RegularControl.new(self.ctrl))
            self.view:setCurrentMessage(nil)
        end
    end
end

return DialogManager