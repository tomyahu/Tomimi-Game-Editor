require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

-- class: BattleCtrl
-- param: view:View -> the view of the menu app
-- The controller of the battle app
local BattleCtrl = extend(Ctrl, function(self, view)
end,

function(view)
    return Ctrl.new(view)
end)

return BattleCtrl