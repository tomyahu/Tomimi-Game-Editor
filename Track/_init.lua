require "Global.consts"
require "Global.application.application"

local Paddle = require("Track.model.paddles.Paddle")

local NoteView = require("Track.view.notes.NoteView")
local LaneView = require("Track.view.lanes.LaneView")
local PaddleView = require("Track.view.paddles.PaddleView")

local TrackCtrl = require "Track.ctrl.TrackCtrl"
local TrackView = require "Track.view.TrackView"

local BPMLaneBuilder = require "Track.model.lanes.BPMLaneBuilder"
----------------------------------------------------------------------------------------

local lane1_build = BPMLaneBuilder.new(126, 400, 88)
local lane2_build = BPMLaneBuilder.new(206, 400, 88)
local lane3_build = BPMLaneBuilder.new(286, 400, 88)

-- Perros Salvajes cancion
local checkpoint = 0
lane1_build:addTones(checkpoint+1,4)
lane1_build:addThirdTones(checkpoint+5,4)
lane1_build:addTones(checkpoint+7,2)

checkpoint = 8
lane2_build:addSemiTones(checkpoint+1,8)
lane2_build:addThirdTones(checkpoint+5,4)
lane2_build:addSemiTones(checkpoint+6.5,5)

checkpoint = 16
lane2_build:addSemiTones(checkpoint+1,8)
lane2_build:addThirdTones(checkpoint+5,4)
lane2_build:addSemiTones(checkpoint+6.5,5)

checkpoint = 24
lane2_build:addSemiTones(checkpoint+1,8)
lane2_build:addThirdTones(checkpoint+5,4)
lane2_build:addSemiTones(checkpoint+6.5,5)

checkpoint = 32
lane3_build:addTones(checkpoint+1,16)
lane2_build:addTones(checkpoint+1.5,16)
lane2_build:addDoubleTones(checkpoint+1.75,8)

checkpoint = 48
lane3_build:addTones(checkpoint+1,16)
lane2_build:addTones(checkpoint+1.5,16)
lane2_build:addDoubleTones(checkpoint+1.75,8)

application:setInGlobalContext("lane1", lane1_build:getLane())
application:setInGlobalContext("lane2", lane2_build:getLane())
application:setInGlobalContext("lane3", lane3_build:getLane())


application:setInGlobalContext("paddle", Paddle.new(50, 110))
application:setInGlobalContext("paddle2", Paddle.new(50, 190))
application:setInGlobalContext("paddle3", Paddle.new(50, 270))


local note_view = NoteView.new()
local lane_view = LaneView.new(note_view)
local paddle_view = PaddleView.new()

local basicTrackView = TrackView.new("Resources/Track/RhythmBopTrackBackground.png", "Resources/Track/RhythmBopTrackOverBackground.png", lane_view, paddle_view)
local basicTrackCtrl = TrackCtrl.new(basicTrackView)

return {["ctrl"] = basicTrackCtrl, ["view"] = basicTrackView}