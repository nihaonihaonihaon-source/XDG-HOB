Toggle("穿墙", "NoClip", false, function(NC)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    if NC then
        if getgenv().NoClipConnection then
            getgenv().NoClipConnection:Disconnect()
        end
        
        getgenv().NoClipConnection = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid:ChangeState(11)
                
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                        part.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
        
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CanCollide = false
        end
    else
        if getgenv().NoClipConnection then
            getgenv().NoClipConnection:Disconnect()
            getgenv().NoClipConnection = nil
        end
        
        local character = LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)