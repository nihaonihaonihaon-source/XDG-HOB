local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

StarterGui:SetCore("SendNotification", {Title = "XDG-HOB", Text = "欢迎使用XDG-HOB", Duration = 5})
print("欢迎使用XDG-HOB")
task.wait(0.5)

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
        createSampleText()
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

local function createSampleText()
    contentFrame:ClearAllChildren()
    
    if selectedCategory == 1 then
        local scrollContainer = Instance.new("ScrollingFrame")
        scrollContainer.Name = "UtilityScroll"
        scrollContainer.Size = UDim2.new(1, -20, 1, -20)
        scrollContainer.Position = UDim2.new(0, 10, 0, 10)
        scrollContainer.BackgroundTransparency = 1
        scrollContainer.ScrollBarThickness = 6
        scrollContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110)
        scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 250)
        scrollContainer.Parent = contentFrame
        
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
                
                local success, result = pcall(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/穿墙.lua"))()
                end)
                
                if success then
                    StarterGui:SetCore("SendNotification", {
                        Title = "XDG-HOB",
                        Text = "防检测穿墙已启用",
                        Duration = 3,
                        Icon = "rbxassetid://4483345998"
                    })
                    print("防检测穿墙脚本加载成功")
                else
                    StarterGui:SetCore("SendNotification", {
                        Title = "错误",
                        Text = "加载穿墙脚本失败",
                        Duration = 5,
                        Icon = "rbxassetid://4483345998"
                    })
                    warn("加载穿墙脚本失败:", result)
                    
                    isHighlighted2 = false
                    antiDetectWallBtn.BackgroundColor3 = originalColor2
                    btnStroke2.Color = Color3.fromRGB(80, 80, 90)
                    antiDetectWallBtn.Text = "防检测穿墙"
                end
            else
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
        
    elseif selectedCategory == 2 then
        local sample = Instance.new("TextLabel")
        sample.Size = UDim2.new(1, 0, 1, 0)
        sample.Position = UDim2.new(0, 0, 0, 0)
        sample.BackgroundTransparency = 1
        sample.Text = "功能区内容"
        sample.TextColor3 = Color3.fromRGB(200, 200, 210)
        sample.Font = Enum.Font.Gotham
        sample.TextSize = 16
        sample.Parent = contentFrame
    elseif selectedCategory == 3 then
        local sample = Instance.new("TextLabel")
        sample.Size = UDim2.new(1, 0, 1, 0)
        sample.Position = UDim2.new(0, 0, 0, 0)
        sample.BackgroundTransparency = 1
        sample.Text = "信息区内容"
        sample.TextColor3 = Color3.fromRGB(200, 200, 210)
        sample.Font = Enum.Font.Gotham
        sample.TextSize = 16
        sample.Parent = contentFrame
    elseif selectedCategory == 4 then
        local sample = Instance.new("TextLabel")
        sample.Size = UDim2.new(1, 0, 1, 0)
        sample.Position = UDim2.new(0, 0, 0, 0)
        sample.BackgroundTransparency = 1
        sample.Text = "其他脚本区内容"
        sample.TextColor3 = Color3.fromRGB(200, 200, 210)
        sample.Font = Enum.Font.Gotham
        sample.TextSize = 16
        sample.Parent = contentFrame
    end
end

createSampleText()

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