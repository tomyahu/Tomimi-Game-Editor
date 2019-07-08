require "lib.classes.class"
require "Global.consts"
local View = require "Global.view.view"
require "Global.application.application"
local Camera = require "lib.cameras.Camera"
local RoomView = require "Overworld.view.rooms.RoomView"
local PlayerView = require "Overworld.view.player.PlayerView"
local Message = require "Overworld.model.dialog.messages.Message"
local BasicMessageView = require "Overworld.view.messages.BasicMessageView"
local NullMessageView = require "Overworld.view.messages.NullMessageView"
--------------------------------------------------------------------------------------------------------

-- class: OverworldView
-- param: current_room:Room -> the current room object to display
-- param: player:Player -> the player object
-- The view of the overworld application
local OverworldView = extend(View, function(self, current_room, player)
    self.current_room_view = RoomView.new(current_room)
    self.player = PlayerView.new(player)
    self.camera = Camera.new(GAME_WIDTH/2, GAME_HEIGHT/2, 1)
    self.current_message = NullMessageView.new()

    self.current_room_view:initialize(self.camera)
end,

function(room_manager, player)
    return View.new()
end)

-- setCurrentRoom: Room -> None
-- Sets the current room to display
function OverworldView.setCurrentRoom(self, new_room)
    self.current_room_view = RoomView.new(new_room)
    self.current_room_view:initialize(self.camera)
end

-- setCurrentMessage: Message -> None
-- Sets the current message display
function OverworldView.setCurrentMessage(self, new_message)
    if new_message == nil then
        self.current_message = NullMessageView.new()
    else
        self.current_message = BasicMessageView.new(new_message)
    end
end

-- getContextVars: dict() -> dict()
-- Leaves the context as it is
function OverworldView.getContextVars(self, context)
    return context
end

-- draw: dict() -> None
-- Draws the player based on its state, sets the camera, draws the room and finally it draws the message to display
function OverworldView.draw(self, context)
    self.player:getSprite():advanceTime(0.1)
    self.player:checkState()

    local px, py = self.player:getPos()
    self.camera:setCenter(px+32, py+32)
    self.current_room_view:draw()
    self.current_message:draw()
end

return OverworldView