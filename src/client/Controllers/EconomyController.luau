--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EconomyController = {}
local started = false

local function createButton(parent: Instance, name: string, text: string, position: UDim2): TextButton
	local button = Instance.new("TextButton")
	button.Name = name
	button.Text = text
	button.Position = position
	button.Size = UDim2.fromOffset(190, 34)
	button.BackgroundColor3 = Color3.fromRGB(46, 39, 34)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	button.Parent = parent
	return button
end

function EconomyController.start()
	if started then
		return
	end
	started = true

	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local remotes = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Factory")
	local getState = remotes:WaitForChild("GetEconomyState") :: RemoteFunction
	local rollMachine = remotes:WaitForChild("RollMachine") :: RemoteFunction
	local sellMachine = remotes:WaitForChild("SellMachine") :: RemoteFunction
	local buyCapacity = remotes:WaitForChild("BuyCapacity") :: RemoteFunction

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "EconomyHud"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui

	local panel = Instance.new("Frame")
	panel.Name = "EconomyPanel"
	panel.Position = UDim2.new(1, -236, 0, 16)
	panel.Size = UDim2.fromOffset(220, 250)
	panel.BackgroundColor3 = Color3.fromRGB(28, 24, 21)
	panel.BackgroundTransparency = 0.1
	panel.BorderSizePixel = 0
	panel.Parent = screenGui

	local title = Instance.new("TextLabel")
	title.Size = UDim2.fromOffset(220, 30)
	title.BackgroundTransparency = 1
	title.Text = "Factory economy"
	title.TextColor3 = Color3.fromRGB(255, 194, 66)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 17
	title.Parent = panel

	local status = Instance.new("TextLabel")
	status.Position = UDim2.fromOffset(8, 34)
	status.Size = UDim2.fromOffset(204, 32)
	status.BackgroundTransparency = 1
	status.TextColor3 = Color3.fromRGB(255, 255, 255)
	status.TextWrapped = true
	status.Font = Enum.Font.Gotham
	status.TextSize = 12
	status.Parent = panel

	local roll = createButton(panel, "Roll", "Roll machine", UDim2.fromOffset(15, 72))
	local capacity = createButton(panel, "Capacity", "Buy capacity", UDim2.fromOffset(15, 112))
	local sell = createButton(panel, "Sell", "Sell multiplier", UDim2.fromOffset(15, 152))

	local function layout(viewportWidth: number)
		local compact = viewportWidth < 600
		panel.Size = if compact then UDim2.fromOffset(196, 180) else UDim2.fromOffset(220, 250)
		panel.Position = if compact then UDim2.fromOffset(8, 372) else UDim2.new(1, -236, 0, 16)
		title.Size = UDim2.new(1, 0, 0, 30)
		status.Size = UDim2.new(1, -16, 0, 32)
		local buttonWidth = if compact then 166 else 190
		local buttonHeight = if compact then 28 else 34
		local firstY = if compact then 68 else 72
		for index, button in ipairs({ roll, capacity, sell }) do
			button.Size = UDim2.fromOffset(buttonWidth, buttonHeight)
			button.Position = UDim2.fromOffset(15, firstY + (index - 1) * (buttonHeight + 6))
		end
	end

	local camera = workspace.CurrentCamera
	if camera then
		camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			layout(camera.ViewportSize.X)
		end)
		layout(camera.ViewportSize.X)
	end

	local function showResponse(response: any)
		if response and response.Success then
			status.TextColor3 = Color3.fromRGB(140, 235, 150)
			local inventory = response.Inventory or {}
			status.Text = `Coins {response.Coins or 0} | Capacity {response.Capacity or 0} | Multiplier {inventory.ValueMultiplier or 0}`
		else
			status.TextColor3 = Color3.fromRGB(255, 150, 120)
			status.Text = response and response.Reason or "Request failed"
		end
	end

	local function refresh()
		showResponse(getState:InvokeServer())
	end

	roll.Activated:Connect(function()
		showResponse(rollMachine:InvokeServer())
	end)
	capacity.Activated:Connect(function()
		showResponse(buyCapacity:InvokeServer())
	end)
	sell.Activated:Connect(function()
		showResponse(sellMachine:InvokeServer("ValueMultiplier", 1))
	end)

	refresh()
end

return EconomyController
