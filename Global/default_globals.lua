local default_globals = {}

default_globals["CONFIGURATION"] = {}

-- Contols
default_globals["CONFIGURATION"]["CONTROLS"] = {}
default_globals["CONFIGURATION"]["CONTROLS"]["MOVEMENT_BUTTONS"] = "arrow_keys"
default_globals["CONFIGURATION"]["CONTROLS"]["ACTION_BUTTON_1"] = "z"
default_globals["CONFIGURATION"]["CONTROLS"]["ACTION_BUTTON_2"] = "x"
default_globals["CONFIGURATION"]["CONTROLS"]["PAUSE_BUTTON"] = "return"

-- Sound Options
default_globals["CONFIGURATION"]["SOUND"] = {}
default_globals["CONFIGURATION"]["SOUND"]["Music"] = 1
default_globals["CONFIGURATION"]["SOUND"]["Effects"] = 0.2

-- Video Options
default_globals["CONFIGURATION"]["VIDEO"] = {}
default_globals["CONFIGURATION"]["VIDEO"]["FULLSCREEN"] = false


-- Saves
default_globals["SAVES"] = {}

-- Debug state
default_globals["DEBUG"] = false

return default_globals