require "Cutscenes.model.cutscenes.BasicCutsceneBuilder"
require "Cutscenes.ctrl.CutscenesCtrl"
require "Cutscenes.view.CutscenesView"
require "Cutscenes.resources.FontBank"
require "Default.application.application"
--------------------------------------------------------------------------------------------------------
cutBuild = BasicCutsceneBuilder.new()

cutBuild:addScene("hola, soy mike", "Resources/Cutscenes/Test/test0.png")
cutBuild:addScene("mira un perrro", "Resources/Cutscenes/Test/test1.png")
cutBuild:addScene("yes good", "Resources/Cutscenes/Test/test2.png")

testCutscene = cutBuild:getCutscene()

cutsceneCtrl = CutscenesCtrl.new(testCutscene)
cutsceneView = CutscenesView.new(testCutscene, cutscene_screen_font)

registerApp("Cutscenes", cutsceneView, cutsceneCtrl)