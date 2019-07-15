require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NoteActiveState
-- param: note:Note -> a note object
-- The inactive state of the note
local NoteInactiveState = class(function(self, note)
    self.note = note
end)

-- hit: None -> None
-- Does nothing
function NoteInactiveState.hit(self)
end

-- doNothing: None -> None
-- does nothing
function NoteInactiveState.doNothing(self)

end

-- to string function
function NoteInactiveState.toString(self)
    return 'NoteInactiveState'
end

return NoteInactiveState