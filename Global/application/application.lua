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

function application.setLocalContext(self,newContext)
    LocalContext = newContext
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

function application.appChange(self,appName)
    local nextApp = APPS[appName]
    application:setView(nextApp:getView())
    application:setCtrl(nextApp:getCtrl())
    application:setLocalContext(nextApp:getView():getContextVars())
end

function application:registerApp(appName, appView, appCtrl)
    APPS[appName] = App.new(appName, appView, appCtrl)
end