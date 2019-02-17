require "Global.application.application"
require "Global.LOVEWrapper.sprite.Sprite"
require "Global.LOVEWrapper.sprite.RectFrame"
require "Overworld.view.OverworldView"
require "Overworld.view.rooms.RoomView"
require "Overworld.view.rooms.RoomManager"
require "Overworld.ctrl.OverworldCtrl"
require "Overworld.model.entities.SolidEntity"
require "Overworld.model.entities.Player"
require "Overworld.model.rooms.Room"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------

local player_frames = {}
player_frames[0] = RectFrame.new(0,0,32,32)

local player_sprite = Sprite.new(player_frames, "Resources/Overworld/Entities/Player.png")
local player = Player.new(player_sprite, 5, newPlayerHitboxes())


local wall_frames = {}
wall_frames[0] = RectFrame.new(0,0,32,32)

local wall_sprite = Sprite.new(wall_frames, "Resources/Overworld/Entities/wall.png")
local wall1 = SolidEntity.new(wall_sprite, newWallHitboxes(32, 32))
wall1:setPos(100,100)

local room = Room.new("Resources/Overworld/Backgrounds/TestBackground.png", 1000, 1000)
room:addObject(player)
room:addObject(wall1)

local room_view = RoomView.new(room)

local room_manager = RoomManager.new()
room_manager:addRoom(room_view)

local thisView = OverworldView.new(room_manager)
local thisCtrl = OverworldCtrl.new(player)

application:registerApp("Overworld", thisView, thisCtrl)