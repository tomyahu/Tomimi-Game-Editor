require "Global.consts"
require "Global.application.application"

local icon_path = RESOURCES_PATH .. "/Menu/ObjectIcons/"

local items = {}

-- Item Definition -----------------------------------------------------------------------------------------------------
local pebble = {}
pebble["name"] = "Pebble"
pebble["description"] = "A little rock that fits in the hand's palm."
pebble["icon"] = icon_path .. "001-Pebble.png"
pebble["consumable"] = true
pebble["stackable"] = 20
pebble["abilities"] = {}
table.insert(pebble["abilities"], 1)
table.insert(pebble["abilities"], 2)

local rope = {}
rope["name"] = "Rope"
rope["description"] = "Works for playing and jumping and tie things together."
rope["icon"] = icon_path .. "002-Rope.png"
rope["consumable"] = true
rope["stackable"] = 3
rope["abilities"] = {}

local marbles = {}
marbles["name"] = "A Bunch of Marbles"
marbles["description"] = "Very beautiful marbles."
marbles["icon"] = icon_path .. "003-A-Bunch-of-Marbles.png"
marbles["consumable"] = true
marbles["stackable"] = 10
marbles["abilities"] = {}

local orange_segment = {}
orange_segment["name"] = "Orange Segment"
orange_segment["description"] = "Gives some health back."
orange_segment["icon"] = icon_path .. "007-Orange-Segment.png"
orange_segment["consumable"] = true
orange_segment["stackable"] = 99
orange_segment["abilities"] = {}
orange_segment["action"] = function(extra)
    local save = application:getCurrentSave()

    for _, character in pairs(save["Party"]) do
        character["hp"] = math.min(character["max_hp"], character["hp"] + 1)
        character["stamina"] = math.min(character["max_stamina"], character["stamina"] + 2)
    end
end

-- Item Insertion ------------------------------------------------------------------------------------------------------

items[1] = pebble
items[2] = rope
items[3] = marbles

return items