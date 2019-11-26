require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: LoveUIComponent
-- The base class to serve as an interface for the UI components
local LoveUIComponent = class(function(self) end)

-- draw: None -> None
-- Draws the UI component
function LoveUIComponent.draw(self) end

return LoveUIComponent