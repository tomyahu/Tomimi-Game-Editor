require "lib.classes.class"
local NullGuard = require("Battle.model.guard.NullGuard")
-------------------------------------------------------------------------------------------------------

-- class: NullEntity
-- A null entity for a battle
local NullEntity = class(function(self)
    -- Data
    self.name = "???"

    -- Stats
    self.max_hp = 1
    self.hp = 1
    self.is_alive = true
    
    self.strength = 0
    self.agility = 0
    self.speed = 0
    self.armor = 0
    self.reaction = 0

    -- In Combat
    self.guard = NullGuard.new(self)
    
    -- magic
    self.max_mp = 0
    self.mp = 0
    self.mana_control = 0
    
    -- magic proficiencies
    self.fire_prof = 0
    self.cold_prof = 0
    self.wind_prof = 0
    self.elec_prof = 0
    self.light_prof = 0
    self.energy_prof = 0
    self.health_prof = 0
    self.ether_prof = 0
    
    -- magic2
    self.b_aura_prof = 0
    self.b_spirit_prof = 0
    self.b_instinct_prof = 0

    -- Constants
    self.natural_resistence = 0
    
    -- Equipped Items
    self.equipped_items = {}

    -- Entity actions
    self.actions = {}

    -- Entity Status Modifiers
    self.status_modifiers = {}
end)

-- getHealed: int -> None
-- The entity recovers points to their hp if its alive
function NullEntity.getHealed(self, points)
  if self.is_alive then
    self.hp = math.min(self.max_hp, self.hp + points)
  end
end

-- getAttackedDirectly: int -> None
-- The entity loses hp equal to damage
function NullEntity.getAttackedDirectly(self, damage)
    if (self.hp - damage) <= 0 then
      self.is_alive = false
    end
    self.hp = math.max(0, self.hp - damage)
end

-- getAttackedGuard: int -> None
-- The entity loses guard points equal to damage
function NullEntity.getAttackedGuard(self, damage)
    self.guard:damageGuard(damage)
end

-- setRelativeMp: int -> None
-- Adds an amount of points to the entity's mp
function NullEntity.addMp(self, points)
  self.mp = math.min(self.max_mp, self.mp + points)
  self.mp = math.max(0, self.mp + points)
end

-- addStatusModifier: StatusModifier -> None
-- Adds a status modifier to the entity
function NullEntity.addStatusModifier(self, status_modifier)
    status_modifier:reset(self)
    status_modifier:activate(self)
    table.insert(self.status_modifiers, status_modifier)
end

-- removeStatusModifier: str -> None
-- Removes the status modifier of an entity
function NullEntity.removeStatusModifier(self, status_modifier_index)
    -- deactivate all status modifiers in order
    for i = (# self.status_modifiers),1,-1 do
        local status_modifier = self.status_modifiers[i]
        status_modifier:deactivate(self)
    end

    table.remove(self.status_modifiers, status_modifier_index)

    -- activate all status modifiers in order
    for i = 1,(# self.status_modifiers) do
        local status_modifier = self.status_modifiers[i]
        status_modifier:activate(self)
    end
end

-- revive: None -> None
-- The entity is revived and their hp is setted to 1 if it was less than one
function NullEntity.revive(self)
    self.is_alive = true
    self.hp = math.max(1, self.hp)
end

-- isGuardBroken: None -> bool
-- Checks if guard is broken
function NullEntity.isGuardBroken(self)
    return self.guard:isGuardBroken()
end

-- getters
function NullEntity.getName(self)
    return self.name
end

function NullEntity.getMaxHp(self)
  return self.max_hp
end

function NullEntity.getHp(self)
  return self.hp
end

function NullEntity.getStrength(self)
  return self.strength
end

function NullEntity.getAgility(self)
  return self.agility
end

function NullEntity.getReaction(self)
    return self.reaction
end

function NullEntity.getSpeed(self)
  return self.speed
end

function NullEntity.getMp(self)
  return self.mp
end

function NullEntity.getMaxMp(self)
  return self.max_mp
end

function NullEntity.getManaControl(self)
  return self.mana_control
end

function NullEntity.getFireProficiency(self)
  return self.fire_prof
end

function NullEntity.getColdProficiency(self)
  return self.cold_prof
end

function NullEntity.getWindProficiency(self)
  return self.wind_prof
end

function NullEntity.getElectricProficiency(self)
  return self.elec_prof
end

function NullEntity.getLightProficiency(self)
  return self.light_prof
end

function NullEntity.getEnergyProficiency(self)
  return self.energy_prof
end

function NullEntity.getHealthProficiency(self)
  return self.health_prof
end

function NullEntity.getEtherProficiency(self)
  return self.ether_prof
end

function NullEntity.getBAuraProficiency(self)
  return self.b_aura_prof
end

function NullEntity.getBSpiritProficiency(self)
    return self.b_spirit_prof
end

function NullEntity.getBInstinctProficiency(self)
    return self.b_instinct_prof
end

function NullEntity.getNaturalResistance(self)
  return self.natural_resistence
end

function NullEntity.getResistance(self)
  return math.max(self:getNaturalResistance(), self.armor)
end

function NullEntity.getStatusModifiers(self)
    return self.status_modifiers
end

function NullEntity.getMaxGuard(self)
    return self.guard:getMaxGuard()
end

function NullEntity.getCurrentGuard(self)
    return self.guard:getCurrentGuard()
end

function NullEntity.getGuard(self)
    return self.guard
end

function NullEntity.isAlive(self)
  return self.is_alive
end

function NullEntity.getActions(self)
    return self.actions
end

return NullEntity