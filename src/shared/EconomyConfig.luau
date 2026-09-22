--!strict

return {
	BaseRollCost = 10,
	RollCostGrowth = 1.15,
	MaxRollCost = 1_000_000,
	RefundFraction = 0.5,
	CapacityCosts = { 25, 100 },
	RarityWeights = {
		Common = 70,
		Uncommon = 20,
		Rare = 8,
		Epic = 1.8,
		Legendary = 0.2,
	},
}
