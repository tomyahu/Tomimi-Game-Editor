local items = {}

local rock = {}
rock["name"] = "Roca"
rock["description"] = "Una roca normal que cabe en la palma de la mano."
rock["consumable"] = true
rock["abilities"] = {}
table.insert(rock["abilities"], 1)
table.insert(rock["abilities"], 2)

items[1] = rock

return items