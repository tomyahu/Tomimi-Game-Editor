require "Default.application.application"
require "Overworld.view.OverworldView"
require "Overworld.ctrl.OverworldCtrl"
--------------------------------------------------------------------------------------------------------

local thisView = OverworldView.new()
local thisCtrl = OverworldCtrl.new()

registerApp("Overworld", thisView, thisCtrl)