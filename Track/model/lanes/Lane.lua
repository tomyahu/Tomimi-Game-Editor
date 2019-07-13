require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Lane
-- Creates a new lane with notes
local Lane = class(function(self)
    self.notes = {}
end)

-- addNote: Note -> None
-- adds a new note to the note dictionary
function Lane.addNote(self, note)
    table.insert(self.notes, note)
end

-- updateAllNotes: None -> None
-- goes through every note in the dictionary and updates its postition with its speed
function Lane.updateAllNotes(self, dt)
    for _, note in pairs(self.notes) do
        note:updatePosition(dt)
    end
end

-- getter
function Lane.getNotes(self)
    return self.notes
end

return Lane