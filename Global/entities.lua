require "Global.consts"

local entities = {}
local entity

------------------------------------------------------------------------------------------------------------------------
-- Mac -----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
entity = {}

-- Constant
entity["name"] = "Mac"
entity["weapon"] = 1
entity["icon_path"] = RESOURCES_PATH .. "/Overworld/CharacterPortraits/MacPortrait.png"
entity["battle_sprite_folder"] = RESOURCES_PATH .. "/Battle/Entities/mac/"
entity["max_hp"] = 8
entity["max_mp"] = 3
entity["max_stamina"] = 10
entity["strength"] = 5
entity["natural_resistence"] = 4
entity["speed"] = 7
entity["agility"] = 9

entity["b_aura_prof"] = 1
entity["b_spirit_prof"] = 1
entity["b_instinct_prof"] = 4

entity["actions"] = {1}

local mac = entity
------------------------------------------------------------------------------------------------------------------------
-- Ken -----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
entity = {}

-- Constant
entity["name"] = "Ken"
entity["weapon"] = 2
entity["icon_path"] = RESOURCES_PATH .. "/Overworld/CharacterPortraits/KenPortrait.png"
entity["battle_sprite_folder"] = RESOURCES_PATH .. "/Battle/Entities/ken/"
entity["max_hp"] = 15
entity["max_mp"] = 13
entity["max_stamina"] = 15
entity["strength"] = 10
entity["natural_resistence"] = 7
entity["speed"] = 6
entity["agility"] = 5

entity["mana_strength"] = 8
entity["mana_control"] = 5

entity["fire_prof"] = 5
entity["wind_prof"] = 1
entity["ether_prof"] = 1

entity["actions"] = {1}

local ken = entity
------------------------------------------------------------------------------------------------------------------------
-- Naranjarina ---------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

entity = {}

-- Constant
entity["name"] = "Naranjarina"
entity["icon_path"] = RESOURCES_PATH .. "/Overworld/CharacterPortraits/NonePortrait.png"
entity["battle_sprite_folder"] = RESOURCES_PATH .. "/Battle/Entities/naranjarina/"
entity["max_hp"] = 3
entity["max_mp"] = 0
entity["max_stamina"] = 2
entity["strength"] = 2
entity["natural_resistence"] = 2
entity["speed"] = 8
entity["agility"] = 8

entity["mana_strength"] = 0
entity["mana_control"] = 0

entity["cold_prof"] = 2

entity["actions"] = {1,3}

local naranjarina = entity

table.insert(entities, ken)
table.insert(entities, mac)
table.insert(entities, naranjarina)

return entities