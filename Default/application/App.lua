--------------------------------------------------------------------------------------------------------
App = {}
App.__index = App

-- App: App
-- Creates a App
function App.new(name, view, ctrl)
    local o = {}
    local self = setmetatable(o, App)
    self.__index = self
    self.name = name
    self.view = view
    self.ctrl = ctrl
    return self
end

function App.getName(self)
    return self.name
end

function App.getView(self)
    return self.view
end

function App.getCtrl(self)
    return self.ctrl
end
