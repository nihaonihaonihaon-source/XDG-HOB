local Library = {}
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local MinBtn = Instance.new("TextButton")
local SearchBox = Instance.new("TextBox")
local SearchBtn = Instance.new("TextButton")
local ClearBtn = Instance.new("TextButton")
local ListContainer = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local MiniButton = Instance.new("TextButton")
local Items = {}
local Dragging = false
local DragStart = Vector2.new()
local StartPos = Vector2.new()
local Minimized = false

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ResetOnSpawn = false

MainFrame.Size = UDim2.new(0, 250, 0, 280)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BackgroundTransparency = 0.95
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local function applyCorner(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = frame
end
applyCorner(MainFrame, 10)

local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 16, 1, 16)
shadow.Position = UDim2.new(0, -8, 0, -8)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://13160448180"
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 10, 10)
shadow.Parent = MainFrame

TitleBar.Size = UDim2.new(1, 0, 0, 26)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
TitleBar.BackgroundTransparency = 0.3
TitleBar.Parent = MainFrame
applyCorner(TitleBar, 10)

Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 8, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "📚 脚本库"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.Parent = TitleBar

CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -24, 0, 3)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.BackgroundTransparency = 0.3
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleBar
applyCorner(CloseBtn, 5)

MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.Position = UDim2.new(1, -48, 0, 3)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
MinBtn.BackgroundTransparency = 0.3
MinBtn.Text = "─"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 12
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Parent = TitleBar
applyCorner(MinBtn, 5)

SearchBox.Size = UDim2.new(1, -70, 0, 24)
SearchBox.Position = UDim2.new(0, 6, 0, 32)
SearchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SearchBox.BackgroundTransparency = 0.5
SearchBox.Text = ""
SearchBox.PlaceholderText = "🔍 搜索..."
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 11
SearchBox.Font = Enum.Font.Gotham
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = MainFrame
applyCorner(SearchBox, 5)

SearchBtn.Size = UDim2.new(0, 28, 0, 24)
SearchBtn.Position = UDim2.new(1, -36, 0, 32)
SearchBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
SearchBtn.BackgroundTransparency = 0.2
SearchBtn.Text = "GO"
SearchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBtn.TextSize = 10
SearchBtn.Font = Enum.Font.GothamBold
SearchBtn.Parent = MainFrame
applyCorner(SearchBtn, 5)

ClearBtn.Size = UDim2.new(0, 18, 0, 18)
ClearBtn.Position = UDim2.new(1, -58, 0, 35)
ClearBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ClearBtn.BackgroundTransparency = 0.3
ClearBtn.Text = "✕"
ClearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearBtn.TextSize = 10
ClearBtn.Font = Enum.Font.GothamBold
ClearBtn.Parent = MainFrame
applyCorner(ClearBtn, 5)
ClearBtn.Visible = false

ListContainer.Size = UDim2.new(1, -8, 1, -62)
ListContainer.Position = UDim2.new(0, 4, 0, 60)
ListContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ListContainer.BackgroundTransparency = 0.5
ListContainer.BorderSizePixel = 0
ListContainer.ScrollBarThickness = 2
ListContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
ListContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
ListContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
ListContainer.Parent = MainFrame
applyCorner(ListContainer, 6)

UIListLayout.Padding = UDim.new(0, 2)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = ListContainer

MiniButton.Size = UDim2.new(0, 36, 0, 36)
MiniButton.Position = UDim2.new(0, 10, 0, 10)
MiniButton.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
MiniButton.BackgroundTransparency = 0.3
MiniButton.Text = "📚"
MiniButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniButton.TextSize = 18
MiniButton.Font = Enum.Font.GothamBold
MiniButton.Visible = false
MiniButton.Parent = ScreenGui
applyCorner(MiniButton, 8)
MiniButton.Draggable = true
MiniButton.Active = true

function Library:AddItem(itemName, callback)
    local item = {}
    item.Name = itemName
    item.Callback = callback
    item.Frame = Instance.new("Frame")
    item.Frame.Size = UDim2.new(1, -4, 0, 24)
    item.Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    item.Frame.BackgroundTransparency = 0.3
    item.Frame.Parent = ListContainer
    applyCorner(item.Frame, 3)
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = "  " .. itemName
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.Gotham
    btn.Parent = item.Frame
    
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    Items[itemName] = item
    return item
end

function Library:Search(query)
    query = query:lower()
    for _, item in pairs(Items) do
        local match = false
        if query == "" then
            match = true
        elseif item.Name:lower():find(query) then
            match = true
        end
        item.Frame.Visible = match
    end
    ClearBtn.Visible = query ~= ""
end

SearchBtn.MouseButton1Click:Connect(function()
    Library:Search(SearchBox.Text)
end)

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    if SearchBox.Text == "" then
        Library:Search("")
        ClearBtn.Visible = false
    else
        Library:Search(SearchBox.Text)
    end
end)

ClearBtn.MouseButton1Click:Connect(function()
    SearchBox.Text = ""
    Library:Search("")
    ClearBtn.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniButton.Visible = true
end)

MiniButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniButton.Visible = false
end)

MinBtn.MouseButton1Click:Connect(function()
    Minimized = not Minimized
    if Minimized then
        MainFrame.Size = UDim2.new(0, 250, 0, 28)
        ListContainer.Visible = false
        SearchBox.Visible = false
        SearchBtn.Visible = false
        ClearBtn.Visible = false
        MinBtn.Text = "□"
        Title.Text = "📚 脚本库"
    else
        MainFrame.Size = UDim2.new(0, 250, 0, 280)
        ListContainer.Visible = true
        SearchBox.Visible = true
        SearchBtn.Visible = true
        MinBtn.Text = "─"
        Title.Text = "📚 脚本库"
    end
end)

Library:AddItem("杀死NPC", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GUI-Offical/FileTest/refs/heads/main/Grab%20R6.txt", true))()
end)

Library:AddItem("偷一个蛋脚本", function()
    loadstring(game:HttpGet("https://zeroinhub.com/api/script"))()
end)

Library:AddItem("BF自动农场", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/q8ta0e/source/main/HNTL_Hub_BF.lua"))()
end)

return Library