require "lib.classes.class"
local Scene = require("Battle.view.animations.scenes.Scene")
--------------------------------------------------------------------------------------------------------

-- class: ActionAnimations
-- param: source_animation_sequence:list(AnimationSequenceBuilder) -> The class that generates the animation to be
--                                                                      performed by the source
-- param: target_animation_sequence:list(AnimationSequenceBuilder) -> The class that generates the animation to be
--                                                                      performed by the targets
-- A class to manage an action's animations
local ActionAnimations = class(function(self, source_animation_builder, target_animation_builder)
    self.source_animation_builder = source_animation_builder
    self.target_animation_builder = target_animation_builder
end)

-- makeScene: EntityView, list(EntityView) -> Scene
-- Creates a scene with the entities given
function ActionAnimations.makeScene(self, source_entity_view, target_entity_views)
    local animation_sequences = {}

    -- Add the source entity view of the action to the animation
    table.insert(animation_sequences, self:getSourceAnimationBuilder():makeAnimationSequence(source_entity_view))

    -- Add the target entities views of the action to the animation
    for _, entity_view in pairs(target_entity_views) do
        table.insert(animation_sequences, self:getTargetAnimationBuilder():makeAnimationSequence(entity_view))
    end

    return Scene.new(animation_sequences)
end

-- getters
function ActionAnimations.getSourceAnimationBuilder(self)
    return self.source_animation_builder
end

function ActionAnimations.getTargetAnimationBuilder(self)
    return self.target_animation_builder
end

return ActionAnimations