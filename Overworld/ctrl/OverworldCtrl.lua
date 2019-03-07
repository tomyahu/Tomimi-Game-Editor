require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
local OverworldBehavior = require "Overworld.model.physics.behavior.OverworldBehavior"
--------------------------------------------------------------------------------------------------------

local OverworldCtrl = extend(Ctrl, function(self, player)
    self.player = player
    self.behavior = OverworldBehavior.new("SolidObjects", player)
end,

function(player)
    return Ctrl.new()
end)

function OverworldCtrl.update(self,_)
    if love.keyboard.isDown("up") and love.keyboard.isDown("down") then
    elseif love.keyboard.isDown("up") then
        self.player:moveUp()
        self.behavior:AllObjectsInteract()
    elseif love.keyboard.isDown("down") then
        self.player:moveDown()
        self.behavior:AllObjectsInteract()
        self.player:getSprite():setFrameSet(2)
    else
        self.player:stopY()
        self.player:getSprite():setFrameSet(1)
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