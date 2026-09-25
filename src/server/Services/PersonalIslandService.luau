--!strict

local AssetService = game:GetService("AssetService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PersonalIslandAsset = require(
	ReplicatedStorage:WaitForChild("Shared"):WaitForChild("PersonalIslandAssetId")
)

local PersonalIslandService = {}
local started = false

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
		warn(`Tiny Factory could not load personal island asset {PersonalIslandAsset.AssetId}: {loadedAsset}`)
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
	loadedAsset.Parent = workspace
end

return PersonalIslandService
