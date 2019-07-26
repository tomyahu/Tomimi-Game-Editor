require "lib.classes.class"
require "Cutscenes.resources.FontBank"
local CutscenesCtrl = require "Cutscenes.ctrl.CutscenesCtrl"
local CutscenesView = require "Cutscenes.view.CutscenesView"
local BasicCutsceneAdmin =  require "Cutscenes.model.cutscene_admin.BasicCutsceneAdmin"
local BasicCutsceneBuilder =  require "Cutscenes.model.cutscenes.BasicCutsceneBuilder"
local TimedCutsceneBuilder =  require "Cutscenes.model.cutscenes.TimedCutsceneBuilder"
--------------------------------------------------------------------------------------------------------

local cutscene_build = TimedCutsceneBuilder.new(30)

cutscene_build:addScene("Habia una vez una naranja", "Resources/Cutscenes/naranja/naranja.jpg")
cutscene_build:addScene("Que queria salir a bailar", "Resources/Cutscenes/naranja/naranja.jpg")
cutscene_build:addScene("Pero le dijeron que", "Resources/Cutscenes/naranja/naranja.jpg")
cutscene_build:addScene("que su falda no era lo suficientemente brillante para", "Resources/Cutscenes/naranja/naranja.jpg")
cutscene_build:addScene("mente brillante para entrar a la disco", "Resources/Cutscenes/naranja/naranja.jpg")

local cutscene_admin = BasicCutsceneAdmin.new()

cutscene_admin:addCutscene("naranja", cutscene_build:getCutscene())
cutscene_admin:setCurrentCutscene("naranja")

local view = CutscenesView.new(cutscene_admin:getCurrentCutscene():getCurrentScene(), cutscene_screen_font)
local ctrl = CutscenesCtrl.new(view, cutscene_admin)

ctrl:setNextApp("Debug_Overworld")

return {["ctrl"] = ctrl, ["view"] = view}