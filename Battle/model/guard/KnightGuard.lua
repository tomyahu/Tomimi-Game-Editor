require "lib.classes.class"
require "Battle.consts"
local NullGuard = require("Battle.model.guard.NullGuard")
--------------------------------------------------------------------------------------------------------

-- class: KnightGuard
-- param: entity:Entity -> the entity that is using this guard style
-- A knight guard style, this style is centered using armor and shields to block incoming damage and maintaining
-- equilibrium, thus strength (STR) is a strong factor in this guard and so is resistance (RES). But also the reactions
-- of the user are important (RCT) and can make the difference between a succesful block and a direct hit.
local KnightGuard = extend(NullGuard, function(self, entity)
    self.max_guard = self:getMaxGuard()
    self.current_guard = self.max_guard
end)

-- getMaxGuard: None -> num
-- gets the maximum guard of the entity using this style
function KnightGuard.getMaxGuard(self)
    local str = self.entity:getStrength()
    local res = self.entity:getResistance()
    local rct = self.entity:getReaction()

    local aux = math.pow(str,2) * res / 10

    return 0.3*aux + 0.7 * math.pow(aux, math.sqrt(rct/95))
end

return KnightGuard