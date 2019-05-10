require "lib.classes.class"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------
local RegularControl = extend(NullControl, function(self, ctrl)
    self.player = ctrl.player
    self.behavior = ctrl.behavior
    self.ctrl = ctrl
    self.z_key_pressed = true
end,

function(ctrl)
    return NullControl.new()
end)

function RegularControl.update(self)
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

    if love.keyboard.isDown("z") and (not self.z_key_pressed) then
        self.player:interact()
    end

    if love.keyboard.isDown("z") then
        self.z_key_pressed = true
    else
        self.z_key_pressed = false
    end
end

return RegularControl