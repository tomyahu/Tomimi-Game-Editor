require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local PlayerView = class(function(self, player)
    self.player = player
    self.state = player:getState():toString()
end)

function PlayerView.getSprite(self)
    return self.player:getSprite()
end

function PlayerView.getPos(self)
    return self.player:getPos()
end

function PlayerView.checkState(self)
    local player_state_str = self.player:getState():toString()

    if not (self.state == player_state_str) then
        self.state = player_state_str
        self:adjustAnimation()
    end
end

function PlayerView.adjustAnimation(self)
    local action = {
        ["StillState"] = function() self:getSprite():setFrameSet(1) end,
        ["WalkingDownState"] = function() self:getSprite():setFrameSet(2) end,
        ["MarchingDownState"] = function() self:getSprite():setFrameSet(2) end,
        ["MoonWalkingUpState"] = function() self:getSprite():setFrameSet(2) end,
        ["WalkingUpState"] = function() self:getSprite():setFrameSet(3) end,
        ["MarchingUpState"] = function() self:getSprite():setFrameSet(3) end,
        ["MoonWalkingDownState"] = function() self:getSprite():setFrameSet(3) end,
        ["WalkingRightState"] = function() self:getSprite():setFrameSet(4) end,
        ["MarchingRightState"] = function() self:getSprite():setFrameSet(4) end,
        ["MoonWalkingLeftState"] = function() self:getSprite():setFrameSet(4) end,
        ["WalkingLeftState"] = function() self:getSprite():setFrameSet(5) end,
        ["MarchingLeftState"] = function() self:getSprite():setFrameSet(5) end,
        ["MoonWalkingRightState"] = function() self:getSprite():setFrameSet(5) end
    }

    if type(action[self.state]) == "function" then
        action[self.state]()
    else
        self:getSprite():setFrameSet(2)
    end

end


return PlayerView