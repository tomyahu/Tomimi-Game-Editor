require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: View
-- View is the view class of an App in the MVC model
local View = class(function(self) end)

-- draw: dict() -> None
-- Takes the local context and from that it visualizes the current app objects on the screen
function View.draw(self, context) end

-- getContextVars: dict() -> dict()
-- Takes the local context and creates a new context based on it
function View.getContextVars(self, context) end

return View