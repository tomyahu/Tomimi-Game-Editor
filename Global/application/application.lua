local App = require "Global.application.App"
require "Global.consts"
--------------------------------------------------------------------------------------------------------
application = {}

CurrentCtrl = nil
CurrentView = nil
LocalContext = {}

function application.setView(_,newView)
    CurrentView = newView
end

function application.setCtrl(_,newCtrl)
    CurrentCtrl = newCtrl
end

function application.getCurrentView(_)
    return CurrentView
end

function application.getCurrentCtrl(_)
    return CurrentCtrl
end

function application.getCurrentLocalContext(_)
    return LocalContext
end

function application.setLocalContext(_, newContext)
    if newContext == nil then
        LocalContext = {}
    else
        LocalContext = newContext
    end
end

function application.appChange(self,appName)
    local nextApp = APPS[appName]
    application:setLocalContext(nextApp:getCtrl():getContextVars(self:getCurrentLocalContext()))
    application:setLocalContext(nextApp:getView():getContextVars(self:getCurrentLocalContext()))
    application:setView(nextApp:getView())
    application:setCtrl(nextApp:getCtrl())
end

function application:registerApp(appName, appPath)
    APPS[appName] = App.new(appName, appPath)
end