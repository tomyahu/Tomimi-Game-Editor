require "Default.view.view"
--------------------------------------------------------------------------------------------------------
OverworldView = View.new()
OverworldView.__index = OverworldView

-- OverworldView: OverworldView
-- Creates a new OverworldView
function OverworldView.new(entities)
    local o = Ctrl.new()
    local self = setmetatable(o, OverworldCtrl)
    self.__index = self
    self.entities = entities
    return self
end
