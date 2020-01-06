require "lib.classes.class"
local NullEntity = require("Battle.model.entities.NullEntity")
--------------------------------------------------------------------------------------------------------

-- ifNotNullAssign: Entity, dict, str -> None
-- if the stat assigned to name exists then it assigns it to the entity
local ifNotNullAssign = function(entity, stats, name)
    if not (stats[name] == nil) then
        entity[name] = stats[name]
    end
end

-- class: Entity
-- param: stats:dict -> a dictionary with all the entity's stats
-- param: sprite_path:str -> the path of the entity's sprite
-- An entity for a battle
local Entity = extend(NullEntity,
function(self, stats, sprite_path)
    self.sprite_path = sprite_path

    -- If stats are not null assign them
    ifNotNullAssign(self, stats, "name")

    ifNotNullAssign(self, stats, "max_hp")
    ifNotNullAssign(self, stats, "hp")
    ifNotNullAssign(self, stats, "is_alive")

    ifNotNullAssign(self, stats, "strength")
    ifNotNullAssign(self, stats, "agility")
    ifNotNullAssign(self, stats, "max_stamina")
    ifNotNullAssign(self, stats, "stamina")
    ifNotNullAssign(self, stats, "speed")

    ifNotNullAssign(self, stats, "max_mp")
    ifNotNullAssign(self, stats, "mp")
    ifNotNullAssign(self, stats, "mana_control")

    ifNotNullAssign(self, stats, "fire_prof")
    ifNotNullAssign(self, stats, "cold_prof")
    ifNotNullAssign(self, stats, "wind_prof")
    ifNotNullAssign(self, stats, "elec_prof")
    ifNotNullAssign(self, stats, "light_prof")
    ifNotNullAssign(self, stats, "energy_prof")
    ifNotNullAssign(self, stats, "health_prof")
    ifNotNullAssign(self, stats, "ether_prof")

    ifNotNullAssign(self, stats, "b_aura_prof")
    ifNotNullAssign(self, stats, "b_spirit_prof")
    ifNotNullAssign(self, stats, "b_instinct_prof")

    ifNotNullAssign(self, stats, "natural_resistence")
    ifNotNullAssign(self, stats, "armor")
end,
function(stats, sprite_path)
    return NullEntity.new()
end)

-- getter
function Entity.getSpritePath(self)
    return self.sprite_path
end

return Entity