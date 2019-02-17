require "Cutscenes.model.cutscene_admin.BasicCutsceneAdmin"
require "Cutscenes.model.cutscenes.TimedCutsceneBuilder"
require "Cutscenes.ctrl.CutscenesCtrl"
require "Cutscenes.view.CutscenesView"
require "Cutscenes.resources.FontBank"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
cutBuild = TimedCutsceneBuilder.new(10)

cutBuild:addScene("hola, soy mike", "Resources/Cutscenes/Test/test0.png")
cutBuild:addScene("mira un perrro", "Resources/Cutscenes/Test/test1.png")
cutBuild:addScene("yes good", "Resources/Cutscenes/Test/test2.png")

testCutscene = cutBuild:getCutscene()

testCutsceneAdmin = BasicCutsceneAdmin.new()
testCutsceneAdmin:addCutscene(0, testCutscene)
testCutsceneAdmin:setCurrentCutscene(0)


cutsceneCtrl = CutscenesCtrl.new(testCutsceneAdmin)
cutsceneView = CutscenesView.new(testCutsceneAdmin, cutscene_screen_font)

cutsceneCtrl:setNextApp("Overworld")

application:registerApp("Cutscenes", cutsceneView, cutsceneCtrl)