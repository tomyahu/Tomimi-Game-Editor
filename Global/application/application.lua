require "Global.application.App"
require "Global.consts"
--------------------------------------------------------------------------------------------------------
application = {}

CurrentCtrl = nil
CurrentView = nil
LocalContext = {}

function application.setView(self,newView)
    CurrentView = newView
end

function application.setCtrl(self,newCtrl)
    CurrentCtrl = newCtrl
end

function application.getCurrentView(self)
    return CurrentView
end

function application.getCurrentCtrl(self)
    return CurrentCtrl
end

function application.getCurrentLocalContext(self)
    return LocalContext
end

function application.setLocalContext(self, newContext)
    if newContext == nil then
        LocalContext = {}
    else
        LocalContext = newContext
    end
end

function application.appChange(self,appName)
    local nextApp = APPS[appName]
    application:setLocalContext(nextApp:getView():getContextVars(self:getCurrentLocalContext()))
    application:setView(nextApp:getView())
    application:setCtrl(nextApp:getCtrl())
end

function application:registerApp(appName, appPath)
    APPS[appName] = App.new(appName, appPath)
end