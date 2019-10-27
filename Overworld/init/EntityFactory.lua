require "Global.consts"
require "lib.classes.class"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local TimedSprite = require "Global.LOVEWrapper.sprite.TimedSprite"
local NullSprite = require "Global.LOVEWrapper.sprite.NullSprite"
local InteractuableDialogEntity = require "Overworld.model.entities.interactuable_entities.InteractuableDialogEntity"
local InteractuableAppChangeEntity = require "Overworld.model.entities.interactuable_entities.InteractuableAppChangeEntity"
local ChangeRoomPad = require "Overworld.model.entities.contact_entities.ChangeRoomPad"
local DialogBuilder = require "Overworld.model.dialog.DialogBuilder"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------
local EntityFactory = class(function(self) end)

function EntityFactory.createOneTileAppChangeObject(self, path, app_name)
    local entity_frames = {}
    entity_frames[1] = {}
    entity_frames[1][1] = RectFrame.new(0,0,64,64)

    local entity_sprite = TimedSprite.new(entity_frames, RESOURCES_PATH .. path)

    local entity = InteractuableAppChangeEntity.new(entity_sprite, newEntityHitboxes(), app_name)

    return entity
end

function EntityFactory.createOneTileDialogObject(self, path, texts)
    local entity_frames = {}
    entity_frames[1] = {}
    entity_frames[1][1] = RectFrame.new(0,0,64,64)

    local entity_sprite = TimedSprite.new(entity_frames, RESOURCES_PATH .. path)

    local dialogBuild = DialogBuilder.new()
    if type(texts) == "string" then
      dialogBuild:addMessage(texts)
    elseif type(texts) == "table" then
      for _, text in pairs(texts) do
        dialogBuild:addMessage(text)
      end
    else
      error("Texts must be a string or a list of strings")
    end

    local entity = InteractuableDialogEntity.new(entity_sprite, newEntityHitboxes(), dialogBuild:getDialog())

    return entity
end

function EntityFactory.createInvisibleChangeRoomPad(self, room_index, newx, newy)
    local pad = ChangeRoomPad.new(NullSprite.new(), newEntityHitboxes(), room_index, newx, newy)
    return pad
end

return EntityFactory