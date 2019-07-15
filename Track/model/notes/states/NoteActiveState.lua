require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NoteActiveState
-- param: note:Note -> a note object
-- The initial state of a note object
local NoteActiveState = class(function(self, note)
    self.note = note
end)

-- hit: None -> None
-- Hits the note and the note passes to the Inactive state
function NoteActiveState.hit(self)
    self.note:setState("NoteActivatedState")
end

-- doNothing: None -> None
-- does nothing
function NoteActiveState.doNothing(self)

end

-- to string function
function NoteActiveState.toString(self)
    return 'NoteActiveState'
end

return NoteActiveState