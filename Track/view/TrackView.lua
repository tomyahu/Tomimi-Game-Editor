require "lib.classes.class"
local View = require "Global.view.view"
require "Global.consts"
local Note = require("Track.model.notes.Note")
local NoteView = require("Track.view.notes.NoteView")
local LaneView = require("Track.view.lanes.LaneView")
--------------------------------------------------------------------------------------------------------

-- class: TrackView
-- The basic view of a track
local TrackView = extend(View, function(self, lane)
    self.current_note_view = NoteView.new()
    self.current_lane_view = LaneView.new(self.current_note_view)
    self.current_lane = lane
end,

function(background_image_path, menu)
    return View:new()
end)

-- draw: context -> None
-- Draws the menu options
function TrackView.draw(self, context)
    self.current_lane_view:draw(self.current_lane)
end

-- getContextVars: dict() -> dict()
-- Takes the local context and creates a new context based on it
function TrackView.getContextVars(self, _)
    local context = {}
    return context
end

return TrackView