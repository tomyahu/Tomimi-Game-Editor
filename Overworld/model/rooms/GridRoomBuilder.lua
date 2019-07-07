require "lib.classes.class"
require "Global.consts"
local Room = require "Overworld.model.rooms.Room"
local Pair = require "lib.structures.util.Pair"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------

-- class: GridRoomBuilder
-- param: cell_size:int -> the size of a single cell in the room
-- param: background_image:str -> the image to display in the background of the room
-- param: width:int -> the width of the room in cells
-- param: height:int -> the height of the room in cells
-- The behaviour that defines how the player interacts with the interactuable objects of the overworld
local GridRoomBuilder = class(function(self, cell_size, background_image, width, height)
    self.cell_size = cell_size
    self.room = Room.new(background_image, width, height)
    self.walls = {}
end)

-- addWall: str, int, int -> None
-- Adds a wall in the specific cell with the image path wall_image
function GridRoomBuilder.addWall(self, wall_image, x, y)
    local wall_frames = {}
    wall_frames[1] = {}
    wall_frames[1][1] = RectFrame.new(0,0,self.cell_size,self.cell_size)

    local wall_sprite = Sprite.new(wall_frames, wall_image)
    local wall = SolidEntity.new(wall_sprite, newWallHitboxes(self.cell_size, self.cell_size))
    wall:setPos(x * self.cell_size, y * self.cell_size)
    self.room:addObject(wall, 2)
end

-- addInvisibleWall: str, int, int -> None
-- Adds an invisible wall in the indicated cell
function GridRoomBuilder.addInvisibleWall(self, x, y)
    self:addWall(RESOURCES_PATH .. "/Overworld/Walls/InvisibleWall.png", x, y)
end

-- addFloor: str, int, int -> None
-- Adds a flooring entity in de specified cell with the image path passed
function GridRoomBuilder.addFloor(self, floor_image, x, y)
    local floor_frames = {}
    floor_frames[1] = {}
    floor_frames[1][1] = RectFrame.new(0,0,self.cell_size,self.cell_size)

    local floor_sprite = Sprite.new(floor_frames, floor_image)
    local floor = SolidEntity.new(floor_sprite, {})
    floor:setPos(x * self.cell_size, y * self.cell_size)
    self.room:addObject(floor, 0)
end

-- addObject: int, int, Entity -> None
-- Adds an Entity to the room in the specified cell
function GridRoomBuilder.addObject(self, x, y, object)
    object:setPos(x * self.cell_size, y * self.cell_size)
    self.room:addObject(object, 1)
end

-- getRoom: None -> Room
-- Builds the room object and returns it
function GridRoomBuilder.getRoom(self)
    return self.room
end

return GridRoomBuilder
