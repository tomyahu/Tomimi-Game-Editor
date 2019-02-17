require "Global.view.view"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
OverworldView = View.new()
OverworldView.__index = OverworldView

-- OverworldView: OverworldView
-- Creates a new OverworldView
function OverworldView.new(room_manager)
    local o = View.new()
    local self = setmetatable(o, OverworldView)
    self.__index = self
    self.room_manager = room_manager
    return self
end

function OverworldView.getContextVars(self, previous_context)
    local context = {}
    local local_context = application:getCurrentLocalContext()
    context['current_room'] = self.room_manager:getCurrentRoom()
    print("inicializar")
    context['current_room']:initialize(context)

    context['SolidObjects'] = local_context['SolidObjects']
    return context
end

function OverworldView.draw(self, context)
    context['current_room']:draw()
end
