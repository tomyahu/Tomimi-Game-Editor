require "Default.application.App"
require "Default.consts"
--------------------------------------------------------------------------------------------------------
CurrentCtrl = nil
CurrentView = nil
Context = {}

function setView(newView)
    CurrentView = newView
end

function setCtrl(newCtrl)
    CurrentCtrl = newCtrl
end

function setContext(newContext)
    Context = newContext
end

function getCurrentView()
    return CurrentView
end

function getCurrentCtrl()
    return CurrentCtrl
end

function getCurrentContext()
    return Context
end

function appChange(appName)
    local nextApp = APPS[appName]
    setView(nextApp:getView())
    setCtrl(nextApp:getCtrl())
    setContext(nextApp:getView():getContextVars())
end

function registerApp(appName, appView, appCtrl)
    APPS[appName] = App.new(appName, appView, appCtrl)
end