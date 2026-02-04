local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local function onTouched(hit)
    if hit and hit.CanCollide then
        humanoid.Jump = true
        wait(0.3)
    end
end

rootPart.Touched:Connect(onTouched)

character:WaitForChild("Humanoid").Died:Connect(function()
    rootPart.Touched:Disconnect()
end)