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

-- getContextVars: dict() -> dict()
-- Takes the local context returns the same context
function OverworldCtrl.getContextVars(self, context)
    local l_context = application:getCurrentLocalContext()
    l_context['SolidObjects'] = {}
    l_context['Interactuables'] = {}
    l_context['ContactInteractuables'] = {}

    local new_room = self.room_manager:getCurrentRoom()
    new_room:addObject(self.player, 1)

    new_room:registerObjects()
    self.view:setCurrentRoom(new_room)

    local new_context = {}
    new_context['SolidObjects'] = context['SolidObjects']
    new_context['Interactuables'] = context['Interactuables']
    new_context['ContactInteractuables'] = context['ContactInteractuables']

    return new_context
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

    local context = application:getCurrentLocalContext()
    context['SolidObjects'] = {}
    context['Interactuables'] = {}
    context['ContactInteractuables'] = {}

    local new_room = self.room_manager:getCurrentRoom()
    new_room:addObject(self.player, 1)

    new_room:registerObjects()
    self.view:setCurrentRoom(new_room)
    
    self:setControls(PreRegularControl.new(self))
end

return OverworldCtrl