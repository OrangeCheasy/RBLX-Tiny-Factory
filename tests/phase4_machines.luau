--!strict

local FactorySimulation = require("../src/shared/FactorySimulation")
local MachineDefinitions = require("../src/shared/MachineDefinitions")

local function expect(condition: boolean, message: string)
	if not condition then
		error(message, 2)
	end
end

local definitionsValid, definitionsError = MachineDefinitions.validate()
expect(definitionsValid, definitionsError or "launch machine definitions should validate")
expect(#MachineDefinitions.getRollPool() >= 10, "the launch roll pool should contain varied machines")

local valueChain = FactorySimulation.new({
	Route = { "BasicDropper", "Giantifier", "Goldenizer", "Seller" },
	SpawnIntervalSeconds = 1,
	TravelTimePerSlotSeconds = 0.1,
})
valueChain:step(0.4)
local valueSnapshot = valueChain:getSnapshot()
expect(valueSnapshot.SoldItems == 1, "the value chain should sell its first item")
expect(valueSnapshot.Coins == 2, "goldenizer should provide a bounded value multiplier")

local duplicateChain = FactorySimulation.new({
	Route = { "BasicDropper", "Duplicator", "Seller" },
	SpawnIntervalSeconds = 1,
	TravelTimePerSlotSeconds = 0.1,
	MaxActiveItems = 4,
})
duplicateChain:step(0.3)
local duplicateSnapshot = duplicateChain:getSnapshot()
expect(duplicateSnapshot.SoldItems == 1, "the original duplicated item should sell")
expect(duplicateSnapshot.ActiveItems == 1, "the duplicate should remain bounded and active")
duplicateChain:step(0.2)
expect(duplicateChain:getSnapshot().SoldItems == 2, "the duplicate should eventually sell")

local luckyChain = FactorySimulation.new({
	Route = { "BasicDropper", "LuckyModifier", "Seller" },
	SpawnIntervalSeconds = 1,
	TravelTimePerSlotSeconds = 0.1,
})
luckyChain:step(0.3)
local luckySnapshot = luckyChain:getSnapshot()
expect(luckySnapshot.SoldItems == 1 and luckySnapshot.Coins >= 1, "lucky modifier must remain bounded and valid")

print("Phase 4 machine tests passed")
