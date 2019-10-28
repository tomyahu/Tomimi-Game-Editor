require "Global.controls"
require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

-- class: CutscenesCtrl
-- param: view:View -> the view of the menu app
-- param: cutsceneAdmin:BasicCutsceneAdmin -> the administrator that changes cutscene
-- The controller of the cutscene app
local CutscenesCtrl = extend(Ctrl, function(self, view, cutsceneAdmin)
    self.cutscene_admin = cutsceneAdmin
end,

function(view, cutsceneAdmin)
    return Ctrl.new(view)
end)

function CutscenesCtrl.callbackPressedKey(self,key)
    if key == ACTION_BUTTON_1 then
        local bool = self.cutscene_admin:getCurrentCutscene():advanceScene()
        if not bool then
            application:appChange(self.next_app)
        else
            self.view:setCurrentCutscene(self.cutscene_admin:getCurrentCutscene():getCurrentScene())
        end
    end
end

-- setNextApp: str -> None
-- sets the next app name
function CutscenesCtrl.setNextApp(self, appName)
    self.next_app = appName
end

-- setup: None -> None
-- Saves the images in the local context
function CutscenesCtrl.setup(self, _)
    local cutscene = self.cutscene_admin:getCurrentCutscene()
    for _, scene in pairs(cutscene:getScenes()) do
        application:setInLocalContext(scene:getImagePath(), love.graphics.newImage(scene:getImagePath()))
    end
end

return CutscenesCtrl