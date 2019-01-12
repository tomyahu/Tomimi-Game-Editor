require "Cutscenes.model.cutscenes.BasicCutscene"
--------------------------------------------------------------------------------------------------------
BasicCutsceneAdmin = {};
BasicCutsceneAdmin.__index = BasicCutsceneAdmin

-- BasicCutsceneAdmin: BasicCutsceneAdmin
-- Creates a BasicCutsceneAdmin
function BasicCutsceneAdmin.new()
    local o = {}
    local self = setmetatable(o, BasicCutsceneAdmin)
    self.__index = self
    self.cutscenes = {}
    self.current_cutscene = nil
    return self
end

function BasicCutsceneAdmin.getCurrentCutscene(self)
    return self.current_cutscene
end

-- addCutscene: any, Cutscene -> None
-- adds a cutscene to the current cutscene administrator with key as the key
function BasicCutsceneAdmin.addCutscene(self, key, cutscene)
    self.cutscenes[key] = cutscene
end

-- setCurrentCutscene: any -> None
-- sets the current cutscene to the cutscene registered with key
function BasicCutsceneAdmin.setCurrentCutscene(self, key)
    self.current_cutscene = self.cutscenes[key]
end