require "lib.classes.class"
require "Global.consts"
local View = require "Global.view.view"
require "Global.LOVEWrapper.LOVEWrapper"
-------------------------------------------------------------------------------------------------------

-- class: CutscenesView
-- param: scene:Scene -> the current scene shown
-- param: font:Font -> the font to use in the cutscenes
-- The view of the cutscene app
local CutscenesView = extend(View, function(self, scene, font)
    self.current_scene = scene
    self.font = font
end,

function(cutscene_admin, font)
    return View.new()
end)

-- setter
function CutscenesView.setCurrentCutscene(self, new_scene)
    self.current_scene = new_scene
end

-- draw: context -> None
-- Draws the current scene
function CutscenesView.draw(self,context)
    love.graphics.setFont( self.font )
    local scene = self.current_scene
    local scene_image = context[scene:getImagePath()]
    local scenepixelwidth, _ = scene_image:getPixelDimensions()

    local x_transition = getRelativePosX(getScale()*(GAME_WIDTH - 500)/2)
    love.graphics.draw(scene_image,x_transition,0,0, getScale()/scenepixelwidth*500)
    love.graphics.print( scene:getText(), getRelativePosX(50), getRelativePosY(550), 0, getScale(), getScale())
end

return CutscenesView