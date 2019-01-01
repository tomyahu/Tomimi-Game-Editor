require "Default.view.view"
--------------------------------------------------------------------------------------------------------
GameView = View.new()
GameView.__index = GameView

-- GameView: GameView
-- Creates a new GameView
function GameView.new()
    local o = Ctrl.new()
    local self = setmetatable(o, GameController)
    self.__index = self
    return self
end
