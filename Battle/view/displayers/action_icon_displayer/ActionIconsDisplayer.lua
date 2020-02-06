require "lib.classes.class"
require "Global.consts"
require "Battle.shaders"
local ActionIconView = require("Battle.view.displayers.action_icon_displayer.ActionIconView")
--------------------------------------------------------------------------------------------------------

-- class: ActionIconsDisplayer
-- The view displayer for action icons
local ActionIconsDisplayer = class(function(self)
    self.actions_icons = {}
    self:reset()

    self.x_pos = GAME_WIDTH/2 - 64
    self.y_pos = 20

    self.fade_start = 0.2
    self.fade_end = 0.05

    self.canvas = love.graphics.newCanvas()
end)

-- draw: None -> None
-- draws the actions icons on the screen
-- TODO: Invert when there is an enemy attacking
function ActionIconsDisplayer.draw(self)
    if (self.current_action > 0) and (self.current_action <= (# self.actions_icons)) then
        self.canvas:renderTo(function()
            love.graphics.clear( )
            for i, icon in pairs(self:getPreviousActionIcons()) do
                local center_offset_x = self.current_action - i
                local center_offset_x_factor = 96

                -- Draw Action Icon
                icon:draw(self.x_pos - center_offset_x*center_offset_x_factor, self.y_pos)
            end

            -- Draw Current Action Icon
            self:getCurrentActionIcon():draw(self.x_pos, self.y_pos)
        end)

        -- Set shader to make older actions more transparent
        love.graphics.setShader(HORIZONTAL_FADE_SHADER)
            HORIZONTAL_FADE_SHADER:send("horizontal_fade_start", self.fade_start)
            HORIZONTAL_FADE_SHADER:send("horizontal_fade_end", self.fade_end)
            love.graphics.draw(self.canvas, 0, 0)
        love.graphics.setShader()
    end
end

-- advanceAction: None -> None
-- advances the current action of the displayer
function ActionIconsDisplayer.advanceAction(self)
    self.current_action = self.current_action + 1
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
        table.insert(aux, self:getActionIcon(i))
    end

    return aux
end

-- setter
function ActionIconsDisplayer.setActions(self, new_actions)
    -- Turn these actions into icons
    self.actions_icons = {}
    for _, action in pairs(new_actions) do
        table.insert(self.actions_icons, ActionIconView.new(action))
    end

    -- Resets
    self:reset()
end

return ActionIconsDisplayer