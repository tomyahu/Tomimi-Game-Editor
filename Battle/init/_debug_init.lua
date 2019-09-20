require "lib.classes.class"
local BattleCtrl = require "Battle.ctrl.BattleCtrl"
local BattleView = require "Battle.view.BattleView"
--------------------------------------------------------------------------------------------------------

local view = BattleView.new()
local ctrl = BattleCtrl.new(view)

return {["ctrl"] = ctrl, ["view"] = view}