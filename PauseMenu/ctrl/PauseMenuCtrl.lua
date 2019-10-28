require "lib.classes.class"
local MenuCtrl = require "Menu.ctrl.MenuCtrl"
--------------------------------------------------------------------------------------------------------

-- class: PauseMenuCtrl
-- param: view:View -> the view of the menu app
-- param: menu:Menu -> the menu model to manage
-- The controller of the pause menu app
local PauseMenuCtrl = extend(MenuCtrl, function(self, view, menu)
    self.aux_menus_ctrls = {}
    self.selected_menu = "side_menu"
end,

function(view, menu)
    return MenuCtrl.new(view, menu)
end)

function PauseMenuCtrl.addItemMenu(self, item_dict)
  -- TODO: create item menu
  local item_menu = nil
  self.view:addItemsView(item_menu)
  
  self.aux_menus_ctrls["items"] = item_menu
end

function PauseMenuCtrl.setup(self)
  -- TODO: Get items from global context
  local item_dict = {}
  
  self:addItemMenu(item_dict)
end

return PauseMenuCtrl