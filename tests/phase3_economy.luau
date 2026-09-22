--!strict

local EconomyRules = require("../src/shared/EconomyRules")

local function expect(condition: boolean, message: string)
	if not condition then
		error(message, 2)
	end
end

local firstRollCost = EconomyRules.getRollCost(0)
local secondRollCost = EconomyRules.getRollCost(1)
expect(firstRollCost == 10, "the first roll cost should be ten Coins")
expect(secondRollCost == 12, "roll costs should grow predictably")

local invalidRoll = EconomyRules.getRollCost(-1)
expect(not invalidRoll, "negative roll counts must be rejected")

local firstCapacityCost = EconomyRules.getCapacityCost(1)
local secondCapacityCost = EconomyRules.getCapacityCost(2)
local maxCapacityCost = EconomyRules.getCapacityCost(3)
expect(firstCapacityCost == 25, "first capacity expansion cost is incorrect")
expect(secondCapacityCost == 100, "second capacity expansion cost is incorrect")
expect(not maxCapacityCost, "maximum capacity must not have another upgrade")

expect(EconomyRules.weightedPick({ A = 1, B = 1 }, 0) ~= nil, "weighted selection should return a result")
expect(EconomyRules.weightedPick({ A = 1 }, 1) == nil, "out-of-range weighted selection must fail")
expect(EconomyRules.getResaleValue("Common") == 5, "common resale refund is incorrect")

print("Phase 3 economy tests passed")
