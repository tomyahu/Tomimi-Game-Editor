require "lib.classes.class"
require "Global.consts"
local View = require "Global.view.view"
require "Global.application.application"
local Camera = require "lib.cameras.Camera"
local RoomView = require "Overworld.view.rooms.RoomView"
local PlayerView = require "Overworld.view.player.PlayerView"
--------------------------------------------------------------------------------------------------------

local OverworldView = extend(View, function(self, current_room, player)
    self.current_room_view = RoomView.new(current_room)
    self.player = PlayerView.new(player)
    self.camera = Camera.new(GAME_WIDTH/2, GAME_HEIGHT/2, 1)

    self.current_room_view:initialize(self.camera)
end,

function(room_manager, player)
    return View.new()
end)

function OverworldView.setCurrentRoom(self, new_room)
    self.current_room_view = RoomView.new(new_room)
    self.current_room_view:initialize(self.camera)
end

function OverworldView.getContextVars(self, context)
    return context
end

function OverworldView.draw(self, context)
    self.player:getSprite():advanceTime(0.1)
    self.player:checkState()

    local px, py = self.player:getPos()
    self.camera:setCenter(px+32, py+32)
    self.current_room_view:draw()
end

return OverworldView