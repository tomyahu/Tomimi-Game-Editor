require "Global.consts"

local icon_path = RESOURCES_PATH .. "/Menu/ObjectIcons/"

local items = {}

-- Item Definition -----------------------------------------------------------------------------------------------------
local pebble = {}
pebble["name"] = "Roca"
pebble["description"] = "Una roca normal que cabe en la palma de la mano."
pebble["icon"] = icon_path .. "001-Pebble.png"
pebble["consumable"] = true
pebble["stackable"] = 20
pebble["abilities"] = {}
table.insert(pebble["abilities"], 1)
table.insert(pebble["abilities"], 2)

local rope = {}
rope["name"] = "Cuerda"
rope["description"] = "Sirve para jugar a saltar la cuerda y atar cosas."
rope["icon"] = icon_path .. "002-Rope.png"
rope["consumable"] = true
rope["stackable"] = 3
rope["abilities"] = {}

local marbles = {}
marbles["name"] = "Puñado de Canicas"
marbles["description"] = "Son muy lindas pero hacen que la gente se caiga."
marbles["icon"] = icon_path .. "003-A-Bunch-of-Marbles.png"
marbles["consumable"] = true
marbles["stackable"] = 10
marbles["abilities"] = {}

-- Item Insertion ------------------------------------------------------------------------------------------------------

items[1] = pebble
items[2] = rope
items[3] = marbles

return items