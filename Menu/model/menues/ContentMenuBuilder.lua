require "lib.classes.class"
local ContentMenu = require "Menu.model.menues.ContentMenu"
local MenuBuilder = require "Menu.model.menues.MenuBuilder"
--------------------------------------------------------------------------------------------------------

-- class: ContentMenuBuilder
-- Builder class to create a content menu
local ContentMenuBuilder = extend(MenuBuilder, function(self)
    self.menu = ContentMenu.new()
end)

-- setContent: any -> None
-- Sets the menu content to new_content
function ContentMenuBuilder.setContent(self, new_content)
    self.menu:setContent(new_content)
end

return ContentMenuBuilder