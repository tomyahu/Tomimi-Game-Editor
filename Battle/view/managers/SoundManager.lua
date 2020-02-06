require "lib.classes.class"
require "Menu.consts"
--------------------------------------------------------------------------------------------------------

-- class: SoundManager
-- The sound manager of the battle view
local SoundManager = class(function(self, battle_music)
    self.music = battle_music
    self.menu_move_sound = MENU_MOVE_SOUND
    self.menu_selected_sound = MENU_SELECTED_SOUND
    self.menu_canceled_sound = MENU_CANCELED_SOUND
end)

function SoundManager.playMusic(self)
    self:playSource(self.music)
end

function SoundManager.stopMusic(self)
    self.music:stop()
end

function SoundManager.playMenuSelectedSound(self)
    self:playSource(self.menu_selected_sound)
end

function SoundManager.playMenuMoveSound(self)
    self:playSource(self.menu_move_sound)
end

function SoundManager.playMenuCanceledSound(self)
    self:playSource(self.menu_canceled_sound)
end

function SoundManager.playSource(self, source)
    source:stop()
    source:play()
end

return SoundManager