require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: LaneView
-- param: note_view:NoteView -> the note view to display the notes
-- Creates a new LaneView to visualize a lane with notes
local LaneView = class(function(self, note_view)
    self.note_view = note_view
end)

-- draw: Lane -> None
-- draws the notes of the lane on the screen
function LaneView.draw(self, lane)
    local notes = lane:getNotes()

    for _, note in pairs(notes) do
        self.note_view:drawBasicNote(note)
    end
end

return LaneView