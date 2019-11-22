require "Global.consts"

local playable_characters = {}

------------------------------------------------------------------------------------------------------------------------
-- Mac -----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

local mac = {}
-- Constant
mac["name"] = "Mac"
mac["weapon"] = 1
mac["icon_path"] = RESOURCES_PATH .. "/Overworld/CharacterPortraits/MacPortrait.png"
mac["max_hp"] = 8
mac["max_stamina"] = 10
mac["strength"] = 5
mac["natural_resistence"] = 4
mac["speed"] = 7
mac["agility"] = 9
mac["b_aura_prof"] = 1
mac["b_spirit_prof"] = 1
mac["b_instinct_prof"] = 4

-- Variable
mac["hp"] = 8
mac["stamina"] = 10

------------------------------------------------------------------------------------------------------------------------
-- Ken -----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

local ken = {}
-- Constant
ken["name"] = "Ken"
ken["weapon"] = 2
ken["icon_path"] = RESOURCES_PATH .. "/Overworld/CharacterPortraits/KenPortrait.png"
ken["max_hp"] = 15
ken["max_mp"] = 13
ken["max_stamina"] = 15
ken["strength"] = 10
ken["natural_resistence"] = 7
ken["speed"] = 6
ken["agility"] = 5

ken["mana_strength"] = 8
ken["mana_control"] = 5

ken["fire_prof"] = 5
ken["wind_prof"] = 1
ken["ether_prof"] = 1

-- Variable
ken["hp"] = 12
ken["mp"] = 13
ken["stamina"] = 13


playable_characters[1] = ken
playable_characters[2] = mac

return playable_characters