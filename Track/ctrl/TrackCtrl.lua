require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
local Paddle = require "Track.model.paddles.Paddle"
local TrackBehavior = require "Track.model.physics.behavior.TrackBehavior"
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

end

function TrackCtrl.callbackReleasedKey(self,key)

end

-- update: num -> None
-- Function called every frame
function TrackCtrl.update(self, dt)

    if love.keyboard.isDown( "j" ) or love.keyboard.isDown( "k" ) then
        self.paddle:pressAction1Button()
    else
        self.paddle:releaseAction1Button()
    end

    self.lane:updateAllNotes(dt)

    self.track_behavior:AllObjectsInteract()
end

-- setup: None -> None
-- plays the track music
function TrackCtrl.setup(self)
    self.lane = application:getFromGlobalContext("lane1")
    self.paddle = application:getFromGlobalContext("paddle")

    self.lane:registerAllNotes()

    self.track_behavior = TrackBehavior.new(self.paddle)
end

-- stop: None -> None
-- stops the track music
function TrackCtrl.stop(self)
    application:setInGlobalContext("lane1", nil)
    application:setInGlobalContext("lane1", nil)
end

return TrackCtrl
