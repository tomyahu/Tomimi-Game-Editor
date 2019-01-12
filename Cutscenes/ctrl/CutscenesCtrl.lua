require "Default.LOVEWrapper"
--------------------------------------------------------------------------------------------------------
CutscenesCtrl = {}
CutscenesCtrl.__index = CutscenesCtrl

-- CutscenesCtrl: CutscenesCtrl
-- Creates a CutscenesCtrl
function CutscenesCtrl.new(cutscene)
    local o = {}
    local self = setmetatable(o, CutscenesCtrl)
    self.__index = self
    self.cutscene = cutscene
    return self
end

function CutscenesCtrl.callbackPressedKey(self,key)
    if key == "return" then
        local bool = self.cutscene:advanceScene()
        if not bool then
            appChange(self.next_app)
        end
    end
    print(key)
end

function CutscenesCtrl.setNextApp(self, appName)
    self.next_app = appName
end