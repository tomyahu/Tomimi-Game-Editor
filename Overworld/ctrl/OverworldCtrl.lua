require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
local OverworldBehavior = require "Overworld.model.physics.behavior.OverworldBehavior"
local DialogManager = require "Overworld.ctrl.dialogs.DialogManager"
local ControlManager = require "Overworld.ctrl.controls.ControlManager"
local RegularControl = require "Overworld.ctrl.controls.RegularControl"
local DialogControl = require "Overworld.ctrl.controls.DialogControl"
--------------------------------------------------------------------------------------------------------

local OverworldCtrl = extend(Ctrl, function(self, view, player, room_manager)
    self.player = player
    self.room_manager = room_manager
    self.dialog_manager = DialogManager.new(view, self)
    self.behavior = OverworldBehavior.new("SolidObjects", self.player)
    self.behavior = OverworldBehavior.new("SolidObjects", self.player)

    self.controls_manager = ControlManager.new()
    self.controls_manager:setControls(RegularControl.new(self))
    self.view = view
end,

function(view, player_view, room_manager)
    return Ctrl.new(view)
end)

function OverworldCtrl.getContextVars(self, context)
    local new_context = {}
    new_context['SolidObjects'] = context['SolidObjects']
    new_context['Interactuables'] = context['Interactuables']
    return new_context
end

function OverworldCtrl.update(self,_)
    self.controls_manager:update()
end

function OverworldCtrl.startDialog(self, dialog)
    self.dialog_manager:setCurrentDialog(dialog)
    self:setControls(DialogControl.new(self))
end

function OverworldCtrl.setControls(self, Controls)
    self.controls_manager:setControls(Controls)
end

return OverworldCtrl