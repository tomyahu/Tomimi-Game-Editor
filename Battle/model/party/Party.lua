require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Party
-- param: members:dict(int, Entity) -> a dictionary with the position number and the entity associated to it
-- param: slot_number:int -> the number of slots the party has
-- A party of entities
local Party = class(function(self, members, slot_number)
    self.slot_number = slot_number
    self.members = {}
    for i = 1, self.slot_number do
        self.members[i] = members[i]
    end
end)

-- getMembers: None -> list(Entity)
-- gets all the not null members of the party
function Party.getMembers(self)
    local members = {}
    for i = 1, self.slot_number do
        if not (self.members[i] == nil) then
            table.insert(members, self.members[i])
        end
    end

    return members
end

-- getOccupiedPositions: None -> list(int)
-- gets the occupied positions by not null entities of the party
function Party.getOcupiedPositions(self)
    local positions = {}
    for i = 1, self.slot_number do
        if not (self.members[i] == nil) then
            table.insert(positions, i)
        end
    end

    return positions
end

-- getMember: int -> Entity
-- gets the member in the party in the position given
function Party.getMember(self, position)
    return self.members[position]
end

-- getMemberNum: None -> int
-- gets the number of members in the party
function Party.getMemberNum(self)
    return (# self:getMembers())
end

-- isEntityInParty: Entity -> bool
-- Returns true if the entity passed is in the party and false otherwise
function Party.isEntityInParty(self, entity)
    for i, member in pairs(self:getMembers()) do
        if entity == member then
            return true
        end
    end
    return false
end

-- getMembersWithoutEntity: Entity -> list(Entity)
-- gets the members of the party without the entity passed
function Party.getMembersWithoutEntity(self, entity)
    local members_without_entity = {}
    for _, member in self:getMembers() do
        if member ~= entity then
            table.insert(members_without_entity, member)
        end
    end
    return members_without_entity
end

return Party