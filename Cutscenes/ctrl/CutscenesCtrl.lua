require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

local CutscenesCtrl = extend(Ctrl, function(self, cutsceneAdmin)
    self.cutscene_admin = cutsceneAdmin
end,

function(cutsceneAdmin)
    return Ctrl.new()
end)

function CutscenesCtrl.callbackPressedKey(self,key)
    if key == "return" then
        local bool = self.cutscene_admin:getCurrentCutscene():advanceScene()
        if not bool then
            application:appChange(self.next_app)
        end
    end
end

function CutscenesCtrl.setNextApp(self, appName)
    self.next_app = appName
end

return CutscenesCtrl