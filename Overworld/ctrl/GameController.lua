require "Default.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------
GameController = Ctrl:new()

-- GameController: GameController
-- Creates a new GameController
function GameController:new()
    local o = Ctrl:new()
    setmetatable(o, self)
    self.__index = self
    return o
end

