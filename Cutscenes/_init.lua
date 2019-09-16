require "Global.consts"
local BasicCutsceneAdmin = require "Cutscenes.model.cutscene_admin.BasicCutsceneAdmin"
local TimedCutsceneBuilder = require "Cutscenes.model.cutscenes.TimedCutsceneBuilder"
local CutscenesCtrl = require "Cutscenes.ctrl.CutscenesCtrl"
local CutscenesView = require "Cutscenes.view.CutscenesView"
require "Cutscenes.resources.FontBank"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local cutBuild = TimedCutsceneBuilder.new(10)

cutBuild:addScene("hola, soy mike", "Resources/Cutscenes/Test/test0.png")
cutBuild:addScene("mira un perrro", "Resources/Cutscenes/Test/test1.png")
cutBuild:addScene("yes good", "Resources/Cutscenes/Test/test2.png")

local testCutscene = cutBuild:getCutscene()

local testCutsceneAdmin = BasicCutsceneAdmin.new()
testCutsceneAdmin:addCutscene(0, testCutscene)
testCutsceneAdmin:setCurrentCutscene(0)

local cutsceneView = CutscenesView.new(testCutsceneAdmin:getCurrentCutscene():getCurrentScene(), cutscene_screen_font)
local cutsceneCtrl = CutscenesCtrl.new(cutsceneView, testCutsceneAdmin)

cutsceneCtrl:setNextApp("Overworld")

return {["ctrl"] = cutsceneCtrl, ["view"] = cutsceneView}