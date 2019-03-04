require "lib.classes.class"
require "Global.consts"
local Room = require "Overworld.model.rooms.Room"
local Pair = require "lib.structures.util.Pair"
local RectFrame = require "Global.LOVEWrapper.sprite.RectFrame"
local Sprite = require "Global.LOVEWrapper.sprite.Sprite"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
require "Overworld.init.hitboxes"
--------------------------------------------------------------------------------------------------------
local GridRoomBuilder = class(function(self, cell_size, background_image, width, height, wall_class)
    self.cell_size = cell_size
    self.room = Room.new(background_image, width, height)
    self.walls = {}
    self.wall_class = wall_class
end)

function GridRoomBuilder.addWall(self, wall_image, x, y)
    local wall_frames = {}
    wall_frames[1] = RectFrame.new(0,0,self.cell_size,self.cell_size)

    local wall_sprite = Sprite.new(wall_frames, wall_image)
    local wall = SolidEntity.new(wall_sprite, newWallHitboxes(self.cell_size, self.cell_size))
    wall:setPos(x * self.cell_size, y * self.cell_size)
    self.room:addObject(wall, 2)
end

function GridRoomBuilder.addInvisibleWall(self, x, y)
    self:addWall(RESOURCES_PATH .. "/Overworld/Walls/InvisibleWall.png", x, y)
end

function GridRoomBuilder.addFloor(self, floor_image, x, y)
    local floor_frames = {}
    floor_frames[1] = RectFrame.new(0,0,self.cell_size,self.cell_size)

    local floor_sprite = Sprite.new(floor_frames, floor_image)
    local floor = SolidEntity.new(floor_sprite, {})
    floor:setPos(x * self.cell_size, y * self.cell_size)
    self.room:addObject(floor, 0)
end

function GridRoomBuilder.addObject(self, x, y, object)
    object:setPos(x * self.cell_size, y * self.cell_size)
    self.room:addObject(object, 1)
end

function GridRoomBuilder.getRoom(self)
    return self.room
end

return GridRoomBuilder
