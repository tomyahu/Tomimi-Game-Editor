require "lib.classes.class"
local NullItem = require()
-------------------------------------------------------------------------------------------------------

-- class: NullItem
-- A consumable item for a battle
local ConsumableItem = extend(NullItem, function(self, effect)
    self.effect = effect
end,

function(effect)
  return NullItem.new()
end)

-- applyEffect: Entity -> None
-- Aplica el efecto del objeto sobre la entidad
function ConsumableItem.applyEffect(self, entity)
  self.effect(entity)
end

return ConsumableItem