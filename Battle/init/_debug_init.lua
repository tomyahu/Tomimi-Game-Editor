require "Global.consts"
require "Global.fonts"

require "lib.classes.class"
local BattleCtrl = require "Battle.ctrl.BattleCtrl"
local BattleView = require "Battle.view.BattleView"
--------------------------------------------------------------------------------------------------------
-- Set Font
local font = DIALOG_FONT

local view = BattleView.new(RESOURCES_PATH .. "/PauseMenu/MenuBorders.png", font)
local ctrl = BattleCtrl.new(view)

return {["ctrl"] = ctrl, ["view"] = view}