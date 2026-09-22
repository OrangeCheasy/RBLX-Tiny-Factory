--!strict

export type MachineCategory = "Producer" | "Processor" | "Seller"

export type MachineDefinition = {
	Id: string,
	DisplayName: string,
	Category: MachineCategory,
	Description: string,
	Rarity: string,
	Rollable: boolean,
	Behavior: string?,
	SpawnInterval: number?,
	OutputValue: number?,
	Multiplier: number?,
	SizeScale: number?,
	VisualState: string?,
	TravelScale: number?,
}

local definitions: { [string]: MachineDefinition } = {
	BasicDropper = {
		Id = "BasicDropper",
		DisplayName = "Basic Dropper",
		Category = "Producer",
		Description = "Creates a basic item at a steady rate.",
		Rarity = "Common",
		Rollable = false,
		SpawnInterval = 1,
		OutputValue = 1,
	},
	ValueMultiplier = {
		Id = "ValueMultiplier",
		DisplayName = "Value Multiplier",
		Category = "Processor",
		Description = "Doubles the value of an item.",
		Rarity = "Common",
		Rollable = true,
		Behavior = "MultiplyValue",
		Multiplier = 2,
	},
	Seller = {
		Id = "Seller",
		DisplayName = "Seller",
		Category = "Seller",
		Description = "Converts an item into Coins.",
		Rarity = "Infrastructure",
		Rollable = false,
	},
	FastDropper = {
		Id = "FastDropper",
		DisplayName = "Fast Dropper",
		Category = "Producer",
		Description = "Creates lower-value items at a faster rate.",
		Rarity = "Uncommon",
		Rollable = true,
		SpawnInterval = 0.5,
		OutputValue = 1,
	},
	HeavyDropper = {
		Id = "HeavyDropper",
		DisplayName = "Heavy Dropper",
		Category = "Producer",
		Description = "Creates valuable items at a slower rate.",
		Rarity = "Rare",
		Rollable = true,
		SpawnInterval = 1.8,
		OutputValue = 4,
	},
	Giantifier = {
		Id = "Giantifier",
		DisplayName = "Giantifier",
		Category = "Processor",
		Description = "Makes the item visibly larger.",
		Rarity = "Common",
		Rollable = true,
		Behavior = "ScaleVisual",
		SizeScale = 1.8,
	},
	PaintMachine = {
		Id = "PaintMachine",
		DisplayName = "Paint Machine",
		Category = "Processor",
		Description = "Paints the item for later visual combinations.",
		Rarity = "Common",
		Rollable = true,
		Behavior = "SetMaterial",
		VisualState = "Painted",
	},
	CompoundPress = {
		Id = "CompoundPress",
		DisplayName = "Compound Press",
		Category = "Processor",
		Description = "Compresses an item into a higher-value form.",
		Rarity = "Uncommon",
		Rollable = true,
		Behavior = "MultiplyValue",
		Multiplier = 3,
	},
	ConveyorBooster = {
		Id = "ConveyorBooster",
		DisplayName = "Conveyor Booster",
		Category = "Processor",
		Description = "Speeds an item through downstream slots.",
		Rarity = "Uncommon",
		Rollable = true,
		Behavior = "AdjustThroughput",
		TravelScale = 0.5,
	},
	CooldownTuner = {
		Id = "CooldownTuner",
		DisplayName = "Cooldown Tuner",
		Category = "Processor",
		Description = "Provides a smaller, reliable throughput improvement.",
		Rarity = "Common",
		Rollable = true,
		Behavior = "AdjustThroughput",
		TravelScale = 0.75,
	},
	Duplicator = {
		Id = "Duplicator",
		DisplayName = "Duplicator",
		Category = "Processor",
		Description = "Creates one bounded additional item.",
		Rarity = "Epic",
		Rollable = true,
		Behavior = "DuplicateItem",
	},
	Goldenizer = {
		Id = "Goldenizer",
		DisplayName = "Goldenizer",
		Category = "Processor",
		Description = "Adds a golden visual state and a bounded value bonus.",
		Rarity = "Epic",
		Rollable = true,
		Behavior = "Goldenize",
		Multiplier = 2,
		VisualState = "Golden",
	},
	LuckyModifier = {
		Id = "LuckyModifier",
		DisplayName = "Lucky Modifier",
		Category = "Processor",
		Description = "Applies a predictable high-or-low value outcome.",
		Rarity = "Legendary",
		Rollable = true,
		Behavior = "RandomMultiplier",
	},
}

local MachineDefinitions = {}

function MachineDefinitions.get(machineId: string): MachineDefinition?
	return definitions[machineId]
end

function MachineDefinitions.all(): { [string]: MachineDefinition }
	return definitions
end

function MachineDefinitions.getRollPool(): { MachineDefinition }
	local result = {}
	for _, definition in pairs(definitions) do
		if definition.Rollable then
			table.insert(result, definition)
		end
	end
	return result
end

function MachineDefinitions.validate(): (boolean, string?)
	local producerCount = 0
	local sellerCount = 0

	for machineId, definition in pairs(definitions) do
		if definition.Id ~= machineId then
			return false, `Machine ID mismatch for {machineId}`
		end

		if definition.DisplayName == "" or definition.Description == "" then
			return false, `Machine {machineId} is missing readable text`
		end

		if definition.Category == "Producer" then
			producerCount += 1
			if not definition.OutputValue or definition.OutputValue <= 0 then
				return false, `Producer {machineId} must have a positive output value`
			end
		elseif definition.Category == "Processor" then
			local behavior = definition.Behavior
			if behavior == "MultiplyValue" or behavior == "Goldenize" then
				if not definition.Multiplier or definition.Multiplier <= 0 then
					return false, `Processor {machineId} must have a positive multiplier`
				end
			elseif behavior == "ScaleVisual" then
				if not definition.SizeScale or definition.SizeScale <= 0 then
					return false, `Processor {machineId} must have a positive size scale`
				end
			elseif behavior == "SetMaterial" then
				if not definition.VisualState or definition.VisualState == "" then
					return false, `Processor {machineId} must have a visual state`
				end
			elseif behavior == "AdjustThroughput" then
				if not definition.TravelScale or definition.TravelScale <= 0 or definition.TravelScale > 1 then
					return false, `Processor {machineId} must have a bounded travel scale`
				end
			elseif behavior ~= "DuplicateItem" and behavior ~= "RandomMultiplier" then
				return false, `Processor {machineId} has an unsupported behavior`
			end
		elseif definition.Category == "Seller" then
			sellerCount += 1
		else
			return false, `Machine {machineId} has an unsupported category`
		end
	end

	if producerCount == 0 then
		return false, "At least one producer is required"
	end
	if sellerCount == 0 then
		return false, "At least one seller is required"
	end

	return true
end

return MachineDefinitions
