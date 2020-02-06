require "Global.consts"

MENU_MOVE_SOUND = love.audio.newSource(RESOURCES_PATH .. "/sounds/menues/menu_move_sound.wav", "static")
MENU_SELECTED_SOUND = love.audio.newSource(RESOURCES_PATH .. "/sounds/menues/menu_selected_sound.wav", "static")
MENU_CANCELED_SOUND = love.audio.newSource(RESOURCES_PATH .. "/sounds/menues/menu_canceled_sound.wav", "static")

-- Equalize sounds
MENU_MOVE_SOUND:setVolume(0.3)
MENU_SELECTED_SOUND:setVolume(0.3)
MENU_CANCELED_SOUND:setVolume(0.3)