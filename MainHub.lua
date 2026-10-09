-- Load Orion UI Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create Window
local Window = OrionLib:MakeWindow({
    Name = "My Custom Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MyHubConfig",
    IntroEnabled = true,
    IntroText = "Loading My Custom Hub..."
})

-- TAB 1: PLAYER MODS
local PlayerTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:AddSection({
    Name = "Speed & Jump"
})

-- WalkSpeed Slider
PlayerTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(140, 0, 255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end    
})

-- JumpPower Slider
PlayerTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Color = Color3.fromRGB(0, 150, 255),
    Increment = 5,
    ValueName = "Power",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.UseJumpPower = true
            player.Character.Humanoid.JumpPower = Value
        end
    end    
})

-- TAB 2: UTILITIES
local UtilityTab = Window:MakeTab({
    Name = "Utilities",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

UtilityTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
    end
})

UtilityTab:AddButton({
    Name = "Unload Hub",
    Callback = function()
        OrionLib:Destroy()
    end
})

-- Initialize Hub
OrionLib:Init()
