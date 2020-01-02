require "lib.classes.class"
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local ContentMenuBuilder = require "Menu.model.menues.ContentMenuBuilder"
--------------------------------------------------------------------------------------------------------

-- class: DefaultContentMenuBuilder
-- Default builder for the content menu
local DefaultContentMenuBuilder = extend(DefaultMenuBuilder, function(self)
    self.menubuild = ContentMenuBuilder.new()
end)

-- setContent: any -> self
-- Sets the content of the content menu being built
function DefaultMenuBuilder.setContent(self, content)
    self.menubuild:setContent(content)
end

return DefaultContentMenuBuilder