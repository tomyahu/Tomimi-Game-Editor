require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Scene
-- param: animation_sequences:list(AnimationSequence) -> A list of animation sequences to play
-- A class made to play a set of animation sequences at the same time
local Scene = class(function(self, animation_sequences)
    self.animation_sequences = animation_sequences
end)

-- update: num -> None
-- Updates all animation sequences playing
function Scene.update(self, dt)
    for _, animation_sequence in pairs(self.animation_sequences) do
        animation_sequence:update(dt)
    end
end

-- hasEnded: None -> Boolean
-- Checks if the scene has ended playing
function Scene.hasEnded(self)
    local aux = true

    for _, animation_sequence in pairs(self.animation_sequences) do
        aux = aux and animation_sequence:hasEnded()
    end

    return aux
end

return Scene