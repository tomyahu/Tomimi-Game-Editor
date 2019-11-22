require "lib.classes.class"
local Menu = require "Menu.model.menues.Menu"
--------------------------------------------------------------------------------------------------------

-- class: ContentMenu
-- param: content:any -> The contents of the menu
-- Creates a new ContentMenu with a content structure and empty options
local ContentMenu = extend(Menu, function(self, content)
    self.options = {}
    self.content = content
end)

-- setter
function ContentMenu.setContent(self, new_content)
    self.content = new_content
end

-- getter
function ContentMenu.getContent(self)
    return self.content
end

return ContentMenu
