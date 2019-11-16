require "Global.consts"
local GridRoomBuilder = require "Overworld.model.rooms.GridRoomBuilder"
local EntityFactory = require "Overworld.init.EntityFactory"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------

local floors = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}


local roomBuild = GridRoomBuilder.new(64, RESOURCES_PATH .. "/Overworld/Backgrounds/TestBackground.png", 20*64, 18*64)

for i, x in pairs(floors) do
    for j, val in pairs(x) do
        if val == 0 then
            roomBuild:addInvisibleWall(j, i)
        elseif val == 1 then
            roomBuild:addFloor(RESOURCES_PATH .. "/Overworld/Floors/TestFloor.png", j, i)
        end
    end
end

local entity_factory = EntityFactory.new()

--Add Plant
roomBuild:addObject(3,3,entity_factory:createOneTileDialogObject("/Overworld/Entities/Plant1.png",
    {
      "Me encanta esta planta, es muy bella me recuerda a las \nalcachofas.",
      "Solo que odio las alcachofas."
      }
    ))

--Add Plant with mac avatar
local planta_conversation = {}
planta_conversation[1] = {}
planta_conversation[1].texts = {}
planta_conversation[1].texts[1] = "Me encanta esta planta, es muy bella me recuerda a las \nalcachofas."
planta_conversation[1].texts[2] = "Solo que odio las alcachofas."
planta_conversation[1].character = "Mac"
planta_conversation[1].avatar_img_path = RESOURCES_PATH .. "/Overworld/CharacterPortraits/MacPortrait.png"

roomBuild:addObject(3, 4, entity_factory:createOneTileConversationObject("/Overworld/Entities/Plant1.png", planta_conversation))

--Add Naranjarina
roomBuild:addObject(8,5,entity_factory:createOneTileAppChangeObject("/Overworld/Entities/Naranjarina.png", "Battle"))

--Add Film
roomBuild:addObject(8,3,entity_factory:createOneTileAppChangeObject("/Overworld/Entities/Film.png", "Movie"))

--Add Path to room 2
roomBuild:addObject(6,2,entity_factory:createInvisibleChangeRoomPad("Room2", 64*6, 64*5))

local room = roomBuild:getRoom()
return room