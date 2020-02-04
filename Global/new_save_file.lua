local TablesMemoryLib = require("lib.memory.TablesMemoryLib")

local save_file = {}

save_file["Overworld"] = {}
save_file["Overworld"]["Room"] = "Room1"
save_file["Overworld"]["Position"] = {}
save_file["Overworld"]["Position"]["x"] = 300
save_file["Overworld"]["Position"]["y"] = 300

save_file["Battle"] = {}
save_file["Battle"]["PlayerPartyMetadata"] = {}

local player1 = {}
player1["id"] = 2
player1["meta"] = {}
player1["meta"]["hp"] = 3
player1["meta"]["mp"] = 0
player1["meta"]["stamina"] = 10

local player2 = {}
player2["id"] = 1
player2["meta"] = {}
player2["meta"]["hp"] = 12
player2["meta"]["mp"] = 13
player2["meta"]["stamina"] = 13

local player3 = {}
player3["id"] = 3
player3["meta"] = {}
player3["meta"]["hp"] = 3
player3["meta"]["mp"] = 0
player3["meta"]["stamina"] = 5

save_file["Battle"]["PlayerPartyMetadata"][1] = player1
save_file["Battle"]["PlayerPartyMetadata"][3] = player2

save_file["Battle"]["EnemyPartyMetadata"] = {}
save_file["Battle"]["EnemyPartyMetadata"][1] = player3
save_file["Battle"]["EnemyPartyMetadata"][3] = player3

save_file["Battle"]["Environment"] = "debug_environment1"

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