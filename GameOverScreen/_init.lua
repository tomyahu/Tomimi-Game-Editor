require "Global.consts"
require "GameOverScreen.consts"
require "Global.fonts"
require "Global.application.application"
local getNewSaveFile = require("Global.new_save_file")

local GameOverCtrl = require "GameOverScreen.ctrl.GameOverCtrl"
local GameOverView = require "GameOverScreen.view.GameOverView"
----------------------------------------------------------------------------------------

local titleScreenMenuView = GameOverView.new(GAME_OVER_SCREEN_PATH, DIALOG_FONT)
local titleScreenMenuCtrl = GameOverCtrl.new(titleScreenMenuView)

return {["ctrl"] = titleScreenMenuCtrl, ["view"] = titleScreenMenuView}