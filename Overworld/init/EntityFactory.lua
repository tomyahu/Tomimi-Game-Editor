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

-- class: EntityFactory
-- A factory class to create overworld entities
local EntityFactory = class(function(self) end)

-- createOneTileAppChangeObject: str, str -> InteractuableAppChangeEntity
-- Creates an interactuable entity that on contact it changes the current app. For this it takes the path of the sprite
-- of the entity and the name of the app to change.
function EntityFactory.createOneTileAppChangeObject(self, path, app_name)
    local entity_frames = {}
    entity_frames[1] = {}
    entity_frames[1][1] = RectFrame.new(0,0,64,64)

    local entity_sprite = TimedSprite.new(entity_frames, RESOURCES_PATH .. path)

    local entity = InteractuableAppChangeEntity.new(entity_sprite, newEntityHitboxes(), app_name)

    return entity
end

-- createOneTileDialogObject: str, str/list(str) -> InteractuableDialogEntity
-- Takes a sprite path and a text (or list of texts like {'hello', 'how are you'}) and it creates an entity that upon
-- interaction it displays the dialog used. If the texts are a list then every text will be in a text message, if it is
-- a string only one message will be displayed.
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

-- createOneTileConversationObject: str, list({texts:list(str), character:str, avatar_img_path:str}) -> InteractuableDialogEntity
-- Takes a sprite path and a table that represents a list of texts and it creates an entity that upon
-- interaction it displays the dialog used. The table must be a list of tables, where each one represents a character
-- speaking. Each element must be composed of a list of texts, the character name and the character icon sprite path.
function EntityFactory.createOneTileConversationObject(self, path, dialog_table)
    local entity_frames = {}
    entity_frames[1] = {}
    entity_frames[1][1] = RectFrame.new(0,0,64,64)

    local entity_sprite = TimedSprite.new(entity_frames, RESOURCES_PATH .. path)

    local dialogBuild = DialogBuilder.new()
    
    for _, element in pairs(dialog_table) do
        if type(element.character) ~= "string" then
            error("Dialog table content character is not a string")
            -- error("Dialog table must be a table of contents {<texts:list(str)>, <character:str>, <avatar_img_path:str>}")
        elseif type(element.avatar_img_path) ~= "string" then
            error("Dialog table content avatar_img_path is not a string")
        end
        
        local texts = element.texts
        
        if type(texts) == "string" then
            dialogBuild:addMessage(texts)
        elseif type(texts) == "table" then
            for _, text in pairs(texts) do
                if type(text) ~= "string" then
                    error("Dialog table element has a text element that is not a string")
                end
                
                dialogBuild:addAvatarCharacterMessage(text, element.character, element.avatar_img_path)
            end
        else
            error("Dialog table content texts are not a string nor a list of strings")
        end
        
    end

    local entity = InteractuableDialogEntity.new(entity_sprite, newEntityHitboxes(), dialogBuild:getDialog())

    return entity
end

-- createInvisibleChangeRoomPad: int, num, num -> ChangeRoomPad
-- Creates a new entity which upon contact it changes the current room. It takes the new room index, the new x of the
-- character in the new room and the new y
function EntityFactory.createInvisibleChangeRoomPad(self, room_index, newx, newy)
    local pad = ChangeRoomPad.new(NullSprite.new(), newEntityHitboxes(), room_index, newx, newy)
    return pad
end

return EntityFactory