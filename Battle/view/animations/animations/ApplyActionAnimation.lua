require "lib.classes.class"
local Animation = require("Battle.view.animations.animations.Animation")
--------------------------------------------------------------------------------------------------------

-- class: MessageDisplayAnimation
-- param: action:Action -> the action ot execute
-- param: extra:table -> extra data about the action
-- An animation where a message is written in the view's message displayer
local ApplyActionAnimation = extend(Animation, function(self, action, extra)
    self.action = action
    self.extra = extra
end)

-- update: int -> None
-- updates aplies an action if its on the first frame
function ApplyActionAnimation.update(self, dt)
    Animation.update(self, dt)
    if self.current_time == dt then
        local action = self.action
        local source_entity = self.entity_view:getEntity()
        local target_entities = {}

        for _, entity_view in pairs(self.target_views) do
            table.insert(target_entities, entity_view:getEntity())
        end

        action:activate(source_entity, target_entities, self.extra)
    end
end

return ApplyActionAnimation