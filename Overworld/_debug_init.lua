require "Global.consts"
require "Global.application.application"
local TimedSprite = require "Global.LOVEWrapper.sprite.TimedSprite"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local OverworldView =  require "Overworld.view.OverworldView"
local RoomManager = require "Overworld.ctrl.rooms.RoomManager"
local OverworldCtrl = require "Overworld.ctrl.OverworldCtrl"
local Player = require "Overworld.model.entities.Player"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------
-- Set Font
local font = love.graphics.newFont("Resources/Fonts/RegularFonts/PIXEAB__.TTF", 18)

-- Player Sprite
local player_frames = {}
player_frames[1] = {}
player_frames[1][1] = RectFrame.new(0,0,64,64)
player_frames[1][2] = RectFrame.new(64,0,64,64)

player_frames[2] = {}
player_frames[2][1] = RectFrame.new(0,64,64,64)
player_frames[2][2] = RectFrame.new(64,64,64,64)

player_frames[3] = {}
player_frames[3][1] = RectFrame.new(0,128,64,64)
player_frames[3][2] = RectFrame.new(64,128,64,64)

player_frames[4] = {}
player_frames[4][1] = RectFrame.new(0,192,64,64)
player_frames[4][2] = RectFrame.new(64,192,64,64)

player_frames[5] = {}
player_frames[5][1] = RectFrame.new(0,256,64,64)
player_frames[5][2] = RectFrame.new(64,256,64,64)
player_frames[5][3] = RectFrame.new(128,256,64,64)
player_frames[5][4] = RectFrame.new(192,256,64,64)

player_frames[6] = {}
player_frames[6][1] = RectFrame.new(0,320,64,64)
player_frames[6][2] = RectFrame.new(64,320,64,64)
player_frames[6][3] = RectFrame.new(128,320,64,64)
player_frames[6][4] = RectFrame.new(192,320,64,64)

player_frames[7] = {}
player_frames[7][1] = RectFrame.new(0,384,64,64)
player_frames[7][2] = RectFrame.new(64,384,64,64)
player_frames[7][3] = RectFrame.new(128,384,64,64)
player_frames[7][4] = RectFrame.new(192,384,64,64)

player_frames[8] = {}
player_frames[8][1] = RectFrame.new(0,448,64,64)
player_frames[8][2] = RectFrame.new(64,448,64,64)
player_frames[8][3] = RectFrame.new(128,448,64,64)
player_frames[8][4] = RectFrame.new(192,448,64,64)

local player_sprite = TimedSprite.new(player_frames, RESOURCES_PATH .. "/Overworld/Entities/[Chara]Mac.png")
local player = Player.new(player_sprite, 200, newPlayerHitboxes(), newPlayerInteractuableHitboxes())

local room_manager = RoomManager.new()
room_manager:addRoom("Overworld.init.debug_rooms.Room1", "Room1")
room_manager:addRoom("Overworld.init.debug_rooms.Room2", "Room2")

local thisView = OverworldView.new(room_manager:getCurrentRoom(), player, font)
local thisCtrl = OverworldCtrl.new(thisView, player, room_manager)

return {["ctrl"] = thisCtrl, ["view"] = thisView}