require "lib.classes.class"
require "Battle.consts"
local EntityGetter = require("Battle.model.entity_getter.EntityGetter")
-------------------------------------------------------------------------------------------------------

-- class: TargetGetter
-- param: ctrl:BattleCtrl -> Controller of the battle application
-- A helper class to get entities actions targets
local TargetGetter = extend(EntityGetter, function(self, ctrl)
    self.target_function_dict = {}
    self.target_function_dict[BATTLE_TARGET_SELF] = function(_, entity) return {{entity}} end
    self.target_function_dict[BATTLE_TARGET_SINGLE_PARTY_MEMBER] = self.getTargetSinglePartyMember
    self.target_function_dict[BATTLE_TARGET_ALL_PARTY_MEMBER] = self.getTargetAllPartyMember
    self.target_function_dict[BATTLE_TARGET_SINGLE_ENEMY] = self.getTargetSingleEnemy
    self.target_function_dict[BATTLE_TARGET_ALL_ENEMIES] = self.getTargetAllEnemies
end)

function TargetGetter.getTargets(self, entity, target_type)
    if self.target_function_dict[target_type] == nil then
        return nil
    end

    return self.target_function_dict[target_type](self, entity)
end

-- getTargetSinglePartyMember: Entity -> list(list(Entity))
-- Returns the targets corresponding to a single party member
-- This includes the entity and the rest of its party separately
function TargetGetter.getTargetSinglePartyMember(self, entity)
    local party_members = self:getEntityPartyMembers(entity)

    return self:getSingleTargetsFromEntityList(party_members)
end

-- getTargetSingleEnemy: Entity -> list(list(Entity))
-- Returns the targets corresponding to single enemy
-- This includes the every entity in the oposing party
function TargetGetter.getTargetSingleEnemy(self, entity)
    local enemy_party_members = self:getEntityEnemyPartyMembers(entity)
    enemy_party_members = self:_getNonDeadEntitiesFromEntityList(enemy_party_members)
    return self:getSingleTargetsFromEntityList(enemy_party_members)
end

-- getSingleTargetsFromParty: list(Entity) -> list(list(Entity))
-- Gets a list of single target options using an entity list
function TargetGetter.getSingleTargetsFromEntityList(self, entity_list)
    local targets = {}
    for _, member in pairs(entity_list) do
        table.insert(targets, {member})
    end

    return targets
end

-- getTargetAllPartyMember: Entity -> list(list(Entity))
-- Returns the targets corresponding to all party member
-- This includes the entity and the rest of its party in the same target group
function TargetGetter.getTargetAllPartyMember(self, entity)
    local party_members = self:getEntityPartyMembers(entity)
    return {party_members}
end

-- getTargetAllEnemies: Entity -> list(list(Entity))
-- Returns the targets corresponding to all enemies
-- This includes all the entities of the oposing enemy party in the same group
function TargetGetter.getTargetAllEnemies(self, entity)
    local enemies = self:getEntityEnemyPartyMembers(entity)
    return {enemies}
end

-- _getNonDeadEntitiesFromEntityList: list(Entity) -> list(Entity)
-- takes a list of entities and returns a list with the entities of that list that are not dead
function TargetGetter._getNonDeadEntitiesFromEntityList(self, entity_list)
    local aux = {}
    for _, entity in pairs(entity_list) do
        if entity:isAlive() then
            table.insert(aux, entity)
        end
    end
    return aux
end


return TargetGetter