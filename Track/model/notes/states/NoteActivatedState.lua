require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NoteActivatedState
-- param: note:Note -> a note object
-- The initial state of a note object
local NoteActivatedState = class(function(self, note)
    self.note = note
end)

-- hit: None -> None
-- does nothing
function NoteActivatedState.hit(self)
end

-- doNothing: None -> None
-- sets the state to inactive state
function NoteActivatedState.doNothing(self)
    self.note:setState("NoteInactiveState")
end

-- to string function
function NoteActivatedState.toString(self)
    return 'NoteActivatedState'
end

return NoteActivatedState