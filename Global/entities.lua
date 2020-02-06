require "Global.consts"
require "Global.guard_types"

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
entity["strength"] = 7
entity["natural_resistence"] = 4
entity["speed"] = 7
entity["agility"] = 9
entity["reaction"] = 60
entity["guard_type"] = ROGUE_GUARD_TYPE

entity["b_aura_prof"] = 1
entity["b_spirit_prof"] = 1
entity["b_instinct_prof"] = 4

entity["actions"] = {1,4,5,6,7}

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
entity["strength"] = 10
entity["natural_resistence"] = 6
entity["speed"] = 6
entity["agility"] = 5
entity["reaction"] = 60
entity["guard_type"] = KNIGHT_GUARD_TYPE

entity["mana_strength"] = 8
entity["mana_control"] = 5

entity["fire_prof"] = 5
entity["wind_prof"] = 1
entity["ether_prof"] = 1

entity["actions"] = {1,7}

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
entity["reaction"] = 55
entity["strength"] = 4
entity["natural_resistence"] = 3
entity["speed"] = 4
entity["agility"] = 15
entity["guard_type"] = ROGUE_GUARD_TYPE

entity["mana_strength"] = 0
entity["mana_control"] = 0

entity["cold_prof"] = 2

entity["actions"] = {1,3}

local naranjarina = entity

table.insert(entities, ken)
table.insert(entities, mac)
table.insert(entities, naranjarina)

return entities