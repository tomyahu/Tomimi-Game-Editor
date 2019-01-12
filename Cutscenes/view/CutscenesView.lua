require "Default.consts"
-------------------------------------------------------------------------------------------------------
CutscenesView = {}
CutscenesView.__index = CutscenesView

-- CutscenesView: CutscenesView
-- Creates a CutscenesView
function CutscenesView.new(cutsceneAdmin, font)
    local o = {}
    local self = setmetatable(o, CutscenesView)
    self.__index = self
    self.cutscene_admin = cutsceneAdmin
    self.font = font
    return self
end

function CutscenesView.draw(self,context)
    love.graphics.setFont( self.font )
    local scene = self.cutscene_admin:getCurrentCutscene():getCurrentScene()
    local scene_image = context[scene:getImagePath()]
    local scenepixelwidth, scenepixelheight = scene_image:getPixelDimensions()
    love.graphics.draw(scene_image,(GAME_WIDTH - 500)/2,0,0, getScale()/scenepixelwidth*500)
    love.graphics.print( scene:getText(), getRelativePosX(50), getRelativePosY(550), 0, getScale(), getScale())
end

function CutscenesView.getContextVars(self)
    local context = {}
    local cutscene = self.cutscene_admin:getCurrentCutscene()
    for num, scene in pairs(cutscene:getScenes()) do
        context[scene:getImagePath()] = love.graphics.newImage(scene:getImagePath())
    end
    return context
end