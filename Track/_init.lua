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

local lane_build = BPMLaneBuilder.new(196, 400, 88)

-- Perros Salvajes cancion
local checkpoint = 0
lane_build:addTones(checkpoint+1,4)
lane_build:addThirdTones(checkpoint+5,4)
lane_build:addTones(checkpoint+7,2)

checkpoint = 8
lane_build:addSemiTones(checkpoint+1,8)
lane_build:addThirdTones(checkpoint+5,4)
lane_build:addSemiTones(checkpoint+6.5,5)

checkpoint = 16
lane_build:addSemiTones(checkpoint+1,8)
lane_build:addThirdTones(checkpoint+5,4)
lane_build:addSemiTones(checkpoint+6.5,5)

application:setInGlobalContext("lane1", lane_build:getLane())

local paddle = Paddle.new(100, 100)
application:setInGlobalContext("paddle", paddle)


local note_view = NoteView.new()
local lane_view = LaneView.new(note_view)
local paddle_view = PaddleView.new()

local basicTrackView = TrackView.new(lane_view, paddle_view)
local basicTrackCtrl = TrackCtrl.new(basicTrackView)

return {["ctrl"] = basicTrackCtrl, ["view"] = basicTrackView}