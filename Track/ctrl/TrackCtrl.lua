require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

-- class: TrackCtrl
-- param: view:View -> the view of the track app
-- The controller of the track app
local TrackCtrl = extend(Ctrl, function(self, view, lane)
    self.view = view
    self.lane = lane
end,

function(view, menu)
    return Ctrl.new(view)
end)

function TrackCtrl.callbackPressedKey(self,key)
end

-- update: num -> None
-- Function called every frame
function Ctrl.update(self, dt)
    self.lane:updateAllNotes(dt)
end

function TrackCtrl.getContextVars(_, context)
end

return TrackCtrl