--!strict

local Players = game:GetService("Players")

-- Tank Blast uses the tank as the player's avatar. Set this before any service
-- work so Roblox cannot race a default character spawn against TankService.
Players.CharacterAutoLoads = false

local GameService = require(script.Services.GameService)

GameService.start()
