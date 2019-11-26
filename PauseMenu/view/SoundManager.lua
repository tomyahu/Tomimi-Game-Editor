require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: SoundManager
-- The sound manager of the pause menu view
-- TODO: Unhardcode variables
-- TODO: Moderate the volume of the sounds
local SoundManager = class(function(self)
    self.menu_move_sound = love.audio.newSource(RESOURCES_PATH .. "/sounds/menues/menu_move_sound.wav", "static")
    self.menu_selected_sound = love.audio.newSource(RESOURCES_PATH .. "/sounds/menues/menu_selected_sound.wav", "static")
    self.menu_canceled_sound = love.audio.newSource(RESOURCES_PATH .. "/sounds/menues/menu_canceled_sound.wav", "static")
end)

function SoundManager.playMenuSelectedSound(self)
    self.menu_selected_sound:stop()
    self.menu_selected_sound:play()
end

function SoundManager.playMenuMoveSound(self)
    self.menu_move_sound:stop()
    self.menu_move_sound:play()
end

function SoundManager.playMenuCanceledSound(self)
    self.menu_canceled_sound:stop()
    self.menu_canceled_sound:play()
end

return SoundManager