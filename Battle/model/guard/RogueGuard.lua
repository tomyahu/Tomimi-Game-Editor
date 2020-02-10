require "lib.classes.class"
require "Battle.consts"
local NullGuard = require("Battle.model.guard.NullGuard")
--------------------------------------------------------------------------------------------------------

-- class: RogueGuard
-- param: entity:Entity -> the entity that is using this guard style
-- A knight guard style, this style is centered using armor and shields to block incoming damage and maintaining
-- equilibrium, thus strength (STR) is a strong factor in this guard and so is resistance (RES). But also the reactions
-- of the user are important (RCT) and can make the difference between a succesful block and a direct hit.
local RogueGuard = extend(NullGuard, function(self, entity)
    self.max_guard = self:getMaxGuard()
    self.current_guard = self.max_guard
end)

-- getMaxGuard: None -> num
-- gets the maximum guard of the entity using this style
function RogueGuard.getMaxGuard(self)
    local spd = self.entity:getSpeed()
    local agi = self.entity:getAgility()
    local rct = self.entity:getReaction()

    local aux = math.pow(spd,1.5) * math.pow(agi,1.5) / 10

    return math.floor(math.pow(aux, math.sqrt(rct/90)))
end

-- smallRecovery: None -> None
-- recovers a small amount of guard
function RogueGuard.smallRecovery(self)
    self:restoreGuard(math.floor(0.05*self:getMaxGuard()))
end

-- mediumRecovery: None -> None
-- recovers half of its guard
function RogueGuard.mediumRecovery(self)
    self:restoreGuard(math.floor(0.7*self:getMaxGuard()))
end

-- fullRecovery: None -> None
-- recovers maximum guard
function RogueGuard.fullRecovery(self)
    self:restoreGuard(self:getMaxGuard())
end

return RogueGuard