require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: TurnManager
-- param: turns:list(Turn) -> A list of entities turns
-- The controler's turn manager that decides whose turn is to do actions
local TurnManager = class(function(self, turns)
    self.turns = turns
    self:resetCurrentTurn()
    self.battle_over = false
end)

-- advanceTurn: None -> None
-- Advances to the turn of the next entity
function TurnManager.advanceTurn(self)
    if (# self.turns) == 0 then
        error("Tried to advance when turn manager doesn't have turns.")
    end
    self.current_turn = ( self.current_turn % (# self.turns) ) + 1

    if self:getCurrentTurn():getEntity():isAlive() then
        self:getCurrentTurn():start()
    else
        self:advanceTurn()
    end
end

-- getCurrentTurn: None -> Turn
-- Gets the turn that is currently on play
function TurnManager.getCurrentTurn(self)
    if (# self.turns) == 0 then
        error("Tried to get turn when turn manager has no turns.")
    end
    return self.turns[self.current_turn]
end

-- setTurns: list(Turn) -> None
-- Sets a list of new turns as the turn manager turns
function TurnManager.setTurns(self, new_turns)
    self.turns = new_turns
    self:resetCurrentTurn()
end

-- resetCurrentTurn: None -> None
-- Resets the current turn to the first turn on the turn list
function TurnManager.resetCurrentTurn(self)
    self.current_turn = 1
end

-- turnEnded: None -> None
-- Activates the resultant actions of the turn on the respective targets
function TurnManager.turnEnded(self)
    -- If the battle isn't over advances a turn otherwise end the battle
    if not self:isBattleOver() then
        self:advanceTurn()
    else
        self:endBattle()
    end
end

-- endBattle: None -> None
-- Ends the current battle
function TurnManager.endBattle(self)
    local ctrl = application:getCurrentCtrl()
    local player_party = ctrl:getPlayerParty()
    local enemy_party = ctrl:getEnemyParty()

    if (not player_party:areThereAliveMembers()) then
        -- Game Over Sequence
        ctrl:doGameOverSequence()
    elseif (not enemy_party:areThereAliveMembers()) then
        -- Victory Sequence
        ctrl:doVictorySequence()
    else
        application:appChange("Overworld")
    end
end

-- getter
function TurnManager.isBattleOver(self)
    local ctrl = application:getCurrentCtrl()
    local player_party = ctrl:getPlayerParty()
    local enemy_party = ctrl:getEnemyParty()

    return self.battle_over or (not player_party:areThereAliveMembers()) or (not enemy_party:areThereAliveMembers())
end

-- setter
function TurnManager.setBattleOver(self, battle_over)
    self.battle_over = battle_over
end

return TurnManager