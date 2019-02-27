local Ctrl = require "Global.ctrl.ctrl"
local OverworldBehavior = require "Overworld.model.physics.behavior.OverworldBehavior"
--------------------------------------------------------------------------------------------------------
local OverworldCtrl = Ctrl:new()
OverworldCtrl.__index = OverworldCtrl

-- OverworldCtrl: OverworldCtrl
-- Creates a new OverworldCtrl
function OverworldCtrl.new(player)
    local o = Ctrl.new()
    local self = setmetatable(o, OverworldCtrl)
    self.__index = self
    self.player = player
    self.behavior = OverworldBehavior.new("SolidObjects", player)
    return self
end

function OverworldCtrl.update(self,_)
    if love.keyboard.isDown("up") and love.keyboard.isDown("down") then
    elseif love.keyboard.isDown("up") then
        self.player:moveUp()
        self.behavior:AllObjectsInteract()
    elseif love.keyboard.isDown("down") then
        self.player:moveDown()
        self.behavior:AllObjectsInteract()
    else
        self.player:stopY()
    end

    if love.keyboard.isDown("left") and love.keyboard.isDown("right") then
    elseif love.keyboard.isDown("left") then
        self.player:moveLeft()
        self.behavior:AllObjectsInteract()
    elseif love.keyboard.isDown("right") then
        self.player:moveRight()
        self.behavior:AllObjectsInteract()
    else
        self.player:stopX()
    end

end

return OverworldCtrl