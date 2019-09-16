require "lib.classes.class"
require "Global.application.application"
local Ctrl = require "Global.ctrl.ctrl"
local OverworldBehavior = require "Overworld.model.physics.behavior.OverworldBehavior"
local OverworldInteractuableObjectBehavior = require "Overworld.model.physics.behavior.OverworldInteractuableObjectBehavior"
local DialogManager = require "Overworld.ctrl.dialogs.DialogManager"
local ControlManager = require "Overworld.ctrl.controls.ControlManager"
local RegularControl = require "Overworld.ctrl.controls.RegularControl"
local PreRegularControl = require "Overworld.ctrl.controls.PreRegularControl"
local DialogControl = require "Overworld.ctrl.controls.DialogControl"
--------------------------------------------------------------------------------------------------------

-- class: OverworldCtrl
-- param: view:View -> the view of the overworld application
-- param: player:Player -> the player object of the overworld
-- param: room_manager:RoomManager -> the room manager that manages which room to render at the moment
-- The controller of the overworld app
local OverworldCtrl = extend(Ctrl, function(self, view, player, room_manager)
    self.player = player
    self.room_manager = room_manager
    self.dialog_manager = DialogManager.new(view, self)
    self.behavior = OverworldBehavior.new("SolidObjects", self.player)
    self.interactuable_behavior = OverworldInteractuableObjectBehavior.new("ContactInteractuables", self.player)

    self.controls_manager = ControlManager.new()
    self.controls_manager:setControls(RegularControl.new(self))
    self.view = view
end,

function(view, player_view, room_manager)
    return Ctrl.new(view)
end)

-- setup: None -> None
-- Takes the local context returns the same context
function OverworldCtrl.setup(self)
    -- TODO: create a method to get current save
    local save = application:getFromGlobalContext("SAVES")["Debug"]

    self.room_manager:setCurrentRoom(save["Overworld"]["Room"])
    self.player:setPos(save["Overworld"]["Position"]["x"], save["Overworld"]["Position"]["y"])

    local new_room = self.room_manager:getCurrentRoom()
    new_room:addObject(self.player, 1)

    new_room:registerObjects()
    self.view:setCurrentRoom(new_room)
end

-- stop: None -> None
-- Function called at the end of the execution of an application
function OverworldCtrl.stop(self)
    -- TODO: create a method to get current save
    local saves = application:getFromGlobalContext("SAVES")
    local save = saves["Debug"]

    local player_x, player_y = self.player:getPos()

    save["Overworld"]["Position"]["x"] = player_x
    save["Overworld"]["Position"]["y"] = player_y
    save["Overworld"]["Room"] = self.room_manager:getCurrentRoomIndex()

    saves["Debug"] = save

    application:setInGlobalContext("SAVES", saves)

end

-- update: num -> None
-- Function called every frame
-- updates the controls manager
function OverworldCtrl.update(self, dt)
    self.controls_manager:update()
end

-- startDialog: Dialog -> None
-- Starts a dialog in the overworld
function OverworldCtrl.startDialog(self, dialog)
    self.dialog_manager:setCurrentDialog(dialog)
    self:setControls(DialogControl.new(self))
end

-- setControls: Controls -> None
-- Sets the current controls to Controls
function OverworldCtrl.setControls(self, Controls)
    self.controls_manager:setControls(Controls)
end

-- changeRoom: int -> None
-- Changes the current room rendered
function OverworldCtrl.changeRoom(self, index)
    self.room_manager:setCurrentRoom(index)

    application:setInLocalContext('SolidObjects', {})
    application:setInLocalContext('Interactuables', {})
    application:setInLocalContext('ContactInteractuables', {})

    local new_room = self.room_manager:getCurrentRoom()
    new_room:addObject(self.player, 1)

    new_room:registerObjects()
    self.view:setCurrentRoom(new_room)
    
    self:setControls(PreRegularControl.new(self))
end

return OverworldCtrl