--------------------------------------------------------------------------------------------------------
App = {}
App.__index = App

-- App: App
-- Creates a App
function App.new(name, path)
    local o = {}
    local self = setmetatable(o, App)
    self.__index = self
    self.name = name
    self.path = path
    return self
end

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
