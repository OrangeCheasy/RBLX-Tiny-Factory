--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BuildController = {}
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
	button.AutoButtonColor = true
	button.Parent = parent
	return button
end

function BuildController.start()
	if started then
		return
	end
	started = true

	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local remotes = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Factory")
	local placeMachine = remotes:WaitForChild("PlaceMachine") :: RemoteFunction
	local removeMachine = remotes:WaitForChild("RemoveMachine") :: RemoteFunction
	local moveMachine = remotes:WaitForChild("MoveMachine") :: RemoteFunction

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "BuildHud"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui

	local panel = Instance.new("Frame")
	panel.Name = "BuildPanel"
	panel.Position = UDim2.fromOffset(16, 200)
	panel.Size = UDim2.fromOffset(220, 250)
	panel.BackgroundColor3 = Color3.fromRGB(28, 24, 21)
	panel.BackgroundTransparency = 0.1
	panel.BorderSizePixel = 0
	panel.Parent = screenGui

	local title = Instance.new("TextLabel")
	title.Size = UDim2.fromOffset(220, 30)
	title.BackgroundTransparency = 1
	title.Text = "Build mode"
	title.TextColor3 = Color3.fromRGB(255, 194, 66)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 17
	title.Parent = panel

	local status = Instance.new("TextLabel")
	status.Name = "Status"
	status.Position = UDim2.fromOffset(8, 34)
	status.Size = UDim2.fromOffset(204, 32)
	status.BackgroundTransparency = 1
	status.TextColor3 = Color3.fromRGB(255, 255, 255)
	status.TextWrapped = true
	status.Font = Enum.Font.Gotham
	status.TextSize = 12
	status.Parent = panel

	local remove = createButton(panel, "RemoveProcessor", "Remove slot 2", UDim2.fromOffset(15, 74))
	local place = createButton(panel, "PlaceProcessor", "Place multiplier", UDim2.fromOffset(15, 114))
	local move = createButton(panel, "MoveProcessor", "Move slot 2 → slot 3", UDim2.fromOffset(15, 154))

	local function layout(viewportWidth: number)
		local compact = viewportWidth < 600
		panel.Size = if compact then UDim2.fromOffset(196, 180) else UDim2.fromOffset(220, 250)
		panel.Position = if compact then UDim2.fromOffset(8, 180) else UDim2.fromOffset(16, 200)
		title.Size = UDim2.new(1, 0, 0, 30)
		status.Size = UDim2.new(1, -16, 0, 32)
		local buttonWidth = if compact then 166 else 190
		local buttonHeight = if compact then 28 else 34
		local firstY = if compact then 68 else 74
		for index, button in ipairs({ remove, place, move }) do
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
			status.Text = "Layout updated"
		else
			status.TextColor3 = Color3.fromRGB(255, 150, 120)
			status.Text = response and response.Reason or "Request failed"
		end
	end

	remove.Activated:Connect(function()
		showResponse(removeMachine:InvokeServer(2))
	end)
	place.Activated:Connect(function()
		showResponse(placeMachine:InvokeServer("ValueMultiplier", 2))
	end)
	move.Activated:Connect(function()
		showResponse(moveMachine:InvokeServer(2, 3))
	end)
end

return BuildController
