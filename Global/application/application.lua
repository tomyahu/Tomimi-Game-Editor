local App = require "Global.application.App"
local GlobalContextClass = require "lib.file.json.JsonDictFile"
require "Global.consts"
--------------------------------------------------------------------------------------------------------

-- The aplication manager
application = {}

-- TODO: create a method to get current save

-- Current controller of the manager
local CurrentCtrl = nil

-- Current view of the manager
local CurrentView = nil

-- Current local context of the manager, every time the appChange function is called the function getContextVars method
-- from the controller of the next application is called to decide what to keep from the previous local context
-- TODO: Check if this can be done by just using the global context and clean local context every app change
local LocalContext = {}

-- Current global context of the manager, is a global dictionary storage that is only accesed with the function
-- getGlobalContext
local GlobalContext = GlobalContextClass.new(GLOBAL_CONTEXT_PATH)

-- If its empty the default global context is loaded and saved
if next(GlobalContext.dict) == nil then
   GlobalContext.dict = require("Global.default_globals")
   GlobalContext:save()
end

-- Current Shader used
local CurrentShader = love.graphics.newShader("/Global/shaders/default_pixel_shader.glsl", "/Global/shaders/default_vertex_shader.glsl")

-- Sets the current view of the application manager
function application.setView(_,newView)
    CurrentView = newView
end

-- Sets the current controller of the application manager
function application.setCtrl(_,newCtrl)
    CurrentCtrl = newCtrl
end

-- Gets the current view of the application manager
function application.getCurrentView(_)
    return CurrentView
end

-- Gets the current controller of the application manager
function application.getCurrentCtrl(_)
    return CurrentCtrl
end

-- Sets the current pixel and vertex shader
function application.setCurrentShader(_, new_pixel_shader, new_vertex_shader)
    CurrentShader = love.graphics.newShader(new_pixel_shader, new_vertex_shader)
end

-- Gets the current shader
function application.getCurrentShader(_)
    return CurrentShader
end

-- Gets the local context of the application
function application.getLocalContext(_)
    return LocalContext
end

-- Empties the local context
function application.resetLocalContext(_)
    LocalContext = {}
end

-- Replaces the old local context with newContext if it is not nil, otherwise it cleans the local context
function application.setLocalContext(_, newContext)
    if newContext == nil then
        LocalContext = {}
    else
        LocalContext = newContext
    end
end

-- Sets a key to a value in local context
function application.setInLocalContext(_, key, val)
    LocalContext[key] = val
end

-- Gets a value from the local context associated with key
function application.getFromLocalContext(_, key)
    return LocalContext[key]
end

-- Gets the global context of the application
function application.getGlobalContext(_)
    return GlobalContext.dict
end

-- Sets a key to a value in global context
function application.setInGlobalContext(_, key, val)
    GlobalContext:set(key, val)
end

-- Gets a value from the global context associated with key
function application.getFromGlobalContext(_, key)
    return GlobalContext:get(key)
end

-- Saves the global context in the file
function application.saveGlobalContext(_)
  GlobalContext:save()
end

-- Loads the global context from the file
function application.loadGlobalContext(_)
  GlobalContext:load()
end

-- appChange: str -> None
-- Changes the current application to the application appName
-- TODO: Check if local context is still not cleaned
function application.appChange(self,appName)
    -- Gets the new application from the global constants
    local nextApp = APPS[appName]
    if nextApp == nil then
        error("The application " .. appName .. " isn't registered or doesn't exists.")
    end

    local current_ctrl = application:getCurrentCtrl()
    local current_view = application:getCurrentView()

    -- Calls the stop functionsof the current application
    current_ctrl:stop()
    current_view:stop()

    local new_ctrl = nextApp:getCtrl()
    local new_view = nextApp:getView()

    -- Manages the local context of the next application
    application:resetLocalContext()

    -- Calls the setup functions of the next application
    new_ctrl:setup()
    new_view:setup()

    -- Sets the current view and controller to those of the next application
    application:setView(new_view)
    application:setCtrl(new_ctrl)
end

-- registerApp: str str -> None
-- Registers a new application in the global APPS variable
function application:registerApp(appName, appPath)
    APPS[appName] = App.new(appName, appPath)
end