require "lib.classes.class"
require "Global.consts"
--------------------------------------------------------------------------------------------------------

-- class: ActionIconsDisplayer
-- The view displayer for action icons
local ActionIconsDisplayer = class(function(self)
    self.actions_icons = {}
end)

-- draw: None -> None
-- draws the actions icons on the screen
-- TODO: Invert when there is an enemy attacking
function ActionIconsDisplayer.draw(self)
    -- TODO: Create Shader to make older actions more transparent
    for i, icon in pairs(self:getPreviousActionIcons()) do
        local center_offset_x_factor = self.current_action - i

        -- TODO: Draw Action Icon
    end

    -- TODO: Draw Current Action Icon
end

-- reset: None -> None
-- resets the action icon displayer so that it displays the first action
function ActionIconsDisplayer.reset(self)
    self.current_action = 1
end

-- getters
function ActionIconsDisplayer.getActionIcon(self, action_index)
    return self.actions_icons[action_index]
end

function ActionIconsDisplayer.getCurrentActionIcon(self)
    return self:getActionIcon(self.current_action)
end

function ActionIconsDisplayer.getPreviousActionIcons(self)
    local aux = {}

    for i = 1,(self.current_action - 1) do
        table.insert(self.getActionIcon(i))
    end

    return aux
end

-- setter
function ActionIconsDisplayer.setActions(self, new_actions)
    -- TODO: Turn these actions into icons
    self.actions_icons = new_actions
    self:reset()
end

return ActionIconsDisplayer