require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
local OverworldBehavior = require "Overworld.model.physics.behavior.OverworldBehavior"
--------------------------------------------------------------------------------------------------------

local OverworldCtrl = extend(Ctrl, function(self, view, player, room_manager)
    self.player = player
    self.room_manager = room_manager
    self.behavior = OverworldBehavior.new("SolidObjects", self.player)
end,

function(view, player_view, room_manager)
    return Ctrl.new(view)
end)

function OverworldCtrl.getContextVars(self, context)
    local new_context = {}
    new_context['SolidObjects'] = context['SolidObjects']
    return new_context
end

function OverworldCtrl.update(self,_)
    if love.keyboard.isDown("up") and love.keyboard.isDown("down") then
        self.player:moveBothY()
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
        self.player:moveBothX()
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