require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.consts"
local BasicMenuView = require "Menu.view.BasicMenuView"
require "Global.application.application"

local SoundManager = require("PauseMenu.view.SoundManager")
local BackgroundView = require("PauseMenu.view.background.BackgroundView")
local MenuFactory = require("PauseMenu.view.menus.MenuFactory")
local NotificationDisplayer = require("PauseMenu.view.notifications.NotificationDisplayer")
--------------------------------------------------------------------------------------------------------

-- class: PauseMenuView
-- param: background_image_path:str -> the path of the image to display
-- param: menu:Menu -> the menu to display
-- param: font:Font -> the font of the leters in the menu
-- The games view of the main menu
-- TODO: change menu variable and add it in setup (might have to use controller for this)
local PauseMenuView = extend(BasicMenuView, function(self, background_image_path, menu, font, menu_sprite_sheet_path)
    self.menu_factory = MenuFactory.new(menu_sprite_sheet_path, font)
    self.background = BackgroundView.new(background_image_path)
    self.side_menu_view = self.menu_factory:getSideMenu(menu)
    self.aux_menus_views = {}
    self.aux_menus_views_visibility = {}
    self.font = font
    self.sound_manager = SoundManager.new()
    self.notification_displayer = NotificationDisplayer.new(font)
end,

function(background_image_path, menu, font)
    return BasicMenuView:new(background_image_path, menu)
end)

-- draw: context -> None
-- Draws the menu options
function PauseMenuView.draw(self)
  self.background:draw()
  
  love.graphics.setFont(self.font)
  self.side_menu_view:draw()
  
  -- Draw all aux menus
  for id, menu in pairs(self.aux_menus_views) do
    if self.aux_menus_views_visibility[id] then
      menu:draw()
    end
  end
  
  self.notification_displayer:draw()
end

-- update: int -> None
-- Updates the internal time of the view components
function PauseMenuView.update(self, dt)
    self.notification_displayer:updateLastMessageTime(dt)
end

-- addItemsView: Menu -> None
-- Adds the item's view to the auxiliary menues and visibility
function PauseMenuView.addItemsView(self, menu)
  self.aux_menus_views["items"] = self.menu_factory:getItemMenu(menu)
  self.aux_menus_views_visibility["items"] = true
end

-- addPartyView: Menu -> None
-- Adds the party view to the auxiliary menues and visibility
function PauseMenuView.addPartyView(self, menu)
    self.aux_menus_views["party"] = self.menu_factory:getPartyMenu(menu)
    self.aux_menus_views_visibility["party"] = true
end

-- addAuxiliaryView: Menu -> None
-- Adds the auxiliary view to the auxiliary menues and visibility
function PauseMenuView.addAuxiliaryView(self, menu)
    self.aux_menus_views["aux"] = self.menu_factory:getAuxiliaryMenu(menu)
    self.aux_menus_views_visibility["aux"] = true
end

-- setItemsViewVisibility: bool -> None
-- Sets the visibility of the items menu
function PauseMenuView.setItemsViewVisibility(self, visibility)
  self.aux_menus_views_visibility["items"] = visibility
end

-- setPartyViewVisibility: bool -> None
-- Sets the visibility of the party menu
function PauseMenuView.setPartyViewVisibility(self, visibility)
    self.aux_menus_views_visibility["party"] = visibility
end

-- setAuxiliaryViewVisibility: bool -> None
-- Sets the visibility of the auxiliary menu
function PauseMenuView.setAuxiliaryViewVisibility(self, visibility)
    self.aux_menus_views_visibility["aux"] = visibility
end

function PauseMenuView.setup(self)
end

function PauseMenuView.stop(self)
end

-- displayNotification: str -> None
-- displays the message passed in the bottom left corner of the screen
function PauseMenuView.displayNotification(self, msg)
    self.notification_displayer:displayMessage(msg)
end

-- getter
function PauseMenuView.getSoundManager(self)
    return self.sound_manager
end

return PauseMenuView