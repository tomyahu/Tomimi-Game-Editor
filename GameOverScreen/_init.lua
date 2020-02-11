require "Global.consts"
require "Global.fonts"
require "Global.application.application"
local getNewSaveFile = require("Global.new_save_file")

local GameOverCtrl = require "GameOverScreen.ctrl.GameOverCtrl"
local GameOverView = require "GameOverScreen.view.GameOverView"
----------------------------------------------------------------------------------------

-- TODO: Use game over screen
local titleScreenMenuView = GameOverView.new(RESOURCES_PATH .. "/Menu/background.png", DIALOG_FONT)
local titleScreenMenuCtrl = GameOverCtrl.new(titleScreenMenuView)

return {["ctrl"] = titleScreenMenuCtrl, ["view"] = titleScreenMenuView}