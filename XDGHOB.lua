local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

StarterGui:SetCore("SendNotification", {Title = "XDG-HOB", Text = "欢迎使用XDG-HOB", Duration = 5})
print("欢迎使用XDG-HOB")
task.wait(0.5)

local function detectExecutor()
    local executors = {
        ["Synapse X"] = function() return tostring(identifyexecutor or gethui):find("Synapse") end,
        ["Script-Ware"] = function() return tostring(getexecutorname):find("Script") end,
        ["Krnl"] = function() return tostring(KRNL_LOADED):find("true") end,
        ["Fluxus"] = function() return tostring(get_hui):find("Fluxus") end,
        ["Comet"] = function() return tostring(comet):find("table") end,
        ["Oxygen U"] = function() return tostring(Oxygen):find("table") end,
        ["Delta"] = function() return tostring(delta):find("table") end
    }
    
    for name, checkFunc in pairs(executors) do
        local success, result = pcall(checkFunc)
        if success and result then
            return name
        end
    end
    
    return "未知注入器"
end

local executorName = detectExecutor()

local function getBeijingTime()
    local timeData = os.date("!*t")
    local beijingOffset = 8 * 3600
    local totalSeconds = os.time(timeData) + beijingOffset
    
    local beijingTime = os.date("*t", totalSeconds)
    return string.format("%04d年%02d月%02d日 %02d:%02d:%02d", 
        beijingTime.year, beijingTime.month, beijingTime.day,
        beijingTime.hour, beijingTime.min, beijingTime.sec)
end

local sg = Instance.new("ScreenGui")
sg.Name = "XDGHOB_UI"
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local uiFrame = Instance.new("Frame")
uiFrame.Name = "MainUI"
uiFrame.Size = UDim2.new(0, 380, 0, 240)
local viewportSize = workspace.CurrentCamera.ViewportSize
local frameSize = uiFrame.AbsoluteSize
local centerX = (viewportSize.X - frameSize.X) / 2
local centerY = (viewportSize.Y - frameSize.Y) / 2
uiFrame.Position = UDim2.new(0, centerX, 0, centerY)
uiFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
uiFrame.BackgroundTransparency = 0.1
uiFrame.BorderSizePixel = 0
uiFrame.Active = true
uiFrame.Selectable = true
uiFrame.Parent = sg

local outerStroke = Instance.new("UIStroke")
outerStroke.Name = "OuterStroke"
outerStroke.Thickness = 3
outerStroke.Color = Color3.fromRGB(70, 145, 255)
outerStroke.Transparency = 0.1
outerStroke.Parent = uiFrame

local innerStroke = Instance.new("UIStroke")
innerStroke.Name = "InnerStroke"
innerStroke.Thickness = 1
innerStroke.Color = Color3.fromRGB(120, 200, 255)
innerStroke.Transparency = 0.3
innerStroke.Parent = uiFrame

local cornerGlow = Instance.new("Frame")
cornerGlow.Name = "CornerGlow"
cornerGlow.Size = UDim2.new(1, 6, 1, 6)
cornerGlow.Position = UDim2.new(0, -3, 0, -3)
cornerGlow.BackgroundColor3 = Color3.fromRGB(70, 145, 255)
cornerGlow.BackgroundTransparency = 0.95
cornerGlow.BorderSizePixel = 0
cornerGlow.ZIndex = -1
cornerGlow.Parent = uiFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
titleBar.BorderSizePixel = 0
titleBar.Active = true
titleBar.Selectable = true
titleBar.Parent = uiFrame

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 145, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 180, 255))
}
gradient.Rotation = 90
gradient.Parent = titleBar

local rainbowText = Instance.new("TextLabel")
rainbowText.Name = "RainbowTitle"
rainbowText.Size = UDim2.new(1, 0, 1, 0)
rainbowText.Position = UDim2.new(0, 0, 0, 0)
rainbowText.BackgroundTransparency = 1
rainbowText.Text = "✨ XDG-HOB ✨"
rainbowText.TextColor3 = Color3.new(1, 1, 1)
rainbowText.Font = Enum.Font.GothamBlack
rainbowText.TextSize = 20
rainbowText.TextStrokeTransparency = 0.7
rainbowText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
rainbowText.Parent = titleBar

local controlBtn = Instance.new("TextButton")
controlBtn.Name = "ControlButton"
controlBtn.Size = UDim2.new(0, 100, 0, 36)
controlBtn.Position = UDim2.new(0, 100, 0, 100)
controlBtn.BackgroundColor3 = Color3.fromRGB(70, 145, 255)
controlBtn.Text = "XDG-HOB"
controlBtn.TextColor3 = Color3.new(1, 1, 1)
controlBtn.Font = Enum.Font.GothamBlack
controlBtn.TextSize = 14
controlBtn.TextStrokeTransparency = 0.6
controlBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
controlBtn.Active = true
controlBtn.Selectable = true
controlBtn.Parent = sg

local btnOuterStroke = Instance.new("UIStroke")
btnOuterStroke.Name = "BtnOuterStroke"
btnOuterStroke.Thickness = 2
btnOuterStroke.Color = Color3.fromRGB(200, 220, 255)
btnOuterStroke.Transparency = 0.2
btnOuterStroke.Parent = controlBtn

local btnInnerStroke = Instance.new("UIStroke")
btnInnerStroke.Name = "BtnInnerStroke"
btnInnerStroke.Thickness = 1
btnInnerStroke.Color = Color3.fromRGB(255, 255, 255)
btnInnerStroke.Transparency = 0.4
btnInnerStroke.Parent = controlBtn

local btnGlow = Instance.new("Frame")
btnGlow.Name = "BtnGlow"
btnGlow.Size = UDim2.new(1, 8, 1, 8)
btnGlow.Position = UDim2.new(0, -4, 0, -4)
btnGlow.BackgroundColor3 = Color3.fromRGB(70, 145, 255)
btnGlow.BackgroundTransparency = 0.9
btnGlow.BorderSizePixel = 0
btnGlow.ZIndex = -1
btnGlow.Parent = controlBtn

local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0, 110, 1, -40)
leftPanel.Position = UDim2.new(0, 0, 0, 40)
leftPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
leftPanel.BorderSizePixel = 0
leftPanel.Parent = uiFrame

local leftPanelStroke = Instance.new("UIStroke")
leftPanelStroke.Name = "LeftPanelStroke"
leftPanelStroke.Thickness = 1
leftPanelStroke.Color = Color3.fromRGB(60, 60, 70)
leftPanelStroke.Transparency = 0.5
leftPanelStroke.Parent = leftPanel

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "CategoryScroll"
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 160)
scrollFrame.Parent = leftPanel

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = scrollFrame
listLayout.Padding = UDim.new(0, 8)

local categories = {"实用区", "功能区", "信息区", "其他脚本区"}
local selectedCategory = 1
local contentContainers = {}

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -110, 1, -40)
contentFrame.Position = UDim2.new(0, 110, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = uiFrame

local contentFrameStroke = Instance.new("UIStroke")
contentFrameStroke.Name = "ContentFrameStroke"
contentFrameStroke.Thickness = 1
contentFrameStroke.Color = Color3.fromRGB(60, 60, 70)
contentFrameStroke.Transparency = 0.5
contentFrameStroke.Parent = contentFrame

local function createUtilityContainer()
    local utilityContainer = Instance.new("Frame")
    utilityContainer.Name = "UtilityContainer"
    utilityContainer.Size = UDim2.new(1, 0, 1, 0)
    utilityContainer.BackgroundTransparency = 1
    utilityContainer.Visible = true
    utilityContainer.Parent = contentFrame
    
    local scrollContainer = Instance.new("ScrollingFrame")
    scrollContainer.Name = "UtilityScroll"
    scrollContainer.Size = UDim2.new(1, -20, 1, -20)
    scrollContainer.Position = UDim2.new(0, 10, 0, 10)
    scrollContainer.BackgroundTransparency = 1
    scrollContainer.ScrollBarThickness = 6
    scrollContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110)
    scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 550)
    scrollContainer.Parent = utilityContainer
    
    local utilityLayout = Instance.new("UIListLayout")
    utilityLayout.Parent = scrollContainer
    utilityLayout.Padding = UDim.new(0, 12)
    utilityLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local antiDetectFlightBtn = Instance.new("TextButton")
    antiDetectFlightBtn.Name = "AntiDetectFlight"
    antiDetectFlightBtn.Size = UDim2.new(0.9, 0, 0, 40)
    antiDetectFlightBtn.Text = "防检测飞行"
    antiDetectFlightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    antiDetectFlightBtn.TextColor3 = Color3.new(1, 1, 1)
    antiDetectFlightBtn.Font = Enum.Font.GothamSemibold
    antiDetectFlightBtn.TextSize = 15
    antiDetectFlightBtn.TextStrokeTransparency = 0.5
    antiDetectFlightBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    antiDetectFlightBtn.AutoButtonColor = false
    
    local btnStroke1 = Instance.new("UIStroke")
    btnStroke1.Thickness = 2
    btnStroke1.Color = Color3.fromRGB(80, 80, 90)
    btnStroke1.Transparency = 0.3
    btnStroke1.Parent = antiDetectFlightBtn
    
    local btnCorner1 = Instance.new("UICorner")
    btnCorner1.CornerRadius = UDim.new(0, 8)
    btnCorner1.Parent = antiDetectFlightBtn
    
    local originalColor1 = Color3.fromRGB(60, 60, 70)
    local isHighlighted1 = false
    
    antiDetectFlightBtn.MouseEnter:Connect(function()
        if not isHighlighted1 then
            antiDetectFlightBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke1.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    antiDetectFlightBtn.MouseLeave:Connect(function()
        if not isHighlighted1 then
            antiDetectFlightBtn.BackgroundColor3 = originalColor1
            btnStroke1.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    antiDetectFlightBtn.MouseButton1Click:Connect(function()
        isHighlighted1 = not isHighlighted1
        
        if isHighlighted1 then
            antiDetectFlightBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke1.Color = Color3.fromRGB(120, 200, 255)
            antiDetectFlightBtn.Text = "防检测飞行 ✓"
            
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/mbhivhjjb.lua"))()
            end)
            
            if success then
                StarterGui:SetCore("SendNotification", {
                    Title = "XDG-HOB",
                    Text = "防检测飞行已启用",
                    Duration = 3,
                    Icon = "rbxassetid://4483345998"
                })
                print("防检测飞行脚本加载成功")
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "错误",
                    Text = "加载飞行脚本失败",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
                warn("加载飞行脚本失败:", result)
                
                isHighlighted1 = false
                antiDetectFlightBtn.BackgroundColor3 = originalColor1
                btnStroke1.Color = Color3.fromRGB(80, 80, 90)
                antiDetectFlightBtn.Text = "防检测飞行"
            end
        else
            antiDetectFlightBtn.BackgroundColor3 = originalColor1
            btnStroke1.Color = Color3.fromRGB(80, 80, 90)
            antiDetectFlightBtn.Text = "防检测飞行"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "防检测飞行已禁用",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    antiDetectFlightBtn.Parent = scrollContainer
    
    local antiDetectWallBtn = Instance.new("TextButton")
    antiDetectWallBtn.Name = "AntiDetectWall"
    antiDetectWallBtn.Size = UDim2.new(0.9, 0, 0, 40)
    antiDetectWallBtn.Text = "防检测穿墙"
    antiDetectWallBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    antiDetectWallBtn.TextColor3 = Color3.new(1, 1, 1)
    antiDetectWallBtn.Font = Enum.Font.GothamSemibold
    antiDetectWallBtn.TextSize = 15
    antiDetectWallBtn.TextStrokeTransparency = 0.5
    antiDetectWallBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    antiDetectWallBtn.AutoButtonColor = false
    
    local btnStroke2 = Instance.new("UIStroke")
    btnStroke2.Thickness = 2
    btnStroke2.Color = Color3.fromRGB(80, 80, 90)
    btnStroke2.Transparency = 0.3
    btnStroke2.Parent = antiDetectWallBtn
    
    local btnCorner2 = Instance.new("UICorner")
    btnCorner2.CornerRadius = UDim.new(0, 8)
    btnCorner2.Parent = antiDetectWallBtn
    
    local originalColor2 = Color3.fromRGB(60, 60, 70)
    local isHighlighted2 = false
    
    antiDetectWallBtn.MouseEnter:Connect(function()
        if not isHighlighted2 then
            antiDetectWallBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke2.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    antiDetectWallBtn.MouseLeave:Connect(function()
        if not isHighlighted2 then
            antiDetectWallBtn.BackgroundColor3 = originalColor2
            btnStroke2.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    antiDetectWallBtn.MouseButton1Click:Connect(function()
        isHighlighted2 = not isHighlighted2
        
        if isHighlighted2 then
            antiDetectWallBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke2.Color = Color3.fromRGB(120, 200, 255)
            antiDetectWallBtn.Text = "防检测穿墙 ✓"
            
            local WallWalkModule = {
                Enabled = false,
                Connection = nil,
                Speed = 26,
                LastUpdate = 0,
                NoClipParts = {},
                CharacterAddedConnection = nil
            }

            function WallWalkModule:Toggle()
                self.Enabled = not self.Enabled
                if self.Enabled then
                    self:Start()
                else
                    self:Stop()
                end
                return self.Enabled
            end

            function WallWalkModule:Start()
                local plr = game:GetService("Players").LocalPlayer
                
                self.NoClipParts = {}
                
                if plr.Character then
                    self:SetupCharacter(plr.Character)
                end
                
                self.CharacterAddedConnection = plr.CharacterAdded:Connect(function(char)
                    self:SetupCharacter(char)
                end)
                
                self.Connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
                    if not self.Enabled or tick() - self.LastUpdate < 0.05 then return end
                    self.LastUpdate = tick()
                    
                    local char = plr.Character
                    if not char then return end
                    
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if not root then return end
                    
                    local UIS = game:GetService("UserInputService")
                    local dir = Vector3.zero
                    local cf = root.CFrame
                    
                    if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + cf.LookVector end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - cf.LookVector end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - cf.RightVector end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + cf.RightVector end
                    if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
                    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir + Vector3.new(0, -1, 0) end
                    
                    if dir.Magnitude > 0 then
                        dir = dir.Unit
                        local speed = self.Speed * (0.9 + math.random() * 0.2)
                        root.CFrame = root.CFrame + (dir * speed * dt)
                    end
                end)
            end

            function WallWalkModule:SetupCharacter(char)
                task.wait(0.2)
                
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                        table.insert(self.NoClipParts, part)
                    end
                end
                
                char.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("BasePart") then
                        task.wait(0.1)
                        descendant.CanCollide = false
                        table.insert(self.NoClipParts, descendant)
                    end
                end)
                
                local humanoid = char:WaitForChild("Humanoid")
                humanoid.StateChanged:Connect(function(oldState, newState)
                    if newState == Enum.HumanoidStateType.Jumping then
                        task.wait(0.05)
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            end

            function WallWalkModule:Stop()
                if self.Connection then 
                    self.Connection:Disconnect() 
                    self.Connection = nil
                end
                
                if self.CharacterAddedConnection then
                    self.CharacterAddedConnection:Disconnect()
                    self.CharacterAddedConnection = nil
                end
                
                local plr = game:GetService("Players").LocalPlayer
                if plr.Character then
                    for _, part in pairs(self.NoClipParts) do
                        if part and part.Parent then
                            part.CanCollide = true
                        end
                    end
                end
                
                self.NoClipParts = {}
            end
            
            WallWalkModule:Toggle()
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "防检测穿墙已启用\nWASD移动 空格上升 Ctrl下降",
                Duration = 5,
                Icon = "rbxassetid://4483345998"
            })
            print("防检测穿墙启用成功")
        else
            if WallWalkModule then
                WallWalkModule:Stop()
            end
            
            antiDetectWallBtn.BackgroundColor3 = originalColor2
            btnStroke2.Color = Color3.fromRGB(80, 80, 90)
            antiDetectWallBtn.Text = "防检测穿墙"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "防检测穿墙已禁用",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    antiDetectWallBtn.Parent = scrollContainer
    
    local flyCarBtn = Instance.new("TextButton")
    flyCarBtn.Name = "FlyCar"
    flyCarBtn.Size = UDim2.new(0.9, 0, 0, 40)
    flyCarBtn.Text = "飞车"
    flyCarBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    flyCarBtn.TextColor3 = Color3.new(1, 1, 1)
    flyCarBtn.Font = Enum.Font.GothamSemibold
    flyCarBtn.TextSize = 15
    flyCarBtn.TextStrokeTransparency = 0.5
    flyCarBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    flyCarBtn.AutoButtonColor = false
    
    local btnStroke3 = Instance.new("UIStroke")
    btnStroke3.Thickness = 2
    btnStroke3.Color = Color3.fromRGB(80, 80, 90)
    btnStroke3.Transparency = 0.3
    btnStroke3.Parent = flyCarBtn
    
    local btnCorner3 = Instance.new("UICorner")
    btnCorner3.CornerRadius = UDim.new(0, 8)
    btnCorner3.Parent = flyCarBtn
    
    local originalColor3 = Color3.fromRGB(60, 60, 70)
    local isHighlighted3 = false
    
    flyCarBtn.MouseEnter:Connect(function()
        if not isHighlighted3 then
            flyCarBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke3.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    flyCarBtn.MouseLeave:Connect(function()
        if not isHighlighted3 then
            flyCarBtn.BackgroundColor3 = originalColor3
            btnStroke3.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    flyCarBtn.MouseButton1Click:Connect(function()
        isHighlighted3 = not isHighlighted3
        
        if isHighlighted3 then
            flyCarBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke3.Color = Color3.fromRGB(120, 200, 255)
            flyCarBtn.Text = "飞车 ✓"
            
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
            end)
            
            if success then
                StarterGui:SetCore("SendNotification", {
                    Title = "XDG-HOB",
                    Text = "飞车脚本已加载",
                    Duration = 3,
                    Icon = "rbxassetid://4483345998"
                })
                print("飞车脚本加载成功")
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "错误",
                    Text = "加载飞车脚本失败",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
                warn("加载飞车脚本失败:", result)
                
                isHighlighted3 = false
                flyCarBtn.BackgroundColor3 = originalColor3
                btnStroke3.Color = Color3.fromRGB(80, 80, 90)
                flyCarBtn.Text = "飞车"
            end
        else
            flyCarBtn.BackgroundColor3 = originalColor3
            btnStroke3.Color = Color3.fromRGB(80, 80, 90)
            flyCarBtn.Text = "飞车"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "飞车脚本已卸载",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    flyCarBtn.Parent = scrollContainer
    
    local playerJoinBtn = Instance.new("TextButton")
    playerJoinBtn.Name = "PlayerJoinNotification"
    playerJoinBtn.Size = UDim2.new(0.9, 0, 0, 40)
    playerJoinBtn.Text = "玩家进入提示"
    playerJoinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    playerJoinBtn.TextColor3 = Color3.new(1, 1, 1)
    playerJoinBtn.Font = Enum.Font.GothamSemibold
    playerJoinBtn.TextSize = 15
    playerJoinBtn.TextStrokeTransparency = 0.5
    playerJoinBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    playerJoinBtn.AutoButtonColor = false
    
    local btnStroke4 = Instance.new("UIStroke")
    btnStroke4.Thickness = 2
    btnStroke4.Color = Color3.fromRGB(80, 80, 90)
    btnStroke4.Transparency = 0.3
    btnStroke4.Parent = playerJoinBtn
    
    local btnCorner4 = Instance.new("UICorner")
    btnCorner4.CornerRadius = UDim.new(0, 8)
    btnCorner4.Parent = playerJoinBtn
    
    local originalColor4 = Color3.fromRGB(60, 60, 70)
    local isHighlighted4 = false
    
    playerJoinBtn.MouseEnter:Connect(function()
        if not isHighlighted4 then
            playerJoinBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke4.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    playerJoinBtn.MouseLeave:Connect(function()
        if not isHighlighted4 then
            playerJoinBtn.BackgroundColor3 = originalColor4
            btnStroke4.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    playerJoinBtn.MouseButton1Click:Connect(function()
        isHighlighted4 = not isHighlighted4
        
        if isHighlighted4 then
            playerJoinBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke4.Color = Color3.fromRGB(120, 200, 255)
            playerJoinBtn.Text = "玩家进入提示 ✓"
            
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
            end)
            
            if success then
                StarterGui:SetCore("SendNotification", {
                    Title = "XDG-HOB",
                    Text = "玩家进入提示脚本已加载",
                    Duration = 3,
                    Icon = "rbxassetid://4483345998"
                })
                print("玩家进入提示脚本加载成功")
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "错误",
                    Text = "加载玩家进入提示脚本失败",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
                warn("加载玩家进入提示脚本失败:", result)
                
                isHighlighted4 = false
                playerJoinBtn.BackgroundColor3 = originalColor4
                btnStroke4.Color = Color3.fromRGB(80, 80, 90)
                playerJoinBtn.Text = "玩家进入提示"
            end
        else
            playerJoinBtn.BackgroundColor3 = originalColor4
            btnStroke4.Color = Color3.fromRGB(80, 80, 90)
            playerJoinBtn.Text = "玩家进入提示"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "玩家进入提示脚本已卸载",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    playerJoinBtn.Parent = scrollContainer
    
    local floatWalkBtn = Instance.new("TextButton")
    floatWalkBtn.Name = "FloatWalk"
    floatWalkBtn.Size = UDim2.new(0.9, 0, 0, 40)
    floatWalkBtn.Text = "踏空"
    floatWalkBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    floatWalkBtn.TextColor3 = Color3.new(1, 1, 1)
    floatWalkBtn.Font = Enum.Font.GothamSemibold
    floatWalkBtn.TextSize = 15
    floatWalkBtn.TextStrokeTransparency = 0.5
    floatWalkBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    floatWalkBtn.AutoButtonColor = false
    
    local btnStroke5 = Instance.new("UIStroke")
    btnStroke5.Thickness = 2
    btnStroke5.Color = Color3.fromRGB(80, 80, 90)
    btnStroke5.Transparency = 0.3
    btnStroke5.Parent = floatWalkBtn
    
    local btnCorner5 = Instance.new("UICorner")
    btnCorner5.CornerRadius = UDim.new(0, 8)
    btnCorner5.Parent = floatWalkBtn
    
    local originalColor5 = Color3.fromRGB(60, 60, 70)
    local isHighlighted5 = false
    
    floatWalkBtn.MouseEnter:Connect(function()
        if not isHighlighted5 then
            floatWalkBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke5.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    floatWalkBtn.MouseLeave:Connect(function()
        if not isHighlighted5 then
            floatWalkBtn.BackgroundColor3 = originalColor5
            btnStroke5.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    floatWalkBtn.MouseButton1Click:Connect(function()
        isHighlighted5 = not isHighlighted5
        
        if isHighlighted5 then
            floatWalkBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke5.Color = Color3.fromRGB(120, 200, 255)
            floatWalkBtn.Text = "踏空 ✓"
            
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
            end)
            
            if success then
                StarterGui:SetCore("SendNotification", {
                    Title = "XDG-HOB",
                    Text = "踏空脚本已加载",
                    Duration = 3,
                    Icon = "rbxassetid://4483345998"
                })
                print("踏空脚本加载成功")
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "错误",
                    Text = "加载踏空脚本失败",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
                warn("加载踏空脚本失败:", result)
                
                isHighlighted5 = false
                floatWalkBtn.BackgroundColor3 = originalColor5
                btnStroke5.Color = Color3.fromRGB(80, 80, 90)
                floatWalkBtn.Text = "踏空"
            end
        else
            floatWalkBtn.BackgroundColor3 = originalColor5
            btnStroke5.Color = Color3.fromRGB(80, 80, 90)
            floatWalkBtn.Text = "踏空"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "踏空脚本已卸载",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    floatWalkBtn.Parent = scrollContainer
    
    local wallClimbBtn = Instance.new("TextButton")
    wallClimbBtn.Name = "WallClimb"
    wallClimbBtn.Size = UDim2.new(0.9, 0, 0, 40)
    wallClimbBtn.Text = "爬墙"
    wallClimbBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    wallClimbBtn.TextColor3 = Color3.new(1, 1, 1)
    wallClimbBtn.Font = Enum.Font.GothamSemibold
    wallClimbBtn.TextSize = 15
    wallClimbBtn.TextStrokeTransparency = 0.5
    wallClimbBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    wallClimbBtn.AutoButtonColor = false
    
    local btnStroke6 = Instance.new("UIStroke")
    btnStroke6.Thickness = 2
    btnStroke6.Color = Color3.fromRGB(80, 80, 90)
    btnStroke6.Transparency = 0.3
    btnStroke6.Parent = wallClimbBtn
    
    local btnCorner6 = Instance.new("UICorner")
    btnCorner6.CornerRadius = UDim.new(0, 8)
    btnCorner6.Parent = wallClimbBtn
    
    local originalColor6 = Color3.fromRGB(60, 60, 70)
    local isHighlighted6 = false
    
    wallClimbBtn.MouseEnter:Connect(function()
        if not isHighlighted6 then
            wallClimbBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke6.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    wallClimbBtn.MouseLeave:Connect(function()
        if not isHighlighted6 then
            wallClimbBtn.BackgroundColor3 = originalColor6
            btnStroke6.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    wallClimbBtn.MouseButton1Click:Connect(function()
        isHighlighted6 = not isHighlighted6
        
        if isHighlighted6 then
            wallClimbBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke6.Color = Color3.fromRGB(120, 200, 255)
            wallClimbBtn.Text = "爬墙 ✓"
            
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
            end)
            
            if success then
                StarterGui:SetCore("SendNotification", {
                    Title = "XDG-HOB",
                    Text = "爬墙脚本已加载",
                    Duration = 3,
                    Icon = "rbxassetid://4483345998"
                })
                print("爬墙脚本加载成功")
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "错误",
                    Text = "加载爬墙脚本失败",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
                warn("加载爬墙脚本失败:", result)
                
                isHighlighted6 = false
                wallClimbBtn.BackgroundColor3 = originalColor6
                btnStroke6.Color = Color3.fromRGB(80, 80, 90)
                wallClimbBtn.Text = "爬墙"
            end
        else
            wallClimbBtn.BackgroundColor3 = originalColor6
            btnStroke6.Color = Color3.fromRGB(80, 80, 90)
            wallClimbBtn.Text = "爬墙"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "爬墙脚本已卸载",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    wallClimbBtn.Parent = scrollContainer
    
    local ironFistBtn = Instance.new("TextButton")
    ironFistBtn.Name = "IronFist"
    ironFistBtn.Size = UDim2.new(0.9, 0, 0, 40)
    ironFistBtn.Text = "铁拳"
    ironFistBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    ironFistBtn.TextColor3 = Color3.new(1, 1, 1)
    ironFistBtn.Font = Enum.Font.GothamSemibold
    ironFistBtn.TextSize = 15
    ironFistBtn.TextStrokeTransparency = 0.5
    ironFistBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    ironFistBtn.AutoButtonColor = false
    
    local btnStroke7 = Instance.new("UIStroke")
    btnStroke7.Thickness = 2
    btnStroke7.Color = Color3.fromRGB(80, 80, 90)
    btnStroke7.Transparency = 0.3
    btnStroke7.Parent = ironFistBtn
    
    local btnCorner7 = Instance.new("UICorner")
    btnCorner7.CornerRadius = UDim.new(0, 8)
    btnCorner7.Parent = ironFistBtn
    
    local originalColor7 = Color3.fromRGB(60, 60, 70)
    local isHighlighted7 = false
    
    ironFistBtn.MouseEnter:Connect(function()
        if not isHighlighted7 then
            ironFistBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
            btnStroke7.Color = Color3.fromRGB(90, 90, 100)
        end
    end)
    
    ironFistBtn.MouseLeave:Connect(function()
        if not isHighlighted7 then
            ironFistBtn.BackgroundColor3 = originalColor7
            btnStroke7.Color = Color3.fromRGB(80, 80, 90)
        end
    end)
    
    ironFistBtn.MouseButton1Click:Connect(function()
        isHighlighted7 = not isHighlighted7
        
        if isHighlighted7 then
            ironFistBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
            btnStroke7.Color = Color3.fromRGB(120, 200, 255)
            ironFistBtn.Text = "铁拳 ✓"
            
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
            end)
            
            if success then
                StarterGui:SetCore("SendNotification", {
                    Title = "XDG-HOB",
                    Text = "铁拳脚本已加载",
                    Duration = 3,
                    Icon = "rbxassetid://4483345998"
                })
                print("铁拳脚本加载成功")
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "错误",
                    Text = "加载铁拳脚本失败",
                    Duration = 5,
                    Icon = "rbxassetid://4483345998"
                })
                warn("加载铁拳脚本失败:", result)
                
                isHighlighted7 = false
                ironFistBtn.BackgroundColor3 = originalColor7
                btnStroke7.Color = Color3.fromRGB(80, 80, 90)
                ironFistBtn.Text = "铁拳"
            end
        else
            ironFistBtn.BackgroundColor3 = originalColor7
            btnStroke7.Color = Color3.fromRGB(80, 80, 90)
            ironFistBtn.Text = "铁拳"
            
            StarterGui:SetCore("SendNotification", {
                Title = "XDG-HOB",
                Text = "铁拳脚本已卸载",
                Duration = 3,
                Icon = "rbxassetid://4483345998"
            })
        end
    end)
    
    ironFistBtn.Parent = scrollContainer
    
    return utilityContainer
end

local function createFunctionContainer()
    local container = Instance.new("Frame")
    container.Name = "FunctionContainer"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Visible = false
    container.Parent = contentFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "功能区内容"
    label.TextColor3 = Color3.fromRGB(200, 200, 210)
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.Parent = container
    
    return container
end

local function createInfoContainer()
    local container = Instance.new("Frame")
    container.Name = "InfoContainer"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Visible = false
    container.Parent = contentFrame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "InfoScroll"
    scrollFrame.Size = UDim2.new(1, -20, 1, -20)
    scrollFrame.Position = UDim2.new(0, 10, 0, 10)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 350)
    scrollFrame.Parent = container
    
    local infoLayout = Instance.new("UIListLayout")
    infoLayout.Parent = scrollFrame
    infoLayout.Padding = UDim.new(0, 15)
    infoLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local timeFrame = Instance.new("Frame")
    timeFrame.Name = "TimeFrame"
    timeFrame.Size = UDim2.new(0.9, 0, 0, 50)
    timeFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    timeFrame.BackgroundTransparency = 0.1
    
    local timeCorner = Instance.new("UICorner")
    timeCorner.CornerRadius = UDim.new(0, 8)
    timeCorner.Parent = timeFrame
    
    local timeStroke = Instance.new("UIStroke")
    timeStroke.Thickness = 2
    timeStroke.Color = Color3.fromRGB(80, 160, 255)
    timeStroke.Transparency = 0.2
    timeStroke.Parent = timeFrame
    
    local timeIcon = Instance.new("ImageLabel")
    timeIcon.Name = "TimeIcon"
    timeIcon.Size = UDim2.new(0, 32, 0, 32)
    timeIcon.Position = UDim2.new(0, 10, 0.5, -16)
    timeIcon.BackgroundTransparency = 1
    timeIcon.Image = "rbxassetid://3926305904"
    timeIcon.ImageRectSize = Vector2.new(64, 64)
    timeIcon.ImageRectOffset = Vector2.new(0, 576)
    timeIcon.Parent = timeFrame
    
    local timeLabel = Instance.new("TextLabel")
    timeLabel.Name = "BeijingTime"
    timeLabel.Size = UDim2.new(1, -50, 1, 0)
    timeLabel.Position = UDim2.new(0, 50, 0, 0)
    timeLabel.BackgroundTransparency = 1
    timeLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
    timeLabel.Font = Enum.Font.GothamSemibold
    timeLabel.TextSize = 14
    timeLabel.TextStrokeTransparency = 0.7
    timeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    timeLabel.Parent = timeFrame
    
    local titleLabel1 = Instance.new("TextLabel")
    titleLabel1.Name = "TimeTitle"
    titleLabel1.Size = UDim2.new(1, -50, 0, 20)
    titleLabel1.Position = UDim2.new(0, 50, 0, 2)
    titleLabel1.BackgroundTransparency = 1
    titleLabel1.Text = "北京时间"
    titleLabel1.TextColor3 = Color3.fromRGB(180, 200, 255)
    titleLabel1.Font = Enum.Font.GothamBold
    titleLabel1.TextSize = 12
    titleLabel1.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel1.Parent = timeFrame
    
    timeFrame.Parent = scrollFrame
    
    local playerFrame = Instance.new("Frame")
    playerFrame.Name = "PlayerFrame"
    playerFrame.Size = UDim2.new(0.9, 0, 0, 50)
    playerFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    playerFrame.BackgroundTransparency = 0.1
    
    local playerCorner = Instance.new("UICorner")
    playerCorner.CornerRadius = UDim.new(0, 8)
    playerCorner.Parent = playerFrame
    
    local playerStroke = Instance.new("UIStroke")
    playerStroke.Thickness = 2
    playerStroke.Color = Color3.fromRGB(80, 160, 255)
    playerStroke.Transparency = 0.2
    playerStroke.Parent = playerFrame
    
    local playerIcon = Instance.new("ImageLabel")
    playerIcon.Name = "PlayerIcon"
    playerIcon.Size = UDim2.new(0, 32, 0, 32)
    playerIcon.Position = UDim2.new(0, 10, 0.5, -16)
    playerIcon.BackgroundTransparency = 1
    playerIcon.Image = "rbxassetid://3926305904"
    playerIcon.ImageRectSize = Vector2.new(64, 64)
    playerIcon.ImageRectOffset = Vector2.new(128, 256)
    playerIcon.Parent = playerFrame
    
    local playerLabel = Instance.new("TextLabel")
    playerLabel.Name = "PlayerName"
    playerLabel.Size = UDim2.new(1, -50, 1, 0)
    playerLabel.Position = UDim2.new(0, 50, 0, 0)
    playerLabel.BackgroundTransparency = 1
    playerLabel.Text = player.Name
    playerLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
    playerLabel.Font = Enum.Font.GothamSemibold
    playerLabel.TextSize = 14
    playerLabel.TextStrokeTransparency = 0.7
    playerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    playerLabel.Parent = playerFrame
    
    local titleLabel2 = Instance.new("TextLabel")
    titleLabel2.Name = "PlayerTitle"
    titleLabel2.Size = UDim2.new(1, -50, 0, 20)
    titleLabel2.Position = UDim2.new(0, 50, 0, 2)
    titleLabel2.BackgroundTransparency = 1
    titleLabel2.Text = "角色名称"
    titleLabel2.TextColor3 = Color3.fromRGB(180, 200, 255)
    titleLabel2.Font = Enum.Font.GothamBold
    titleLabel2.TextSize = 12
    titleLabel2.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel2.Parent = playerFrame
    
    playerFrame.Parent = scrollFrame
    
    local executorFrame = Instance.new("Frame")
    executorFrame.Name = "ExecutorFrame"
    executorFrame.Size = UDim2.new(0.9, 0, 0, 50)
    executorFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    executorFrame.BackgroundTransparency = 0.1
    
    local executorCorner = Instance.new("UICorner")
    executorCorner.CornerRadius = UDim.new(0, 8)
    executorCorner.Parent = executorFrame
    
    local executorStroke = Instance.new("UIStroke")
    executorStroke.Thickness = 2
    executorStroke.Color = Color3.fromRGB(80, 160, 255)
    executorStroke.Transparency = 0.2
    executorStroke.Parent = executorFrame
    
    local executorIcon = Instance.new("ImageLabel")
    executorIcon.Name = "ExecutorIcon"
    executorIcon.Size = UDim2.new(0, 32, 0, 32)
    executorIcon.Position = UDim2.new(0, 10, 0.5, -16)
    executorIcon.BackgroundTransparency = 1
    executorIcon.Image = "rbxassetid://3926305904"
    executorIcon.ImageRectSize = Vector2.new(64, 64)
    executorIcon.ImageRectOffset = Vector2.new(192, 128)
    executorIcon.Parent = executorFrame
    
    local executorLabel = Instance.new("TextLabel")
    executorLabel.Name = "ExecutorName"
    executorLabel.Size = UDim2.new(1, -50, 1, 0)
    executorLabel.Position = UDim2.new(0, 50, 0, 0)
    executorLabel.BackgroundTransparency = 1
    executorLabel.Text = executorName
    executorLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
    executorLabel.Font = Enum.Font.GothamSemibold
    executorLabel.TextSize = 14
    executorLabel.TextStrokeTransparency = 0.7
    executorLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    executorLabel.Parent = executorFrame
    
    local titleLabel3 = Instance.new("TextLabel")
    titleLabel3.Name = "ExecutorTitle"
    titleLabel3.Size = UDim2.new(1, -50, 0, 20)
    titleLabel3.Position = UDim2.new(0, 50, 0, 2)
    titleLabel3.BackgroundTransparency = 1
    titleLabel3.Text = "注入器"
    titleLabel3.TextColor3 = Color3.fromRGB(180, 200, 255)
    titleLabel3.Font = Enum.Font.GothamBold
    titleLabel3.TextSize = 12
    titleLabel3.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel3.Parent = executorFrame
    
    executorFrame.Parent = scrollFrame
    
    local statusFrame = Instance.new("Frame")
    statusFrame.Name = "StatusFrame"
    statusFrame.Size = UDim2.new(0.9, 0, 0, 80)
    statusFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    statusFrame.BackgroundTransparency = 0.1
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 8)
    statusCorner.Parent = statusFrame
    
    local statusStroke = Instance.new("UIStroke")
    statusStroke.Thickness = 2
    statusStroke.Color = Color3.fromRGB(80, 160, 255)
    statusStroke.Transparency = 0.2
    statusStroke.Parent = statusFrame
    
    local statusIcon = Instance.new("ImageLabel")
    statusIcon.Name = "StatusIcon"
    statusIcon.Size = UDim2.new(0, 32, 0, 32)
    statusIcon.Position = UDim2.new(0, 10, 0, 10)
    statusIcon.BackgroundTransparency = 1
    statusIcon.Image = "rbxassetid://3926305904"
    statusIcon.ImageRectSize = Vector2.new(64, 64)
    statusIcon.ImageRectOffset = Vector2.new(0, 64)
    statusIcon.Parent = statusFrame
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, -50, 0, 60)
    statusLabel.Position = UDim2.new(0, 50, 0, 10)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "脚本状态：正常运行\n游戏ID：" .. game.PlaceId .. "\n玩家数量：" .. #Players:GetPlayers()
    statusLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
    statusLabel.Font = Enum.Font.GothamSemibold
    statusLabel.TextSize = 12
    statusLabel.TextStrokeTransparency = 0.7
    statusLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.TextYAlignment = Enum.TextYAlignment.Top
    statusLabel.Parent = statusFrame
    
    local titleLabel4 = Instance.new("TextLabel")
    titleLabel4.Name = "StatusTitle"
    titleLabel4.Size = UDim2.new(1, -50, 0, 20)
    titleLabel4.Position = UDim2.new(0, 50, 0, 2)
    titleLabel4.BackgroundTransparency = 1
    titleLabel4.Text = "系统状态"
    titleLabel4.TextColor3 = Color3.fromRGB(180, 200, 255)
    titleLabel4.Font = Enum.Font.GothamBold
    titleLabel4.TextSize = 12
    titleLabel4.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel4.Parent = statusFrame
    
    statusFrame.Parent = scrollFrame
    
    local function updateInfo()
        timeLabel.Text = getBeijingTime()
        playerLabel.Text = player.Name
        executorLabel.Text = executorName
        statusLabel.Text = string.format("脚本状态：正常运行\n游戏ID：%d\n玩家数量：%d", 
            game.PlaceId, #Players:GetPlayers())
    end
    
    RunService.RenderStepped:Connect(function()
        updateInfo()
    end)
    
    return container
end

local function createOtherScriptsContainer()
    local container = Instance.new("Frame")
    container.Name = "OtherScriptsContainer"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Visible = false
    container.Parent = contentFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "其他脚本区内容"
    label.TextColor3 = Color3.fromRGB(200, 200, 210)
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.Parent = container
    
    return container
end

local function createCategoryBtn(name, index)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 100, 0, 34)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    btn.TextStrokeTransparency = 0.5
    btn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    btn.MouseButton1Click:Connect(function()
        selectedCategory = index
        for _, child in pairs(scrollFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
                child.BorderSizePixel = 0
            end
        end
        btn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
        btn.BorderSizePixel = 2
        btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
        
        for i, container in ipairs(contentContainers) do
            container.Visible = (i == index)
        end
    end)
    if index == selectedCategory then
        btn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
        btn.BorderSizePixel = 2
        btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    end
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1
    btnStroke.Color = Color3.fromRGB(70, 70, 80)
    btnStroke.Transparency = 0.3
    btnStroke.Parent = btn
    btn.MouseEnter:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(80, 160, 255) then
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(80, 160, 255) then
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        end
    end)
    btn.Parent = scrollFrame
end

for i, name in ipairs(categories) do
    createCategoryBtn(name, i)
end

table.insert(contentContainers, createUtilityContainer())
table.insert(contentContainers, createFunctionContainer())
table.insert(contentContainers, createInfoContainer())
table.insert(contentContainers, createOtherScriptsContainer())

uiFrame.Visible = true
controlBtn.Visible = true

local uiVisible = true

local frameDragging = false
local frameStartPos
local frameStartOffset

local btnDragging = false
local btnStartPos
local btnStartOffset

local function updateFrameDrag(input)
    if frameDragging then
        local delta = input.Position - frameStartPos
        local viewportSize = workspace.CurrentCamera.ViewportSize
        local frameSize = uiFrame.AbsoluteSize
        
        local newX = math.clamp(frameStartOffset.X + delta.X, 0, viewportSize.X - frameSize.X)
        local newY = math.clamp(frameStartOffset.Y + delta.Y, 0, viewportSize.Y - frameSize.Y)
        
        uiFrame.Position = UDim2.new(0, newX, 0, newY)
    end
end

local function updateBtnDrag(input)
    if btnDragging then
        local delta = input.Position - btnStartPos
        local viewportSize = workspace.CurrentCamera.ViewportSize
        local btnSize = controlBtn.AbsoluteSize
        
        local newX = math.clamp(btnStartOffset.X + delta.X, 0, viewportSize.X - btnSize.X)
        local newY = math.clamp(btnStartOffset.Y + delta.Y, 0, viewportSize.Y - btnSize.Y)
        
        controlBtn.Position = UDim2.new(0, newX, 0, newY)
    end
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        frameDragging = true
        frameStartPos = input.Position
        frameStartOffset = Vector2.new(uiFrame.Position.X.Offset, uiFrame.Position.Y.Offset)
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        frameDragging = false
    end
end)

controlBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        btnDragging = true
        btnStartPos = input.Position
        btnStartOffset = Vector2.new(controlBtn.Position.X.Offset, controlBtn.Position.Y.Offset)
    end
end)

controlBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if btnDragging then
            local moved = (input.Position - btnStartPos).Magnitude
            if moved < 5 then
                uiVisible = not uiVisible
                uiFrame.Visible = uiVisible
            end
        end
        btnDragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if frameDragging then
            updateFrameDrag(input)
        elseif btnDragging then
            updateBtnDrag(input)
        end
    end
end)

controlBtn.MouseEnter:Connect(function()
    controlBtn.BackgroundColor3 = Color3.fromRGB(90, 170, 255)
end)

controlBtn.MouseLeave:Connect(function()
    controlBtn.BackgroundColor3 = Color3.fromRGB(70, 145, 255)
end)

local rainbowColors = {
    Color3.fromRGB(255, 100, 100),
    Color3.fromRGB(255, 180, 100),
    Color3.fromRGB(255, 255, 100),
    Color3.fromRGB(180, 255, 100),
    Color3.fromRGB(100, 220, 255),
    Color3.fromRGB(180, 100, 255),
    Color3.fromRGB(255, 100, 220)
}
local colorIndex = 1

RunService.RenderStepped:Connect(function(delta)
    colorIndex = (colorIndex + delta * 2) % #rainbowColors
    local color1 = rainbowColors[math.floor(colorIndex) + 1]
    local color2 = rainbowColors[(math.floor(colorIndex) + 1) % #rainbowColors + 1]
    local t = (colorIndex % 1)
    rainbowText.TextColor3 = color1:Lerp(color2, t)
end)

print("XDG-HOB UI 创建完成")