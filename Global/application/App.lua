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
    return view
end

function App.getCtrl(self)
    local ctrl = require(self.path)["ctrl"]
    return ctrl
end

return App