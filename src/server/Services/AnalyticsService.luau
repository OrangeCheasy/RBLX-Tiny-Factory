--!strict

local Players = game:GetService("Players")

local AnalyticsService = {}
local counters = {}
local started = false

local function attributeName(eventName: string): string
	return `Analytics_{eventName}`
end

function AnalyticsService.record(player: Player, eventName: string, amount: number?)
	if type(eventName) ~= "string" or eventName == "" or #eventName > 48 then
		return
	end
	local increment = amount or 1
	if type(increment) ~= "number" or increment < 0 or increment % 1 ~= 0 then
		return
	end
	counters[player] = counters[player] or {}
	local current = counters[player][eventName] or 0
	local nextValue = math.min(current + increment, 1_000_000)
	counters[player][eventName] = nextValue
	player:SetAttribute(attributeName(eventName), nextValue)
end

function AnalyticsService.snapshot(player: Player): { [string]: number }
	local result = {}
	for eventName, count in pairs(counters[player] or {}) do
		result[eventName] = count
	end
	return result
end

function AnalyticsService.start()
	if started then
		return
	end
	started = true
	Players.PlayerRemoving:Connect(function(player)
		counters[player] = nil
	end)
end

return AnalyticsService
