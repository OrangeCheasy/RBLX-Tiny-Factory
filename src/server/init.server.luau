--!strict

local Players = game:GetService("Players")

-- Tiny Factory does not replace the player's avatar. Keep default character
-- loading enabled while the factory runtime initializes independently.
Players.CharacterAutoLoads = true

local GameService = require(script.Services.GameService)

GameService.start()
