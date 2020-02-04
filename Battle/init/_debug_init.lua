require "Global.consts"
require "Global.fonts"

require "lib.classes.class"
local BattleCtrl = require "Battle.ctrl.BattleCtrl"
local BattleView = require "Battle.view.BattleView"
--------------------------------------------------------------------------------------------------------
-- Set Font
local font = BATTLE_FONT

local view = BattleView.new(RESOURCES_PATH .. "/PauseMenu/MenuBorders.png", font, BATTLE_THEME_1)
local ctrl = BattleCtrl.new(view)

return {["ctrl"] = ctrl, ["view"] = view}