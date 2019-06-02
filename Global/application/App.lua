require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: App
-- param: name:str -> the application name
-- param: path:str -> the path of the script that initialices the contoller and view of the app
-- App is an application that can be changed in the application manager
local App = class(function(self, name, path)
    self.name = name
    self.path = path
end)

-- getters
function App.getName(self)
    return self.name
end

-- getView: None -> View
-- Loads and gets the view of the App, it throws an error if it couldn't be loaded
function App.getView(self)
    local view = require(self.path)["view"]

    if view == nil then
        error("App " .. self.name .. "'s view not found.")
    elseif not (type(view) == "table") then
        error("App " .. self.name .. "'s view must be an object.")
    end

    return view
end

-- getCtrl: None -> Ctrl
-- Loads and gets the controller of the App, it throws an error if it couldn't be loaded
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
