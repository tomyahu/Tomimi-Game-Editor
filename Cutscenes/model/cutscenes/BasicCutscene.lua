--------------------------------------------------------------------------------------------------------
BasicCutscene = {}
BasicCutscene.__index = BasicCutscene

-- BasicCutscene: BasicCutscene
-- Creates a BasicCutscene
function BasicCutscene.new(scenes)
    local o = {}
    local self = setmetatable(o, BasicCutscene)
    self.__index = self
    self.scenes = scenes
    self.current_scene = 0
    return self
end

function BasicCutscene.advanceScene(self)
    if self.current_scene < # self.scenes then
        self.current_scene = self.current_scene + 1
        return true
    else
        return false
    end
end

function BasicCutscene.getCurrentScene(self)
    return self.scenes[self.current_scene]
end

function BasicCutscene.getScenes(self)
    return self.scenes
end