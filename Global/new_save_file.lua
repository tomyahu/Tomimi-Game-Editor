local TablesMemoryLib = require("lib.memory.TablesMemoryLib")
local entities = require("Global.entities")


local save_file = {}

save_file["Overworld"] = {}
save_file["Overworld"]["Room"] = "Room1"
save_file["Overworld"]["Position"] = {}
save_file["Overworld"]["Position"]["x"] = 300
save_file["Overworld"]["Position"]["y"] = 300
save_file["Overworld"]["Position"]["y"] = 300

save_file["Battle"] = {}
save_file["Battle"]["PlayerPartyMetadata"] = {}

save_file["Party"] = {}
save_file["Party"][1] = entities[2] -- Mac
save_file["Party"][2] = entities[1] -- Ken


local player1 = {}
player1["id"] = 3
player1["meta"] = {}

save_file["Battle"]["PlayerPartyMetadata"][1] = player1
save_file["Battle"]["PlayerPartyMetadata"][2] = player1
save_file["Battle"]["PlayerPartyMetadata"][3] = player1

save_file["Battle"]["EnemyPartyMetadata"] = {}
save_file["Battle"]["EnemyPartyMetadata"][1] = player1
save_file["Battle"]["EnemyPartyMetadata"][2] = player1
save_file["Battle"]["EnemyPartyMetadata"][3] = player1

save_file["Battle"]["Ambient"] = "debug_ambient1"

-- items
save_file["Items"] = {}

local item_1 = {}
item_1["id"] = 1
item_1["count"] = 1

local item_2 = {}
item_2["id"] = 2
item_2["count"] = 3

local item_3 = {}
item_3["id"] = 3
item_3["count"] = 1

local item_4 = {}
item_4["id"] = 7
item_4["count"] = 5

table.insert(save_file["Items"], item_1)
table.insert(save_file["Items"], item_2)
table.insert(save_file["Items"], item_3)
table.insert(save_file["Items"], item_4)


local function getNewSaveFile()
    return TablesMemoryLib.copy(save_file)
end

return getNewSaveFile