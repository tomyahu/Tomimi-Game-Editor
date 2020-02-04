require "lib.classes.class"
require "Menu.consts"
--------------------------------------------------------------------------------------------------------

-- class: SoundManager
-- The sound manager of the pause menu view
local SoundManager = class(function(self)
    self.menu_move_sound = MENU_MOVE_SOUND
    self.menu_selected_sound = MENU_SELECTED_SOUND
    self.menu_canceled_sound = MENU_CANCELED_SOUND
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