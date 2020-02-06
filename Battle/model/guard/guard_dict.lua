require "Global.guard_types"
local NullGuard = require("Battle.model.guard.NullGuard")
local KnightGuard = require("Battle.model.guard.KnightGuard")
local RogueGuard = require("Battle.model.guard.RogueGuard")
--------------------------------------------------------------------------------------------------------

local guards = {}

guards[NULL_GUARD_TYPE] = NullGuard
guards[KNIGHT_GUARD_TYPE] = KnightGuard
guards[ROGUE_GUARD_TYPE] = RogueGuard

return guards