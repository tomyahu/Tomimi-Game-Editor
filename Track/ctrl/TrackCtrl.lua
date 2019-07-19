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
    self.current_paddle = 1
end,

function(view, menu)
    return Ctrl.new(view)
end)

function TrackCtrl.callbackPressedKey(self,key)

    if key == "s" or key == "w" then
        self.paddles[self.current_paddle]:deactivate()

        if key == "s" then
            self.current_paddle = (self.current_paddle%3) + 1
        else
            self.current_paddle = ((self.current_paddle + 1) %3) + 1
        end

        self.paddles[self.current_paddle]:activate()
        self.track_behavior:setPaddle(self.paddles[self.current_paddle])
    end


end

function TrackCtrl.callbackReleasedKey(self,key)

end

-- update: num -> None
-- Function called every frame
function TrackCtrl.update(self, dt)

    if love.keyboard.isDown( "j" ) or love.keyboard.isDown( "k" ) then
        self.paddles[self.current_paddle]:pressAction1Button()
    else
        self.paddles[self.current_paddle]:releaseAction1Button()
    end

    self.lanes[1]:updateAllNotes(dt)
    self.lanes[2]:updateAllNotes(dt)
    self.lanes[3]:updateAllNotes(dt)

    self.track_behavior:AllObjectsInteract()
end

-- setup: None -> None
-- plays the track music
function TrackCtrl.setup(self)
    self.lanes = {}
    self.lanes[1] = application:getFromGlobalContext("lane1")
    self.lanes[2] = application:getFromGlobalContext("lane2")
    self.lanes[3] = application:getFromGlobalContext("lane3")


    self.paddles = {}
    self.paddles[1] = application:getFromGlobalContext("paddle")
    self.paddles[2] = application:getFromGlobalContext("paddle2")
    self.paddles[3] = application:getFromGlobalContext("paddle3")

    self.paddles[2]:deactivate()
    self.paddles[3]:deactivate()

    self.lanes[1]:registerAllNotes()
    self.lanes[2]:registerAllNotes()
    self.lanes[3]:registerAllNotes()

    self.track_behavior = TrackBehavior.new(self.paddles[1])
end

-- stop: None -> None
-- frees memory from the global context
function TrackCtrl.stop(self)
    application:setInGlobalContext("lane1", nil)
    application:setInGlobalContext("lane2", nil)
    application:setInGlobalContext("lane3", nil)

    application:setInGlobalContext("paddle", nil)
    application:setInGlobalContext("paddle2", nil)
    application:setInGlobalContext("paddle3", nil)
end

return TrackCtrl
