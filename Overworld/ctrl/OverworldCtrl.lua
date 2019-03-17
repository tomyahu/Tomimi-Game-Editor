require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
local OverworldBehavior = require "Overworld.model.physics.behavior.OverworldBehavior"
--------------------------------------------------------------------------------------------------------

local OverworldCtrl = extend(Ctrl, function(self, player_view)
    self.player_view = player_view
    self.player = player_view:getEntity()
    self.behavior = OverworldBehavior.new("SolidObjects", self.player)
end,

function(player)
    return Ctrl.new()
end)

function OverworldCtrl.update(self,_)
    if love.keyboard.isDown("up") and love.keyboard.isDown("down") then
        self.player:moveBothY()
        self.player_view:moveBothY()
    elseif love.keyboard.isDown("up") then
        self.player:moveUp()
        self.player_view:moveUp()
        self.behavior:AllObjectsInteract()
    elseif love.keyboard.isDown("down") then
        self.player:moveDown()
        self.player_view:moveDown()
        self.behavior:AllObjectsInteract()
    else
        self.player:stopY()
        self.player_view:stopY()
    end

    if love.keyboard.isDown("left") and love.keyboard.isDown("right") then
        self.player:moveBothX()
        self.player_view:moveBothX()
    elseif love.keyboard.isDown("left") then
        self.player:moveLeft()
        self.player_view:moveLeft()
        self.behavior:AllObjectsInteract()
    elseif love.keyboard.isDown("right") then
        self.player:moveRight()
        self.player_view:moveRight()
        self.behavior:AllObjectsInteract()
    else
        self.player:stopX()
        self.player_view:stopX()
    end

end

return OverworldCtrl