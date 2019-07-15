require "Global.consts"
require "Global.application.application"

local Paddle = require("Track.model.paddles.Paddle")

local NoteView = require("Track.view.notes.NoteView")
local LaneView = require("Track.view.lanes.LaneView")
local PaddleView = require("Track.view.paddles.PaddleView")

local TrackCtrl = require "Track.ctrl.TrackCtrl"
local TrackView = require "Track.view.TrackView"

local LaneBuilder = require "Track.model.lanes.LaneBuilder"
----------------------------------------------------------------------------------------

local lane_build = LaneBuilder.new(228,200)

lane_build:addNote(1100)
lane_build:addNote(1200)
lane_build:addNote(1300)
lane_build:addNote(1400)

application:setInGlobalContext("lane1", lane_build:getLane())

local paddle = Paddle.new(100, 100)
application:setInGlobalContext("paddle", paddle)


local note_view = NoteView.new()
local lane_view = LaneView.new(note_view)
local paddle_view = PaddleView.new()

local basicTrackView = TrackView.new(lane_view, paddle_view)
local basicTrackCtrl = TrackCtrl.new(basicTrackView)

return {["ctrl"] = basicTrackCtrl, ["view"] = basicTrackView}