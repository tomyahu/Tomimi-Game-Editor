require "lib.classes.class"
require "Global.application.application"
local NullControl = require "Overworld.ctrl.controls.NullControl"
--------------------------------------------------------------------------------------------------------

-- class: RegularControl
-- param: ctrl:Ctrl -> the controller of the overworld application
-- The controls that are available by default in the overworld
local RegularControl = extend(NullControl, function(self, ctrl)
    self.player = ctrl.player
    self.behavior = ctrl.behavior
    self.interactuable_behavior = ctrl.interactuable_behavior
    self.ctrl = ctrl
    self.action_key_pressed = true
end,

function(ctrl)
    return NullControl.new()
end)

-- update: None -> None
-- Interprets the input from the player and acts accordingly
function RegularControl.update(self)
    -- Puts itself in all combinations of up and down keys pressed
    if love.keyboard.isDown(UP_BUTTON) and love.keyboard.isDown(DOWN_BUTTON) then
        self.player:moveBothY()
    elseif love.keyboard.isDown(UP_BUTTON) then
        self.player:moveUp()
        self.behavior:allObjectsInteract()
    elseif love.keyboard.isDown(DOWN_BUTTON) then
        self.player:moveDown()
        self.behavior:allObjectsInteract()
    else
        self.player:stopY()
    end

    -- Puts itself in all combinations of left and right keys pressed
    if love.keyboard.isDown(LEFT_BUTTON) and love.keyboard.isDown(RIGHT_BUTTON) then
        self.player:moveBothX()
    elseif love.keyboard.isDown(LEFT_BUTTON) then
        self.player:moveLeft()
        self.behavior:allObjectsInteract()
    elseif love.keyboard.isDown(RIGHT_BUTTON) then
        self.player:moveRight()
        self.behavior:allObjectsInteract()
    else
        self.player:stopX()
    end

    -- Interact with objects if the z key is pressed
    if love.keyboard.isDown(ACTION_BUTTON_1) and (not self.action_key_pressed) then
        self.player:interact()
    end

    -- This part is here to check if the z key was just pressed or not
    if love.keyboard.isDown(ACTION_BUTTON_1) then
        self.action_key_pressed = true
    else
        self.action_key_pressed = false
    end
    
    if love.keyboard.isDown(PAUSE_BUTTON) then
      application:appChange("PauseMenu")
    end
  

    -- Make all interactuable objects interact
    self.interactuable_behavior:allObjectsInteract()
end

return RegularControl