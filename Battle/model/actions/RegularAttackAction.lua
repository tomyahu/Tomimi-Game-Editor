require "lib.classes.class"
require "Battle.consts"
local Action =  require("Battle.model.actions.Action")
--------------------------------------------------------------------------------------------------------

-- class: AttackAction
-- param: id:int -> the id of the action
-- param: name:str -> the name of the action
-- param: description:str -> the description of the action
-- param: item_requirements:list(<int, int>) -> a list of the ids of the items that are required for this action to be
--                                         performed and the cuantity of each of them
-- param: start_piece:str -> The starting connection of this action
-- param: end_piece:str -> The ending connection of this action
-- param: target:str -> The targets this action can be used on
-- param: icon_path:str -> the path of the icon of this action
-- param: guard_damage:int -> the guard damage the action does
-- param: direct_damage:int -> the direct damage the action does
-- A regular attack action in a battle
local RegularAttackAction = extend(Action, function(self, id, name, description, item_requirements, start_piece, end_piece, target, icon_path, guard_damage, direct_damage)
    self.guard_damage = guard_damage
    self.direct_damage = direct_damage
end,

function(id, name, description, item_requirements, start_piece, end_piece, target, icon_path)
    local action_fun = function() end
    local type = BATTLE_ACTION_ATTACK_TYPE    

    return Action.new(id, name, description, item_requirements, start_piece, end_piece, target, type, action_fun, icon_path)
end)

-- activate: Entity, list(Entity), any -> None
-- Activates the effect of the skill from the source entity on a target entity
function RegularAttackAction.activate(self, source_entity, target_entity, extra)
    for _, entity in pairs(target_entity) do
        if entity:isGuardBroken() then
            entity:getAttackedDirectly(self.direct_damage)
        else
            entity:getAttackedGuard(self.guard_damage)
        end
        print(entity:getHp())
    end
end

return RegularAttackAction