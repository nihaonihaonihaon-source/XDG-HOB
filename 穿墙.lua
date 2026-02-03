Toggle("幽灵模式", "GhostMode", false, function(Enabled)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    if Enabled then
        if _G.GhostModeConnection then
            _G.GhostModeConnection:Disconnect()
        end
        
        local function makeTransparent(part)
            if part:IsA("BasePart") then
                local originalProperties = {
                    Transparency = part.Transparency,
                    CanCollide = part.CanCollide,
                    Material = part.Material
                }
                
                part.Transparency = 0.7
                part.CanCollide = false
                part.Material = Enum.Material.ForceField
                
                if not part:FindFirstChild("GhostModeOriginal") then
                    local folder = Instance.new("Folder")
                    folder.Name = "GhostModeOriginal"
                    
                    for propName, propValue in pairs(originalProperties) do
                        local value = Instance.new(propName == "Material" and "StringValue" or "NumberValue")
                        value.Name = propName
                        value.Value = propValue
                        value.Parent = folder
                    end
                    
                    folder.Parent = part
                end
            end
        end
        
        local function disableCharacterPhysics(character)
            if not character then return end
            
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                    part.AssemblyLinearVelocity = Vector3.new()
                    part.AssemblyAngularVelocity = Vector3.new()
                    
                    if part:FindFirstChildWhichIsA("BodyVelocity") then
                        part:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
                    end
                    if part:FindFirstChildWhichIsA("BodyForce") then
                        part:FindFirstChildWhichIsA("BodyForce"):Destroy()
                    end
                end
            end
            
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
                
                spawn(function()
                    for i = 1, 10 do
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        RunService.Heartbeat:Wait()
                    end
                end)
            end
        end
        
        _G.GhostModeConnection = RunService.Heartbeat:Connect(function()
            local character = LocalPlayer.Character
            if character then
                disableCharacterPhysics(character)
                
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        makeTransparent(part)
                        
                        local mesh = part:FindFirstChildWhichIsA("SpecialMesh")
                        if mesh then
                            mesh.VertexColor = Vector3.new(1, 1, 1)
                        end
                    end
                end
                
                local root = character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.Velocity = Vector3.new()
                    root.RotVelocity = Vector3.new()
                end
            end
        end)
        
        local character = LocalPlayer.Character
        if character then
            disableCharacterPhysics(character)
        end
        
        LocalPlayer.CharacterAdded:Connect(function(newChar)
            task.wait(1)
            disableCharacterPhysics(newChar)
        end)
    else
        if _G.GhostModeConnection then
            _G.GhostModeConnection:Disconnect()
            _G.GhostModeConnection = nil
        end
        
        local character = LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    local originalFolder = part:FindFirstChild("GhostModeOriginal")
                    if originalFolder then
                        for _, value in pairs(originalFolder:GetChildren()) do
                            if value.Name == "Transparency" then
                                part.Transparency = value.Value
                            elseif value.Name == "CanCollide" then
                                part.CanCollide = value.Value == 1
                            elseif value.Name == "Material" then
                                part.Material = Enum.Material[value.Value]
                            end
                        end
                        originalFolder:Destroy()
                    end
                    
                    part.CustomPhysicalProperties = nil
                    part.CanCollide = true
                    
                    if part.Name == "HumanoidRootPart" then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.PlatformStand = false
                        end
                    end
                end
            end
        end
    end
end)