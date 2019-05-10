require "lib.classes.class"
local InteractuableSolidEntity = require "Overworld.model.entities.InteractuableSolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local InteractuableDialogEntity = extend(InteractuableSolidEntity, function(self, sprite, hitboxes, dialog)
    self.dialog = dialog
end,

function(sprite, hitboxes, dialog)
    return InteractuableSolidEntity.new(sprite, hitboxes)
end)

function InteractuableDialogEntity.interactWithPlayer(self, player)
    local ctrl = application:getCurrentCtrl()
    ctrl:startDialog(self.dialog)
end

return InteractuableDialogEntity