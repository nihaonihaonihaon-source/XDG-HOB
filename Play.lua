local response = syn.request({
    Url = "https://luraph.com/api/v1/obfuscate",
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = game:GetService("HttpService"):JSONEncode({
        script = "local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XDGHOBGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(60, 60, 65)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "XDG HOB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 24
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

CloseButton.MouseEnter:Connect(function()
    CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local ScriptButton = Instance.new("TextButton")
ScriptButton.Name = "ScriptButton"
ScriptButton.Size = UDim2.new(0, 300, 0, 60)
ScriptButton.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptButton.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptButton.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
ScriptButton.Text = "点击后加载脚本"
ScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptButton.TextSize = 20
ScriptButton.Font = Enum.Font.GothamBold
ScriptButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = ScriptButton

local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(40, 140, 70)
ButtonStroke.Thickness = 2
ButtonStroke.Parent = ScriptButton

ScriptButton.MouseEnter:Connect(function()
    ScriptButton.BackgroundColor3 = Color3.fromRGB(70, 200, 100)
end)

ScriptButton.MouseLeave:Connect(function()
    ScriptButton.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
end)

ScriptButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/key.lua"))()
end)",
        options = {
            ["MutateStrings"] = true,
            ["Virtualization"] = true
        }
    })
})