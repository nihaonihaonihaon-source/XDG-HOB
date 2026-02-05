local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CardKeyVerificationSystem"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local correctKeys = {
    "HOBJKssdxfgddgfyd",
    "HOBq1472580369",
    "HOBjiahao947"
}

local attempts = 0
local maxAttempts = 3

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeButton

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "XDG-HOB卡密验证系统"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = titleBar

local function rainbowText()
    local colors = {
        Color3.fromRGB(255, 0, 0),
        Color3.fromRGB(255, 127, 0),
        Color3.fromRGB(255, 255, 0),
        Color3.fromRGB(0, 255, 0),
        Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(75, 0, 130),
        Color3.fromRGB(143, 0, 255)
    }
    local i = 1
    spawn(function()
        while titleLabel and titleLabel.Parent do
            titleLabel.TextColor3 = colors[i]
            i = i + 1
            if i > #colors then i = 1 end
            wait(0.5)
        end
    end)
end

rainbowText()

local inputFrame = Instance.new("Frame")
inputFrame.Name = "InputFrame"
inputFrame.Size = UDim2.new(0.8, 0, 0, 40)
inputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
inputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
inputFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputFrame.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 4)
inputCorner.Parent = inputFrame

local textBox = Instance.new("TextBox")
textBox.Name = "KeyInput"
textBox.Size = UDim2.new(1, -20, 1, 0)
textBox.Position = UDim2.new(0, 10, 0, 0)
textBox.BackgroundTransparency = 1
textBox.Text = ""
textBox.PlaceholderText = "请输入卡密"
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 16
textBox.ClearTextOnFocus = false
textBox.Parent = inputFrame

local verifyButton = Instance.new("TextButton")
verifyButton.Name = "VerifyButton"
verifyButton.Size = UDim2.new(0.6, 0, 0, 40)
verifyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
verifyButton.AnchorPoint = Vector2.new(0.5, 0.5)
verifyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyButton.Text = "核对卡密"
verifyButton.Font = Enum.Font.GothamBold
verifyButton.TextSize = 18
verifyButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 4)
buttonCorner.Parent = verifyButton

local messageLabel = Instance.new("TextLabel")
messageLabel.Name = "MessageLabel"
messageLabel.Size = UDim2.new(0.8, 0, 0, 30)
messageLabel.Position = UDim2.new(0.5, 0, 0.85, 0)
messageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
messageLabel.BackgroundTransparency = 1
messageLabel.Text = ""
messageLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
messageLabel.Font = Enum.Font.Gotham
messageLabel.TextSize = 14
messageLabel.Visible = false
messageLabel.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local function showMessage(msg, color)
    messageLabel.Text = msg
    messageLabel.TextColor3 = color
    messageLabel.Visible = true
end

local function hideMessage()
    messageLabel.Visible = false
end

verifyButton.MouseButton1Click:Connect(function()
    local inputKey = textBox.Text
    
    local isValid = false
    for _, key in ipairs(correctKeys) do
        if inputKey == key then
            isValid = true
            break
        end
    end
    
    if isValid then
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/XDGHOB.lua"))()
    else
        attempts = attempts + 1
        
        showMessage("卡密不正确", Color3.fromRGB(255, 50, 50))
        
        if attempts >= maxAttempts then
            wait(0.5)
            screenGui:Destroy()
        else
            wait(3)
            hideMessage()
        end
    end
end)

verifyButton.MouseEnter:Connect(function()
    verifyButton.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
end)

verifyButton.MouseLeave:Connect(function()
    verifyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
end)

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
end)