require "lib.classes.class"
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
    self.max_stamina = 1
    self.stamina = 1
    self.speed = 0

    -- In Combat
    self.guard = 0
    
    -- magic
    self.max_mp = 0
    self.mp = 0
    self.mana_strength = 0
    self.mana_control = 0
    
    -- magic proficiencies
    self.fire_prof = 0
    self.cold_prof = 0
    self.wind_prof = 0
    self.lightning_prof = 0
    self.light_prof = 0
    self.dark_prof = 0
    self.health_prof = 0
    self.ether_prof = 0
    
    -- magic2
    self.b_aura_prof = 0
    self.b_spirit_prof = 0
    self.b_instinct_prof = 0

    -- Constants
    self.natural_resistence = 0

    -- Modifiers
    self.armor = 0
    self.temp_strength = 0
    self.temp_agility = 0
    self.temp_speed = 0

    self.temp_mana_strength = 0
    self.temp_mana_control = 0

    self.temp_fire_prof = 0
    self.temp_cold_prof = 0
    self.temp_wind_prof = 0
    self.temp_lightning_prof = 0
    self.temp_light_prof = 0
    self.temp_dark_prof = 0
    self.temp_health_prof = 0
    self.temp_ether_prof = 0

    self.temp_b_aura_prof = 0
    self.temp_b_spirit_prof = 0
    self.temp_b_instinct_prof = 0

    self.temp_resistence = 0
    
    -- Equipped Items
    self.equipped_items = {}
    
    -- Buffs
    self.buffs = {}
end)

-- getHealed: int -> None
-- The entity recovers points to their hp if its alive
function NullEntity.getHealed(self, points)
  if self.is_alive then
    self.hp = math.min(self.max_hp, self.hp + points)
  end
end

-- getAttacked: int -> None
-- The entity loses hp equal to damage
function NullEntity.getAttacked(self, damage)
    if (self.hp - damage) <= 0 then
      self.is_alive = false
    end
    self.hp = math.max(0, self.hp - damage)
end

-- setRelativeMp: int -> None
-- Adds or substracts an amount of points to the entity's mp
function NullEntity.setRelativeMp(self, points)
  self.mp = math.min(self.max_mp, self.mp + points)
  self.mp = math.max(0, self.mp + points)
end

-- addBuff: Buff -> None
-- Adds a buff to the entity
function NullEntity.addBuff(self, buff)
  -- TODO: Check if buff was already added and just refresh the buff if it has
  -- TODO: Insert the buff in the buff list
end

-- removeBuff: str -> None
-- Removes the buff of an entity
function NullEntity.removeBuff(self, buff_id)
  -- TODO: Remove a buff from the buff list
end

-- revive: None -> None
-- The entity is revived and their hp is setted to 1 if it was less than one
function NullEntity.revive(self)
    self.is_alive = true
    self.hp = math.max(1, self.hp)
end

-- getters
function NullEntity.getMaxHp(self)
  return self.max_hp
end

function NullEntity.getHp(self)
  return self.hp
end

function NullEntity.getStrength(self)
  return self.strength + self.temp_strength
end

function NullEntity.getAgility(self)
  return self.agility + self.temp_agility
end

function NullEntity.getMaxStamina(self)
    return self.max_stamina
end

function NullEntity.getStamina(self)
  return self.stamina
end

function NullEntity.getSpeed(self)
  return self.speed + self.temp_speed
end

function NullEntity.getMp(self)
  return self.mp
end

function NullEntity.getMaxMp(self)
  return self.max_mp
end

function NullEntity.getManaStrength(self)
  return self.mana_strength + self.temp_mana_strength
end

function NullEntity.getManaControl(self)
  return self.mana_control + self.temp_mana_control
end

function NullEntity.getFireProficiency(self)
  return self.fire_prof + self.temp_fire_prof
end

function NullEntity.getColdProficiency(self)
  return self.cold_prof + self.temp_cold_prof
end

function NullEntity.getWindProficiency(self)
  return self.wind_prof + self.temp_wind_prof
end

function NullEntity.getLightningProficiency(self)
  return self.lightning_prof + self.temp_lightning_prof
end

function NullEntity.getLightProficiency(self)
  return self.light_prof + self.temp_light_prof
end

function NullEntity.getDarkProficiency(self)
  return self.dark_prof + self.temp_dark_prof
end

function NullEntity.getHealthProficiency(self)
  -- TODO: Apply buff and equipped items modifiers 
  return self.health_prof + self.temp_health_prof
end

function NullEntity.getEtherProficiency(self)
  return self.ether_prof + self.temp_ether_prof
end

function NullEntity.getBAuraProficiency(self)
  return self.b_aura_prof + self.temp_b_aura_prof
end

function NullEntity.getBSpiritProficiency(self)
    return self.b_spirit_prof + self.temp_b_spirit_prof
end

function NullEntity.getBInstinctProficiency(self)
    return self.b_instinct_prof + self.temp_b_instinct_prof
end


function NullEntity.getNaturalResistance(self)
  return self.natural_resistence
end

function NullEntity.getResistance(self)
  return math.max(self:getNaturalResistance() + self.temp_resistance, self.armor)
end

function NullEntity.getMaxGuard(self)
    local stamina_modifier = (self.max_stamina - self.stamina)/self.max_stamina*0.8 + 0.2
    local strength = self:getStrength()
    local resistance = self:getResistance()
    -- TODO: Graph this
    return (strength/4 + resistance/2) * stamina_modifier
end

-- TODO: Implement getCurrentGuard based on current stamina

function NullEntity.isAlive(self)
  return self.is_alive
end

return NullEntity