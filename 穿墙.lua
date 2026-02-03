local NoClipModule = {}

local function SafeExecute(callback, fallback)
    local success, result = pcall(function()
        return callback()
    end)
    
    if not success then
        if fallback then
            return fallback()
        end
        return nil
    end
    
    return result
end

local function GetService(serviceName)
    return SafeExecute(function()
        local success, service = pcall(function()
            return game:GetService(serviceName)
        end)
        
        if not success then
            service = game:FindService(serviceName) or game:GetService(tostring(serviceName))
        end
        
        return service
    end, function()
        return nil
    end)
end

function NoClipModule:Init(uiToggleFunction)
    SafeExecute(function()
        task.wait(math.random(0.1, 0.5))
        
        local RunService = GetService("RunService")
        local Players = GetService("Players")
        
        if not RunService or not Players then
            return false
        end
        
        local noclipConnection = nil
        local isActive = false
        local LocalPlayer = Players.LocalPlayer
        
        local function UpdateNoClip(state)
            isActive = state
            
            SafeExecute(function()
                if not LocalPlayer then 
                    LocalPlayer = Players.LocalPlayer 
                    if not LocalPlayer then return end
                end
                
                if state then
                    if noclipConnection then
                        noclipConnection:Disconnect()
                        noclipConnection = nil
                    end
                    
                    noclipConnection = RunService.Stepped:Connect(function()
                        SafeExecute(function()
                            local character = LocalPlayer.Character
                            if character then
                                for _, part in pairs(character:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CanCollide = false
                                    end
                                end
                            end
                        end, function()
                            if noclipConnection then
                                noclipConnection:Disconnect()
                                noclipConnection = nil
                            end
                        end)
                    end)
                    
                else
                    if noclipConnection then
                        noclipConnection:Disconnect()
                        noclipConnection = nil
                    end
                    
                    SafeExecute(function()
                        local character = LocalPlayer.Character
                        if character then
                            for _, part in pairs(character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = true
                                end
                            end
                        end
                    end)
                end
            end, function()
                if noclipConnection then
                    noclipConnection:Disconnect()
                    noclipConnection = nil
                end
            end)
        end
        
        if uiToggleFunction and type(uiToggleFunction) == "function" then
            uiToggleFunction("穿墙", "NoClip", false, function(state)
                UpdateNoClip(state)
            end)
        end
        
        local characterAddedConnection
        characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(character)
            if isActive then
                task.wait(0.3)
                SafeExecute(function()
                    if noclipConnection then
                        noclipConnection:Disconnect()
                        noclipConnection = nil
                    end
                    
                    noclipConnection = RunService.Stepped:Connect(function()
                        SafeExecute(function()
                            if character and character.Parent then
                                for _, part in pairs(character:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CanCollide = false
                                    end
                                end
                            end
                        end)
                    end)
                end)
            end
        end)
        
        local playerLeavingConnection
        playerLeavingConnection = Players.PlayerRemoving:Connect(function(player)
            if player == LocalPlayer then
                if noclipConnection then
                    noclipConnection:Disconnect()
                    noclipConnection = nil
                end
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                if playerLeavingConnection then
                    playerLeavingConnection:Disconnect()
                end
            end
        end)
        
        NoClipModule.connection = noclipConnection
        NoClipModule.characterConnection = characterAddedConnection
        NoClipModule.leavingConnection = playerLeavingConnection
        
        return true
    end, function()
        return false
    end)
end

function NoClipModule:Toggle(state)
    SafeExecute(function()
        local RunService = GetService("RunService")
        local Players = GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        if state then
            if NoClipModule.connection then
                NoClipModule.connection:Disconnect()
                NoClipModule.connection = nil
            end
            
            NoClipModule.connection = RunService.Stepped:Connect(function()
                local character = LocalPlayer.Character
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if NoClipModule.connection then
                NoClipModule.connection:Disconnect()
                NoClipModule.connection = nil
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
end

function NoClipModule:Destroy()
    SafeExecute(function()
        if NoClipModule.connection then
            NoClipModule.connection:Disconnect()
            NoClipModule.connection = nil
        end
        if NoClipModule.characterConnection then
            NoClipModule.characterConnection:Disconnect()
            NoClipModule.characterConnection = nil
        end
        if NoClipModule.leavingConnection then
            NoClipModule.leavingConnection:Disconnect()
            NoClipModule.leavingConnection = nil
        end
    end)
end

return NoClipModule