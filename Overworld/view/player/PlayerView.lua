require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: PlayerView
-- param: player:Player -> the player object
-- Object to display the player sprite on the screen
local PlayerView = class(function(self, player)
    self.player = player
    self.state = player:getState():toString()

    self.actions = {
        ["StillDownState"] = function() self:getSprite():setFrameSet(1) end,
        ["StillUpState"] = function() self:getSprite():setFrameSet(2) end,
        ["StillRightState"] = function() self:getSprite():setFrameSet(3) end,
        ["StillLeftState"] = function() self:getSprite():setFrameSet(4) end,
        ["WalkingDownState"] = function() self:getSprite():setFrameSet(5) end,
        ["WalkingUpState"] = function() self:getSprite():setFrameSet(6) end,
        ["WalkingRightState"] = function() self:getSprite():setFrameSet(7) end,
        ["WalkingLeftState"] = function() self:getSprite():setFrameSet(8) end
    }
end)

-- getSprite: None -> Sprite
-- Gets the player's sprite
function PlayerView.getSprite(self)
    return self.player:getSprite()
end

-- getPos: None -> int, int
-- Gets the player's x and y coordinates
function PlayerView.getPos(self)
    return self.player:getPos()
end

-- checkState: None -> None
-- Checks if the current state changed and if it did it adjusts the current player animation
function PlayerView.checkState(self)
    local player_state_str = self.player:getState():toString()

    if not (self.state == player_state_str) then
        self.state = player_state_str
        self:adjustAnimation()
    end
end

-- adjustAnimation: None -> None
-- Sets the animation of the player according to the player's current state
function PlayerView.adjustAnimation(self)
    if type(self.actions[self.state]) == "function" then
        self.actions[self.state]()
    else
        self:getSprite():setFrameSet(2)
    end
end


return PlayerView