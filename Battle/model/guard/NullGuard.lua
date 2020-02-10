require "lib.classes.class"
require "Battle.consts"
--------------------------------------------------------------------------------------------------------

-- class: NullGuard
-- param: entity:Entity -> the entity that is using this guard style
-- A null guard style that has 0 guard
local NullGuard = class(function(self, entity)
    self.entity = entity
    self.max_guard = self:getMaxGuard()
    self.current_guard = self.max_guard
end)

-- resetGuard: None -> None
-- resets the guard values
function NullGuard.resetGuard(self)
    self.max_guard = self:getMaxGuard()
    self.current_guard = self.max_guard
end

-- getMaxGuard: None -> num
-- gets the maximum guard of the entity using this style
function NullGuard.getMaxGuard(self)
    return 0
end

-- isGuardBroken: None -> bool
-- Checks if the guard is broken
function NullGuard.isGuardBroken(self)
    return self.current_guard == 0
end

-- restoreGuard: num -> None
-- Restores the guard in val units, if the guard obtained is more than the maximum guard then it readjustes it to the
-- maximum guard
function NullGuard.restoreGuard(self, val)
    self.current_guard = math.min(self.current_guard + val, self.max_guard)
end

-- damageGuard: num -> None
-- Damages the guard in val units, if the guard obtained is less than 0 it is set to 0
function NullGuard.damageGuard(self, val)
    self.current_guard = math.max(self.current_guard - val, 0)
end

-- setCurrentGuard: num -> None
-- sets the current guard value, is the value is less than 0 it is set to 0
function NullGuard.setCurrentGuard(self, new_guard_value)
    self.current_guard = math.max(0, new_guard_value)
end

-- readjustGuard: None -> None
-- readjusts the current guard in case tha entity's stats have changed
function NullGuard.readjustGuard(self)
    local old_max_guard = self.max_guard
    self.max_guard = self:getMaxGuard()

    local old_guard = self.current_guard

    self.current_guard = (old_guard/old_max_guard)*self.max_guard
end

-- smallRecovery: None -> None
-- does nothing
function NullGuard.smallRecovery(self)
end

-- mediumRecovery: None -> None
-- does nothing
function NullGuard.mediumRecovery(self)
end

-- mediumRecovery: None -> None
-- does nothing
function NullGuard.fullRecovery(self)
end


-- smallRecover: None -> None
-- does nothing
function NullGuard.smallRecover(self)
end

-- getter
function NullGuard.getCurrentGuard(self)
    return self.current_guard
end

return NullGuard