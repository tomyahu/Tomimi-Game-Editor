require "lib.classes.class"
local InteractuableSolidEntity = require "Overworld.model.entities.InteractuableSolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: InteractuableDialogEntity
-- param: sprite:Sprite -> the sprite of the entity
-- param: hitboxes:list(Hitbox) -> the list of hitboxes of the entity
-- param: dialog:Dialog -> the dialog that will be triggered when the player interacts with the function
-- An entity of the overworld that triggers a dialog when the player interacts with it
local InteractuableDialogEntity = extend(InteractuableSolidEntity, function(self, sprite, hitboxes, dialog)
    self.dialog = dialog
end,

function(sprite, hitboxes, dialog)
    return InteractuableSolidEntity.new(sprite, hitboxes)
end)

-- interactWithPlayer: Player -> None
-- Starts the entity's dialog when the player interacts with it
function InteractuableDialogEntity.interactWithPlayer(self, player)
    local ctrl = application:getCurrentCtrl()
    ctrl:startDialog(self.dialog)
end

return InteractuableDialogEntity