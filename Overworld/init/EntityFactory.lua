require "Global.consts"
require "lib.classes.class"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local TimedSprite = require "Global.LOVEWrapper.sprite.TimedSprite"
local NullSprite = require "Global.LOVEWrapper.sprite.NullSprite"
local InteractuableDialogEntity = require "Overworld.model.entities.InteractuableDialogEntity"
local ChangeRoomPad = require "Overworld.model.entities.contact_entities.ChangeRoomPad"
local DialogBuilder = require "Overworld.model.dialog.DialogBuilder"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------
local EntityFactory = class(function(self) end)

function EntityFactory.createOneTileObject(self, path, text)
    local entity_frames = {}
    entity_frames[1] = {}
    entity_frames[1][1] = RectFrame.new(0,0,64,64)

    local entity_sprite = TimedSprite.new(entity_frames, RESOURCES_PATH .. path)

    local dialogBuild = DialogBuilder.new()
    dialogBuild:addMessage(text)

    local entity = InteractuableDialogEntity.new(entity_sprite, newEntityHitboxes(), dialogBuild:getDialog())

    return entity
end

function EntityFactory.createIvisibleChangeRoomPad(self, room_index, newx, newy)
    local pad = ChangeRoomPad.new(NullSprite.new(), newEntityHitboxes(), room_index, newx, newy)
    return pad
end

return EntityFactory