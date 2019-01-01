require "Default.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------
GameController = Ctrl:new()
GameController.__index = GameController

-- GameController: GameController
-- Creates a new GameController
function GameController:new()
    local o = Ctrl.new()
    self = setmetatable(o, GameController)
    self.__index = self
    return self
end

