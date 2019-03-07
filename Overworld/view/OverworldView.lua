require "lib.classes.class"
require "Global.consts"
local View = require "Global.view.view"
require "Global.application.application"
local Camera = require "lib.cameras.Camera"
--------------------------------------------------------------------------------------------------------

local OverworldView = extend(View, function(self, room_manager, player)
    self.room_manager = room_manager
    self.player = player
    self.camera = Camera.new(GAME_WIDTH/2, GAME_HEIGHT/2, 1)
end,

function(room_manager, player)
    return View.new()
end)

function OverworldView.getContextVars(self, _)
    local context = {}
    local local_context = application:getCurrentLocalContext()
    context['current_room'] = self.room_manager:getCurrentRoom()
    context['current_room']:initialize(context, self.camera)

    context['SolidObjects'] = local_context['SolidObjects']
    return context
end

function OverworldView.draw(self, context)
    self.player:getSprite():advanceTime(0.1)

    local px, py = self.player:getPos()
    self.camera:setCenter(px+32, py+32)
    context['current_room']:draw()
end

return OverworldView