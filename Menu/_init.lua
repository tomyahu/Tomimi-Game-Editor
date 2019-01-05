require "Menu.ctrl.MenuCtrl"
require "Menu.view.MenuView"
require "Menu.model.menues.DefaultMenuBuilder"
require "Menu.model.menuStates.ExitMenuState"
require "Menu.model.menues.DefaultMenuBuilder"

local mBuild = DefaultMenuBuilder.new()
mBuild:addState(MenuState.new("Start"))
mBuild:addState(MenuState.new("Load"))
mBuild:addState(ExitMenuState.new("Exit"))

titleScreenMenu = mBuild:getMenu()

titleScreenMenuCtrl = MenuCtrl.new(titleScreenMenu)
titleScreenMenuView = MenuView.new("Resources/Menu/background.png", titleScreenMenu)