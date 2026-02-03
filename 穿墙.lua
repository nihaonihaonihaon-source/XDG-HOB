Toggle("穿墙模式", "NoClip", false, function(Enabled)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    if Enabled then
        if _G.NoClipConnection then
            _G.NoClipConnection:Disconnect()
        end
        
        _G.NoClipConnection = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                end
                
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                        part.Velocity = Vector3.new(0, 0, 0)
                        part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end
                end
                
                local root = character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CanCollide = false
                    root.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
        
        local function setupNewCharacter(character)
            task.wait(0.5)
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        
        if LocalPlayer.Character then
            setupNewCharacter(LocalPlayer.Character)
        end
        
        _G.NoClipCharAdded = LocalPlayer.CharacterAdded:Connect(setupNewCharacter)
    else
        if _G.NoClipConnection then
            _G.NoClipConnection:Disconnect()
            _G.NoClipConnection = nil
        end
        
        if _G.NoClipCharAdded then
            _G.NoClipCharAdded:Disconnect()
            _G.NoClipCharAdded = nil
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