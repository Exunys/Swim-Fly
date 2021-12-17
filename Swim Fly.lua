--// Services

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

--// Variables

local Key = Enum.KeyCode.E
local Flying = false
local Typing = false

--// Typing Check

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

--// Main

RunService.RenderStepped:Connect(function()
    if Flying then
        Players.LocalPlayer.Character.Humanoid:ChangeState(4)
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
end)

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == Key then
        Flying = not Flying
        
        if not Flying then
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 
        end
    end
end)
