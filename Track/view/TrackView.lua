require "lib.classes.class"
local View = require "Global.view.view"
require "Global.consts"
--------------------------------------------------------------------------------------------------------

-- class: TrackView
-- The basic view of a track
local TrackView = extend(View, function(self, lane_view, paddle_view)
    self.current_lane_view = lane_view
    self.paddle_view = paddle_view
end,

function(background_image_path, menu)
    return View:new()
end)

-- draw: context -> None
-- Draws the paddle and notes from the lanes
function TrackView.draw(self, context)
    love.graphics.setBackgroundColor( 74/255, 38/255, 99/255, 1 )
    self.current_lane_view:draw(self.current_lane)
    self.paddle_view:draw(self.paddle)
end

-- setup: None -> None
-- sets the golbal variables and plays the track music
function TrackView.setup(self)
    self.current_lane = application:getFromGlobalContext("lane1")
    self.paddle = application:getFromGlobalContext("paddle")
    local song_source = love.audio.newSource( "Resources/Track/music/Freesbe - Ahxello.mp3", "stream" )
    love.audio.play(song_source)
end

-- stop: None -> None
-- stops the track music
function TrackView.stop(self)
    love.audio.stop("Resources/Track/music/Freesbe - Ahxello.mp3")
end

return TrackView