require "lib.classes.class"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
require "Global.LOVEWrapper.LOVEWrapper"

local items = require("Global.items")
--------------------------------------------------------------------------------------------------------
-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: CharacterInfoCard
-- param: card_border:MenuBorderView -> the border of the character card
-- param: character_stats:dict -> statistics of the character
-- TODO: create Factory for character cards
local CharacterInfoCard = class(function(self, card_border, character_stats, font)
    self.character_stats = character_stats
    self.card_border = card_border
    self.font = font

    self.weapon_id = -1
    self.weapon_name = love.graphics.newText( font, "Weapon: " .. "???" )
    self.weapon_sprite = nil

    self.character_icon =  sprite_factory:getRegularRectSprite(character_stats["icon_path"], 64, 64, 1)
end)

-- TODO: Document this
function CharacterInfoCard.draw(self)
    -- Draw card border
    self.card_border:draw()

    local border_offset_x = self.card_border:getX()
    local border_offset_y = self.card_border:getY()

    local border_offset_width = self.card_border:getWidth()*self.card_border:getDimension()
    local border_offset_height = self.card_border:getHeight()*self.card_border:getDimension()

    -- Draw Portrait
    self.character_icon:draw(getRelativePosX(border_offset_x + border_offset_width/2 - 112),getRelativePosY(border_offset_y + 28),4*getScale() ,4*getScale())

    -- set font
    love.graphics.setFont( self.font )

    local text_offset_x_1 = border_offset_x + 28
    local text_offset_x_2 = text_offset_x_1 + border_offset_width/2 - 14

    local text_offset_y = border_offset_y + 256 + 28 + 10
    local text_vertical_space = 32

    -- Draw Name
    local name = self:getStrFromStat(self.character_stats["name"])
    love.graphics.print( name, getRelativePosX(text_offset_x_1), getRelativePosY(text_offset_y), 0, getScale(), getScale())


    -- Draw HP, MP and STA
    local max_hp = self:getStrFromStat(self.character_stats["max_hp"])
    local max_mp = self:getStrFromStat(self.character_stats["max_mp"])
    local max_sta = self:getStrFromStat(self.character_stats["max_stamina"])

    local hp = self:getStrFromStat(self.character_stats["hp"])
    local mp = self:getStrFromStat(self.character_stats["mp"])
    local sta = self:getStrFromStat(self.character_stats["stamina"])

    love.graphics.print( "HP: " .. hp .. "/" .. max_hp, getRelativePosX(text_offset_x_1), getRelativePosY(text_offset_y + text_vertical_space), 0, getScale(), getScale())
    love.graphics.print( "MP: " .. mp .. "/" .. max_mp, getRelativePosX(text_offset_x_2), getRelativePosY(text_offset_y + text_vertical_space), 0, getScale(), getScale())
    love.graphics.print( "STA: " .. sta .. "/" .. max_sta, getRelativePosX(text_offset_x_1), getRelativePosY(text_offset_y + 2*text_vertical_space), 0, getScale(), getScale())


    -- Draw STR, RES, SPD and AGI
    local str = self:getStrFromStat(self.character_stats["strength"])
    local res = self:getStrFromStat(self.character_stats["natural_resistence"])
    local spd = self:getStrFromStat(self.character_stats["speed"])
    local agi = self:getStrFromStat(self.character_stats["agility"])

    love.graphics.print( "STR: " .. str, getRelativePosX(text_offset_x_1), getRelativePosY(text_offset_y + 3.5*text_vertical_space), 0, getScale(), getScale())
    love.graphics.print( "RES: " .. res, getRelativePosX(text_offset_x_2), getRelativePosY(text_offset_y + 3.5*text_vertical_space), 0, getScale(), getScale())
    love.graphics.print( "SPD: " .. spd, getRelativePosX(text_offset_x_1), getRelativePosY(text_offset_y + 4.5*text_vertical_space), 0, getScale(), getScale())
    love.graphics.print( "AGI: " .. agi, getRelativePosX(text_offset_x_2), getRelativePosY(text_offset_y + 4.5*text_vertical_space), 0, getScale(), getScale())

    -- Check if weapon has changed Weapon
    -- TODO: Put this in its own method
    local weapon_id = self.character_stats["weapon"]
    if not (self.weapon_id == weapon_id) then
        local weapon = items[weapon_id]
        self.weapon_name = love.graphics.newText( self.font, "Weapon: " .. weapon["name"])
        self.weapon_sprite = sprite_factory:getRegularRectSprite(weapon["icon"], 16, 16, 1)
    end

    -- Draw Weapon
    love.graphics.draw( self.weapon_name, getRelativePosX(text_offset_x_1), getRelativePosY(text_offset_y + 6*text_vertical_space), 0, getScale(), getScale())
    self.weapon_sprite:draw(getRelativePosX(text_offset_x_1 + self.weapon_name:getWidth() + 5), getRelativePosY(text_offset_y + 6*text_vertical_space - 4), 2*getScale(), 2*getScale())
end

-- TODO: Document this
function CharacterInfoCard.getStrFromStat(self, stat)
    if stat == nil then
        return "??"
    else
        return tostring(stat)
    end
end

return CharacterInfoCard