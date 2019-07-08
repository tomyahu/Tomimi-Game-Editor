require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: BasicCutsceneAdmin
-- A basic cutscene administrator that manages the current shown cutscene
local BasicCutsceneAdmin = class(function(self)
    self.cutscenes = {}
    self.current_cutscene = nil
end)

-- getter
function BasicCutsceneAdmin.getCurrentCutscene(self)
    return self.current_cutscene
end

-- resetCurrentCutscene: None -> None
-- Resets the current cutscene
function BasicCutsceneAdmin.resetCurrentCutscene(self)
    self.current_cutscene:resetCutscene()
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

return BasicCutsceneAdmin