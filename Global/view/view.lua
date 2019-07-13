require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: View
-- View is the view class of an App in the MVC model
local View = class(function(self) end)

-- draw: dict() -> None
-- Takes the local context and from that it visualizes the current app objects on the screen
function View.draw(self, context) end

-- setup: None -> None
-- Function called at the begining of the execution of an application
function View.setup(self) end

return View