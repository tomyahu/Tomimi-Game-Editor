require "Default.consts"
-------------------------------------------------------------------------------------------------------
CutscenesView = {}
CutscenesView.__index = CutscenesView

-- CutscenesView: CutscenesView
-- Creates a CutscenesView
function CutscenesView.new(cutscene, font)
    local o = {}
    local self = setmetatable(o, CutscenesView)
    self.__index = self
    self.cutscene = cutscene
    self.font = font
    return self
end

function CutscenesView.draw(self,context)
    love.graphics.setFont( self.font )
    local scene_image = context[self.cutscene:getCurrentScene():getImagePath()]
    local scenepixelwidth, scenepixelheight = scene_image:getPixelDimensions()
    love.graphics.draw(scene_image,(GAME_WIDTH - 500)/2,0,0, getScale()/scenepixelwidth*500)
    love.graphics.print( self.cutscene:getCurrentScene():getText(), getRelativePosX(50), getRelativePosY(550), 0, getScale(), getScale())
end

function CutscenesView.getContextVars(self)
    local context = {}
    for num, scene in pairs(self.cutscene:getScenes()) do
        context[scene:getImagePath()] = love.graphics.newImage(scene:getImagePath())
    end
    return context
end