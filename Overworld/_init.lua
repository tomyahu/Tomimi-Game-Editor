require "Global.application.application"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local OverworldView =  require "Overworld.view.OverworldView"
local RoomView = require "Overworld.view.rooms.RoomView"
local RoomManager = require "Overworld.view.rooms.RoomManager"
local OverworldCtrl = require "Overworld.ctrl.OverworldCtrl"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
local Player = require "Overworld.model.entities.Player"
local Room = require "Overworld.model.rooms.Room"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------

local player_frames = {}
player_frames[1] = RectFrame.new(0,0,32,32)

local player_sprite = Sprite.new(player_frames, "Resources/Overworld/Entities/Player.png")
local player = Player.new(player_sprite, 5, newPlayerHitboxes())


local wall_frames = {}
wall_frames[1] = RectFrame.new(0,0,32,32)

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

return {["ctrl"] = thisCtrl, ["view"] = thisView}