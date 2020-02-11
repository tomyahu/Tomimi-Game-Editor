require "lib.classes.class"
require "Global.consts"
require "Global.fonts"
local items = require("Global.items")
local UITeselatedFrame = require("lib.ui.ui_objects.UITeselatedFrame")
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- class: ItemRewardDisplayer
-- param: sprite_path:str -> The sprite path of the frames of the message displayer
-- The view displayer for messages in the bottom of the screen
local ItemRewardDisplayer = class(function(self, sprite_path)
    self.sprite_path = sprite_path
    self.draw_x = GAME_WIDTH/2 - 64
    self.draw_y = 200

    self.text_offset_x = 64
    self.text_offset_y = 32

    self.items = {}

    self.title_displayer_frame = UITeselatedFrame.new(self.draw_x, self.draw_y - 30, self.sprite_path, 5, 1, 32)
    self.title_text = love.graphics.newText( BATTLE_FONT, "You've got:")

    self.displayer_frame = UITeselatedFrame.new(self.draw_x, self.draw_y, self.sprite_path, 12, 10, 32)
    self.is_visible = true
end)

-- draw: None -> None
-- draws the action name on the screen
function ItemRewardDisplayer.draw(self)
    if self.is_visible then
        self:drawFrameTitle()
        self:drawItems()
    end
end

-- drawFrameTitle: Noen -> None
function ItemRewardDisplayer.drawFrameTitle(self)
    self.title_displayer_frame:draw()
    love.graphics.draw(self.title_text, getRelativePosX(self.draw_x + 30), getRelativePosX(self.draw_y - 8), 0, getScale())
end

-- drawItems: None -> None
-- draws the items as a list in the displayer frame
function ItemRewardDisplayer.drawItems(self)
    self.displayer_frame:draw()

    for i, item in pairs(self.items) do
        love.graphics.draw(item.text, getRelativePosX(self.draw_x + self.text_offset_x), getRelativePosX(self.draw_y + 32*(i-1) + self.text_offset_y), 0, getScale())
        item.icon_sprite:draw(getRelativePosX(self.draw_x + self.text_offset_x - 32), getRelativePosX(self.draw_y + 32*(i-1) + self.text_offset_y - 8), 2*getScale(), 2*getScale())
    end
end

-- setItems: list(dict(id:int, count:int)) -> None
-- sets the visual components to draw every item
function ItemRewardDisplayer.setItems(self, new_items)
    self.items = {}

    for _, item in pairs(new_items) do
        local item_id = item.id
        local item_amount = item.count
        local item_name = items[item_id]["name"]
        local item_text = love.graphics.newText( BATTLE_FONT, item_name .. " x" .. item_amount)

        local item_icon_path = items[item_id]["icon"]
        local item_icon_sprite = SpriteFactory.getRegularRectSprite(item_icon_path, 16, 16, 1)

        local item = {}
        item.text = item_text
        item.icon_sprite = item_icon_sprite

        table.insert(self.items, item)
    end
end

-- setters
function ItemRewardDisplayer.setIsVisible(self, is_visible)
    self.is_visible = is_visible
end

-- getter
function ItemRewardDisplayer.isVisible(self)
    return self.is_visible
end

return ItemRewardDisplayer