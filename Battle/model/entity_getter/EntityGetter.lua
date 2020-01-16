require "lib.classes.class"
-------------------------------------------------------------------------------------------------------

-- class: EntityGetter
-- param: ctrl:BattleCtrl -> Controller of the battle application
-- A helper class to get entities in battle relative to an entity passed
local EntityGetter = class(function(self, ctrl)
    self.ctrl = ctrl
end)

-- getEntityPartyMembers: Entity -> list(Entity)
-- gets the members of the party the entity passed is in
function EntityGetter.getEntityPartyMembers(self, entity)
    local party1 = self.ctrl:getPlayerParty()
    local party2 = self.ctrl:getEnemyParty()

    if party1:isEntityInParty(entity) then
        return party1:getMembers(entity)
    elseif party2:isEntityInParty(entity) then
        return party2:getMembers(entity)
    end

    self:entityIsNotInAnyPartyError(entity)
end

-- getEntityEnemyPartyMembers: Entity -> list(Entity)
-- gets the members of the oposed party that the entity passed is in
function EntityGetter.getEntityEnemyPartyMembers(self, entity)
    local party1 = self.ctrl:getPlayerParty()
    local party2 = self.ctrl:getEnemyParty()

    if party1:isEntityInParty(entity) then
        return party2:getMembers(entity)
    elseif party2:isEntityInParty(entity) then
        return party1:getMembers(entity)
    end

    self:entityIsNotInAnyPartyError(entity)
end

function EntityGetter.entityIsNotInAnyPartyError(self, entity)
    error("Tried to get entity" .. entity:getName() .. "'s party members but entity wasn't in any party.")
end

return EntityGetter