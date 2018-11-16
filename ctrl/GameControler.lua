require "class"
--------------------------------------------------------------------------------------------------------
Controller = class(function(ctrl, model, view)
    ctrl.model = model
    ctrl.view = view
end)

function Controller:updateView()
    ctrl.view:draw()
end

