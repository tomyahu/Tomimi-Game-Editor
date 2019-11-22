require "Global.consts"

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

-- Item Insertion ------------------------------------------------------------------------------------------------------

items[1] = pebble
items[2] = rope
items[3] = marbles

return items