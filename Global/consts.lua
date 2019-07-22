-- In this file resides the basic information of the initial configuration of the game. Its content may include the
-- game title, the initial dimensions of the window, the dimensions of the game world, the apps, the initial app, the
-- global context, the audio volume, etc.
---------------------------------------------------------------
GAME_TITLE = "Rhythm Bop"
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600
FULL_SCREEN = false

GAME_WIDTH = 800
GAME_HEIGHT = 600

RESOURCES_PATH = "Resources"

APPS = {
    ["TitleMenu"] = "Menu._init",
    ["SongMenu"] = "SongSelectMenu._init",
    ["Track"] = "Track._init",
    ["Debug_Overworld"] = "Overworld._debug_init"
}
INITIAL_APP = "TitleMenu"

TEST = false