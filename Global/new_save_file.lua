local TablesMemoryLib = require("lib.memory.TablesMemoryLib")

local save_file = {}

save_file["Overworld"] = {}
save_file["Overworld"]["Room"] = "Room1"
save_file["Overworld"]["Position"] = {}
save_file["Overworld"]["Position"]["x"] = 300
save_file["Overworld"]["Position"]["y"] = 300

-- items
save_file["Items"] = {}

-- Sets the party inventory, id -> item amount
save_file["Items"][1] = 1
save_file["Items"][2] = 3
save_file["Items"][3] = 1
save_file["Items"][7] = 5


-- Battle Encounter stuff
save_file["Battle"] = {}
save_file["Battle"]["PlayerPartyMetadata"] = {}

local player1 = {}
player1["id"] = 2
player1["meta"] = {}
player1["meta"]["hp"] = 3
player1["meta"]["mp"] = 5

local player2 = {}
player2["id"] = 1
player2["meta"] = {}
player2["meta"]["hp"] = 12
player2["meta"]["mp"] = 13

local player3 = {}
player3["id"] = 3
player3["meta"] = {}
player3["meta"]["hp"] = 3
player3["meta"]["mp"] = 0

save_file["Battle"]["PlayerPartyMetadata"][1] = player1
save_file["Battle"]["PlayerPartyMetadata"][3] = player2
save_file["Battle"]["CanEscape"] = true

save_file["Battle"]["EnemyPartyMetadata"] = {}
save_file["Battle"]["EnemyPartyMetadata"][1] = nil
save_file["Battle"]["EnemyPartyMetadata"][2] = player3
save_file["Battle"]["EnemyPartyMetadata"][3] = nil

save_file["Battle"]["Environment"] = "debug_environment1"
save_file["Battle"]["Rewards"] = {}
save_file["Battle"]["Rewards"]["Items"] = {}

local reward_item_1 = {}
reward_item_1["id"] = 7
reward_item_1["count"] = 2

local reward_item_2 = {}
reward_item_2["id"] = 1
reward_item_2["count"] = 1

table.insert(save_file["Battle"]["Rewards"]["Items"], reward_item_1)
table.insert(save_file["Battle"]["Rewards"]["Items"], reward_item_2)


local function getNewSaveFile()
    return TablesMemoryLib.copy(save_file)
end

return getNewSaveFile