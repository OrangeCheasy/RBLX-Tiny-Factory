--!strict

local AssetService = game:GetService("AssetService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local PersonalIslandAsset = require(Shared:WaitForChild("PersonalIslandAssetId"))
local PersonalIslandPartColors = require(Shared:WaitForChild("PersonalIslandPartColors"))

-- The source GLB is authored in meters; Roblox uses studs (about 0.28 m each).
local MODEL_SCALE = 3.5714286

local PersonalIslandService = {}
local started = false

local function prepareIsland(model: Model)
	local originalSize = model:GetExtentsSize()
	model:ScaleTo(MODEL_SCALE)
	local scaledSize = model:GetExtentsSize()

	local partCount = 0
	local coloredPartCount = 0

	for _, descendant in model:GetDescendants() do
		if descendant:IsA("BasePart") then
			partCount += 1
			descendant.Anchored = true

			local color = PersonalIslandPartColors[descendant.Name]
			if not color then
				-- Some import paths append a numeric suffix to duplicate instance names.
				local baseName = string.gsub(descendant.Name, "_%d+$", "")
				color = PersonalIslandPartColors[baseName]
			end

			if color then
				descendant.Color = color
				coloredPartCount += 1
			end
		end
	end

	print(
		"Tiny Factory personal island scaled from "
			.. tostring(originalSize)
			.. " to "
			.. tostring(scaledSize)
			.. " studs; anchored "
			.. tostring(partCount)
			.. " parts and restored source colors on "
			.. tostring(coloredPartCount)
			.. " parts."
	)
	if coloredPartCount < partCount then
		warn(
			"Tiny Factory restored source colors on "
				.. tostring(coloredPartCount)
				.. " of "
				.. tostring(partCount)
				.. " parts; some imported names did not match the source GLB."
		)
	end
end

function PersonalIslandService.start()
	if started then
		return
	end
	started = true

	if PersonalIslandAsset.AssetId <= 0 then
		warn("Tiny Factory personal island is not imported yet; waiting for the main-only asset workflow.")
		return
	end

	if workspace:FindFirstChild("PersonalIsland") then
		return
	end

	local ok, loadedAsset = pcall(function()
		return AssetService:LoadAssetAsync(PersonalIslandAsset.AssetId)
	end)

	if not ok then
		warn(
			"Tiny Factory could not load personal island asset "
				.. tostring(PersonalIslandAsset.AssetId)
				.. ": "
				.. tostring(loadedAsset)
		)
		return
	end

	if not loadedAsset:IsA("Model") then
		warn("Tiny Factory personal island asset did not return a Model.")
		loadedAsset:Destroy()
		return
	end

	loadedAsset.Name = "PersonalIsland"
	loadedAsset:SetAttribute("HiggsfieldProjectId", PersonalIslandAsset.SourceProjectId)
	loadedAsset:SetAttribute("HiggsfieldRevision", PersonalIslandAsset.SourceRevision)
	loadedAsset:SetAttribute("RobloxAssetId", PersonalIslandAsset.AssetId)

	prepareIsland(loadedAsset)
	loadedAsset.Parent = workspace
end

return PersonalIslandService
