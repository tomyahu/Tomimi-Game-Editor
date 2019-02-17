require "Global.LOVEWrapper.LOVEWrapper"
require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------
local CutscenesCtrl = Ctrl.new()
CutscenesCtrl.__index = CutscenesCtrl

-- CutscenesCtrl: CutscenesCtrl
-- Creates a CutscenesCtrl
function CutscenesCtrl.new(cutsceneAdmin)
    local o = Ctrl.new()
    local self = setmetatable(o, CutscenesCtrl)
    self.__index = self
    self.cutscene_admin = cutsceneAdmin
    return self
end

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