--!strict

local Players = game:GetService("Players")

local DebugHudController = {}
local started = false

local function createLabel(parent: Instance, name: string, position: UDim2): TextLabel
	local label = Instance.new("TextLabel")
	label.Name = name
	label.BackgroundTransparency = 0.25
	label.BackgroundColor3 = Color3.fromRGB(28, 24, 21)
	label.BorderSizePixel = 0
	label.Position = position
	label.Size = UDim2.fromOffset(260, 28)
	label.Font = Enum.Font.Gotham
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = parent
	return label
end

function DebugHudController.start()
	if started then
		return
	end
	started = true

	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "DebugHud"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui

	local title = createLabel(screenGui, "Title", UDim2.fromOffset(16, 16))
	title.Text = "Tiny Factory — v1.00"
	local coins = createLabel(screenGui, "Coins", UDim2.fromOffset(16, 50))
	local activeItems = createLabel(screenGui, "ActiveItems", UDim2.fromOffset(16, 84))
	local production = createLabel(screenGui, "Production", UDim2.fromOffset(16, 118))
	local sold = createLabel(screenGui, "Sold", UDim2.fromOffset(16, 152))
	local capacity = createLabel(screenGui, "Capacity", UDim2.fromOffset(16, 186))
	local dataStatus = createLabel(screenGui, "DataStatus", UDim2.fromOffset(16, 220))

	local function refresh()
		coins.Text = `Coins: {player:GetAttribute("FactoryCoins") or 0}`
		activeItems.Text = `Active items: {player:GetAttribute("FactoryActiveItems") or 0}`
		production.Text = `Produced: {player:GetAttribute("FactoryProducedItems") or 0}`
		sold.Text = `Sold: {player:GetAttribute("FactorySoldItems") or 0}`
		capacity.Text = `Capacity: {player:GetAttribute("FactoryCapacity") or 1}`
		if player:GetAttribute("FactoryDataLocked") then
			dataStatus.Text = "Save: another session is active"
		elseif player:GetAttribute("FactoryDataLoaded") then
			dataStatus.Text = "Save: loaded"
		elseif player:GetAttribute("FactoryDataError") then
			dataStatus.Text = "Save: unavailable; playing safely"
		else
			dataStatus.Text = "Save: loading"
		end
	end

	for _, attributeName in ipairs({
		"FactoryCoins",
		"FactoryActiveItems",
		"FactoryProducedItems",
		"FactorySoldItems",
		"FactoryCapacity",
		"FactoryDataLoaded",
		"FactoryDataLocked",
		"FactoryDataError",
	}) do
		player:GetAttributeChangedSignal(attributeName):Connect(refresh)
	end
	local camera = workspace.CurrentCamera
	if camera then
		local function layout()
			local compact = camera.ViewportSize.X < 600
			for _, label in ipairs({ title, coins, activeItems, production, sold, capacity, dataStatus }) do
				label.Size = UDim2.fromOffset(if compact then 190 else 260, 26)
				label.TextSize = if compact then 14 else 16
			end
		end
		camera:GetPropertyChangedSignal("ViewportSize"):Connect(layout)
		layout()
	end
	refresh()
end

return DebugHudController
