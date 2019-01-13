require "Default.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------
OverworldCtrl = Ctrl:new()
OverworldCtrl.__index = OverworldCtrl

-- OverworldCtrl: OverworldCtrl
-- Creates a new OverworldCtrl
function OverworldCtrl:new(player)
    local o = Ctrl.new()
    self = setmetatable(o, OverworldCtrl)
    self.__index = self
    self.player = player
    return self
end

