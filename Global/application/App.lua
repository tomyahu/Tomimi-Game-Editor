require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local App = class(function(self, name, path)
    self.name = name
    self.path = path
end)

function App.getName(self)
    return self.name
end

function App.getView(self)
    local view = require(self.path)["view"]

    if view == nil then
        error("App " .. self.name .. "'s view not found.")
    elseif not (type(view) == "table") then
        error("App " .. self.name .. "'s view must be an object.")
    end

    return view
end

function App.getCtrl(self)
    local ctrl = require(self.path)["ctrl"]

    if ctrl == nil then
        error("App " .. self.name .. "'s controller not found.")
    elseif not (type(ctrl) == "table") then
        error("App " .. self.name .. "'s controller must be an object.")
    end

    return ctrl
end

return App
