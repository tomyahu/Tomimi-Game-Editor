require "lib.classes.class"
local InteractuableSolidEntity = require "Overworld.model.entities.interactuable_entities.InteractuableSolidEntity"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: InteractuableAppChangeEntity
-- param: sprite:Sprite -> the sprite of the entity
-- param: hitboxes:list(Hitbox) -> the list of hitboxes of the entity
-- param: app_name:str -> the name of the app
-- An entity of the overworld that triggers an app change when the player interacts with it
local InteractuableAppChangeEntity = extend(InteractuableSolidEntity, function(self, sprite, hitboxes, app_name)
    self.app_name = app_name
end,

function(sprite, hitboxes, app_name)
    return InteractuableSolidEntity.new(sprite, hitboxes)
end)

-- interactWithPlayer: Player -> None
-- Changes the current application to another app
function InteractuableAppChangeEntity.interactWithPlayer(self, player)
    application:appChange(self.app_name)
end

return InteractuableAppChangeEntity