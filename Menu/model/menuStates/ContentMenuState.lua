require "lib.classes.class"
local MenuState = require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------

-- class: ContentMenuState
-- param: name:str -> the name of the menu state
-- param: content:any -> the content of this menu state
-- Creates a new Content Menu state
local ContentMenuState = extend(MenuState, function(self, name, content)
    self.name = name
    self.content = content
end)

-- getters
function ContentMenuState.getContent(self)
    return self.content
end

-- setters
function ContentMenuState.setContent(self, new_content)
    self.content = new_content
end

return ContentMenuState