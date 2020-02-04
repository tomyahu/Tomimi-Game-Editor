require "lib.classes.class"
require "Global.application.application"

local animation_dict = require("Battle.init.action_animations.action_animations")
--------------------------------------------------------------------------------------------------------

-- class: ActionSceneManager
-- A manager class that controls the animation scenes when an ability is used in battle
local ActionSceneManager = class(function(self)
    self.actions = {}
    self.source_entity = nil
    self.target_entities = {}
    self:reset()
end)

-- getCurrentScene: None -> Scene
-- Gets the current scene to play
function ActionSceneManager.getCurrentScene(self)
    return self.action_scenes[self.current_animation_scene_index]
end

-- updateAnimation: num -> None
-- Updates the current animation scene
function ActionSceneManager.update(self, dt)
    local current_scene = self:getCurrentScene()

    if current_scene ~= nil then
        current_scene:update(dt)

        if current_scene:hasEnded() then
            self:advanceScene()
        end
    end
end

-- advanceScene: None -> None
-- Advances the scene of the action
function ActionSceneManager.advanceScene(self)
    local view = application:getCurrentView()

    self:applyAction(self.current_animation_scene_index)
    self.current_animation_scene_index = self.current_animation_scene_index + 1

    if self:getCurrentScene() == nil then
        -- Update Action Name Displayer
        view:getActionNameDisplayer():setText("")

        -- TODO: Update Action Visualizer

        self:finishedDisplayingScenes()
    else
        view:getActionNameDisplayer():setText(self.actions[self.current_animation_scene_index]:getName())
    end

end

-- finishedDisplayingScenes: None -> None
-- Finishes the current turn when the animations end
function ActionSceneManager.finishedDisplayingScenes(self)
    local ctrl = application:getCurrentCtrl()
    local turn_manager = ctrl:getTurnManager()
    turn_manager:turnEnded()
end

-- reset: None -> None
-- resets the current animation scene index
function ActionSceneManager.reset(self)
    self.current_animation_scene_index = 1
    self.action_scenes = {}
end

-- setters
function ActionSceneManager.setActionScenes(self, action_scenes)
    self:reset()
    self.action_scenes = action_scenes
end

function ActionSceneManager.playScenesWithActionsAndEntities(self, actions, source_entity, target_entities)
    local view = application:getCurrentView()
    local entity_view_getter = view:getEntityViewGetter()

    local scenes = {}
    local source_entity_view = entity_view_getter:getEntityView(source_entity)

    for i = 1, (# actions) do
        local action = actions[i]
        local targets = target_entities[i]

        local targets_views = {}

        for _, target in pairs(targets) do
            table.insert(targets_views, entity_view_getter:getEntityView(target))
        end

        local action_animations = animation_dict[action]

        table.insert(scenes, action_animations:makeScene(source_entity_view, targets_views))
    end

    self.actions = actions
    self.source_entity = source_entity
    self.target_entities = target_entities

    -- Update Action Name Displayer
    view:getActionNameDisplayer():setText(self.actions[1]:getName())

    -- TODO: Update ActionVisualizer

    self:setActionScenes(scenes)
end

-- applyAction: int -> None
-- Applies the saved action given an index
function ActionSceneManager.applyAction(self, action_index)
    local action = self.actions[action_index]
    local source_entity = self.source_entity
    local target_entities = self.target_entities[action_index]
    action:activate(source_entity, target_entities)
end

return ActionSceneManager