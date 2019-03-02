require "lib.classes.class"
local View = require "Global.view.view"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

local OverworldView = extend(View, function(self, room_manager)
    self.room_manager = room_manager
end,

function(room_manager)
    return View.new()
end)

function OverworldView.getContextVars(self, _)
    local context = {}
    local local_context = application:getCurrentLocalContext()
    context['current_room'] = self.room_manager:getCurrentRoom()
    context['current_room']:initialize(context)

    context['SolidObjects'] = local_context['SolidObjects']
    return context
end

function OverworldView.draw(_, context)
    context['current_room']:draw()
end

return OverworldView