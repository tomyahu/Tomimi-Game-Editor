require "lib.classes.class"
local View = require "Global.view.view"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: TrackView
-- The basic view of a track
local TrackView = extend(View, function(self, background_image_path, over_background_image_path, lane_view, paddle_view)
    self.background = love.graphics.newImage(background_image_path)
    self.over_background = love.graphics.newImage(over_background_image_path)
    self.current_lane_view = lane_view
    self.paddle_view = paddle_view
end,

function(background_image_path, menu)
    return View:new()
end)

-- update: int -> None
-- Function called every frame
function View.update(self, dt)
    self.current_lane_view:updateParticleSystem(dt)
end

-- draw: context -> None
-- Draws the paddle and notes from the lanes
function TrackView.draw(self, context)

    local backgroundpixelwidth, backgroundpixelheight = self.background:getPixelDimensions()
    love.graphics.draw(self.background,getRelativePosX(0),getRelativePosY(0),0, getScale()/backgroundpixelwidth*GAME_WIDTH, getScale()/backgroundpixelheight*GAME_HEIGHT)
    love.graphics.setBackgroundColor( 74/255, 38/255, 99/255, 1 )

    self.paddle_view:drawPaddleLane(self.paddle)
    self.paddle_view:drawPaddleLane(self.paddle2)
    self.paddle_view:drawPaddleLane(self.paddle3)

    self.current_lane_view:draw(self.lanes[1])
    self.current_lane_view:draw(self.lanes[2])
    self.current_lane_view:draw(self.lanes[3])

    self.paddle_view:draw(self.paddle)
    self.paddle_view:draw(self.paddle2)
    self.paddle_view:draw(self.paddle3)

    local backgroundpixelwidth, backgroundpixelheight = self.over_background:getPixelDimensions()
    love.graphics.draw(self.over_background,getRelativePosX(0),getRelativePosY(0),0, getScale()/backgroundpixelwidth*GAME_WIDTH, getScale()/backgroundpixelheight*GAME_HEIGHT)

    -- Song Name
    love.graphics.print( "Song Name - Song Artist", getRelativePosX(48), getRelativePosY(38), 0, getScale(), getScale())

    -- Score
    local current_score = application:getFromLocalContext('score')
    love.graphics.print( "Score: " .. tostring(current_score), getRelativePosX(335), getRelativePosY(410), 0, getScale(), getScale())
end

-- setup: None -> None
-- sets the golbal variables and plays the track music
function TrackView.setup(self)
    self.lanes = {}
    self.lanes[1] = application:getFromGlobalContext("lane1")
    self.lanes[2] = application:getFromGlobalContext("lane2")
    self.lanes[3] = application:getFromGlobalContext("lane3")

    self.paddle = application:getFromGlobalContext("paddle")
    self.paddle2 = application:getFromGlobalContext("paddle2")
    self.paddle3 = application:getFromGlobalContext("paddle3")
    local song_source = love.audio.newSource( "Resources/Track/music/Perros Salvajes Daddy Yankee.mp3", "stream" )
    love.audio.play(song_source)
end

-- stop: None -> None
-- stops the track music
function TrackView.stop(self)
    love.audio.stop()
end

return TrackView