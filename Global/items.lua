local items = {}

local rock = {}
rock["name"] = "Roca"
rock["description"] = "Una roca normal."
rock["consumable"] = true
rock["abilities"] = {}
table.insert(rock["abilities"], 1)
table.insert(rock["abilities"], 2)

table.insert(items, rock)

return items