require "lib.classes.class"
require "Battle.consts"
--------------------------------------------------------------------------------------------------------

-- class: KnightGuard
-- param: entity:Entity -> the entity that is using this guard style
-- A knight guard style, this style is centered using armor and shields to block incoming damage and maintaining
-- equilibrium, thus strength (STR) is a strong factor in this guard and so is resistance (RES). But also the reactions
-- of the user are important (RCT) and can make the difference between a succesful block and a direct hit.
local KnightGuard = class(function(self, entity)
end)

-- getMaxGuard: None -> num
-- gets the maximum guard of the entity using this style
function KnightGuard.getMaxGuard(self)
    local str = self.entity:getStrength()
    local res = self.entity:getResistance()
    local rct = self.entity:getReaction()

    local aux = math.pow(str,2) * res

    return math.floor(0.3*aux + math.pow(0.7*aux, rct/95))
end

return KnightGuard