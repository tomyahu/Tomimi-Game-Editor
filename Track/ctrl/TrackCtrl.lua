require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
local Paddle = require "Track.model.paddles.Paddle"
--------------------------------------------------------------------------------------------------------

-- class: TrackCtrl
-- param: view:View -> the view of the track app
-- The controller of the track app
local TrackCtrl = extend(Ctrl, function(self, view)
    self.view = view
end,

function(view, menu)
    return Ctrl.new(view)
end)

function TrackCtrl.callbackPressedKey(self,key)
    if key == "a" then
        self.paddle:pressAction1Button()
    end
end

function TrackCtrl.callbackReleasedKey(self,key)
    if key == "a" then
        self.paddle:releaseAction1Button()
    end
end

-- update: num -> None
-- Function called every frame
function TrackCtrl.update(self, dt)
    self.lane:updateAllNotes(dt)
end

-- setup: None -> None
-- plays the track music
function TrackCtrl.setup(self)
    self.lane = application:getFromGlobalContext("lane1")
    self.paddle = application:getFromGlobalContext("paddle")
end

-- stop: None -> None
-- stops the track music
function TrackCtrl.stop(self)
    application:setInGlobalContext("lane1", nil)
    application:setInGlobalContext("lane1", nil)
end

return TrackCtrl