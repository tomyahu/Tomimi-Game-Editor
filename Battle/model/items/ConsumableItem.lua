require "lib.classes.class"
local NullItem = require()
-------------------------------------------------------------------------------------------------------

-- class: ConsumableItem
-- param: name:str -> the name of the item
-- param: description:str -> the description of what the item does
-- param: effect:function -> the effect function to apply to the entity when its consumed
-- A consumable item for a battle
local ConsumableItem = extend(NullItem, function(self, name, description, effect)
    self.effect = effect
end,

function(name, description, effect)
  return NullItem.new(name, description)
end)

-- applyEffect: Entity -> None
-- applies the effect function to the entity
function ConsumableItem.applyEffect(self, entity)
  -- TODO: Delete self from entity's inventory
  self.effect(entity)
end

return ConsumableItem