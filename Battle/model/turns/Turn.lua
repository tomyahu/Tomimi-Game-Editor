require "lib.classes.class"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: Turn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle
local Turn = class(function(self, entity)
    self.entity = entity
    self.actions = {}
    self.target_action_entities = {}
end)

-- start: None -> None
-- Starts a new edition of the turn of this entity
function Turn.start(self)
    self.actions = {}
    self.target_action_entities = {}
end

-- chooseActions: list(Action), list(list(Entity)) -> None
-- Chooses the actions to be used for this turn
function Turn.chooseActions(self, actions, target_entities)
    self:setActions(actions)
    self:setTargetActionEntities(target_entities)

    local view = application:getCurrentView()
    local action_scene_manager = view:getActionSceneManager()

    action_scene_manager:playScenesWithActionsAndEntities(actions, self.entity, target_entities)
end

function Turn.toString(self)
    return self.entity:getName() .. "'s Turn."
end

-- setters
function Turn.setActions(self, actions)
    self.actions = actions
end

function Turn.setTargetActionEntities(self, target_action_entities)
    self.target_action_entities = target_action_entities
end

-- getters
function Turn.getEntity(self)
    return self.entity
end

function Turn.getActions(self)
    return self.actions
end

function Turn.getTargetActionEntities(self)
    return self.target_action_entities
end

return Turn