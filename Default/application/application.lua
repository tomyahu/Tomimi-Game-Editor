require "Default.application.App"
require "Default.consts"
--------------------------------------------------------------------------------------------------------
application = {}

CurrentCtrl = nil
CurrentView = nil
localContext = {}

function application.setView(self,newView)
    CurrentView = newView
end

function application.setCtrl(self,newCtrl)
    CurrentCtrl = newCtrl
end

function application.setContext(self,newContext)
    localContext = newContext
end

function application.getCurrentView(self)
    return CurrentView
end

function application.getCurrentCtrl(self)
    return CurrentCtrl
end

function application.getCurrentContext(self)
    return localContext
end

function application.appChange(self,appName)
    local nextApp = APPS[appName]
    application:setView(nextApp:getView())
    application:setCtrl(nextApp:getCtrl())
    application:setContext(nextApp:getView():getContextVars())
end

function application:registerApp(appName, appView, appCtrl)
    APPS[appName] = App.new(appName, appView, appCtrl)
end