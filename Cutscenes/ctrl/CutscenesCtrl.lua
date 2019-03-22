require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

local CutscenesCtrl = extend(Ctrl, function(self, view, cutsceneAdmin)
    self.cutscene_admin = cutsceneAdmin
end,

function(view, cutsceneAdmin)
    return Ctrl.new(view)
end)

function CutscenesCtrl.callbackPressedKey(self,key)
    if key == "return" then
        local bool = self.cutscene_admin:getCurrentCutscene():advanceScene()
        if not bool then
            application:appChange(self.next_app)
        else
            self.view:setCurrentCutscene(self.cutscene_admin:getCurrentCutscene():getCurrentScene())
        end
    end
end

function CutscenesCtrl.setNextApp(self, appName)
    self.next_app = appName
end

function CutscenesCtrl.getContextVars(self, _)
    local context = {}
    local cutscene = self.cutscene_admin:getCurrentCutscene()
    for _, scene in pairs(cutscene:getScenes()) do
        context[scene:getImagePath()] = love.graphics.newImage(scene:getImagePath())
    end
    return context
end

return CutscenesCtrl