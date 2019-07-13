require "Global.consts"
require "Global.application.application"

local TrackCtrl = require "Track.ctrl.TrackCtrl"
local TrackView = require "Track.view.TrackView"

local LaneBuilder = require "Track.model.lanes.LaneBuilder"
----------------------------------------------------------------------------------------

local lane_build = LaneBuilder.new(100,100)

lane_build:addNote(100)
lane_build:addNote(200)
lane_build:addNote(300)
lane_build:addNote(400)

local lane1 = lane_build:getLane()


local basicTrackView = TrackView.new(lane1)
local basicTrackCtrl = TrackCtrl.new(basicTrackView, lane1)

return {["ctrl"] = basicTrackCtrl, ["view"] = basicTrackView}