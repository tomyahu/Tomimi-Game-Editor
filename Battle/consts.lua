require "Global.consts"

BATTLE_TARGET_SELF = "self"
BATTLE_TARGET_SINGLE_PARTY_MEMBER = "single_party_member"
BATTLE_TARGET_ALL_PARTY_MEMBER = "all_party_members"
BATTLE_TARGET_SINGLE_ENEMY = "single_enemy"
BATTLE_TARGET_ALL_ENEMIES = "all_enemies"

BATTLE_ACTION_ATTACK_TYPE = "attack"
BATTLE_ACTION_SUPPORT_TYPE = "support"
BATTLE_ACTION_OTHER_TYPE = "other"

BATTLE_ACTION_PIECE_BORDER = "N"
BATTLE_ACTION_PIECE_T = "T"
BATTLE_ACTION_PIECE_C = "C"

BATTLE_ACTION_DEFAULT_ICON_DIR = RESOURCES_PATH .. "/Battle/AbilitiesIcons/"

BATTLE_THEME_1 = love.audio.newSource(RESOURCES_PATH .. "/sounds/Battle/battle_musicv1.wav", "stream")
BATTLE_THEME_1:setLooping(true)
BATTLE_THEME_1:setVolume(0.5)