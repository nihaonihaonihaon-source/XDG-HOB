if game.GameId == 7709344486 then  --- Doors Lobby
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", -- Required
	Text = "正在加载...偷走脑红...", -- Required
	Icon = "rbxassetid://119970903874014" -- Optional
})

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
  fireproximityprompt(prompt)
end)
local Doors
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MovementControlGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "Background"
backgroundFrame.Size = UDim2.new(0, 220, 0, 60)
backgroundFrame.Position = UDim2.new(1, -230, 0, 10)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Active = true
backgroundFrame.Parent = screenGui

local uiCornerBg = Instance.new("UICorner")
uiCornerBg.CornerRadius = UDim.new(0, 10)
uiCornerBg.Parent = backgroundFrame

local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.Size = UDim2.new(0, 200, 0, 30)
buttonFrame.Position = UDim2.new(0, 10, 0, 5)
buttonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonFrame.BorderSizePixel = 0
buttonFrame.Parent = backgroundFrame

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = buttonFrame

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 50, 230))
})
uiGradient.Rotation = 45
uiGradient.Parent = buttonFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(50, 50, 50)
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = buttonFrame

local textButton = Instance.new("TextButton")
textButton.Name = "MainButton"
textButton.Size = UDim2.new(1, -10, 1, -10)
textButton.Position = UDim2.new(0, 5, 0, 5)
textButton.BackgroundTransparency = 1
textButton.Text = "开始"
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.TextSize = 18
textButton.Font = Enum.Font.GothamBold
textButton.Parent = buttonFrame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Name = "Subtitle"
subtitleLabel.Size = UDim2.new(1, -20, 0, 15)
subtitleLabel.Position = UDim2.new(0, 10, 0, 40)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Rb脚本中心付费版"
subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitleLabel.TextSize = 12
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
subtitleLabel.Parent = backgroundFrame

do
    local dragging, dragStart, startPos
    backgroundFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = backgroundFrame.Position
        end
    end)
    backgroundFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            backgroundFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local itemName = "Laser Cape"
local normalSpeed = 20
local speed = 650
local speedConnection = nil
local isSpeedActive = false
local isActive = false

local customPart, followConn, slowConn

local function FindDelivery()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil,nil end
    for _, plot in pairs(plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            local yourBase = sign:FindFirstChild("YourBase")
            if yourBase and yourBase.Enabled then
                local hitbox = plot:FindFirstChild("DeliveryHitbox")
                if hitbox and hitbox:IsA("BasePart") then
                    local cf = hitbox.CFrame
                    local size = hitbox.Size / 2
                    local offset = -cf.LookVector * (size.Z + 10)
                    return hitbox, cf.Position + offset, cf.LookVector
                end
            end
        end
    end
    return nil,nil,nil
end

function addpart()
    if customPart then return end
    local hitbox,pos = FindDelivery()
    if not hitbox then return end
    local part = Instance.new("Part")
    part.Size = Vector3.new(10,5,10)
    part.Anchored = true
    part.Position = pos
    part.Color = Color3.fromRGB(255,0,0)
    part.Material = Enum.Material.Neon
    part.Parent = workspace
    customPart = part
    followConn = RunService.Heartbeat:Connect(function()
        if customPart and hitbox and hitbox.Parent then
            local cf = hitbox.CFrame
            local size = hitbox.Size/4
            local offset = -cf.LookVector * (size.Z+15)
            customPart.CFrame = CFrame.new(cf.Position+offset)
        end
    end)
    slowConn = RunService.Heartbeat:Connect(function()
        if customPart then
            for _,plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp2 = plr.Character.HumanoidRootPart
                    local hum = plr.Character:FindFirstChild("Humanoid")
                    if hum and (hrp2.Position - customPart.Position).Magnitude <= 20 then
                        hum.WalkSpeed = 0.1
                        hum.JumpPower = 0.1
                    end
                end
            end
        end
    end)
end

function removepart()
    if customPart then customPart:Destroy() customPart = nil end
    if followConn then followConn:Disconnect() end
    if slowConn then slowConn:Disconnect() end
end

local floor1 = {
    Vector3.new(-457, -8, -100), Vector3.new(-457, -8, 7), Vector3.new(-456, -8, 114), Vector3.new(-456, -8, 221),
    Vector3.new(-363, -8, 221), Vector3.new(-364, -8, 112), Vector3.new(-365, -8, 4), Vector3.new(-364, -8, -103)
}
local floor2 = {
    Vector3.new(-522, 12, -132), Vector3.new(-521, 12, -25), Vector3.new(-523, 12, 83), Vector3.new(-521, 12, 190),
    Vector3.new(-300, 12, -70), Vector3.new(-298, 12, 36), Vector3.new(-299, 12, 143), Vector3.new(-299, 12, 250)
}
local floor2Secondary = {
    [Vector3.new(-522, 12, -132)] = Vector3.new(-463, -8, -129),
    [Vector3.new(-521, 12, -25)] = Vector3.new(-471, -8, -32),
    [Vector3.new(-523, 12, 83)] = Vector3.new(-469, -8, 81),
    [Vector3.new(-521, 12, 190)] = Vector3.new(-468, -8, 188),
    [Vector3.new(-300, 12, -70)] = Vector3.new(-351, -8, -68),
    [Vector3.new(-298, 12, 36)] = Vector3.new(-351, -8, 39),
    [Vector3.new(-299, 12, 143)] = Vector3.new(-350, -8, 146),
    [Vector3.new(-299, 12, 250)] = Vector3.new(-353, -8, 251)
}

local function getCurrentFloor()
    local yPos = hrp.Position.Y
    if yPos >= -8 and yPos <= -1 then
        return floor1, "floor1"
    elseif yPos >= 8 and yPos <= 15 then
        return floor2, "floor2"
    elseif yPos >= 16 then
        return nil, "floor3"
    else
        return floor1, "floor1"
    end
end

local function checkFloor3()
    local _, floorName = getCurrentFloor()
    if floorName == "floor3" then
        StarterGui:SetCore("SendNotification", {
            Title = "Jack 827",
            Text = "不支持三楼",
            Duration = 10
        })
        return true
    end
    return false
end

local function enableSpeedBoost()
    if speedConnection then
        speedConnection:Disconnect()
    end
    isSpeedActive = true
    speedConnection = RunService.Heartbeat:Connect(function()
        if humanoid and hrp and humanoid.MoveDirection.Magnitude > 0 then
            local moveDir = humanoid.MoveDirection
            hrp.Velocity = Vector3.new(moveDir.X * speed, hrp.Velocity.Y, moveDir.Z * speed)
        end
    end)
end
local function disableSpeedBoost()
    if speedConnection then
        speedConnection:Disconnect()
        speedConnection = nil
    end
    isSpeedActive = false
    humanoid.WalkSpeed = normalSpeed
    hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
end

function stopAll()
    isActive = false
    disableSpeedBoost()
    if humanoid then
        humanoid.PlatformStand = false
    end
    if hrp then
        hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
    end
end

local function findClosestLocation(floor)
    local closestLocation = nil
    local shortestDistance = math.huge
    for _, location in ipairs(floor) do
        local distance = (hrp.Position - location).Magnitude
        if distance < shortestDistance then
            shortestDistance = distance
            closestLocation = location
        end
    end
    return closestLocation
end

local function useRemoteOnce()
    local remote = ReplicatedStorage:FindFirstChild("Packages")
    if remote then
        remote = remote:FindFirstChild("Net")
        if remote then
            remote = remote:FindFirstChild("RE/UseItem")
            if remote and game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperArm") then
                local args = {
                    Vector3.new(-309.9, -4.71, 221.58),
                    game.Players.LocalPlayer.Character:WaitForChild("LeftUpperArm")
                }
                remote:FireServer(unpack(args))
            end
        end
    end
end

local function autoWalkTo(targetPosition, walkSpeed)
    walkSpeed = walkSpeed or 50
    local reached = false
    spawn(function()
        while not reached and character and hrp and isActive do
            local direction = (targetPosition - hrp.Position)
            local distance = direction.Magnitude
            if distance < 1.4 then
                reached = true
                break
            end
            direction = direction.Unit
            hrp.Velocity = Vector3.new(direction.X * walkSpeed, hrp.Velocity.Y, direction.Z * walkSpeed)
            task.wait()
        end
        if hrp then
            hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
        end
    end)
    repeat task.wait() until reached or not isActive
    return reached
end

local function FindDeliveryPos()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil,nil end
    for _, plot in pairs(plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            local yourBase = sign:FindFirstChild("YourBase")
            if yourBase and yourBase.Enabled then
                local hitbox = plot:FindFirstChild("DeliveryHitbox")
                if hitbox and hitbox:IsA("BasePart") then
                    local cf = hitbox.CFrame
                    local size = hitbox.Size / 2
                    local offset = -cf.LookVector * (size.Z + 10)
                    return cf.Position + offset, cf.LookVector
                end
            end
        end
    end
    return nil,nil
end

function activate()
    if checkFloor3() then return end
    isActive = true
    local currentFloor, currentFloorName = getCurrentFloor()
    local item = character:FindFirstChild(itemName) or player.Backpack:FindFirstChild(itemName)
    if not item then isActive = false return end
    humanoid:EquipTool(item)
    useRemoteOnce()
    enableSpeedBoost()
    local closestLocation = findClosestLocation(currentFloor)
    if closestLocation then
        local success = autoWalkTo(closestLocation, 700)
        if not success or not isActive then disableSpeedBoost() isActive = false return end
        if currentFloorName == "floor2" and floor2Secondary[closestLocation] then
            local secondarySuccess = autoWalkTo(floor2Secondary[closestLocation], 600)
            if not secondarySuccess or not isActive then disableSpeedBoost() isActive = false return end
        end
    else
        disableSpeedBoost()
        isActive = false
        return
    end
    local plotPos, lookVector = FindDeliveryPos()
    if plotPos and lookVector then
        autoWalkTo(plotPos, 900)
        disableSpeedBoost()
    else
        disableSpeedBoost()
    end
    isActive = false
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    hrp = character:WaitForChild("HumanoidRootPart")
    if isSpeedActive then
        enableSpeedBoost()
    end
end)

local running = false
local waitingForInteraction = false

local function StopAllModes()
    stopAll()
    running = false
    waitingForInteraction = false
    textButton.Text = "开始"
    subtitleLabel.Text = "已停止"
end

local function StartRoutine()
    if running then return end
    running = true
    subtitleLabel.Text = "执行中..."
    activate()
    running = false
    StopAllModes()
end

local function StartWaiting()
    if running or waitingForInteraction then return end
    waitingForInteraction = true
    textButton.Text = "停止"
    subtitleLabel.Text = "等待..."
end

textButton.MouseButton1Click:Connect(function()
    if not waitingForInteraction and not running then
        StartWaiting()
    else
        StopAllModes()
    end
end)

ProximityPromptService.PromptTriggered:Connect(function(prompt, plr)
    if plr ~= player then return end
    if not waitingForInteraction then return end
    waitingForInteraction = false
    subtitleLabel.Text = "等待1.4秒..."
    task.delay(1.4, function()
        if not running and not waitingForInteraction then
            StartRoutine()
        end
    end)
end)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "成功", 
	Icon = "rbxassetid://119970903874014" 
})()
elseif game.GameId == 2440500124 then  --- Doors Lobby
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", -- Required
	Text = "正在加载...Doors...", -- Required
	Icon = "rbxassetid://119970903874014" -- Optional
})
local WindUI = loadstring(game:HttpGet("https://pastebin.com/raw/qYYUTE4g"))()

local EntityModules = game:GetService("ReplicatedStorage").ModulesClient.EntityModules
local gameData = game.ReplicatedStorage:WaitForChild("GameData")
local floor = gameData:WaitForChild("Floor")
local isMines = floor.Value == "Mines"
local isHotel = floor.Value == "Hotel"
local isBackdoor = floor.Value == "Backdoor"
local isGarden = floor.Value == "Garden"

function Distance(pos)
	if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude
	end
end

_G.GetOldBright = {
	Brightness = game.Lighting.Brightness,
	ClockTime = game.Lighting.ClockTime,
	FogEnd = game.Lighting.FogEnd,
	GlobalShadows = game.Lighting.GlobalShadows,
	OutdoorAmbient = game.Lighting.OutdoorAmbient
}

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "ru",
    Translations = {
        ["ru"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Пример",
            ["WELCOME"] = "Добро пожаловать в WindUI!",
            ["LIB_DESC"] = "Библиотека для создания красивых интерфейсов",
            ["SETTINGS"] = "Настройки",
            ["APPEARANCE"] = "Внешний вид",
            ["FEATURES"] = "Функционал",
            ["UTILITIES"] = "Инструменты",
            ["UI_ELEMENTS"] = "UI Элементы",
            ["CONFIGURATION"] = "Конфигурация",
            ["SAVE_CONFIG"] = "Сохранить конфигурацию",
            ["LOAD_CONFIG"] = "Загрузить конфигурацию",
            ["THEME_SELECT"] = "Выберите тему",
            ["TRANSPARENCY"] = "Прозрачность окна"
        },
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Example",
            ["WELCOME"] = "Welcome to WindUI!",
            ["LIB_DESC"] = "Beautiful UI library for Roblox",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency"
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local Confirmed = false

WindUI:Popup({
    Title = gradient("RbScript Hub", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
    Icon = "sparkles",
    IconThemed = true,
    Content = "欢迎使用付费版！",
    Buttons = {
        {
            Title = "取消",
            --Icon = "",
            Callback = function() end,
            Variant = "Secondary", -- Primary, Secondary, Tertiary
        },
        {
            Title = "确认",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary", -- Primary, Secondary, Tertiary
        }
    }
})

repeat wait() until Confirmed

local UserGui = Instance.new("ScreenGui", game.CoreGui)
local UserLabel = Instance.new("TextLabel", UserGui)
local UIGradient = Instance.new("UIGradient")

UserGui.Name = "UserGui"
UserGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UserGui.Enabled = true
UserLabel.Name = "UserLabel"
UserLabel.BackgroundColor3 = Color3.new(1, 1, 1)
UserLabel.BackgroundTransparency = 1
UserLabel.BorderColor3 = Color3.new(0, 0, 0)
UserLabel.Position = UDim2.new(0.80, 0.80, 0.00090, 0)
UserLabel.Size = UDim2.new(0, 135, 0, 50)
UserLabel.Font = Enum.Font.GothamSemibold
UserLabel.Text = "尊敬的："..game.Players.LocalPlayer.Character.Name.."付费版用户，欢迎使用Rb脚本中心！"
UserLabel.TextColor3 = Color3.new(1, 1, 1)
UserLabel.TextScaled = true
UserLabel.TextSize = 14
UserLabel.TextWrapped = true
UserLabel.Visible = true

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
}
UIGradient.Rotation = 10
UIGradient.Parent = UserLabel

local TweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
tween:Play()

local Window = WindUI:CreateWindow({
    Title = ((isHotel and "Rb脚本中心 | 酒店") or (isMines and "Rb脚本中心 | 矿井") or (isBackdoor and "Rb脚本中心 | 后门")),
    Icon = "rbxassetid://105933835532108",
    Author = "付费版 Yungengxin",
    Folder = "脚本中心",
    Size = UDim2.fromOffset(480, 360),
    Theme = "Dark",
    Background = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#0f0c29"), Transparency = 1 },
        ["100"] = { Color = Color3.fromHex("#302b63"), Transparency = 0.9 },
    }, {
        Rotation = 45,
    }),
    Background = "rbxassetid://133155269071576",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
        
            WindUI:Notify({
                Title = "您的用户ID：",
                Content = (game:GetService("Players").LocalPlayer.UserId),
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
    HideSearchBar = false,
    ScrollBarEnabled = true
})

Window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromHex("#30ff6a")
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "Theme Changed",
        Content = "Current theme: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

local Tabs = {
    Main = Window:Section({ Title = "通用", Opened = true }),
    gn = Window:Section({ Title = "功能", Opened = true }),
    Settings = Window:Section({ Title = "UI设置", Opened = true }),
    Utilities = Window:Section({ Title = "保存配置", Opened = true })
}

local TabHandles = {
    xx = Tabs.Main:Tab({ Title = "游戏信息", Icon = "layout-grid" }),
    Elements = Tabs.Main:Tab({ Title = "玩家功能", Icon = "layout-grid" }),
    gn = Tabs.gn:Tab({ Title = "互动功能", Icon = "layout-grid" }),
    ESPgn = Tabs.gn:Tab({ Title = "视觉功能", Icon = "layout-grid" }),
    pbgn = Tabs.gn:Tab({ Title = "屏蔽实体", Icon = "layout-grid" }),
    tzgn = Tabs.gn:Tab({ Title = "通知功能", Icon = "layout-grid" }),
    fzgn = Tabs.gn:Tab({ Title = "辅助功能", Icon = "layout-grid" }),
    Appearance = Tabs.Settings:Tab({ Title = "UI外观", Icon = "brush" }),
    Config = Tabs.Utilities:Tab({ Title = "调整配置", Icon = "settings" })
}

TabHandles.xx:Paragraph({
    Title = "您的游戏名称：",
    Desc = ""..game:GetService("Players").LocalPlayer.DisplayName.."",
    Buttons = {
        {
            Title = "复制您的名称",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.DisplayName)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Icon = "copy",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您的游戏用户名：",
    Desc = ""..game:GetService("Players").LocalPlayer.Name.."",
    Buttons = {
        {
            Title = "复制您的用户名",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.Name)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您的用户名ID：",
    Desc = ""..game:GetService("Players").LocalPlayer.UserId.."",
    Buttons = {
        {
            Title = "复制您的用户名ID",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.UserId)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您的账号注册时间（天）：",
    Desc = ""..game:GetService("Players").LocalPlayer.AccountAge.."",
    Buttons = {
        {
            Title = "复制您的注册时间",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.AccountAge)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您所在的服务器名称：",
    Desc = ""..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."",
    Buttons = {
        {
            Title = "复制您所在的服务器名称",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您所在的服务器ID：",
    Desc = ""..game.PlaceId.."",
    Buttons = {
        {
            Title = "复制您所在的服务器ID",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard("无法复制")

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})



TabHandles.xx:Paragraph({
    Title = "您的注入器：",
    Desc = ""..identifyexecutor().."",
    Image = "rbxassetid://129287693322764",
    ImageSize = 42, -- default 30
    Thumbnail = "rbxassetid://94512740386917",
    ThumbnailSize = 120, -- Thumbnail height
    Buttons = {
        {
            Title = "测试您注入器的UNC",
            Variant = "Primary",
            Callback = function() 
            Window:Dialog({
            Title = "Rb脚本中心",
            Content = "温馨提示：请勿点击多次，\n否则会造成游戏卡顿!",
            Icon = "bell",
            Buttons = {
                {
                    Title = "确定",
                    Variant = "Primary",
                    Callback = function() 
                        print("ok")
                    end,
                }
            }
        })
            loadstring(game:HttpGet"https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/unc")()

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功执行，请在控制台查看UNC！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Code({
    Title = "Rb脚本中心交流群（主群）",
    Code = [[https://qm.qq.com/q/csDfI4BZNm]],
})

TabHandles.xx:Code({
    Title = "Rb脚本中心交流群（Discord群）",
    Code = [[https://discord.gg/qZmW3PYd9T]],
})



local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家速度",
    Desc = "speedwalk",
    Value = { Min = 0, Max = 1000, Default = 16 },
    Callback = function(Value)
        _G.WalkSpeedTp = Value
    end
})

local featureToggle = TabHandles.Elements:Toggle({
    Title = "开启速度",
    Value = false,
    Callback = function(Value) 
        _G.SpeedWalk = Value
while _G.SpeedWalk do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeedTp
end
task.wait()
end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "已开启速度" or "已关闭速度",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家速度V2",
    Desc = "tpwalk",
    Value = { Min = 0, Max = 10, Default = 0 },
    Callback = function(value)
        local tpWalk = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local teleportDistance = value -- 每次传送的距离
local isTeleporting = true -- 是否正在传送

-- 禁用所有与移动相关的状态
local function DisableDefaultMovement()
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
end

-- 启用所有与移动相关的状态
local function EnableDefaultMovement()
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
end

-- 自定义传送函数
local function Teleport()
    if not isTeleporting or not rootPart or not humanoid then
        return
    end

    -- 获取移动方向
    local moveDirection = humanoid.MoveDirection
    if moveDirection.Magnitude == 0 then
        return -- 如果没有移动方向，则停止传送
    end

    -- 计算传送向量
    local teleportVector = moveDirection * teleportDistance

    -- 检测前方是否有障碍物
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = workspace:Raycast(rootPart.Position, teleportVector, raycastParams)

    if raycastResult then
        -- 如果有障碍物，调整传送向量
        teleportVector = (raycastResult.Position - rootPart.Position).Unit * teleportDistance
    end

    -- 更新位置
    rootPart.CFrame = rootPart.CFrame + teleportVector
end

-- 控制开关函数
function tpWalk:Enabled(enabled)
    isTeleporting = enabled
    if enabled then DisableDefaultMovement() else EnableDefaultMovement() end
end

function tpWalk:GetEnabled()
    return isTeleporting
end

function tpWalk:SetSpeed(speed)
    teleportDistance = speed or 0.1
end

function tpWalk:GetSpeed()
    return teleportDistance
end

-- 每帧更新传送
RunService.Heartbeat:Connect(function()
    if isTeleporting then
        Teleport()
    end
end)

return tpWalk
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家跳跃",
    Desc = "JumpPower",
    Value = { Min = 0, Max = 1000, Default = 50 },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家重力",
    Desc = "gravity",
    Value = { Min = 0, Max = 1000, Default = 309 },
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})



TabHandles.Elements:Divider()

local featureToggle = TabHandles.Elements:Toggle({
    Title = "夜视",
    Desc = "使你的游戏亮度提高",
    Value = false,
    Callback = function(state) 
        if state then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
            else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
            end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "夜视已开启，若仍不清楚可开启去雾功能" or "夜视已关闭",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

xrayEnabled = false
function xray()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChildWhichIsA("Humanoid") and not v.Parent.Parent:FindFirstChildWhichIsA("Humanoid") then
            v.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
        end
    end
end

local featureToggle = TabHandles.Elements:Toggle({
    Title = "地图透视",
    Desc = "Xray",
    Value = false,
    Callback = function(state) 
        if state then
		    xrayEnabled = true
    xray()
            else
		    xrayEnabled = false
    xray()
            end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "地图透视已开启，若仍不清楚可开启其他视觉功能" or "地图透视已关闭",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local toggleState = false

game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
function NoFog()
    local c = game.Lighting
    c.FogEnd = 100000
    for r, v in pairs(c:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end
TabHandles.Elements:Button({
    Title = "去雾",
    Desc = "一键去除游戏中的雾",
    Icon = "bell",
    Callback = function()
NoFog()
local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已去雾",
            Icon = "bell",
            Duration = 3
        })
    end
})
TabHandles.Elements:Divider()

TabHandles.Elements:Button({
    Title = "飞行",
    Desc = "传统的飞行",
    Icon = "bell",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/CPSm1udG"))()
local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "成功加载飞行",
            Icon = "bell",
            Duration = 3
        })
    end
})

local gnSlider = TabHandles.gn:Slider({
    Title = "自动捡钥匙距离",
    Value = { Min = 0, Max = 15, Default = 15 },
    Callback = function(val)
        val = keyrange
    end
})

local gnSlider = TabHandles.gn:Slider({
    Title = "自动拉拉杆距离",
    Value = { Min = 0, Max = 15, Default = 15 },
    Callback = function(val)
        val = leverrange
    end
})

local gnSlider = TabHandles.gn:Slider({
    Title = "自动拾起书距离",
    Value = { Min = 0, Max = 15, Default = 15 },
    Callback = function(val)
        val = bookrange
    end
})

local pickupaura

TabHandles.gn:Toggle({
    Title = "自动捡钥匙",
    Icon = "check",
    Value = false,
    Callback = function(val) 

pickupaura = val

        repeat task.wait(.5)

            for _,v in pairs(bullshittable.KeyObtain) do

                pcall(function()

                    local mag = (lplr.Character.HumanoidRootPart.Position - v.Parent.Hitbox.Position).magnitude

                    if mag < keyrange then 

                        fireproximityprompt(v)

                    end

                end)

             end

        until not pickupaura 

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启自动捡钥匙" or "已关闭自动捡钥匙",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

local leveraura

TabHandles.gn:Toggle({
    Title = "自动拉拉杆",
    Icon = "check",
    Value = false,
    Callback = function(val) 

leveraura = val

        repeat task.wait(.5)

            for _,v in pairs(bullshittable.LeverForGate) do

                pcall(function()

                    local mag = (lplr.Character.HumanoidRootPart.Position - v.Parent.Main.Position).magnitude

                    if mag < leverrange then 

                        fireproximityprompt(v)

                    end

                end)

             end

        until not leveraura

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启自动拉拉杆" or "已关闭自动拉拉杆",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

local bookaura

TabHandles.gn:Toggle({
    Title = "自动拾起书",
    Icon = "check",
    Value = false,
    Callback = function(val) 

bookaura = val

        repeat task.wait(.5)

            for _,v in pairs(bullshittable.LiveHintBook) do

                pcall(function()

                    local mag = (lplr.HumanoidRootPart.Position - v.Parent.Cover2.Position).magnitude

                    if mag < bookrange then 

                        fireproximityprompt(v)

                    end

                end)

             end

        until not bookaura

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启自动拾起书" or "已关闭自动拾起书",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.gn:Toggle({
    Title = "即时互动",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.NoCooldownProximity = Value
if _G.NoCooldownProximity == true then
for i, v in pairs(workspace:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
v.HoldDuration = 0
end
end
CooldownProximity = workspace.DescendantAdded:Connect(function(Cooldown)
if _G.NoCooldownProximity == true then
if Cooldown:IsA("ProximityPrompt") then
Cooldown.HoldDuration = 0
end
end
end)
else
if CooldownProximity then
CooldownProximity:Disconnect()
CooldownProximity = nil
end
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启即时互动" or "已关闭即时互动",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

_G.Aura = {
    "ActivateEventPrompt",
    "AwesomePrompt",
    "FusesPrompt",
    "HerbPrompt",
    "LeverPrompt",
    "LootPrompt",
    "ModulePrompt",
    "SkullPrompt",
    "UnlockPrompt",
    "ValvePrompt",
}

TabHandles.gn:Toggle({
    Title = "自动互动",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.AutoLoot = Value
if _G.AutoLoot then
lootables = {}
local function LootCheck(v)
    if not table.find(lootables, v) and v.Name ~= "Groundskeeper" and v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) then
        table.insert(lootables, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
	LootCheck(v)
end
end
ChildAllNext = workspace.DescendantAdded:Connect(function(v)
if v:IsA("ProximityPrompt") then
	LootCheck(v)
end
end)
RemoveChild = workspace.DescendantRemoving:Connect(function(v)
    for i = #lootables, 1, -1 do
        if lootables[i] == v then
            table.remove(lootables, i)
            break
        end
    end
end)
else
if ChildAllNext then
ChildAllNext:Disconnect()
ChildAllNext = nil
end
if RemoveChild then
RemoveChild:Disconnect()
RemoveChild = nil
end
end
while _G.AutoLoot do
for i, v in pairs(lootables) do
	if v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) and (v:GetAttribute("Interactions") == nil or v:GetAttribute("Interactions") <= 2) then
		if Distance(v.Parent:GetPivot().Position) <= 12 then
			fireproximityprompt(v)
		end
	end
end
task.wait(0.1)
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启自动互动" or "已关闭自动互动",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "全图高亮",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.FullBright = Value
while _G.FullBright do
game.Lighting.Brightness = 2
game.Lighting.ClockTime = 14
game.Lighting.FogEnd = 100000
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
task.wait()
end
for i, v in pairs(_G.GetOldBright) do
game.Lighting[i] = v
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已开启全图高亮",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "去雾",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.Nofog = Value
while _G.Nofog do
game:GetService("Lighting").FogStart = 100000
game:GetService("Lighting").FogEnd = 200000
for i, v in pairs(game:GetService("Lighting"):GetChildren()) do
if v.ClassName == "Atmosphere" then
v.Density = 0
v.Haze = 0
end
end
task.wait()
end
game:GetService("Lighting").FogStart = 0
game:GetService("Lighting").FogEnd = 1000
for i, v in pairs(game:GetService("Lighting"):GetChildren()) do
if v.ClassName == "Atmosphere" then
v.Density = 0.3
v.Haze = 1
end
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已开启全图高亮",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})


if not isGarden then
TabHandles.ESPgn:Toggle({
    Title = (((isHotel or isBackdoor) and "钥匙/拉杆透视") or (isMines and "保险丝透视")),
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspKey = Value
if _G.EspKey == false then
_G.KeyAdd = {}
if KeySpawn then
KeySpawn:Disconnect()
KeySpawn = nil
end
if KeyRemove then
KeyRemove:Disconnect()
KeyRemove = nil
end
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Keys(v)
if ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 0, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 0, 255)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(0, 0, 255) 
	Highlight.OutlineColor = Color3.fromRGB(0, 0, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and ((v.Name == "LeverForGate" and "拉杆") or (v.Name:find("Key") and "钥匙") or (v.Name:find("FuseObtain") and "保险丝")) or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance((v.Name == "LeverForGate" and v.PrimaryPart.Position) or ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v.Hitbox.Position))).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
local function CheckKey(v)
    if not table.find(_G.KeyAdd, v) and ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
        table.insert(_G.KeyAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckKey(v)
end
KeySpawn = workspace.DescendantAdded:Connect(function(v)
    CheckKey(v)
end)
KeyRemove = workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.KeyAdd, 1, -1 do
        if _G.KeyAdd[i] == v then
            table.remove(_G.KeyAdd, i)
            break
        end
    end
end)
end
while _G.EspKey do
for i, v in pairs(_G.KeyAdd) do
if v:IsA("Model") then
Keys(v)
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})
end

TabHandles.ESPgn:Toggle({
    Title = "门透视",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspDoor = Value
if _G.EspDoor == false then
for _, v in pairs(game.Workspace:FindFirstChild("CurrentRooms"):GetChildren()) do 
if v:isA("Model") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
end
while _G.EspDoor do
for i, v in pairs(game.Workspace:FindFirstChild("CurrentRooms"):GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Door") and v.Door:FindFirstChild("Door") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 255, 0)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(0, 255, 0) 
	Highlight.OutlineColor = Color3.fromRGB(0, 255, 0) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v.Door
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and "门 "..((v.Door:FindFirstChild("Sign") and v.Door.Sign:FindFirstChild("Stinker") and v.Door.Sign.Stinker.Text) or (v.Door.Sign:FindFirstChild("SignText") and v.Door.Sign.SignText.Text)):gsub("^0+", "")..(v.Door:FindFirstChild("Lock") and " (锁住)" or "") or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.Door.Door.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v.Door
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

if isBackdoor then
TabHandles.ESPgn:Toggle({
    Title = "透视时间拉杆",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspLeverTime = Value
if _G.EspLeverTime == false then
_G.TimeLeverAdd = {}
if TimeLeverSpawn then
TimeLeverSpawn:Disconnect()
TimeLeverSpawn = nil
end
if TimeLeverRemove then
TimeLeverRemove:Disconnect()
TimeLeverRemove = nil
end
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("TimerLever") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function LeverTimes(v)
if v.Name:find("TimerLever") and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 0, 255)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 0, 255)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(0, 0, 255) 
	Highlight.OutlineColor = Color3.fromRGB(0, 0, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and "时间拉杆" or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
local function CheckTimeLever(v)
    if not table.find(_G.TimeLeverAdd, v) and v.Name == "TimerLever" then
        table.insert(_G.TimeLeverAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckTimeLever(v)
end
TimeLeverSpawn = workspace.DescendantAdded:Connect(function(v)
    CheckTimeLever(v)
end)
TimeLeverRemove = workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.TimeLeverAdd, 1, -1 do
        if _G.TimeLeverAdd[i] == v then
            table.remove(_G.TimeLeverAdd, i)
            break
        end
    end
end)
end
while _G.EspLeverTime do
for i, v in pairs(_G.TimeLeverAdd) do
if v:IsA("Model") then
LeverTimes(v)
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})
end

if isHotel then
TabHandles.ESPgn:Toggle({
    Title = "透视书",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspBook = Value
if _G.EspBook == false then
_G.BookAdd = {}
if BookSpawn then
BookSpawn:Disconnect()
BookSpawn = nil
end
if BookRemove then
BookRemove:Disconnect()
BookRemove = nil
end
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("LiveHintBook") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Books(v)
if v.Name:find("LiveHintBook") and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(160, 32, 240)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(160, 32, 240)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(160, 32, 240) 
	Highlight.OutlineColor = Color3.fromRGB(160, 32, 240) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and "书" or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 10
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
local function CheckBook(v)
    if not table.find(_G.BookAdd, v) and v.Name == "LiveHintBook" then
        table.insert(_G.BookAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckBook(v)
end
BookSpawn = workspace.DescendantAdded:Connect(function(v)
    CheckBook(v)
end)
BookRemove = workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.BookAdd, 1, -1 do
        if _G.BookAdd[i] == v then
            table.remove(_G.BookAdd, i)
            break
        end
    end
end)
end
while _G.EspBook do
for i, v in pairs(_G.BookAdd) do
if v:IsA("Model") then
Books(v)
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "透视电箱",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspBreaker = Value
if _G.EspBreaker == false then
_G.BreakerAdd = {}
if BreakerSpawn then
BreakerSpawn:Disconnect()
BreakerSpawn = nil
end
if BreakerRemove then
BreakerRemove:Disconnect()
BreakerRemove = nil
end
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("LiveBreakerPolePickup") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Breakers(v)
if v.Name == "LiveBreakerPolePickup" and v:FindFirstChildOfClass("ProximityPrompt") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(25, 25, 112)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(25, 25, 112)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(25, 25, 112) 
	Highlight.OutlineColor = Color3.fromRGB(25, 25, 112) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and "电箱" or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 10
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
local function CheckBreaker(v)
    if not table.find(_G.BreakerAdd, v) and v.Name == "LiveBreakerPolePickup" then
        table.insert(_G.BreakerAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckBreaker(v)
end
BreakerSpawn = workspace.DescendantAdded:Connect(function(v)
    CheckBreaker(v)
end)
BreakerRemove = workspace.DescendantRemoving:Connect(function(v)
for i = #_G.BreakerAdd, 1, -1 do
    if _G.BreakerAdd[i] == v then
        table.remove(_G.BreakerAdd, i)
        break
    end
end
end)
end
while _G.EspBreaker do
for i, v in pairs(_G.BreakerAdd) do
if v.Name == "LiveBreakerPolePickup" then
Breakers(v)
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})
end

TabHandles.ESPgn:Toggle({
    Title = "透视物品",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspItem = Value
if _G.EspItem == false then
_G.ItemAdd = {}
if ItemSpawn then
ItemSpawn:Disconnect()
ItemSpawn = nil
end
if ItemRemove then
ItemRemove:Disconnect()
ItemRemove = nil
end
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name:find("Handle") then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Items(v)
if v.Name == "Handle" and v.Parent:FindFirstChildOfClass("ProximityPrompt") then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(255, 215, 0)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(255, 215, 0)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 215, 0) 
	Highlight.OutlineColor = Color3.fromRGB(255, 215, 0) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v.Parent
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Parent.Name or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 10
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v.Parent
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
local function CheckItem(v)
    if not table.find(_G.ItemAdd, v) and v.Name == "Handle" then
        table.insert(_G.ItemAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckItem(v)
end
ItemSpawn = workspace.DescendantAdded:Connect(function(v)
    CheckItem(v)
end)
ItemRemove = workspace.DescendantRemoving:Connect(function(v)
for i = #_G.ItemAdd, 1, -1 do
    if _G.ItemAdd[i] == v then
        table.remove(_G.ItemAdd, i)
        break
    end
end
end)
end
while _G.EspItem do
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Tool") then
		for i, z in pairs(v:GetChildren()) do
			if z.Name:find("Esp_") then
				z:Destroy()
			end
		end
	end
end
for i, v in pairs(_G.ItemAdd) do
if v.Name == "Handle" then
Items(v)
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

_G.EspEntityNameDis = {
	["FigureRig"] = "Figure",
	["SallyMoving"] = "Sally Window",
	["RushMoving"] = "Rush",
	["Eyes"] = "Eyes",
	["Groundskeeper"] = "Skeeper",
	["BackdoorLookman"] = "Lookman",
	["BackdoorRush"] = "Blitz",
	["MandrakeLive"] = "Mandrake",
	["GloombatSwarm"] = "Gloombat",
	["GiggleCeiling"] = "Giggle",
	["AmbushMoving"] = "Ambush"
}

TabHandles.ESPgn:Toggle({
    Title = ((isHotel and "透视柜子/床") or (isMines and "透视柜子/垃圾桶/管道") or (isBackdoor and "透视柜子")),
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspHiding = Value
if _G.EspHiding == false then
_G.HidingAdd = {}
if HidingSpawn then
HidingSpawn:Disconnect()
HidingSpawn = nil
end
if HidingRemove then
HidingRemove:Disconnect()
HidingRemove = nil
end
for _, v in pairs(workspace:GetDescendants()) do 
if v.Name == "Bed" or v.Name == "Wardrobe" or v.Name == "Backdoor_Wardrobe" or v.Name == "Locker_Large" or v.Name == "Rooms_Locker" then
for i, z in pairs(v:GetChildren()) do
if z.Name:find("Esp_") then
z:Destroy()
end
end
end
end
else
function Hidings(v)
if (v.Name == "Bed" or v.Name == "Wardrobe" or v.Name == "Backdoor_Wardrobe" or v.Name == "Locker_Large" or v.Name == "Rooms_Locker") and v.PrimaryPart then
if v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(50, 205, 50)
	v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(50, 205, 50)
end
if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(50, 205, 50) 
	Highlight.OutlineColor = Color3.fromRGB(50, 205, 50) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v
	Highlight.Parent = v
	elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
	v:FindFirstChild("Esp_Highlight"):Destroy()
end
if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
	v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Name or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.PrimaryPart.Position)).."m)" or "")
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 10
    v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
	GuiEsp = Instance.new("BillboardGui", v)
	GuiEsp.Adornee = v
	GuiEsp.Name = "Esp_Gui"
	GuiEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiEsp.AlwaysOnTop = true
	GuiEspText = Instance.new("TextLabel", GuiEsp)
	GuiEspText.BackgroundTransparency = 1
	GuiEspText.Font = Enum.Font.Code
	GuiEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiEspText.TextSize = 15
	GuiEspText.TextColor3 = Color3.new(0,0,0) 
	GuiEspText.TextStrokeTransparency = 0.5
	GuiEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiEspText
	elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
	v:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
local function CheckHiding(v)
    if not table.find(_G.HidingAdd, v) and v.Name == "Bed" or v.Name == "Wardrobe" or v.Name == "Backdoor_Wardrobe" or v.Name == "Locker_Large" or v.Name == "Rooms_Locker" then
        table.insert(_G.HidingAdd, v)
    end
end
for _, v in ipairs(workspace:GetDescendants()) do
	CheckHiding(v)
end
BookSpawn = workspace.DescendantAdded:Connect(function(v)
    CheckHiding(v)
end)
BookRemove = workspace.DescendantRemoving:Connect(function(v)
    for i = #_G.HidingAdd, 1, -1 do
        if _G.HidingAdd[i] == v then
            table.remove(_G.HidingAdd, i)
            break
        end
    end
end)
end
while _G.EspHiding do
for i, v in pairs(_G.HidingAdd) do
if v:IsA("Model") then
Hidings(v)
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "透视玩家",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspPlayer = Value
if _G.EspPlayer == false then
for i, v in pairs(game.Players:GetChildren()) do
	if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
		for x, b in pairs(v.Character:GetChildren()) do
			if b.Name:find("Esp_") then
				b:Destroy()
			end
		end
	end
end
end
while _G.EspPlayer do
for i, v in pairs(game.Players:GetChildren()) do
if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
if v.Character:FindFirstChild("Esp_Highlight") then
	v.Character:FindFirstChild("Esp_Highlight").FillColor = Color3.new(255, 255, 255)
	v.Character:FindFirstChild("Esp_Highlight").OutlineColor = Color3.new(255, 255, 255)
end
if _G.EspHighlight == true and v.Character:FindFirstChild("Esp_Highlight") == nil then
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "Esp_Highlight"
	Highlight.FillColor = Color3.fromRGB(255, 255, 255) 
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = v.Character
	Highlight.Parent = v.Character
	elseif _G.EspHighlight == false and v.Character:FindFirstChild("Esp_Highlight") then
	v.Character:FindFirstChild("Esp_Highlight"):Destroy()
end
if v.Character:FindFirstChild("Esp_Gui") and v.Character["Esp_Gui"]:FindFirstChild("TextLabel") then
	v.Character["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
	        (_G.EspName == true and v.Name or "")..
            (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance(v.Character.HumanoidRootPart.Position)).."m)" or "")..
            (_G.EspHealth == true and "\n血量: [ "..(v.Character.Humanoid.Health <= 0 and "Dead" or string.format("%.0f", (v.Character.Humanoid.Health))).." ]" or "")
    v.Character["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 10
    v.Character["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = _G.EspGuiTextColor or Color3.new(255, 255, 255)
end
if _G.EspGui == true and v.Character:FindFirstChild("Esp_Gui") == nil then
	GuiPlayerEsp = Instance.new("BillboardGui", v.Character)
	GuiPlayerEsp.Adornee = v.Character.Head
	GuiPlayerEsp.Name = "Esp_Gui"
	GuiPlayerEsp.Size = UDim2.new(0, 100, 0, 150)
	GuiPlayerEsp.AlwaysOnTop = true
	GuiPlayerEsp.StudsOffset = Vector3.new(0, 3, 0)
	GuiPlayerEspText = Instance.new("TextLabel", GuiPlayerEsp)
	GuiPlayerEspText.BackgroundTransparency = 1
	GuiPlayerEspText.Font = Enum.Font.Code
	GuiPlayerEspText.Size = UDim2.new(0, 100, 0, 100)
	GuiPlayerEspText.TextSize = 15
	GuiPlayerEspText.TextColor3 = Color3.new(0,0,0) 
	GuiPlayerEspText.TextStrokeTransparency = 0.5
	GuiPlayerEspText.Text = ""
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 1.5
	UIStroke.Parent = GuiPlayerEspText
	elseif _G.EspGui == false and v.Character:FindFirstChild("Esp_Gui") then
	v.Character:FindFirstChild("Esp_Gui"):Destroy()
end
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透视" or "已关闭透视",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "文本显示",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspGui = Value

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启文本显示" or "已关闭文本显示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "高亮显示",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspHighlight = Value

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启高亮显示" or "已关闭高亮显示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

local intensitySlider = TabHandles.ESPgn:Slider({
    Title = "文本大小",
    Desc = "speedwalk",
    Value = { Min = 5, Max = 50, Default = 10 },
    Callback = function(Value)
        _G.EspGuiTextSize = Value
    end
})

TabHandles.ESPgn:Toggle({
    Title = "名称显示",
    Desc = "需先开启“文本显示”",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspName = Value

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启名称显示" or "已关闭名称显示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "距离显示",
    Desc = "需先开启“文本显示”",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspDistance = Value

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启距离显示" or "已关闭距离显示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.ESPgn:Toggle({
    Title = "玩家血量显示",
    Desc = "需先开启“文本显示”",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.EspHealth = Value

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启血量显示" or "已关闭血量显示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

Screech = false
ClutchHeart = false
local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if tostring(self) == "Screech" and method == "FireServer" and Screech == true then
        args[1] = true
        return old(self,unpack(args))
    end
    if tostring(self) == "ClutchHeartbeat" and method == "FireServer" and ClutchHeart == true then
        args[2] = true
        return old(self,unpack(args))
    end
    return old(self,...)
end))

workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "Screech" then
v:Destroy()
end
end)

TabHandles.pbgn:Toggle({
    Title = "防Screech",
    Icon = "check",
    Value = false,
    Callback = function(Value) 
_G.AntiScreech = Value
Screech = Value
WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启防Screech" or "已关闭防Screech",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.pbgn:Toggle({
    Title = "防Halt",
    Icon = "check",
    Value = false,
    Callback = function(Value) 
_G.NoHalt = Value
local HaltShade = EntityModules:FindFirstChild("Shade") or EntityModules:FindFirstChild("_Shade")
if HaltShade then
    HaltShade.Name = _G.NoHalt and "_Shade" or "Shade"
end
WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启防Halt" or "已关闭防Halt",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.pbgn:Toggle({
    Title = "防Eyes",
    Icon = "check",
    Value = false,
    Callback = function(Value) 
_G.NoEyes = Value
while _G.NoEyes do
if workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman") then
if game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("MotorReplication"):FireServer(-649)
end
end
task.wait()
end
WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启防Eyes" or "已关闭防Eyes",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.pbgn:Toggle({
    Title = "防Look Man",
    Icon = "check",
    Value = false,
    Callback = function(Value) 
_G.NoEyes = Value
while _G.NoEyes do
if workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman") then
if game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("MotorReplication"):FireServer(-649)
end
end
task.wait()
end
WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启防Look Man" or "已关闭防Look Man",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

_G.EntityChoose = {"Rush", "Seek", "Eyes", "Sally Window", "LookMan", "Giggle", "GloombatSwarm", "Ambush", "A-60", "A-120", "Groundskeeper", "Mandrake", "Surge", "Monument" ,"Eyestalk" ,"Bramble" }

TabHandles.tzgn:Toggle({
    Title = "开启实体生成通知",
    Icon = "check",
    Value = false,
    Callback = function(Value) 
_G.NotifyEntity = Value
if _G.NotifyEntity then
    EntityChild = workspace.ChildAdded:Connect(function(child)
        for _, v in ipairs(_G.EntityChoose) do
            if child:IsA("Model") and child.Name:find(v) then
                repeat task.wait() until not child:IsDescendantOf(workspace) or (game.Players.LocalPlayer:DistanceFromCharacter(child:GetPivot().Position) < 1000)
                if child:IsDescendantOf(workspace) then
                    WindUI:Notify({Title = v.." 已生成!", Duration = 5})
                    if _G.NotifyEntityChat then
                        local text = _G.ChatNotify or ""
                        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(text..v.." 已生成!")
                    end
                end
            end
        end
    end)
else
    if EntityChild then
        EntityChild:Disconnect()
        EntityChild = nil
    end
end
WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启防Eyes" or "已关闭防Eyes",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.tzgn:Toggle({
    Title = "开启聊天栏通知",
    Icon = "check",
    Value = false,
    Callback = function(Value) 
_G.NotifyEntityChat = Value
WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启聊天栏通知" or "已关闭防聊天栏通知",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

local intensitySlider = TabHandles.fzgn:Slider({
    Title = "透明度",
    Desc = "speedwalk",
    Step = 0.1,
    Value = { Min = 0, Max = 1, Default = 0.5 },
    Callback = function(Value)
        _G.TransparencyHide = Value
    end
})

TabHandles.fzgn:Toggle({
    Title = "柜子/床透明",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.HidingTransparency = Value
while _G.HidingTransparency do
if game.Players.LocalPlayer.Character:GetAttribute("Hiding") then
	for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
		if v:IsA("ObjectValue") and v.Name == "HiddenPlayer" then
			if v.Value == game.Players.LocalPlayer.Character then
                local hidePart = {}
                for _, i in pairs(v.Parent:GetChildren()) do
                    if i:IsA("BasePart") then
		                i.Transparency = _G.TransparencyHide or 0.5
		                table.insert(hidePart, i)
		            end
		        end
            repeat task.wait()
                for _, h in pairs(hidePart) do
                    h.Transparency = _G.TransparencyHide or 0.5
                    task.wait()
                end
            until not game.Players.LocalPlayer.Character:GetAttribute("Hiding") or not _G.HidingTransparency
            for _, n in pairs(hidePart) do
                n.Transparency = 0
                task.wait()
            end
            break
		end
	end
end
end
task.wait()
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启透明" or "已关闭透明",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

if isHotel then
TabHandles.fzgn:Toggle({
    Title = "自动提示密码",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.NotifyEntity = Value
if _G.NotifyEntity then
local function Deciphercode(v)
local Hints = game.Players.LocalPlayer.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")

local code = {[1] = " _",[2] = " _", [3] = " _", [4] = " _", [5] = " _"}
    for i, v in pairs(v:WaitForChild("UI"):GetChildren()) do
        if v:IsA("ImageLabel") and v.Name ~= "Image" then
            for b, n in pairs(Hints:GetChildren()) do
                if n:IsA("ImageLabel") and n.Visible and v.ImageRectOffset == n.ImageRectOffset then
                    code[tonumber(v.Name)] = n:FindFirstChild("TextLabel").Text 
                end
            end
        end
    end 
    return code
end
local function CodeAll(v)
	if v:IsA("Tool") and v.Name == "LibraryHintPaper" then
        local code = table.concat(Deciphercode(v))
        if code then
	        ui:Notify({Title = "Code: "..code, Duration = 5})
			if _G.NotifyEntityChat2 then
				if not _G.ChatNotify then
					TextChat = ""
				else
					TextChat = _G.ChatNotify
				end
				if TextChat then
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(TextChat..code)
				end
			end
	        if workspace:FindFirstChild("Padlock") and Distance(workspace.Padlock:GetPivot().Position) <= 30 then
				if game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
					game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("LP"):FireServer(code)
				end
			end
		end
    end
end
Getpaper = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
CodeAll(v)
end)
else
if Getpaper then
Getpaper:Disconnect()
Getpaper = nil
end
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启自动提示" or "已关闭自动提示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})
end

TabHandles.fzgn:Toggle({
    Title = "聊天栏提示密码",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.NotifyEntityChat2 = Value

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启聊天栏提示" or "已关闭聊天栏提示",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.fzgn:Toggle({
    Title = "无限氧气",
    Icon = "check",
    Value = false,
    Callback = function(Value) 

_G.ActiveInfOxygen = Value 
while _G.ActiveInfOxygen do 
if game.Players.LocalPlayer.Character:GetAttribute("Oxygen") then
game.Players.LocalPlayer.Character:SetAttribute("Oxygen",99999)
end
task.wait()
end 
if game.Players.LocalPlayer.Character:GetAttribute("Oxygen") then
game.Players.LocalPlayer.Character:SetAttribute("Oxygen",100)
end

WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = Value and "已开启无限氧气" or "已关闭无限氧气",
            Icon = Value and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
	 end
})

TabHandles.Appearance:Paragraph({
    Title = "自定义界面",
    Desc = "个性化您的体验",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local themeDropdown = TabHandles.Appearance:Dropdown({
    Title = "主题选择",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "主题应用",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
    end
})

local transparencySlider = TabHandles.Appearance:Slider({
    Title = "透明度",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
    end
})

TabHandles.Appearance:Toggle({
    Title = "启用黑色主题",
    Desc = "使用黑色调主题方案",
    Value = true,
    Callback = function(state)
        WindUI:SetTheme(state and "Dark" or "Light")
        themeDropdown:Select(state and "Dark" or "Light")
    end
})

TabHandles.Appearance:Button({
    Title = "创建新主题",
    Icon = "plus",
    Callback = function()
        Window:Dialog({
            Title = "创建主题",
            Content = "此功能很快就会推出",
            Buttons = {
                {
                    Title = "确认",
                    Variant = "Primary"
                }
            }
        })
    end
})

TabHandles.Config:Paragraph({
    Title = "配置管理",
    Desc = "保存你的设置",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "default"
local configFile = nil
local MyPlayerData = {
    name = "Player1",
    level = 1,
    inventory = { "sword", "shield", "potion" }
}

TabHandles.Config:Input({
    Title = "配置名称",
    Value = configName,
    Callback = function(value)
        configName = value
    end
})

local ConfigManager = Window.ConfigManager
if ConfigManager then
    ConfigManager:Init(Window)
    
    TabHandles.Config:Button({
        Title = "保存配置",
        Icon = "save",
        Variant = "Primary",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            
            configFile:Register("featureToggle", featureToggle)
            configFile:Register("intensitySlider", intensitySlider)
            configFile:Register("modeDropdown", modeDropdown)
            configFile:Register("themeDropdown", themeDropdown)
            configFile:Register("transparencySlider", transparencySlider)
            
            configFile:Set("playerData", MyPlayerData)
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            
            if configFile:Save() then
                WindUI:Notify({ 
                    Title = "保存配置", 
                    Content = "保存为："..configName,
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({ 
                    Title = "错误", 
                    Content = "保存失败",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    TabHandles.Config:Button({
        Title = "加载配置",
        Icon = "folder",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            local loadedData = configFile:Load()
            
            if loadedData then
                if loadedData.playerData then
                    MyPlayerData = loadedData.playerData
                end
                
                local lastSave = loadedData.lastSave or "Unknown"
                WindUI:Notify({ 
                    Title = "加载配置", 
                    Content = "正在加载："..configName.."\n上次保存："..lastSave,
                    Icon = "refresh-cw",
                    Duration = 5
                })
                
                TabHandles.Config:Paragraph({
                    Title = "玩家数据",
                    Desc = string.format("名字: %s\n等级: %d\n库存: %s", 
                        MyPlayerData.name, 
                        MyPlayerData.level, 
                        table.concat(MyPlayerData.inventory, ", "))
                })
            else
                WindUI:Notify({ 
                    Title = "错误", 
                    Content = "加载失败",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
else
    TabHandles.Config:Paragraph({
        Title = "配置管理不可用",
        Desc = "此功能需要配置管理",
        Image = "alert-triangle",
        ImageSize = 20,
        Color = "White"
    })
end


local footerSection = Window:Section({ Title = "Rb脚本中心_付费版" })

Window:OnClose(function()
    print("Window closed")
    
    if ConfigManager and configFile then
        configFile:Set("playerData", MyPlayerData)
        configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
        configFile:Save()
        print("Config auto-saved on close")
    end
end)

Window:OnDestroy(function()
    print("Window destroyed")
end)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "成功", 
	Icon = "rbxassetid://119970903874014" 
})()
elseif game.GameId == 2820580801 then  --- Doors Lobby
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", -- Required
	Text = "正在加载...俄亥俄州...", -- Required
	Icon = "rbxassetid://119970903874014" -- Optional
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local library = loadstring(game:HttpGet("https://pastefy.app/lhpGk8o3/raw", true))()
local devv   = require(game:GetService("ReplicatedStorage").devv)
local Signal = devv.load("Signal")
game.TextChatService.ChatWindowConfiguration.Enabled = true
game:GetService("RunService").Heartbeat:Connect(function()
workspace.CurrentCamera.FieldOfView = 120
end)

local function isFriend(targetPlayer)return localPlayer:IsFriendsWith(targetPlayer.UserId)end local function teleportBehindTarget(targetPlayer)local targetCharacter=targetPlayer.Character if not targetCharacter then return end if targetCharacter:FindFirstChild('ForceField')or isFriend(targetPlayer)then return end local targetRoot=targetCharacter:FindFirstChild("HumanoidRootPart")local localCharacter=localPlayer.Character local localRoot=localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")if targetRoot and localRoot then local behindCFrame=targetRoot.CFrame * CFrame.new(0,0,3)localRoot.CFrame=behindCFrame end end local function startTeleportLoop()if teleportLoop then teleportLoop:Disconnect()end teleportLoop=RunService.Heartbeat:Connect(function()for _,player in ipairs(Players:GetPlayers())do if player ~=localPlayer then teleportBehindTarget(player)task.wait(1)end end end)end local function stopTeleportLoop()if teleportLoop then teleportLoop:Disconnect()teleportLoop=nil end end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local devv = require(game:GetService('ReplicatedStorage').devv)
local item = devv.load('v3item')

local speed=1 local tpEnabled=true local heartbeatConnection=nil local character,humanoid local function setupCharacter()character=LocalPlayer.Character if character then humanoid=character:WaitForChild("Humanoid")humanoid.Died:Connect(function()repeat task.wait()until LocalPlayer.Character ~=nil setupCharacter()if tpEnabled then startTPWalk()end end)end end local function startTPWalk()if heartbeatConnection then heartbeatConnection:Disconnect()end heartbeatConnection=RunService.Heartbeat:Connect(function()if not tpEnabled or not character or not humanoid or humanoid.Health <=0 then return end if humanoid.MoveDirection.Magnitude > 0 then local currentCFrame=character.PrimaryPart.CFrame local newPosition=currentCFrame.Position +(humanoid.MoveDirection * speed)character:SetPrimaryPartCFrame(CFrame.new(newPosition)* currentCFrame.Rotation)end end)end local function stopTPWalk()if heartbeatConnection then heartbeatConnection:Disconnect()heartbeatConnection=nil end end LocalPlayer.CharacterAdded:Connect(function(newCharacter)character=newCharacter setupCharacter()end)setupCharacter()

local autoCollectConnections={}local function setupAutoCollect(toggleVar,itemNames,sizeFilter,toggleName)return function(state)toggleVar=state if state then if autoCollectConnections[toggleName]then autoCollectConnections[toggleName]:Disconnect()end autoCollectConnections[toggleName]=RunService.Heartbeat:Connect(function()if character and humanoidRootPart then local collected=false for _,item in pairs(workspace.Game.Entities.ItemPickup:GetChildren())do for _,part in pairs(item:GetDescendants())do if(part:IsA("MeshPart")or part:IsA("Part"))then local prompt=part:FindFirstChildOfClass("ProximityPrompt")if prompt then local matchName=false if type(itemNames)=="table" then for _,name in pairs(itemNames)do if prompt.ObjectText==name then matchName=true break end end else matchName=prompt.ObjectText==itemNames end local matchSize=true if sizeFilter then matchSize=part.Size==sizeFilter end if matchName and matchSize then humanoidRootPart.CFrame=part.CFrame * CFrame.new(0,2,0)task.wait(0.1)for i=1,10 do fireproximityprompt(prompt)task.wait(0.1)end collected=true break end end end end if collected then break end end if collected then humanoidRootPart.CFrame=CFrame.new(1881.17371,-45.2568588,-183.409271)end end end)else if autoCollectConnections[toggleName]then autoCollectConnections[toggleName]:Disconnect()autoCollectConnections[toggleName]=nil end end end end local Players=game:GetService("Players")local player=Players.LocalPlayer if not player then Players:GetPropertyChangedSignal("LocalPlayer"):Wait()player=Players.LocalPlayer end local function onCharacterAdded(character)local humanoid=character:WaitForChild("Humanoid",10)character:WaitForChild("HumanoidRootPart",10)if humanoid then humanoid.UseJumpPower=true end end if player.Character then onCharacterAdded(player.Character)end player.CharacterAdded:Connect(onCharacterAdded)
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local SnowRUN = game:GetService("RunService")
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
local window = library:new("Rb脚本中心_付费版")
local tab = window:Tab("封禁信息")
local section = tab:section("封禁信息", true)
local banReasonLabel = section:Label("封禁原因：无")
local banCountLabel = section:Label("封禁次数：无")
local isBannedLabel = section:Label("是否封禁：否")
local banTimeLabel = section:Label("封禁时间：无")
local unbanTimeLabel = section:Label("解封时间：无")
local function fmt(ts)return os.date("%Y-%m-%d %H:%M:%S",ts)end local function a123()local banReason=nil local banCount=nil local isBanned=false local banAt=nil local unbanAt=nil local remainingTime=nil for _,entry in ipairs(getgc(true))do if type(entry)=="table" then local reason=rawget(entry,"shadowbanned")if reason then banReason=reason isBanned=true end local count=rawget(entry,"numshadowbans")if count then banCount=tostring(count)isBanned=true end local at=rawget(entry,"shadowbannedAt")if at then banAt=fmt(at)end local exes=rawget(entry,"shadowbannedExpires")if exes then unbanAt=fmt(exes)local now=os.time()local rem=exes - now if rem > 0 then local d=math.floor(rem/86400);rem=rem%86400 local h=math.floor(rem/3600);rem=rem%3600 local m=math.floor(rem/60);rem=rem%60 local s=rem remainingTime=string.format("%d天 %d小时 %d分 %d秒",d,h,m,s)else remainingTime="已过期" end end end end banReasonLabel.Text="封禁原因："..(banReason or "无")banCountLabel.Text="封禁次数："..(banCount or "无")isBannedLabel.Text="是否封禁："..(isBanned and "是" or "否")banTimeLabel.Text="封禁时间："..(banAt or "无")unbanTimeLabel.Text="解封时间："..(unbanAt or "无")return isBanned,banReason,banCount,banAt,unbanAt,remainingTime end task.spawn(function()a123()end)
local main = window:Tab("玩家")
local player = main:section("玩家", true)
player:Button("透视ESP",function()  
local Players=game:GetService("Players")local RunService=game:GetService("RunService")local LocalPlayer=Players.LocalPlayer local LocalCharacter=LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()local LocalHead=LocalCharacter:WaitForChild("Head")local playerConnections={}local function updateNametag(player,textLabel,head)local character=player.Character if not character then return end local humanoid=character:FindFirstChildOfClass("Humanoid")local targetHead=character:FindFirstChild("Head")if humanoid and targetHead and humanoid.Health > 0 then local distance=(LocalHead.Position - targetHead.Position).Magnitude textLabel.Text=string.format("%s\n血量: %d/%d\n距离: %.1fm",player.Name,math.floor(humanoid.Health),math.floor(humanoid.MaxHealth),distance)textLabel.Visible=true else textLabel.Visible=false end end local function createNametag(player)if player==LocalPlayer then return end playerConnections[player]={}local function setupCharacter(character)local head=character:WaitForChild("Head")local billboard=Instance.new("BillboardGui")billboard.Name="PlayerNametag" billboard.Adornee=head billboard.Size=UDim2.new(0,200,0,80)billboard.StudsOffset=Vector3.new(0,3,0)billboard.AlwaysOnTop=true billboard.Parent=head local textLabel=Instance.new("TextLabel")textLabel.Size=UDim2.new(1,0,1,0)textLabel.Font=Enum.Font.GothamBold textLabel.TextSize=8 textLabel.TextColor3=Color3.new(1,0,0)textLabel.TextStrokeColor3=Color3.new(0,0,0)textLabel.TextStrokeTransparency=0.3 textLabel.BackgroundTransparency=1 textLabel.TextYAlignment=Enum.TextYAlignment.Top textLabel.Parent=billboard local heartbeatConn=RunService.Heartbeat:Connect(function()if not character or not character.Parent then heartbeatConn:Disconnect()return end updateNametag(player,textLabel,head)end)table.insert(playerConnections[player],heartbeatConn)local characterRemovedConn characterRemovedConn=character.AncestryChanged:Connect(function(_,parent)if parent==nil then billboard:Destroy()heartbeatConn:Disconnect()characterRemovedConn:Disconnect()end end)table.insert(playerConnections[player],characterRemovedConn)end if player.Character then setupCharacter(player.Character)end local charAddedConn=player.CharacterAdded:Connect(setupCharacter)table.insert(playerConnections[player],charAddedConn)end local function removeNametag(player)if playerConnections[player]then for _,conn in ipairs(playerConnections[player])do conn:Disconnect()end playerConnections[player]=nil end if player.Character then local head=player.Character:FindFirstChild("Head")if head then local nametag=head:FindFirstChild("PlayerNametag")if nametag then nametag:Destroy()end end end end Players.PlayerAdded:Connect(function(player)createNametag(player)local leavingConn leavingConn=player.AncestryChanged:Connect(function(_,parent)if parent==nil then removeNametag(player)leavingConn:Disconnect()end end)end)for _,player in ipairs(Players:GetPlayers())do if player ~=LocalPlayer then createNametag(player)local leavingConn leavingConn=player.AncestryChanged:Connect(function(_,parent)if parent==nil then removeNametag(player)leavingConn:Disconnect()end end)end end LocalPlayer.CharacterAdded:Connect(function(character)LocalCharacter=character LocalHead=character:WaitForChild("Head")end)
end)
player:Slider('加速设置', 'SpeedSlider', 1, 1, 15, false, function(value)
speed = value
end)
player:Toggle("速度开关", "speed", false, function(value)
tpEnabled = value
if value then
startTPWalk()
else
stopTPWalk()
end
end)
local jumpConnection
player:Toggle("连跳", "jump", false, function(value)
if value then jumpConnection=game:GetService("UserInputService").JumpRequest:Connect(function()if humanoid and humanoid.Health > 0 then humanoid:ChangeState(Enum.HumanoidStateType.Jumping)end end)else if jumpConnection then jumpConnection:Disconnect()jumpConnection=nil end end
end)

local players = game:GetService("Players"):GetPlayers()
local localPlayer = game:GetService("Players").LocalPlayer
local main = window:Tab("战斗")
local kill = main:section("战斗", true)
kill:Slider("物品栏数量", "taunt_interval", 6, 1, 9, false, function(value)
 local sum = require(game.ReplicatedStorage.devv.client.Objects.v3item.modules.inventory)sum.numSlots = value
end)

kill:Dropdown("攻击方式", "Player", {"超级拳", "普通拳"}, function(value)
    if value == "超级拳" then
        hitMOD = "meleemegapunch"
    elseif value == "普通拳" then
        hitMOD = "meleepunch"
    end
end)
kill:Toggle("杀戮光环", "Hit", false, function(state)
autokill = state
end)
kill:Toggle("踩踏光环", "Kill", false, function(state)
autostomp = state
end)
kill:Toggle("抓取光环", "grab", false, function(state)
grabplay = state
end)

SnowRUN.Heartbeat:Connect(function()
pcall(function()

if tp666 then
 if tp666 and selectedPlayer then spawn(function()local localPlayer=game:GetService("Players").LocalPlayer local character=localPlayer.Character or localPlayer.CharacterAdded:Wait()local humanoid=character:WaitForChild("Humanoid")local radius=5 local heightOffset=0 local angle=0 local rotationSpeed=0.8 while tp666 and selectedPlayer and selectedPlayer.Character do local targetChar=selectedPlayer.Character local targetRoot=targetChar:FindFirstChild("HumanoidRootPart")local localRoot=character:FindFirstChild("HumanoidRootPart")if targetRoot and localRoot and targetChar:FindFirstChild("Humanoid")and targetChar.Humanoid.Health > 0 and humanoid.Health > 0 then angle=angle + rotationSpeed if angle > 2 * math.pi then angle=0 end local x=math.cos(angle)* radius local z=math.sin(angle)* radius local offset=Vector3.new(x,heightOffset,z)localRoot.CFrame=CFrame.new(targetRoot.Position + offset,targetRoot.Position)humanoid.AutoRotate=false else if not(targetChar and targetChar:FindFirstChild("Humanoid")and targetChar.Humanoid.Health > 0)then humanoid.AutoRotate=true break end end wait()end humanoid.AutoRotate=true end)end
 end

if isTeleporting then
 if isTeleporting and selectedPlayer then spawn(function()local localPlayer=game:GetService("Players").LocalPlayer local character=localPlayer.Character or localPlayer.CharacterAdded:Wait()local humanoid=character:WaitForChild("Humanoid")while isTeleporting and selectedPlayer and selectedPlayer.Character do local targetChar=selectedPlayer.Character local targetRoot=targetChar:FindFirstChild("HumanoidRootPart")local targetHumanoid=targetChar:FindFirstChild("Humanoid")local localRoot=character:FindFirstChild("HumanoidRootPart")if targetRoot and localRoot then local targetCFrame=targetRoot.CFrame local offset=targetCFrame.LookVector * -zDistance + Vector3.new(0,yDistance,0)localRoot.CFrame=targetCFrame + offset end wait()end end)end
 end
for i, v in next, b1 do if v.name == 'Fists' then qtid = v.guid break end end

if autokill then
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer and player.Character then
        local targetChar = player.Character
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
            local distance = (rootPart.Position - targetHRP.Position).Magnitude
            if distance <= 40 then
                local uid = player.UserId
                require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("equip", qtid)
                require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("meleeItemHit", "player", { hitPlayerId = uid, meleeType = hitMOD })
                break
            end
        end
    end
end
end

if autostomp then
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer and player.Character then
        local targetChar = player.Character
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHRP and targetHumanoid and targetHumanoid.Health < 20 then
            local distance = (rootPart.Position - targetHRP.Position).Magnitude
            if distance <= 40 then
                local uid = player.UserId
                Signal.FireServer("stomp", player)
                break
            end
        end
    end
end
end

if grabplay then
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer and player.Character then
        local targetChar = player.Character
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHRP and targetHumanoid and targetHumanoid.Health < 20 then
            local distance = (rootPart.Position - targetHRP.Position).Magnitude
            if distance <= 40 then
                local uid = player.UserId
                Signal.FireServer("grabPlayer", player)
                break
            end
        end
    end
end
end

if autoatm then
local player=game:GetService("Players").LocalPlayer local character=player.Character or player.CharacterAdded:Wait()local rootPart=character:WaitForChild("HumanoidRootPart")for _,v in pairs(workspace.Game.Entities.CashBundle:GetDescendants())do if v:IsA("ClickDetector")then local detectorPos=v.Parent:GetPivot().Position local distance=(rootPart.Position - detectorPos).Magnitude if distance <=35 then fireclickdetector(v)end end end
for _, v in ipairs(workspace.Game.Props.ATM:GetChildren()) do
if v:IsA("Model") and (v:GetAttribute("health") or 0) > 0 then
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
currentATM = v
ATMguid = currentATM:GetAttribute("guid")
local pos = currentATM.WorldPivot.Position
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
if Humanoid then
local HumanoidRootPart = Character:WaitForChild('HumanoidRootPart')
if HumanoidRootPart then
HumanoidRootPart.CFrame = CFrame.new(pos.x, pos.y, pos.z)
for i, v in next, item.inventory.items do
if v.name == 'Fists' then
qtid = v.guid
break
end
end
local distance = (HumanoidRootPart.Position - pos).Magnitude
if distance <= 40 then
local hitATM = {
meleeType = "meleepunch",
guid = ATMguid
}
Signal.FireServer("equip", qtid)
Signal.FireServer("meleeItemHit", "prop", hitATM)
end
end
end
break
end
end
end
end
end

if autojia then
Signal.InvokeServer("attemptPurchase", jiahit)
for i, v in next, item.inventory.items do
if v.name == jiahit then
light = v.guid
local armor = game:GetService('Players').LocalPlayer:GetAttribute('armor')
if armor == nil or armor <= 0 then
Signal.FireServer("equip", light)
Signal.FireServer("useConsumable", light)
Signal.FireServer("removeItem", light)
break
end
end
end
end

if autolok then
Signal.InvokeServer("attemptPurchase", 'Bandage')
for i, v in next, item.inventory.items do
if v.name == 'Bandage' then
bande = v.guid
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
if humanoid.Health < humanoid.MaxHealth then
Signal.FireServer("equip", bande)
Signal.FireServer("useConsumable", bande)
Signal.FireServer("removeItem", bande)
end
break
end
end
end
local devv = require(game:GetService('ReplicatedStorage').devv)
local item = devv.load('v3item')

if autouse then
for i, v in next, item.inventory.items do
if v.name == 'Green Lucky Block' or v.name == 'Orange Lucky Block' or v.name == 'Purple Lucky Block' or v.name == 'Electronics' or v.name == 'Weapon Parts' then
useid = v.guid
Signal.FireServer("equip", useid)
Signal.FireServer("useConsumable", useid)
Signal.FireServer("removeItem", useid)
break
end
end
end

if autosell then
for i, v in next, item.inventory.items do
if v.name == 'Amethyst' or v.name == 'Sapphire' or v.name == 'Emerald' or v.name == 'Topaz' or v.name == 'Ruby' or v.name == 'Diamond Ring' or v.name == "Gold Bar" or v.name == "AK-47" or v.name == "AR-15"  or v.name == "Diamond" then
sellid = v.guid
Signal.FireServer("equip", sellid)
Signal.FireServer("sellItem", sellid)
break
end
end
end

if autorem then
for i, v in next, item.inventory.items do
if v.name == 'Uzi' or v.name == 'Baseball Bat' or v.name == 'Basketball' or v.name == 'Bloxaide'or v.name == 'Bloxy Cola' or v.name == 'C4' or v.name == 'Cake' or v.name == 'Stop Sign'then
Signal.FireServer("removeItem", v.guid)
end
end
end

if autocl then
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Electronics" or e.ObjectText == "Weapon Parts" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end)
end)
------------------
kill:Toggle("反布娃娃状态[防止僵直]", "rea", false, function(state)
antirea = state
if antirea then
while antirea and task.wait() do
Signal.FireServer("setRagdoll", false)
end
end
end)
kill:Toggle("反坐下状态", "rea", false, function(state)
antisit = state
if antisit then
while antisit and task.wait() do
local Players = game:GetService("Players")
local player = Players.LocalPlayer
player.CharacterAdded:Connect(function(char)
local humanoid = char:WaitForChild("Humanoid")
humanoid.Sit = false
end)
end
end
end)
kill:Dropdown("选择护甲", "jiahit", {"轻型护甲100", "重型护甲2000", "军用护甲3500", "EOD护甲7500"}, function(value)
if value == "轻型护甲100" then
jiahit = "Light Vest"
elseif value == "重型护甲2000" then
jiahit = "Heavy Vest"
elseif value == "军用护甲3500" then
jiahit = "Military Vest"
elseif value == "EOD护甲7500" then
jiahit = "EOD Vest"
end
end)
kill:Toggle("自动穿甲", "jia", false, function(state)
autojia = state
end)
kill:Toggle("自动回血", "ban", false, function(state)
autolok = state
end)
local main = window:Tab("魔法")
local zzzz = main:section("魔法", true)
zzzz:Label("朝地面轰一炮即可触发 失效重新开起")
zzzz:Button("购买RPG武器", function()
Signal.InvokeServer("attemptPurchase", "RPG")
end)
zzzz:Button("购买RPG子弹", function()
Signal.InvokeServer("attemptPurchaseAmmo", "RPG")
end)
zzzz:Toggle("RPG全图轰炸", "rpgkill666", false, function()
local ReplicatedStorage=game:GetService("ReplicatedStorage")local Players=game:GetService("Players")local localPlayer=Players.LocalPlayer local function findRemoteEvent(eventName)for _,v in next,getgc(false)do if typeof(v)=="function" then local source=debug.info(v,"s")local name=debug.info(v,"n")if source and source:find("Signal")and name=="FireServer" then local success,upvalue=pcall(getupvalue,v,1)if success and upvalue and typeof(upvalue)=="table" then for k,remote in pairs(upvalue)do if k==eventName then return typeof(remote)=="string" and ReplicatedStorage.devv.remoteStorage[remote]or remote end end end break end end end return nil end local rocketHit=ReplicatedStorage.devv.remoteStorage:FindFirstChild("rocketHit")or findRemoteEvent("rocketHit")local lastArgs=nil local isListening=false local function shouldIgnorePlayer(player)if player==localPlayer then return true end if player.Name=="PolarDream8" then return true end if player.Name=="X7Sdaydream_XD" then return true end local success,isFriend=pcall(function()return localPlayer:IsFriendsWith(player.UserId)end)if success and isFriend then return true end return false end local originalNamecall originalNamecall=hookmetamethod(game,"__namecall",function(self,...)local args={...}local method=getnamecallmethod()if self==rocketHit and method=="FireServer" then if not lastArgs then lastArgs=args isListening=true coroutine.wrap(function()while isListening and lastArgs do local otherPlayersPositions={}for _,player in ipairs(Players:GetPlayers())do if not shouldIgnorePlayer(player)and player.Character then local rootPart=player.Character:FindFirstChild("HumanoidRootPart")if rootPart then table.insert(otherPlayersPositions,rootPart.Position)end end end if #otherPlayersPositions > 0 then local randomIndex=math.random(1,#otherPlayersPositions)local modifiedArgs={lastArgs[1],lastArgs[2],otherPlayersPositions[randomIndex]}rocketHit:FireServer(unpack(modifiedArgs))end task.wait()end end)()end end return originalNamecall(self,...)end)
end)
local killoppEnabled = false
local ignoreFriendsEnabled = false
zzzz:Toggle("射线枪子追开关", "sxq", false, function(state)
local Players=game:GetService("Players")local ReplicatedStorage=game:GetService("ReplicatedStorage")local LocalPlayer=Players.LocalPlayer local wepguid local devv=require(ReplicatedStorage.devv)local item=devv.load("v3item")for i,v in next,(item.inventory and item.inventory.items or{})do if v.type=="Gun" then wepguid=v.guid print(wepguid)end end local UserInputService=game:GetService("UserInputService")local RunService=game:GetService("RunService")local Camera=workspace.CurrentCamera local FOVCircle=Drawing.new("Circle")FOVCircle.Visible=true FOVCircle.Radius=200 FOVCircle.Color=Color3.fromRGB(255,255,255)FOVCircle.Thickness=1 FOVCircle.Transparency=1 FOVCircle.Filled=false FOVCircle.Position=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()FOVCircle.Position=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)end)local function findRemoteEvent(eventName)for _,v in next,getgc(false)do if typeof(v)=="function" then local source=debug.info(v,"s")local name=debug.info(v,"n")if source and source:find("Signal")and name=="FireServer" then local success,upvalue=pcall(getupvalue,v,1)if success and upvalue and typeof(upvalue)=="table" then for k,remote in pairs(upvalue)do if k==eventName then return typeof(remote)=="string" and ReplicatedStorage.devv.remoteStorage[remote]or remote end end end break end end end return nil end local replicateProjectiles=ReplicatedStorage.devv.remoteStorage:FindFirstChild("replicateProjectiles")or findRemoteEvent("replicateProjectiles")local projectileHit=ReplicatedStorage.devv.remoteStorage:FindFirstChild("projectileHit")or findRemoteEvent("projectileHit")local guid=require(game:GetService("ReplicatedStorage").devv.shared.Helpers.string.GUID)local newGuid=guid()local function isFriend(player)return LocalPlayer:IsFriendsWith(player.UserId)end local function getClosestPlayer()local closestCharacter local closestDistance=math.huge for _,player in ipairs(Players:GetPlayers())do if player ~=LocalPlayer and player.Character and not isFriend(player)and player.Name ~="PolarDream8" then local character=player.Character local humanoid=character:FindFirstChildOfClass("Humanoid")local rootPart=character:FindFirstChild("HumanoidRootPart")local head=character:FindFirstChild("Head")if humanoid and humanoid.Health > 0 and rootPart and head then local screenPoint,onScreen=Camera:WorldToViewportPoint(head.Position)if onScreen then local distanceFromCenter=(Vector2.new(screenPoint.X,screenPoint.Y)- FOVCircle.Position).Magnitude if distanceFromCenter <=FOVCircle.Radius then local distance=(rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude if distance < closestDistance then closestCharacter=character closestDistance=distance end end end end end end return closestCharacter end while true do if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0 then local ClosestPlayer=getClosestPlayer()if ClosestPlayer then local spawnArgs={[1]=wepguid,[2]={[1]={[1]=newGuid,[2]=ClosestPlayer.Head.CFrame}},[3]="semi"}local hitArgs={[1]=newGuid,[2]="player",[3]={hitPart=ClosestPlayer.Hitbox.Head_Hitbox,hitPlayerId=Players:GetPlayerFromCharacter(ClosestPlayer).UserId,hitSize=ClosestPlayer.Head.Size,pos=ClosestPlayer.Head.CFrame}}replicateProjectiles:FireServer(unpack(spawnArgs))projectileHit:FireServer(unpack(hitArgs))end end wait()end
end)
zzzz:Toggle("子追开关", "killopp", false, function(state)
killoppEnabled = state
end)
zzzz:Toggle("忽略好友", "ignorefriends", false, function(state)
ignoreFriendsEnabled = state
end)

local game=game local Workspace=game:GetService("Workspace")local Players=game:GetService("Players")local LocalPlayer=Players.LocalPlayer local Camera=Workspace.CurrentCamera local RunService=game:GetService("RunService")local UserInputService=game:GetService("UserInputService")local old local TEXT_POSITION=Vector2.new(Camera.ViewportSize.X - 200,50)local TEXT_COLOR=Color3.new(1,1,1)local HEALTH_COLOR=Color3.new(0,1,0)local targetDisplay=Drawing.new("Text")targetDisplay.Visible=false targetDisplay.Size=20 targetDisplay.Center=false targetDisplay.Outline=true targetDisplay.OutlineColor=Color3.new(0,0,0)targetDisplay.Color=TEXT_COLOR targetDisplay.Text="目标: None" targetDisplay.Position=TEXT_POSITION targetDisplay.Font=2 local healthDisplay=Drawing.new("Text")healthDisplay.Visible=false healthDisplay.Size=18 healthDisplay.Center=true healthDisplay.Outline=true healthDisplay.OutlineColor=Color3.new(0,0,0)healthDisplay.Color=HEALTH_COLOR healthDisplay.Font=2 local usernameDisplay=Drawing.new("Text")usernameDisplay.Visible=false usernameDisplay.Size=18 usernameDisplay.Center=true usernameDisplay.Outline=true usernameDisplay.OutlineColor=Color3.new(0,0,0)usernameDisplay.Color=TEXT_COLOR usernameDisplay.Font=2 local function isFriend(player)if not ignoreFriendsEnabled then return false end local success,isFriend=pcall(function()return LocalPlayer:IsFriendsWith(player.UserId)end)return success and isFriend end local function updateDisplay(character,player)local head=character and character:FindFirstChild("Head")local humanoid=character and character:FindFirstChildOfClass("Humanoid")if not head or not humanoid then healthDisplay.Visible=false usernameDisplay.Visible=false return end local headPos,headOnScreen=Camera:WorldToViewportPoint(head.Position)if not headOnScreen then healthDisplay.Visible=false usernameDisplay.Visible=false return end healthDisplay.Text=math.floor(humanoid.Health).."/"..math.floor(humanoid.MaxHealth)healthDisplay.Position=Vector2.new(headPos.X,headPos.Y - 30)healthDisplay.Visible=true usernameDisplay.Text=player.Name usernameDisplay.Position=Vector2.new(headPos.X,headPos.Y - 50)usernameDisplay.Visible=true end local function getClosestHead()local closestHead local closestPlayer local closestCharacter local closestDistance=math.huge local cameraDirection=Camera.CFrame.LookVector local cameraPos=Camera.CFrame.Position for _,player in ipairs(Players:GetPlayers())do if player ~=LocalPlayer and player.Character then if ignoreFriendsEnabled and isFriend(player)then end local character=player.Character local head=character:FindFirstChild("Head")local humanoid=character:FindFirstChildOfClass("Humanoid")local forcefield=character:FindFirstChild("ForceField")if head and humanoid and not forcefield and humanoid.Health > 0 then local distance=(head.Position - cameraPos).Magnitude if distance < closestDistance then closestHead=head closestPlayer=player closestCharacter=character closestDistance=distance end end end end return closestHead,closestPlayer,closestCharacter end RunService.Heartbeat:Connect(function()if not killoppEnabled then targetDisplay.Visible=false healthDisplay.Visible=false usernameDisplay.Visible=false return end local closestHead,closestPlayer,closestCharacter=getClosestHead()if closestHead and closestPlayer then targetDisplay.Text="目标: "..closestPlayer.Name targetDisplay.Visible=true updateDisplay(closestCharacter,closestPlayer)else targetDisplay.Text="目标: None" targetDisplay.Visible=true healthDisplay.Visible=false usernameDisplay.Visible=false end end)old=hookmetamethod(game,"__namecall",function(self,...)if not killoppEnabled then return old(self,...)end local method=getnamecallmethod()local args={...}if(method=="Raycast" or method=="FindPartOnRay")and not checkcaller()and self==Workspace then local origin,direction if method=="Raycast" then origin=args[1]direction=args[2]else local ray=args[1]if typeof(ray)=="Ray" then origin=ray.Origin direction=ray.Direction end end if origin and direction then local closestHead,closestPlayer=getClosestHead()if closestHead and closestPlayer then if not(ignoreFriendsEnabled and isFriend(closestPlayer))then return{Instance=closestHead,Position=closestHead.Position,Normal=(closestHead.Position - origin).Unit,Material=Enum.Material.Plastic}end end end end return old(self,...)end)local function cleanup()targetDisplay:Remove()healthDisplay:Remove()usernameDisplay:Remove()end game:GetService("UserInputService").WindowFocusReleased:Connect(cleanup)
local main = window:Tab("购买")
local qtl = main:section("购买", true)
local dropdown = qtl:Dropdown("选择物品", "Items", {}, function(value)
    selectedItem = value 
end)
local itemsOnSale=workspace:FindFirstChild("ItemsOnSale")if itemsOnSale then local itemNames={}local seenNames={}for _,item in ipairs(itemsOnSale:GetChildren())do if not seenNames[item.Name]then table.insert(itemNames,item.Name)seenNames[item.Name]=true end end dropdown:SetOptions(itemNames)end
qtl:Button("购买物品", function()
if selectedItem then
Signal.InvokeServer("attemptPurchase", selectedItem)
end
end)

qtl:Button("购买子弹", function()
if selectedItem then
Signal.InvokeServer("attemptPurchaseAmmo", selectedItem)
end
end)
local main = window:Tab("附属")
local qtl1 = main:section("附属", true)
qtl1:Toggle("自动消耗品[幸运方块&材料]", "use", false, function(state)
autouse = state
end)
qtl1:Toggle("自动售卖物品", "sell", false, function(state)
autosell = state
end)
qtl1:Toggle("自动清理工作垃圾","", false, function(v)
autosd = v
if autosd then
while autosd and wait() do  
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait() -- 确保角色存在
for _, v in ipairs(workspace.Game.Local.Rubbish:GetDescendants()) do
if v:IsA("ClickDetector") then
local parentPart = v.Parent
if parentPart:IsA("BasePart") then
character:PivotTo(parentPart:GetPivot())
task.wait(0.2)
fireclickdetector(v)
end
end
end
end
end
end)
qtl1:Toggle("自动移除背包内垃圾","", false, function(v)
autorem = v
end)
qtl1:Toggle("即时互动","", false, function(v)
autohlod = v
if autohlod then
local function modifyPrompt(prompt)prompt.HoldDuration=0 end local function isTargetPrompt(prompt)local parent=prompt.Parent while parent do if parent==workspace or parent==workspace.BankRobbery.VaultDoor then return true end parent=parent.Parent end return false end for _,prompt in ipairs(workspace:GetDescendants())do if prompt:IsA("ProximityPrompt")and isTargetPrompt(prompt)then modifyPrompt(prompt)end end workspace.DescendantAdded:Connect(function(instance)if instance:IsA("ProximityPrompt")and isTargetPrompt(instance)then modifyPrompt(instance)end end)
end
end)
local main = window:Tab("自动")
local auto = main:section("自动", true)
auto:Toggle("自动装备拳头", "zb", false, function(state)
autozb = state
if autozb then
while autozb and task.wait() do
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
for i, v in next, item.inventory.items do
if v.name == 'Fists' then
qtid = v.guid
Signal.FireServer("equip", qtid)
break
end
end
end
end
end
end
end)
auto:Toggle("自动攻击ATM", "", false, function(v)
autoatm = v
end)
auto:Toggle("自动抢劫银行", "16384", false, function(value)
autobank = value
if autobank then
while autobank and wait() do
local BankDoor=game:GetService("Workspace").BankRobbery.VaultDoor local BankCashs=game:GetService("Workspace").BankRobbery.BankCash local Players=game:GetService("Players")local LocalPlayer=Players.LocalPlayer local function getCharacter()local character=LocalPlayer.Character if character and character:FindFirstChild("Humanoid")and character.Humanoid.Health > 0 then return character end return nil end if BankDoor.Door.Attachment.ProximityPrompt.Enabled==true then BankDoor.Door.Attachment.ProximityPrompt.HoldDuration=0 BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance=20 local character=getCharacter()if character then local epoh1=CFrame.new(1071.955810546875,9,-343.80816650390625)character.HumanoidRootPart.CFrame=epoh1 wait(0.3)BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()wait(0.3)BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()end else if BankCashs.Cash:FindFirstChild("Bundle")then local character=getCharacter()if character then character.HumanoidRootPart.CFrame=CFrame.new(1055.94153,3,-344.58374)BankCashs.Main.Attachment.ProximityPrompt.MaxActivationDistance=20 for _,obj in ipairs(workspace.BankRobbery.BankCash:GetDescendants())do if obj:IsA("ProximityPrompt")then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end end end if not BankCashs.Cash:FindFirstChild("Bundle")then BankCashs.Main.Attachment.ProximityPrompt:InputHoldEnd()end end
end 
end
end)
auto:Toggle("自动开保险&宝箱","", false, function(v)
bxbx = v
if bxbx then
while bxbx and wait() do  
local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
local BankCashs = game:GetService("Workspace").BankRobbery.BankCash
local epoh2 = game:GetService("Players")
local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
if BankDoor.Door.Attachment.ProximityPrompt.Enabled then
BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
epoh3.CFrame = epoh1
wait(0.3)
BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
wait(0.3)
BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
else
for _, obj in ipairs(workspace.Game.Entities:GetDescendants()) do
if obj:IsA("ProximityPrompt") and (obj.ActionText == "Crack Chest" or obj.ActionText == "Crack Safe") and obj.Enabled then
        if bxbx then
        obj.RequiresLineOfSight = false
        obj.HoldDuration = 0 
        local target = obj.Parent and obj.Parent.Parent
        if target and target:IsA("BasePart") then
            local snow4 = target.CFrame * CFrame.new(0, 2, 2)
            local snow5 = game:GetService("Players")
            local snow6 = snow5.LocalPlayer.Character.HumanoidRootPart
            snow6.CFrame = snow4
            wait(0.5) 
            fireproximityprompt(obj) 
        end
        end
    end
end
end
end
end
end
end
end)
auto:Toggle("自动购买撬锁","", false, function(v)
lock = v
if lock then
while lock and wait() do  
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
Signal.InvokeServer("attemptPurchase", "Lockpick")
end
end
end
end
end)
auto:Toggle("保险&箱子&银行光环","", false, function(v)
bxgh = v
if bxgh then
while bxgh and wait() do 
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:FindFirstChild("HumanoidRootPart")
for _,obj in ipairs(workspace.Game.Entities.GoldJewelSafe:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.Game.Entities.SmallSafe:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.Game.Entities.SmallChest:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.Game.Entities.LargeSafe:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.Game.Entities.MediumSafe:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.Game.Entities.LargeChest:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.Game.Entities.JewelSafe:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end for _,obj in ipairs(workspace.BankRobbery.VaultDoor:GetDescendants())do if obj:IsA("ProximityPrompt")and rootPart and(obj.Parent.Position - rootPart.Position).Magnitude > 35 then obj.RequiresLineOfSight=false obj.HoldDuration=0 fireproximityprompt(obj)end end
end
end
end)
auto:Toggle("金钱光环","", false, function(v)
mngh = v
if mngh then
while mngh and wait() do 
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
local player=game:GetService("Players").LocalPlayer local character=player.Character or player.CharacterAdded:Wait()local rootPart=character:WaitForChild("HumanoidRootPart")for _,v in pairs(workspace.Game.Entities.CashBundle:GetDescendants())do if v:IsA("ClickDetector")then local detectorPos=v.Parent:GetPivot().Position local distance=(rootPart.Position - detectorPos).Magnitude if distance <=35 then fireclickdetector(v)end end end
end
end
end
end
end)
local main = window:Tab("收集")
local zzjwp = main:section("收集", true)
zzjwp:Toggle("查找放下来印钞机","", false, function(v)
czycj = v
if czycj then
while czycj and wait() do
local Players=game:GetService("Players")local localPlayer=Players.LocalPlayer local droppables=workspace.Game.Local.droppables if droppables and droppables:FindFirstChild("Money Printer")then local unusualMoneyPrinter=droppables:FindFirstChild("Money Printer")for _,child in pairs(unusualMoneyPrinter:GetChildren())do if child:IsA("MeshPart")then local humanoidRootPart=localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")if humanoidRootPart then humanoidRootPart.CFrame=CFrame.new(child.Position)end end end end
end
end
end)
zzjwp:Toggle("自动拾取材料", "auto", false, function(v)
autocl = v
end)
zzjwp:Toggle("自动拾取宝石", "auto", false, function(v)
autobs = v
if autobs then
while autobs and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Amethyst" or e.ObjectText == "Sapphire" or e.ObjectText == "Emerald"  or e.ObjectText == "Topaz"  or e.ObjectText == "Ruby"  or e.ObjectText == "Diamond Ring"  or e.ObjectText == "Diamond" or e.ObjectText == "Void Gem" or e.ObjectText == "Dark Matter Gem" or e.ObjectText == "Rollie" then
                                for _, obj in ipairs(workspace.BankRobbery.VaultDoor:GetDescendants()) do
                                if obj:IsA("ProximityPrompt") then
                                if (obj.Parent.Position - rootPart.Position).Magnitude > 35 then
                                obj.RequiresLineOfSight = false
                                obj.HoldDuration = 0
                                fireproximityprompt(obj)
                                end
                                end
                                end
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取红卡", "auto", false, function(v)
autohk = v
if autohk then
while autohk and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Military Armory Keycard" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取印钞机", "auto", false, function(v)
automn = v
if automn then
while automn and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Money Printer" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取顶级物品", "auto", false, function(v)
autodj = v
if autodj then
while autodj and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Suitcase Nuke" or e.ObjectText == "Nuke Launcher" or e.ObjectText == "Easter Basket" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取金条", "auto", false, function(v)
autojt = v
if autojt then
while autojt and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" and e.ObjectText == "Gold Bar" then
                                for _, obj in ipairs(workspace.BankRobbery.VaultDoor:GetDescendants()) do
                                if obj:IsA("ProximityPrompt") then
                                if (obj.Parent.Position - rootPart.Position).Magnitude > 35 then
                                obj.RequiresLineOfSight = false
                                obj.HoldDuration = 0
                                fireproximityprompt(obj)
                                end
                                end
                                end
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取气球", "auto", false, function(v)
autoqq = v
if autoqq then
while autoqq and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Bunny Balloon" or e.ObjectText == "Ghost Balloon" or e.ObjectText == "Clover Balloon" or e.ObjectText == "Bat Balloon" or e.ObjectText == "Gold Clover Balloon" or e.ObjectText == "Golden Rose" or e.ObjectText == "Black Rose" or e.ObjectText == "Heart Balloon" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取蓝色糖果棒", "auto", false, function(v)
autoblue = v
if autoblue then
while autoblue and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Blue Candy Cane" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
zzjwp:Toggle("自动拾取幸运方块", "auto", false, function(v)
autoluck = v
if autoluck then
while autoluck and wait() do
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                if e.ObjectText == "Green Lucky Block" or e.ObjectText == "Orange Lucky Block" or e.ObjectText == "Purple Lucky Block" then
                                local itemCFrame = v.CFrame
                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                e.RequiresLineOfSight = false
                                e.HoldDuration = 0
                                wait(0.1)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end)
local main = window:Tab("RPG轰炸玩法")
local RPGAUTO = main:section("RPG轰炸玩法", true)
RPGAUTO:Button("RPG环绕轰炸", function()
local ReplicatedStorage=game:GetService("ReplicatedStorage")local Players=game:GetService("Players")local localPlayer=Players.LocalPlayer local function findRemoteEvent(eventName)for _,v in next,getgc(false)do if typeof(v)=="function" then local source=debug.info(v,"s")local name=debug.info(v,"n")if source and source:find("Signal")and name=="FireServer" then local success,upvalue=pcall(getupvalue,v,1)if success and upvalue and typeof(upvalue)=="table" then for k,remote in pairs(upvalue)do if k==eventName then return typeof(remote)=="string" and ReplicatedStorage.devv.remoteStorage[remote]or remote end end end break end end end return nil end local rocketHit=ReplicatedStorage.devv.remoteStorage:FindFirstChild("rocketHit")or findRemoteEvent("rocketHit")local lastArgs=nil local isListening=false local originalNamecall originalNamecall=hookmetamethod(game,"__namecall",function(self,...)local args={...}local method=getnamecallmethod()if self==rocketHit and method=="FireServer" then if not lastArgs then lastArgs=args isListening=true coroutine.wrap(function()while isListening and lastArgs do if localPlayer.Character then local localRoot=localPlayer.Character:FindFirstChild("HumanoidRootPart")if localRoot then local center=localRoot.Position local radius=50 local explosionCount=999 while isListening do for i=1,explosionCount do if not isListening then break end local angle=(i / explosionCount)* math.pi * 2 local x=center.X + math.cos(angle)* radius local y=center.Y local z=center.Z + math.sin(angle)* radius local modifiedArgs={lastArgs[1],lastArgs[2],Vector3.new(x,y,z)}rocketHit:FireServer(unpack(modifiedArgs))end radius=radius + 5 task.wait()end end end task.wait()end end)()end end return originalNamecall(self,...)end)
end)
RPGAUTO:Button("RPG圆形轰炸", function()
local ReplicatedStorage=game:GetService("ReplicatedStorage")local Players=game:GetService("Players")local localPlayer=Players.LocalPlayer local function findRemoteEvent(eventName)for _,v in next,getgc(false)do if typeof(v)=="function" then local source=debug.info(v,"s")local name=debug.info(v,"n")if source and source:find("Signal")and name=="FireServer" then local success,upvalue=pcall(getupvalue,v,1)if success and upvalue and typeof(upvalue)=="table" then for k,remote in pairs(upvalue)do if k==eventName then return typeof(remote)=="string" and ReplicatedStorage.devv.remoteStorage[remote]or remote end end end break end end end return nil end local rocketHit=ReplicatedStorage.devv.remoteStorage:FindFirstChild("rocketHit")or findRemoteEvent("rocketHit")local lastArgs=nil local isListening=false local originalNamecall originalNamecall=hookmetamethod(game,"__namecall",function(self,...)local args={...}local method=getnamecallmethod()if self==rocketHit and method=="FireServer" then if not lastArgs then lastArgs=args isListening=true coroutine.wrap(function()while isListening and lastArgs do if localPlayer.Character then local localRoot=localPlayer.Character:FindFirstChild("HumanoidRootPart")if localRoot then local radius=50 local angle=math.random()* 2 * math.pi local x=localRoot.Position.X + radius * math.cos(angle)local y=localRoot.Position.Y local z=localRoot.Position.Z + radius * math.sin(angle)local modifiedArgs={lastArgs[1],lastArgs[2],Vector3.new(x,y,z)}rocketHit:FireServer(unpack(modifiedArgs))end end task.wait()end end)()end end return originalNamecall(self,...)end)
end)
RPGAUTO:Button("RPG直线轰炸", function()
local ReplicatedStorage=game:GetService("ReplicatedStorage")local Players=game:GetService("Players")local localPlayer=Players.LocalPlayer local function findRemoteEvent(eventName)for _,v in next,getgc(false)do if typeof(v)=="function" then local source=debug.info(v,"s")local name=debug.info(v,"n")if source and source:find("Signal")and name=="FireServer" then local success,upvalue=pcall(getupvalue,v,1)if success and upvalue and typeof(upvalue)=="table" then for k,remote in pairs(upvalue)do if k==eventName then return typeof(remote)=="string" and ReplicatedStorage.devv.remoteStorage[remote]or remote end end end break end end end return nil end local rocketHit=ReplicatedStorage.devv.remoteStorage:FindFirstChild("rocketHit")or findRemoteEvent("rocketHit")local lastArgs=nil local isListening=false local originalNamecall originalNamecall=hookmetamethod(game,"__namecall",function(self,...)local args={...}local method=getnamecallmethod()if self==rocketHit and method=="FireServer" then if not lastArgs then lastArgs=args isListening=true coroutine.wrap(function()while isListening and lastArgs do if localPlayer.Character then local localRoot=localPlayer.Character:FindFirstChild("HumanoidRootPart")local humanoid=localPlayer.Character:FindFirstChildOfClass("Humanoid")if localRoot and humanoid then local lookVector=humanoid.RootPart.CFrame.LookVector lookVector=Vector3.new(lookVector.X,0,lookVector.Z).Unit for distance=10,math.huge,10 do if not isListening then break end local x=localRoot.Position.X +(lookVector.X * distance)local y=localRoot.Position.Y local z=localRoot.Position.Z +(lookVector.Z * distance)local modifiedArgs={lastArgs[1],lastArgs[2],Vector3.new(x,y,z)}rocketHit:FireServer(unpack(modifiedArgs))task.wait()end end end task.wait()end end)()end end return originalNamecall(self,...)end)
end)
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local function StopAnim()
	plr.Character.Animate.Disabled = false
    local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
    for i, track in pairs (animtrack) do
        track:Stop()
    end
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "成功", 
	Icon = "rbxassetid://119970903874014" 
})()
elseif game.GameId == 7008097940 then 
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "正在加载...墨水游戏...", 
	Icon = "rbxassetid://119970903874014" 
})
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/pagedcomic-design/ui/refs/heads/main/ui"))()

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Player = game.Players.LocalPlayer

-- Services
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Global Variables
_G.InfiniteJump = false
_G.AutoSpeed = false
_G.Speed = 50
_G.AutoHelpPlayer = false
_G.AutoTrollPlayer = false
_G.TugOfWar = false
_G.DoorExit = false
_G.AntiLag = false
_G.PartLag = {"FootstepEffect", "BulletHole", "GroundSmokeDIFFERENT", "ARshell", "effect debris", "effect", "DroppedMP5"}
_G.EspHighlight = false
_G.EspGui = false
_G.EspGuiTextSize = 7
_G.EspGuiTextColor = Color3.new(255, 255, 255)
_G.EspName = false
_G.EspDistance = false
_G.CollectBandage = false
_G.CollectFlashbang = false
_G.CollectGrenade = false
_G.AntiFling = false
_G.AntiBanana = false
_G.AutoDalgona = false
_G.HideSeekESP = false
_G.GlassBridgeVision = false
_G.AutoMingle = false
_G.AutoSkip = false
_G.NoCooldownProximity = false
_G.Float = false
_G.NoClip = false

local Loading = false
local Loading1 = false
local CooldownProximity = nil
local FloatConnection = nil
local NoClipConnection = nil

-- Create Main Window
local Window = WindUI:CreateWindow({
    Title = "Rb脚本中心-付费版",
    Icon = "zap",
    Author = "墨水",
    Folder = "RbHub_InkGameV2_CN",
    Size = UDim2.fromOffset(480, 360),
    Theme = "Dark",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:Notify({
                Title = "用户中心",
                Content = "Rb脚本中心用户资料",
                Duration = 3
            })
        end
    },
    SideBarWidth = 200,
})

local UserGui = Instance.new("ScreenGui", game.CoreGui)
local UserLabel = Instance.new("TextLabel", UserGui)
local UIGradient = Instance.new("UIGradient")

UserGui.Name = "UserGui"
UserGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UserGui.Enabled = true
UserLabel.Name = "UserLabel"
UserLabel.BackgroundColor3 = Color3.new(1, 1, 1)
UserLabel.BackgroundTransparency = 1
UserLabel.BorderColor3 = Color3.new(0, 0, 0)
UserLabel.Position = UDim2.new(0.80, 0.80, 0.00090, 0)
UserLabel.Size = UDim2.new(0, 135, 0, 50)
UserLabel.Font = Enum.Font.GothamSemibold
UserLabel.Text = "尊敬的："..game.Players.LocalPlayer.Character.Name.."付费版用户，欢迎使用Rb脚本中心！"
UserLabel.TextColor3 = Color3.new(1, 1, 1)
UserLabel.TextScaled = true
UserLabel.TextSize = 14
UserLabel.TextWrapped = true
UserLabel.Visible = true

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
}
UIGradient.Rotation = 10
UIGradient.Parent = UserLabel

local TweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
tween:Play()

Window:Tag({
    Title = "v1.0",
    Color = Color3.fromHex("#30ff6a")
})
Window:Tag({
    Title = "测试版",
    Color = Color3.fromHex("#315dff")
})

-- Create Sections and Tabs
local Tabs = {
    Main = Window:Section({ Title = "主线关卡", Opened = true }),
    HideSeek = Window:Section({ Title = "躲猫猫", Opened = true }),
    Player = Window:Section({ Title = "杂项", Opened = true }),
    Other = Window:Section({ Title = "小游戏", Opened = true }),
}

local TabHandles = {
    MainGames = Tabs.Main:Tab({ Title = "红绿灯", Icon = "gamepad-2" }),
    Dalgona = Tabs.Main:Tab({ Title = "抠糖饼 & 拔河", Icon = "cookie" }),
    HideSeekESP = Tabs.HideSeek:Tab({ Title = "透视功能", Icon = "eye" }),
    HideSeekTeleport = Tabs.HideSeek:Tab({ Title = "传送收集", Icon = "move" }),
    Movement = Tabs.Player:Tab({ Title = "玩家设置", Icon = "user" }),
    Utilities = Tabs.Player:Tab({ Title = "实用功能", Icon = "settings" }),
    OtherGames = Tabs.Other:Tab({ Title = "其他关卡", Icon = "puzzle" }),
}

-- Utility Functions
function CheckWall(Target)
    local Direction = (Target.Position - Workspace.CurrentCamera.Position).unit * (Target.Position - Workspace.CurrentCamera.Position).Magnitude
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = {Player.Character, Workspace.CurrentCamera}
    RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local Result = Workspace:Raycast(Workspace.CurrentCamera.Position, Direction, RaycastParams)
    return Result == nil or Result.Instance:IsDescendantOf(Target)
end

function HasTool(tool)
    for _, v in pairs(Player.Character:GetChildren()) do
        if v:IsA("Tool") and v.Name == tool then
            return true
        end
    end
    for _, v in pairs(Player.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == tool then
            return true
        end
    end
    return false
end

function PartLagDe(g)
    for i, v in pairs(_G.PartLag) do
        if g.Name:find(v) then
            g:Destroy()
        end
    end
end

-- Setup Jump and Speed
UserInputService.JumpRequest:connect(function()
    if _G.InfiniteJump == true then
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

Player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").WalkSpeed = _G.AutoSpeed and _G.Speed or 16
    character:WaitForChild("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if _G.AutoSpeed == true then
            character.Humanoid.WalkSpeed = _G.Speed or 50
        end
    end)
end)

-- Main Games Tab - Red Light Green Light
TabHandles.MainGames:Button({
    Title = "一键到终点",
    Desc = "瞬间传送到终点",
    Icon = "zap",
    Callback = function()
        if Workspace:FindFirstChild("RedLightGreenLight") and Workspace.RedLightGreenLight:FindFirstChild("sand") and Workspace.RedLightGreenLight.sand:FindFirstChild("crossedover") then
            local pos = Workspace.RedLightGreenLight.sand.crossedover.Position + Vector3.new(0, 5, 0)
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos, pos + Vector3.new(0, 0, -1))
            WindUI:Notify({
                Title = "传送成功",
                Content = "已抵达终点！",
                Icon = "check",
                Duration = 2
            })
        end
    end
})

TabHandles.MainGames:Button({
    Title = "帮助玩家",
    Desc = "扛起玩家传送至终点",
    Icon = "hand-helping",
    Callback = function()
        if Loading then return end
        Loading = true
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("CarryPrompt") and v.Character.HumanoidRootPart.CarryPrompt.Enabled == true then
                if v.Character:FindFirstChild("SafeRedLightGreenLight") == nil then
                    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    wait(0.3)
                    repeat task.wait(0.1)
                        fireproximityprompt(v.Character.HumanoidRootPart:FindFirstChild("CarryPrompt"))
                    until v.Character.HumanoidRootPart.CarryPrompt.Enabled == false
                    wait(0.5)
                    if Workspace:FindFirstChild("RedLightGreenLight") and Workspace.RedLightGreenLight:FindFirstChild("sand") and Workspace.RedLightGreenLight.sand:FindFirstChild("crossedover") then
                        local pos = Workspace.RedLightGreenLight.sand.crossedover.Position + Vector3.new(0, 5, 0)
                        Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos, pos + Vector3.new(0, 0, -1))
                    end
                    wait(0.4)
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClickedButton"):FireServer({tryingtoleave = true})
                    break
                end
            end
        end
        Loading = false
    end
})

TabHandles.MainGames:Toggle({
    Title = "自动帮助玩家",
    Desc = "自动扛起未通关玩家传送到终点",
    Value = false,
    Callback = function(value)
        _G.AutoHelpPlayer = value
        while _G.AutoHelpPlayer do
            pcall(function()
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local carryPrompt = v.Character.HumanoidRootPart:FindFirstChild("CarryPrompt")
                        if carryPrompt and carryPrompt.Enabled and not v.Character:FindFirstChild("SafeRedLightGreenLight") then
                            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                            wait(0.3)
                            repeat
                                fireproximityprompt(carryPrompt)
                                task.wait(0.1)
                            until not carryPrompt.Enabled or not carryPrompt.Parent
                            wait(0.5)
                            if Workspace:FindFirstChild("RedLightGreenLight") and Workspace.RedLightGreenLight:FindFirstChild("sand") and Workspace.RedLightGreenLight.sand:FindFirstChild("crossedover") then
                                local pos = Workspace.RedLightGreenLight.sand.crossedover.Position + Vector3.new(0, 5, 0)
                                Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos, pos + Vector3.new(0, 0, -1))
                            end
                            wait(0.4)
                            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClickedButton"):FireServer({tryingtoleave = true})
                            break
                        end
                    end
                end
            end)
            task.wait(2)
        end
    end
})

TabHandles.MainGames:Toggle({
    Title = "自动恶搞玩家",
    Desc = "扛起玩家让他滚回起点",
    Value = false,
    Callback = function(value)
        _G.AutoTrollPlayer = value
        while _G.AutoTrollPlayer do
            pcall(function()
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("CarryPrompt") and v.Character.HumanoidRootPart.CarryPrompt.Enabled == true then
                        if v.Character:FindFirstChild("SafeRedLightGreenLight") == nil then
                            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                            wait(0.3)
                            repeat task.wait(0.1)
                                fireproximityprompt(v.Character.HumanoidRootPart:FindFirstChild("CarryPrompt"))
                            until v.Character.HumanoidRootPart.CarryPrompt.Enabled == false
                            wait(0.5)
                            if Workspace:FindFirstChild("RedLightGreenLight") then
                                Player.Character.HumanoidRootPart.CFrame = CFrame.new(-84, 1023, -537)
                            end
                            wait(0.4)
                            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClickedButton"):FireServer({tryingtoleave = true})
                            break
                        end
                    end
                end
            end)
            task.wait()
        end
    end
})

-- Dalgona & Tug Tab
TabHandles.Dalgona:Button({
    Title = "一键完成扣糖饼",
    Desc = "瞬间完成扣糖饼",
    Icon = "cookie",
    Callback = function()
        pcall(function()
            if ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Games") then
                local DalgonaClientModule = ReplicatedStorage.Modules.Games:FindFirstChild("DalgonaClient")
                if DalgonaClientModule then
                    for i, v in pairs(getreg()) do
                        if typeof(v) == "function" and islclosure(v) then
                            if getfenv(v).script == DalgonaClientModule then
                                if getinfo(v).nups == 73 then
                                    setupvalue(v, 31, 9e9)
                                    WindUI:Notify({
                                        Title = "椪糖完成",
                                        Content = "抠图已完成！",
                                        Icon = "check",
                                        Duration = 3
                                    })
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
})

TabHandles.Dalgona:Toggle({
    Title = "自动扣糖饼",
    Desc = "自动完成扣糖饼",
    Value = false,
    Callback = function(value)
        _G.AutoDalgona = value
        while _G.AutoDalgona do
            pcall(function()
                if ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Games") then
                    local DalgonaClientModule = ReplicatedStorage.Modules.Games:FindFirstChild("DalgonaClient")
                    if DalgonaClientModule then
                        for i, v in pairs(getreg()) do
                            if typeof(v) == "function" and islclosure(v) then
                                if getfenv(v).script == DalgonaClientModule then
                                    if getinfo(v).nups == 73 then
                                        setupvalue(v, 31, 9e9)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(5)
        end
    end
})

TabHandles.Dalgona:Toggle({
    Title = "自动拔河",
    Desc = "自动赢得拔河比赛",
    Value = false,
    Callback = function(value)
        _G.TugOfWar = value
        while _G.TugOfWar do
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TemporaryReachedBindable"):FireServer({GameQTE = true})
            end)
            task.wait(0.1)
        end
    end
})

-- Hide & Seek ESP Tab
TabHandles.HideSeekESP:Toggle({
    Title = "出口透视",
    Desc = "显示出口大门",
    Value = false,
    Callback = function(value)
        _G.DoorExit = value
        if value then
            task.spawn(function()
                while _G.DoorExit do
            pcall(function()
                if Workspace:FindFirstChild("HideAndSeekMap") then
                    for i, v in pairs(Workspace:FindFirstChild("HideAndSeekMap"):GetChildren()) do
                        if v.Name == "NEWFIXEDDOORS" then
                            for k, m in pairs(v:GetChildren()) do
                                if m.Name:find("Floor") and m:FindFirstChild("EXITDOORS") then
                                    for _, a in pairs(m:FindFirstChild("EXITDOORS"):GetChildren()) do
                                        if a:IsA("Model") and a:FindFirstChild("DoorRoot") then
                                            -- Clean existing ESP
                                            for _, z in pairs(a.DoorRoot:GetChildren()) do
                                                if z.Name:find("Esp_") then
                                                    z:Destroy()
                                                end
                                            end

                                            -- Add highlight if enabled
                                            if _G.EspHighlight and not a.DoorRoot:FindFirstChild("Esp_Highlight") then
                                                local Highlight = Instance.new("Highlight")
                                                Highlight.Name = "Esp_Highlight"
                                                Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                                                Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
                                                Highlight.FillTransparency = 0.5
                                                Highlight.OutlineTransparency = 0
                                                Highlight.Adornee = a
                                                Highlight.Parent = a.DoorRoot
                                            end

                                            -- Add GUI ESP if enabled
                                            if _G.EspGui and not a.DoorRoot:FindFirstChild("Esp_Gui") then
                                                local BillboardGui = Instance.new("BillboardGui")
                                                BillboardGui.Name = "Esp_Gui"
                                                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                                BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                                                BillboardGui.AlwaysOnTop = true
                                                BillboardGui.Parent = a.DoorRoot

                                                local TextLabel = Instance.new("TextLabel")
                                                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                                TextLabel.BackgroundTransparency = 1
                                                TextLabel.Text = "出口大门"
                                                TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                                                TextLabel.TextScaled = true
                                                TextLabel.Font = Enum.Font.SourceSansBold
                                                TextLabel.Parent = BillboardGui

                                                local UIStroke = Instance.new("UIStroke")
                                                UIStroke.Color = Color3.new(0, 0, 0)
                                                UIStroke.Thickness = 1.5
                                                UIStroke.Parent = TextLabel
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(1)
        end
            end)
        else
            -- Clean up all door ESP when disabled
            if Workspace:FindFirstChild("HideAndSeekMap") then
                for i, v in pairs(Workspace:FindFirstChild("HideAndSeekMap"):GetChildren()) do
                    if v.Name == "NEWFIXEDDOORS" then
                        for k, m in pairs(v:GetChildren()) do
                            if m.Name:find("Floor") and m:FindFirstChild("EXITDOORS") then
                                for _, a in pairs(m:FindFirstChild("EXITDOORS"):GetChildren()) do
                                    if a:IsA("Model") and a:FindFirstChild("DoorRoot") then
                                        for _, z in pairs(a.DoorRoot:GetChildren()) do
                                            if z.Name:find("Esp_") then
                                                z:Destroy()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})

TabHandles.HideSeekESP:Toggle({
    Title = "钥匙透视",
    Desc = "显示掉落钥匙",
    Value = false,
    Callback = function(value)
        _G.DoorKey = value
        if value then
            task.spawn(function()
                while _G.DoorKey do
                    pcall(function()
                        for _, a in pairs(Workspace.Effects:GetChildren()) do
                            if a.Name:find("DroppedKey") and a:FindFirstChild("Handle") then
                                -- Clean existing ESP
                                for _, z in pairs(a.Handle:GetChildren()) do
                                    if z.Name:find("Esp_") then
                                        z:Destroy()
                                    end
                                end

                                if _G.EspHighlight and not a.Handle:FindFirstChild("Esp_Highlight") then
                                    local Highlight = Instance.new("Highlight")
                                    Highlight.Name = "Esp_Highlight"
                                    Highlight.FillColor = Color3.fromRGB(255, 255, 0)
                                    Highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                                    Highlight.FillTransparency = 0.3
                                    Highlight.OutlineTransparency = 0
                                    Highlight.Adornee = a
                                    Highlight.Parent = a.Handle
                                end

                                if _G.EspGui and not a.Handle:FindFirstChild("Esp_Gui") then
                                    local BillboardGui = Instance.new("BillboardGui")
                                    BillboardGui.Name = "Esp_Gui"
                                    BillboardGui.Size = UDim2.new(0, 150, 0, 40)
                                    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                                    BillboardGui.AlwaysOnTop = true
                                    BillboardGui.Parent = a.Handle

                                    local TextLabel = Instance.new("TextLabel")
                                    TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                    TextLabel.BackgroundTransparency = 1
                                    TextLabel.Text = "钥匙"
                                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                                    TextLabel.TextScaled = true
                                    TextLabel.Font = Enum.Font.SourceSansBold
                                    TextLabel.Parent = BillboardGui

                                    local UIStroke = Instance.new("UIStroke")
                                    UIStroke.Color = Color3.new(0, 0, 0)
                                    UIStroke.Thickness = 1.5
                                    UIStroke.Parent = TextLabel
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        else
            -- Clean up all key ESP when disabled
            for _, a in pairs(Workspace.Effects:GetChildren()) do
                if a.Name:find("DroppedKey") and a:FindFirstChild("Handle") then
                    for _, z in pairs(a.Handle:GetChildren()) do
                        if z.Name:find("Esp_") then
                            z:Destroy()
                        end
                    end
                end
            end
        end
    end
})

TabHandles.HideSeekESP:Toggle({
    Title = "躲藏玩家透视",
    Desc = "显示躲藏的玩家",
    Value = false,
    Callback = function(value)
        _G.HidePlayer = value
        if value then
            task.spawn(function()
                while _G.HidePlayer do
                    pcall(function()
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v ~= Player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
                                if v:GetAttribute("IsHider") then
                                    -- Clean existing ESP first
                                    for _, z in pairs(v.Character.Head:GetChildren()) do
                                        if z.Name:find("Esp_") then
                                            z:Destroy()
                                        end
                                    end

                                    if _G.EspHighlight and not v.Character.Head:FindFirstChild("Esp_Highlight") then
                                        local Highlight = Instance.new("Highlight")
                                        Highlight.Name = "Esp_Highlight"
                                        Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                                        Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                                        Highlight.FillTransparency = 0.5
                                        Highlight.OutlineTransparency = 0
                                        Highlight.Adornee = v.Character
                                        Highlight.Parent = v.Character.Head
                                    end

                                    if _G.EspGui and not v.Character.Head:FindFirstChild("Esp_Gui") then
                                        local BillboardGui = Instance.new("BillboardGui")
                                        BillboardGui.Name = "Esp_Gui"
                                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                        BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                                        BillboardGui.AlwaysOnTop = true
                                        BillboardGui.Parent = v.Character.Head

                                        local TextLabel = Instance.new("TextLabel")
                                        TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                        TextLabel.BackgroundTransparency = 1
                                        TextLabel.Text = v.Name .. " (躲藏中)"
                                        TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                        TextLabel.TextScaled = true
                                        TextLabel.Font = Enum.Font.SourceSansBold
                                        TextLabel.Parent = BillboardGui

                                        local UIStroke = Instance.new("UIStroke")
                                        UIStroke.Color = Color3.new(0, 0, 0)
                                        UIStroke.Thickness = 1.5
                                        UIStroke.Parent = TextLabel
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        else
            -- Clean up all player ESP when disabled
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= Player and v.Character and v.Character:FindFirstChild("Head") then
                    for _, z in pairs(v.Character.Head:GetChildren()) do
                        if z.Name:find("Esp_") then
                            z:Destroy()
                        end
                    end
                end
            end
        end
    end
})

-- Hide & Seek Teleport Tab
TabHandles.HideSeekTeleport:Button({
    Title = "一键收集全部钥匙",
    Desc = "自动收集钥匙",
    Icon = "key",
    Callback = function()
        if Player:GetAttribute("IsHider") and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local OldCFrame = Player.Character.HumanoidRootPart.CFrame
            for _, a in pairs(Workspace.Effects:GetChildren()) do
                if a.Name:find("DroppedKey") and a:FindFirstChild("Handle") then
                    Player.Character.HumanoidRootPart.CFrame = a.Handle.CFrame
                    wait(0.5)
                end
            end
            Player.Character.HumanoidRootPart.CFrame = OldCFrame
            WindUI:Notify({
                Title = "收集完成",
                Content = "已收集全部钥匙",
                Icon = "check",
                Duration = 3
            })
        end
    end
})

TabHandles.HideSeekTeleport:Button({
    Title = "传送到躲藏玩家",
    Desc = "传送到躲藏玩家身边",
    Icon = "eye",
    Callback = function()
        for i, v in pairs(game.Players:GetChildren()) do
            if v ~= Player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
                if v:GetAttribute("IsHider") and v.Character.Humanoid.Health > 0 then
                    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    WindUI:Notify({
                        Title = "传送成功",
                        Content = "已传送到 " .. v.Name,
                        Icon = "move",
                        Duration = 2
                    })
                    break
                end
            end
        end
    end
})

-- Player Movement Tab
TabHandles.Movement:Slider({
    Title = "移动速度",
    Desc = "自定义你的移速",
    Value = { Min = 16, Max = 1000, Default = 50 },
    Callback = function(val)
        _G.Speed = val
        if _G.AutoSpeed and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = val
        end
    end
})

TabHandles.Movement:Toggle({
    Title = "开启移速",
    Desc = "变成闪电侠",
    Value = false,
    Callback = function(value)
        _G.AutoSpeed = value
        if value and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = _G.Speed or 50
        elseif Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = 16
        end
    end
})

TabHandles.Movement:Toggle({
    Title = "无限跳",
    Desc = "踏空",
    Value = false,
    Callback = function(value)
        _G.InfiniteJump = value
    end
})

-- Float Feature
TabHandles.Movement:Toggle({
    Title = "锁定高度",
    Desc = "锁定你所在位置高度",
    Value = false,
    Callback = function(value)
        _G.Float = value
        if value then
            FloatConnection = RunService.Heartbeat:Connect(function()
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = Player.Character.HumanoidRootPart
                    local bodyVelocity = rootPart:FindFirstChild("FloatVelocity")

                    if not bodyVelocity then
                        bodyVelocity = Instance.new("BodyVelocity")
                        bodyVelocity.Name = "FloatVelocity"
                        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        bodyVelocity.Parent = rootPart
                    end
                end
            end)
            WindUI:Notify({
                Title = "锁定高度已开启",
                Content = "已开启",
                Icon = "move",
                Duration = 2
            })
        else
            if FloatConnection then
                FloatConnection:Disconnect()
                FloatConnection = nil
            end
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                local bodyVelocity = Player.Character.HumanoidRootPart:FindFirstChild("FloatVelocity")
                if bodyVelocity then
                    bodyVelocity:Destroy()
                end
            end
            WindUI:Notify({
                Title = "锁定高度已关闭",
                Content = "已关闭",
                Icon = "move",
                Duration = 2
            })
        end
    end
})

-- NoClip Feature
TabHandles.Movement:Toggle({
    Title = "穿墙",
    Desc = "穿墙",
    Value = false,
    Callback = function(value)
        _G.NoClip = value
        if value then
            NoClipConnection = RunService.Stepped:Connect(function()
                if Player.Character then
                    for _, part in pairs(Player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            WindUI:Notify({
                Title = "穿墙已开启",
                Content = "可自由穿透",
                Icon = "move",
                Duration = 2
            })
        else
            if NoClipConnection then
                NoClipConnection:Disconnect()
                NoClipConnection = nil
            end
            if Player.Character then
                for _, part in pairs(Player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            WindUI:Notify({
                Title = "穿墙已关闭",
                Content = "穿墙已关闭",
                Icon = "move",
                Duration = 2
            })
        end
    end
})

-- Player Utilities Tab
TabHandles.Utilities:Toggle({
    Title = "自动跳过对话",
    Desc = "自动跳过所有剧情对话",
    Value = false,
    Callback = function(value)
        _G.AutoSkip = value
        if value then
            task.spawn(function()
                while _G.AutoSkip do
                    pcall(function()
                        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DialogueRemote"):FireServer("Skipped")
                        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TemporaryReachedBindable"):FireServer()
                    end)
                    task.wait(0.8)
                end
            end)
        end
    end
})

TabHandles.Utilities:Toggle({
    Title = "零交互延迟",
    Desc = "去除所有交互按钮的按住时间",
    Value = false,
    Callback = function(value)
        _G.NoCooldownProximity = value
        if value then
            for i, v in pairs(Workspace:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    v.HoldDuration = 0
                end
            end
            if CooldownProximity then
                CooldownProximity:Disconnect()
            end
            CooldownProximity = Workspace.DescendantAdded:Connect(function(Cooldown)
                if _G.NoCooldownProximity and Cooldown:IsA("ProximityPrompt") then
                    Cooldown.HoldDuration = 0
                end
            end)
        else
            if CooldownProximity then
                CooldownProximity:Disconnect()
                CooldownProximity = nil
            end
        end
    end
})

TabHandles.Utilities:Toggle({
    Title = "性能优化",
    Desc = "降低画质提升帧率",
    Value = false,
    Callback = function(value)
        _G.AntiLag = value
        if value then
            local Terrain = Workspace:FindFirstChildOfClass("Terrain")
            if Terrain then
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 1
            end
            game.Lighting.GlobalShadows = false
            game.Lighting.FogEnd = 9e9
            game.Lighting.FogStart = 9e9

            task.spawn(function()
                while _G.AntiLag do
                    pcall(function()
                        for i, v in pairs(Workspace:FindFirstChild("Effects"):GetChildren()) do
                            PartLagDe(v)
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

TabHandles.Utilities:Toggle({
    Title = "防被甩飞",
    Desc = "防止被出生甩飞",
    Value = false,
    Callback = function(value)
        _G.AntiFling = value
        while _G.AntiFling do
            pcall(function()
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    Player.Character.HumanoidRootPart.Anchored = true
                    Player.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    Player.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    Player.Character.HumanoidRootPart.Anchored = false
                end
            end)
            task.wait(0.1)
        end
    end
})

-- Other Games Tab
TabHandles.OtherGames:Button({
    Title = "一键完成跳绳",
    Desc = "直接传送到跳绳终点",
    Icon = "activity",
    Callback = function()
        pcall(function()
            if Workspace:FindFirstChild("JumpRope") and Workspace.JumpRope:FindFirstChild("Important") then
                local model = Workspace.JumpRope.Important:FindFirstChild("Model")
                if model and model:FindFirstChild("LEGS") then
                    local pos = model.LEGS.Position
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos, pos + Vector3.new(0, 0, -1))
                    WindUI:Notify({
                        Title = "完成",
                        Content = "已通关",
                        Icon = "check",
                        Duration = 3
                    })
                end
            end
        end)
    end
})

TabHandles.OtherGames:Button({
    Title = "玻璃桥透视",
    Desc = "显示玻璃桥安全玻璃",
    Icon = "eye",
    Callback = function()
        pcall(function()
            if Workspace:FindFirstChild("GlassBridge") then
                local GlassHolder = Workspace.GlassBridge:FindFirstChild("GlassHolder")
                if GlassHolder then
                    for i, v in pairs(GlassHolder:GetChildren()) do
                        for k, j in pairs(v:GetChildren()) do
                            if j:IsA("Model") and j.PrimaryPart then
                                local isSafe = not j.PrimaryPart:GetAttribute("exploitingisevil")
                                local Color = isSafe and Color3.fromRGB(28, 235, 87) or Color3.fromRGB(248, 87, 87)
                                j.PrimaryPart.Color = Color
                                j.PrimaryPart.Transparency = 0
                                j.PrimaryPart.Material = Enum.Material.Neon
                            end
                        end
                    end
                    WindUI:Notify({
                        Title = "玻璃桥透视",
                        Content = "已开启",
                        Icon = "eye",
                        Duration = 3
                    })
                end
            end
        end)
    end
})

TabHandles.OtherGames:Button({
    Title = "一键通过玻璃桥",
    Desc = "直接传送到玻璃桥终点",
    Icon = "zap",
    Callback = function()
        pcall(function()
            if Workspace:FindFirstChild("GlassBridge") and Workspace.GlassBridge:FindFirstChild("End") and Workspace.GlassBridge.End.PrimaryPart then
                local pos = Workspace.GlassBridge.End.PrimaryPart.Position + Vector3.new(0, 8, 0)
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos, pos + Vector3.new(0, 0, -1))
                WindUI:Notify({
                    Title = "已通关",
                    Content = "已传送到终点",
                    Icon = "check",
                    Duration = 3
                })
            end
        end)
    end
})

TabHandles.OtherGames:Toggle({
    Title = "自动抱团",
    Desc = "自动完成抱团小游戏",
    Value = false,
    Callback = function(value)
        _G.AutoMingle = value
        while _G.AutoMingle do
            pcall(function()
                for i, v in ipairs(Player.Character:GetChildren()) do
                    if v.Name == "RemoteForQTE" then
                        v:FireServer()
                    end
                end
            end)
            task.wait(0.1)
        end
    end
})


-- Final notification
WindUI:Notify({
    Title = "Rb脚本中心-付费版",
    Content = "加载完成",
    Icon = "zap",
    Duration = 5
})
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "成功", 
	Icon = "rbxassetid://119970903874014" 
})()
else
local WindUI = loadstring(game:HttpGet("https://pastebin.com/raw/qYYUTE4g"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "ru",
    Translations = {
        ["ru"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Пример",
            ["WELCOME"] = "Добро пожаловать в WindUI!",
            ["LIB_DESC"] = "Библиотека для создания красивых интерфейсов",
            ["SETTINGS"] = "Настройки",
            ["APPEARANCE"] = "Внешний вид",
            ["FEATURES"] = "Функционал",
            ["UTILITIES"] = "Инструменты",
            ["UI_ELEMENTS"] = "UI Элементы",
            ["CONFIGURATION"] = "Конфигурация",
            ["SAVE_CONFIG"] = "Сохранить конфигурацию",
            ["LOAD_CONFIG"] = "Загрузить конфигурацию",
            ["THEME_SELECT"] = "Выберите тему",
            ["TRANSPARENCY"] = "Прозрачность окна"
        },
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Example",
            ["WELCOME"] = "Welcome to WindUI!",
            ["LIB_DESC"] = "Beautiful UI library for Roblox",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency"
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local Confirmed = false

WindUI:Popup({
    Title = gradient("RbScript Hub", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
    Icon = "sparkles",
    IconThemed = true,
    Content = "欢迎使用付费版！",
    Buttons = {{
        Title = "取消",
        -- Icon = "",
        Callback = function()
        end,
        Variant = "Secondary" -- Primary, Secondary, Tertiary
    }, {
        Title = "确认",
        Icon = "arrow-right",
        Callback = function()
            Confirmed = true
        end,
        Variant = "Primary" -- Primary, Secondary, Tertiary
    }}
})

WindUI.Services.LuarmorService = {
    Name = "Luarmor 验证",
    Icon = "key",
    Args = {"ScriptId", "Discord"},
    New = function(ScriptId, Discord)
        print("初始化Luarmor服务: ScriptId=", ScriptId, "Discord=", Discord)
        
        -- 安全加载Luarmor库
        local success, API = pcall(function()
            return loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
        end)
        
        if not success or not API then
            warn("无法加载Luarmor库: " .. tostring(API))
            return {
                Verify = function() return false, "服务初始化失败" end,
                Copy = function() return "无法复制" end
            }
        end
        
        API.script_id = ScriptId
        
        return {
            Verify = function(key)
                print("验证卡密: " .. tostring(key))
                local status = API.check_key(key)
                
                if not status then
                    warn("验证API返回nil")
                    return false, "验证服务无响应"
                end
                
                print("验证状态: ", status.code, " - ", status.message)
                
                if status.code == "KEY_VALID" then
                    return true, "验证成功"
                elseif status.code == "KEY_HWID_LOCKED" then
                    return false, "HWID不匹配，请通过Discord重置"
                elseif status.code == "KEY_EXPIRED" then
                    return false, "卡密已过期"
                else
                    return false, "卡密无效 (" .. (status.message or "未知错误") .. ")"
                end
            end,
            
            Copy = function()
                print("复制Discord链接: " .. Discord)
                if setclipboard then
                    setclipboard(Discord)
                elseif toclipboard then
                    toclipboard(Discord)
                else
                    return "无法复制，注入器不支持剪贴板操作"
                end
                return "Discord链接已复制"
            end
        }
    end
}

local Window = WindUI:CreateWindow({
    Title = "Rb脚本中心",
    Icon = "rbxassetid://105933835532108",
    Author = "付费版 Yungengxin",
    Folder = "脚本中心",
    Size = UDim2.fromOffset(480, 360),
    Theme = "Dark",
    Background = WindUI:Gradient({
        ["0"] = {
            Color = Color3.fromHex("#0f0c29"),
            Transparency = 1
        },
        ["100"] = {
            Color = Color3.fromHex("#302b63"),
            Transparency = 0.9
        }
    }, {
        Rotation = 45
    }),
    Background = "rbxassetid://133155269071576",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()

            WindUI:Notify({
                Title = "您的用户ID：",
                Content = (game:GetService("Players").LocalPlayer.UserId),
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
KeySystem = {
        Note = "请输入您的卡密进行验证",
        Thumbnail = {
            Image = "rbxassetid://119970903874014",
            Title = "Rb脚本中心"
        },
        API = {{
            Type = "LuarmorService",  -- 使用新的服务名称
            ScriptId = "6fa2f5b2bc6d2ae88b069bdb76c0e1e8",  -- 确保这是正确的ScriptId
            Discord = "https://ads.luarmor.net/get_key?for=Rb_Script_HUB_FFB-AGCdDBQkFGED"  -- 确保这是正确的Discord链接
        }},
        SaveKey = false
    },
    HideSearchBar = false,
    ScrollBarEnabled = true
})

if Window.KeySystem and Window.KeySystem.API then
    local service = Window.KeySystem.API[1]
    if service and service.Verify then
        -- 在实际验证流程中，这里会调用service:Verify(key)
        print("服务验证函数可用")
    else
        warn("服务验证函数不可用")
    end
else
    warn("KeySystem API未正确初始化")
end

local UserGui = Instance.new("ScreenGui", game.CoreGui)
local UserLabel = Instance.new("TextLabel", UserGui)
local UIGradient = Instance.new("UIGradient")

UserGui.Name = "UserGui"
UserGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UserGui.Enabled = true
UserLabel.Name = "UserLabel"
UserLabel.BackgroundColor3 = Color3.new(1, 1, 1)
UserLabel.BackgroundTransparency = 1
UserLabel.BorderColor3 = Color3.new(0, 0, 0)
UserLabel.Position = UDim2.new(0.80, 0.80, 0.00090, 0)
UserLabel.Size = UDim2.new(0, 135, 0, 50)
UserLabel.Font = Enum.Font.GothamSemibold
UserLabel.Text = "尊敬的：" .. game.Players.LocalPlayer.Character.Name ..
                     "付费版用户，欢迎使用Rb脚本中心！"
UserLabel.TextColor3 = Color3.new(1, 1, 1)
UserLabel.TextScaled = true
UserLabel.TextSize = 14
UserLabel.TextWrapped = true
UserLabel.Visible = true

UIGradient.Color = ColorSequence.new {ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                                      ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
                                      ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
                                      ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
                                      ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
                                      ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
                                      ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
                                      ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
                                      ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
                                      ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
                                      ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))}
UIGradient.Rotation = 10
UIGradient.Parent = UserLabel

local TweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(UIGradient, tweeninfo, {
    Rotation = 360
})
tween:Play()

Window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromHex("#30ff6a")
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "Theme Changed",
        Content = "Current theme: " .. WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

Window:CreateTopbarButton("MyCustomButton2", "droplet-off",  function()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local API_KEY = "sk-aa4018ed6a5745dc844fd78ef81a1c09"
local MODEL = "deepseek-chat"

local old = PlayerGui:FindFirstChild("CuteAI_ChatUI")
if old then old:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CuteAI_ChatUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 360)
frame.Position = UDim2.new(0.5, -210, 0.5, -180)
frame.BackgroundColor3 = Color3.fromRGB(255, 240, 245)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- ===== 侧边栏（人设设置） =====
local sidebar = Instance.new("Frame", frame)
sidebar.Size = UDim2.new(0, 160, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(240, 220, 240)
sidebar.BorderSizePixel = 0
sidebar.Position = UDim2.new(0, -160, 0, 0)
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

-- 人设输入框
local personaBox = Instance.new("TextBox", sidebar)
personaBox.Size = UDim2.new(1, -20, 0, 100)
personaBox.Position = UDim2.new(0, 10, 0, 10)
personaBox.Text = "你是\\Rb娘化版·小云\\，一个可爱活泼的二次元AI助手，温柔贴心，使用中文，带点颜文字(≧▽≦)"
personaBox.TextWrapped = true
personaBox.TextSize = 14
personaBox.ClearTextOnFocus = false
personaBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
personaBox.TextColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", personaBox).CornerRadius = UDim.new(0, 8)

-- 新建对话按钮
local newChatBtn = Instance.new("TextButton", sidebar)
newChatBtn.Size = UDim2.new(1, -20, 0, 30)
newChatBtn.Position = UDim2.new(0, 10, 0, 120)
newChatBtn.Text = "+ 新建对话"
newChatBtn.Font = Enum.Font.GothamBold
newChatBtn.TextSize = 14
newChatBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 220)
newChatBtn.TextColor3 = Color3.fromRGB(80, 40, 60)
Instance.new("UICorner", newChatBtn).CornerRadius = UDim.new(0, 8)

-- 按钮 hover 效果函数
local function styleButton(btn, default, hover, pressed)
    btn.TextColor3 = default
    btn.MouseEnter:Connect(function()
        btn.TextColor3 = hover
    end)
    btn.MouseLeave:Connect(function()
        btn.TextColor3 = default
    end)
    btn.MouseButton1Down:Connect(function()
        btn.TextColor3 = pressed
        btn.TextSize = btn.TextSize - 2
    end)
    btn.MouseButton1Up:Connect(function()
        btn.TextColor3 = hover
        btn.TextSize = btn.TextSize + 2
    end)
end

styleButton(newChatBtn, Color3.fromRGB(80,40,60), Color3.fromRGB(120,50,80), Color3.fromRGB(40,20,40))

-- 使用说明
local usageLabel = Instance.new("TextLabel", sidebar)
usageLabel.Size = UDim2.new(1, -20, 0, 180)
usageLabel.Position = UDim2.new(0, 10, 0, 160)
usageLabel.TextWrapped = true
usageLabel.Font = Enum.Font.Gotham
usageLabel.TextSize = 14
usageLabel.TextColor3 = Color3.fromRGB(60, 40, 80)
usageLabel.BackgroundTransparency = 1
usageLabel.TextXAlignment = Enum.TextXAlignment.Left
usageLabel.TextYAlignment = Enum.TextYAlignment.Top
usageLabel.Text = "💡 使用说明：\n" ..
    "1. 输入文字即可和小云聊天。\n" ..
    "2. 点击『新建对话』会清空旧消息并应用当前人设。\n" ..
    "3. 小云会记住当前 Roblox 游戏的信息，当你询问与游戏相关的信息时会自动回答。\n" ..
    "4. 也可以问其他问题，小云会像普通 AI 一样回答。\n"

-- 制作者署名
local creditLabel = Instance.new("TextLabel", sidebar)
creditLabel.Size = UDim2.new(1, -20, 0, 20)
creditLabel.Position = UDim2.new(0, 10, 1, -25)
creditLabel.Text = "--- Yungengxin制作 ---"
creditLabel.Font = Enum.Font.Gotham
creditLabel.TextSize = 12
creditLabel.TextColor3 = Color3.fromRGB(120, 100, 140)
creditLabel.BackgroundTransparency = 1
creditLabel.TextXAlignment = Enum.TextXAlignment.Center

-- 聊天框
local chatBox = Instance.new("ScrollingFrame", frame)
chatBox.Size = UDim2.new(1, -20, 1, -96)
chatBox.Position = UDim2.new(0, 10, 0, 40)
chatBox.BackgroundTransparency = 1
chatBox.BorderSizePixel = 0
chatBox.ScrollBarThickness = 6
chatBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
chatBox.CanvasSize = UDim2.new(0, 0, 0, 0)
local list = Instance.new("UIListLayout", chatBox)
list.Padding = UDim.new(0, 6)
list.SortOrder = Enum.SortOrder.LayoutOrder

-- 标题栏
local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(230, 200, 230)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", titleBar)
title.Text = "Rb脚本中心AI · 小云 v_1.0.0"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(90, 50, 80)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -200, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)

-- 缩小按钮
local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 60, 0, 30)
minimizeBtn.Position = UDim2.new(1, -90, 0, 0)
minimizeBtn.Text = "—"
minimizeBtn.TextSize = 22
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BackgroundColor3 = Color3.fromRGB(230,200,230)
minimizeBtn.BorderSizePixel = 0
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)
styleButton(minimizeBtn, Color3.fromRGB(80,80,80), Color3.fromRGB(40,40,40), Color3.fromRGB(20,20,20))

-- 清空按钮
local clearBtn = Instance.new("TextButton", titleBar)
clearBtn.Size = UDim2.new(0, 30, 0, 30)
clearBtn.Position = UDim2.new(1, -150, 0, 0)
clearBtn.Text = "🗑"
clearBtn.TextSize = 18
clearBtn.Font = Enum.Font.GothamBold
clearBtn.BackgroundColor3 = Color3.fromRGB(255,220,220)
clearBtn.TextColor3 = Color3.fromRGB(180,0,0)
clearBtn.BorderSizePixel = 0
Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 8)
styleButton(clearBtn, Color3.fromRGB(180,0,0), Color3.fromRGB(255,0,0), Color3.fromRGB(120,0,0))

-- 关闭按钮
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "X"
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(255,200,200)
closeBtn.TextColor3 = Color3.fromRGB(200,50,50)
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
styleButton(closeBtn, Color3.fromRGB(200,50,50), Color3.fromRGB(255,0,0), Color3.fromRGB(150,0,0))

-- 输入框和发送按钮
local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(1, -100, 0, 44)
input.Position = UDim2.new(0, 10, 1, -54)
input.PlaceholderText = "和小云聊天"
input.Text = ""
input.TextSize = 18
input.ClearTextOnFocus = false
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
input.TextColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local sendBtn = Instance.new("TextButton", frame)
sendBtn.Size = UDim2.new(0, 70, 0, 44)
sendBtn.Position = UDim2.new(1, -80, 1, -54)
sendBtn.Text = "发送"
sendBtn.TextSize = 18
sendBtn.Font = Enum.Font.GothamBold
sendBtn.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
sendBtn.TextColor3 = Color3.fromRGB(90, 50, 80)
Instance.new("UICorner", sendBtn).CornerRadius = UDim.new(0, 8)
styleButton(sendBtn, Color3.fromRGB(90,50,80), Color3.fromRGB(120,70,100), Color3.fromRGB(60,30,50))

-- 输入提示
local typing = Instance.new("TextLabel", frame)
typing.Text = ""
typing.Font = Enum.Font.Gotham
typing.TextSize = 14
typing.TextColor3 = Color3.fromRGB(140, 120, 140)
typing.BackgroundTransparency = 1
typing.Size = UDim2.new(1, -20, 0, 18)
typing.Position = UDim2.new(0, 10, 1, -78)

-- ============ Roblox API 游戏信息 ============
local function getLocalGameInfo()
    return {
        name = game.Name,
        placeId = game.PlaceId,
        universeId = game.GameId,
        players = Players.NumPlayers
    }
end

local function fetchGameDetails(universeId)
    local success, result = pcall(function()
        return HttpService:GetAsync("https://games.roblox.com/v1/games?universeIds=" .. tostring(universeId))
    end)

    if success then
        local data = HttpService:JSONDecode(result)
        if data.data and #data.data > 0 then
            local gameInfo = data.data[1]
            return {
                name = gameInfo.name,
                description = gameInfo.description,
                creatorName = gameInfo.creator and gameInfo.creator.name or "未知",
                creatorType = gameInfo.creator and gameInfo.creator.type or "未知",
                playing = gameInfo.playing,
                visits = gameInfo.visits,
                favorites = gameInfo.favoritedCount
            }
        end
    end
    return nil
end

local function formatGameInfo()
    local localInfo = getLocalGameInfo()
    local apiInfo = fetchGameDetails(localInfo.universeId)

    local text = string.format(
        "游戏名称: %s\\nPlaceId: %d\\nUniverseId: %d\\n当前玩家数: %d",
        localInfo.name, localInfo.placeId, localInfo.universeId, localInfo.players
    )

    if apiInfo then
        text = text .. string.format(
            "\\n描述: %s\\n作者: %s (%s)\\n在线人数: %d\\n总访问量: %d\\n收藏数: %d",
            apiInfo.description, apiInfo.creatorName, apiInfo.creatorType,
            apiInfo.playing, apiInfo.visits, apiInfo.favorites
        )
    end

    return text
end


-- ============ 聊天逻辑 ============
local currentHistory = {}
local persona = personaBox.Text

local function addBubble(sender, text, isMe, typingEffect)
    local container = Instance.new("Frame", chatBox)
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y

    local lbl = Instance.new("TextLabel", container)
    lbl.TextWrapped = true
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 16
    lbl.Text = ""
    lbl.AutomaticSize = Enum.AutomaticSize.Y
    lbl.Size = UDim2.new(0.7, 0, 0, 0)
    lbl.BackgroundColor3 = isMe and Color3.fromRGB(200, 230, 255) or Color3.fromRGB(255, 230, 240)
    lbl.TextColor3 = Color3.fromRGB(40, 40, 40)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 12)

    local pad = Instance.new("UIPadding", lbl)
    pad.PaddingTop = UDim.new(0, 8)
    pad.PaddingBottom = UDim.new(0, 8)
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)

    if isMe then
        lbl.AnchorPoint = Vector2.new(1, 0)
        lbl.Position = UDim2.new(1, -10, 0, 0)
    else
        lbl.AnchorPoint = Vector2.new(0, 0)
        lbl.Position = UDim2.new(0, 10, 0, 0)
    end

    lbl:GetPropertyChangedSignal("TextBounds"):Connect(function()
        container.Size = UDim2.new(1, 0, 0, lbl.TextBounds.Y + 16)
    end)

    if typingEffect then
        for i = 1, #text do
            lbl.Text = string.sub(text, 1, i)
            task.wait(0.03)
        end
    else
        lbl.Text = text
    end
end

local function buildSystemPrompt()
    local gameInfoText = formatGameInfo()
    return persona ..
        "\\n你运行在 Roblox 游戏环境中，可以参考以下当前游戏的详细信息回答问题（仅在用户询问游戏相关时使用）：\\n" ..
        gameInfoText ..
        "\\n另外，你了解 Roblox 平台相关的知识，请在需要时结合这些知识回答用户。"
end


local function newChat()
    busy = false
    currentHistory = {
        { role = "system", content = buildSystemPrompt() }
    }
    for _, child in ipairs(chatBox:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    addBubble("小云", "新会话已创建 (｡･ω･｡)ﾉ♡", false, true)
end

newChatBtn.MouseButton1Click:Connect(function()
    persona = personaBox.Text ~= "" and personaBox.Text or persona
    newChat()
end)

-- 清空功能
local function clearChat()
    busy = false
    currentHistory = {
        { role = "system", content = buildSystemPrompt() }
    }
    for _, child in ipairs(chatBox:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    addBubble("小云", "聊天记录已清空 (｡•́︿•̀｡)", false, true)
end
clearBtn.MouseButton1Click:Connect(clearChat)

-- AI 调用
local function callAI()
    local payload = {
        model = MODEL,
        messages = currentHistory
    }
    local requestData = {
        Url = "https://api.deepseek.com/v1/chat/completions",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer " .. API_KEY
        },
        Body = HttpService:JSONEncode(payload)
    }
    local response = HttpService:RequestAsync(requestData)
    if response.Success then
        local data = HttpService:JSONDecode(response.Body)
        if data.choices and data.choices[1] and data.choices[1].message then
            return data.choices[1].message.content
        else
            return "（API返回格式异常）"
        end
    else
        return "（请求失败：" .. tostring(response.StatusCode) .. "）"
    end
end

local busy = false
local timeoutDuration = 15 -- 超时时间（秒）

local function send(text)
    if busy then return end
    text = string.gsub(text, "^%s*(.-)%s*$", "%1")
    if text == "" then return end

    addBubble("你", text, true, false)
    input.Text = ""
    busy = true
    typing.Text = "小云正在输入…"

    local timestamp = tick()
    table.insert(currentHistory, { role = "user", content = text, timestamp = timestamp })

    task.delay(timeoutDuration, function()
        if busy and currentHistory[#currentHistory].timestamp == timestamp then
            busy = false
            typing.Text = ""
            addBubble("系统", "（请求超时，已自动解锁）", false, false)
        end
    end)

    local reply = callAI()
    table.insert(currentHistory, { role = "assistant", content = reply })

    typing.Text = ""
    addBubble("小云", reply, false, true)
    busy = false
end

sendBtn.MouseButton1Click:Connect(function()
    send(input.Text)
end)

input.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        send(input.Text)
    end
end)

-- 缩小逻辑
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        chatBox.Visible = false
        input.Visible = false
        sendBtn.Visible = false
        typing.Visible = false
        sidebar.Visible = false
        frame.Size = UDim2.new(0, 420, 0, 40)
    else
        chatBox.Visible = true
        input.Visible = true
        sendBtn.Visible = true
        typing.Visible = true
        sidebar.Visible = true
        frame.Size = UDim2.new(0, 420, 0, 360)
    end
end)

-- 关闭逻辑
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- 初始化
newChat() 

end,  989)

local Tabs = {
    Main = Window:Section({
        Title = "通用",
        Opened = true
    }),
    gn = Window:Section({
        Title = "功能",
        Opened = true
    }),
    Settings = Window:Section({
        Title = "UI设置",
        Opened = true
    }),
    Utilities = Window:Section({
        Title = "保存配置",
        Opened = true
    })
}

local TabHandles = {
    xx = Tabs.Main:Tab({
        Title = "游戏信息",
        Icon = "layout-grid"
    }),
    Elements = Tabs.Main:Tab({
        Title = "玩家功能",
        Icon = "layout-grid"
    }),
    gn = Tabs.gn:Tab({
        Title = "加载游戏",
        Icon = "layout-grid"
    }),
    Appearance = Tabs.Settings:Tab({
        Title = "UI外观",
        Icon = "brush"
    }),
    Config = Tabs.Utilities:Tab({
        Title = "调整配置",
        Icon = "settings"
    })
}

TabHandles.xx:Paragraph({
    Title = "您的游戏名称：",
    Desc = "" .. game:GetService("Players").LocalPlayer.DisplayName .. "",
    Buttons = {{
        Title = "复制您的名称",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("Players").LocalPlayer.DisplayName)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Icon = "copy",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Paragraph({
    Title = "您的游戏用户名：",
    Desc = "" .. game:GetService("Players").LocalPlayer.Name .. "",
    Buttons = {{
        Title = "复制您的用户名",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("Players").LocalPlayer.Name)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Paragraph({
    Title = "您的用户名ID：",
    Desc = "" .. game:GetService("Players").LocalPlayer.UserId .. "",
    Buttons = {{
        Title = "复制您的用户名ID",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("Players").LocalPlayer.UserId)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Paragraph({
    Title = "您的账号注册时间（天）：",
    Desc = "" .. game:GetService("Players").LocalPlayer.AccountAge .. "",
    Buttons = {{
        Title = "复制您的注册时间",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("Players").LocalPlayer.AccountAge)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Paragraph({
    Title = "您所在的服务器名称：",
    Desc = "" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "",
    Buttons = {{
        Title = "复制您所在的服务器名称",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Paragraph({
    Title = "您所在的服务器ID：",
    Desc = "" .. game.PlaceId .. "",
    Buttons = {{
        Title = "复制您所在的服务器ID",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard("无法复制")

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Paragraph({
    Title = "您的注入器：",
    Desc = "" .. identifyexecutor() .. "",
    Image = "rbxassetid://129287693322764",
    ImageSize = 42, -- default 30
    Thumbnail = "rbxassetid://94512740386917",
    ThumbnailSize = 120, -- Thumbnail height
    Buttons = {{
        Title = "测试您注入器的UNC",
        Variant = "Primary",
        Callback = function()
            Window:Dialog({
                Title = "Rb脚本中心",
                Content = "温馨提示：请勿点击多次，\n否则会造成游戏卡顿!",
                Icon = "bell",
                Buttons = {{
                    Title = "确定",
                    Variant = "Primary",
                    Callback = function()
                        print("ok")
                    end
                }}
            })
            loadstring(game:HttpGet "https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/unc")()

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "Rb脚本中心---提示：",
                Content = "已成功执行，请在控制台查看UNC！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

TabHandles.xx:Code({
    Title = "Rb脚本中心交流群（主群）",
    Code = [[https://qm.qq.com/q/csDfI4BZNm]]
})

TabHandles.xx:Code({
    Title = "Rb脚本中心交流群（Discord群）",
    Code = [[https://discord.gg/qZmW3PYd9T]]
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家速度",
    Desc = "speedwalk",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 16
    },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家速度V2",
    Desc = "tpwalk",
    Value = {
        Min = 0,
        Max = 10,
        Default = 0
    },
    Callback = function(value)
        local tpWalk = {}

        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")

        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")

        local teleportDistance = value -- 每次传送的距离
        local isTeleporting = true -- 是否正在传送

        -- 禁用所有与移动相关的状态
        local function DisableDefaultMovement()
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
        end

        -- 启用所有与移动相关的状态
        local function EnableDefaultMovement()
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
        end

        -- 自定义传送函数
        local function Teleport()
            if not isTeleporting or not rootPart or not humanoid then
                return
            end

            -- 获取移动方向
            local moveDirection = humanoid.MoveDirection
            if moveDirection.Magnitude == 0 then
                return -- 如果没有移动方向，则停止传送
            end

            -- 计算传送向量
            local teleportVector = moveDirection * teleportDistance

            -- 检测前方是否有障碍物
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {character}
            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

            local raycastResult = workspace:Raycast(rootPart.Position, teleportVector, raycastParams)

            if raycastResult then
                -- 如果有障碍物，调整传送向量
                teleportVector = (raycastResult.Position - rootPart.Position).Unit * teleportDistance
            end

            -- 更新位置
            rootPart.CFrame = rootPart.CFrame + teleportVector
        end

        -- 控制开关函数
        function tpWalk:Enabled(enabled)
            isTeleporting = enabled
            if enabled then
                DisableDefaultMovement()
            else
                EnableDefaultMovement()
            end
        end

        function tpWalk:GetEnabled()
            return isTeleporting
        end

        function tpWalk:SetSpeed(speed)
            teleportDistance = speed or 0.1
        end

        function tpWalk:GetSpeed()
            return teleportDistance
        end

        -- 每帧更新传送
        RunService.Heartbeat:Connect(function()
            if isTeleporting then
                Teleport()
            end
        end)

        return tpWalk
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家跳跃",
    Desc = "JumpPower",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 50
    },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家重力",
    Desc = "gravity",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 309
    },
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

TabHandles.Elements:Divider()

local featureToggle = TabHandles.Elements:Toggle({
    Title = "夜视",
    Desc = "使你的游戏亮度提高",
    Value = false,
    Callback = function(state)
        if state then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "夜视已开启，若仍不清楚可开启去雾功能" or "夜视已关闭",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

xrayEnabled = false
function xray()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChildWhichIsA("Humanoid") and
            not v.Parent.Parent:FindFirstChildWhichIsA("Humanoid") then
            v.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
        end
    end
end

local featureToggle = TabHandles.Elements:Toggle({
    Title = "地图透视",
    Desc = "Xray",
    Value = false,
    Callback = function(state)
        if state then
            xrayEnabled = true
            xray()
        else
            xrayEnabled = false
            xray()
        end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "地图透视已开启，若仍不清楚可开启其他视觉功能" or
                "地图透视已关闭",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local toggleState = false

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
function NoFog()
    local c = game.Lighting
    c.FogEnd = 100000
    for r, v in pairs(c:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end
TabHandles.Elements:Button({
    Title = "去雾",
    Desc = "一键去除游戏中的雾",
    Icon = "bell",
    Callback = function()
        NoFog()
        local Sound = Instance.new("Sound", game:GetService("SoundService"))
        Sound.SoundId = "rbxassetid://2865227271"
        Sound:Play()
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已去雾",
            Icon = "bell",
            Duration = 3
        })
    end
})
TabHandles.Elements:Divider()

TabHandles.Elements:Button({
    Title = "飞行",
    Desc = "传统的飞行",
    Icon = "bell",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/CPSm1udG"))()
        local Sound = Instance.new("Sound", game:GetService("SoundService"))
        Sound.SoundId = "rbxassetid://2865227271"
        Sound:Play()
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "成功加载飞行",
            Icon = "bell",
            Duration = 3
        })
    end
})

local wpgn

TabHandles.gn:Button({
    Title = "自动检测服务器并加载对应脚本",
    Icon = "bell",
    Callback = function()
if game.GameId == 3808081382 then  --- Doors Lobby
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", -- Required
	Text = "正在加载...最强战场...", -- Required
	Icon = "rbxassetid://119970903874014" -- Optional
})
local WindUI = loadstring(game:HttpGet("https://pastebin.com/raw/qYYUTE4g"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "ru",
    Translations = {
        ["ru"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Пример",
            ["WELCOME"] = "Добро пожаловать в WindUI!",
            ["LIB_DESC"] = "Библиотека для создания красивых интерфейсов",
            ["SETTINGS"] = "Настройки",
            ["APPEARANCE"] = "Внешний вид",
            ["FEATURES"] = "Функционал",
            ["UTILITIES"] = "Инструменты",
            ["UI_ELEMENTS"] = "UI Элементы",
            ["CONFIGURATION"] = "Конфигурация",
            ["SAVE_CONFIG"] = "Сохранить конфигурацию",
            ["LOAD_CONFIG"] = "Загрузить конфигурацию",
            ["THEME_SELECT"] = "Выберите тему",
            ["TRANSPARENCY"] = "Прозрачность окна"
        },
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Example",
            ["WELCOME"] = "Welcome to WindUI!",
            ["LIB_DESC"] = "Beautiful UI library for Roblox",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency"
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local Confirmed = false

WindUI:Popup({
    Title = gradient("RbScript Hub", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
    Icon = "sparkles",
    IconThemed = true,
    Content = "欢迎使用付费版！",
    Buttons = {
        {
            Title = "取消",
            --Icon = "",
            Callback = function() end,
            Variant = "Secondary", -- Primary, Secondary, Tertiary
        },
        {
            Title = "确认",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary", -- Primary, Secondary, Tertiary
        }
    }
})

repeat wait() until Confirmed

local UserGui = Instance.new("ScreenGui", game.CoreGui)
local UserLabel = Instance.new("TextLabel", UserGui)
local UIGradient = Instance.new("UIGradient")

UserGui.Name = "UserGui"
UserGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UserGui.Enabled = true
UserLabel.Name = "UserLabel"
UserLabel.BackgroundColor3 = Color3.new(1, 1, 1)
UserLabel.BackgroundTransparency = 1
UserLabel.BorderColor3 = Color3.new(0, 0, 0)
UserLabel.Position = UDim2.new(0.80, 0.80, 0.00090, 0)
UserLabel.Size = UDim2.new(0, 135, 0, 50)
UserLabel.Font = Enum.Font.GothamSemibold
UserLabel.Text = "尊敬的："..game.Players.LocalPlayer.Character.Name.."付费版用户，欢迎使用Rb脚本中心！"
UserLabel.TextColor3 = Color3.new(1, 1, 1)
UserLabel.TextScaled = true
UserLabel.TextSize = 14
UserLabel.TextWrapped = true
UserLabel.Visible = true

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
}
UIGradient.Rotation = 10
UIGradient.Parent = UserLabel

local TweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
tween:Play()



local Window = WindUI:CreateWindow({
    Title = "Rb脚本中心 | 最强战场",
    Icon = "rbxassetid://105933835532108",
    Author = "付费版 Yungengxin",
    Folder = "脚本中心",
    Size = UDim2.fromOffset(480, 360),
    Theme = "Dark",
    Background = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#0f0c29"), Transparency = 1 },
        ["100"] = { Color = Color3.fromHex("#302b63"), Transparency = 0.9 },
    }, {
        Rotation = 45,
    }),
    Background = "rbxassetid://133155269071576",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
        
            WindUI:Notify({
                Title = "您的用户ID：",
                Content = (game:GetService("Players").LocalPlayer.UserId),
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
    HideSearchBar = false,
    ScrollBarEnabled = true
})

Window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromHex("#30ff6a")
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "Theme Changed",
        Content = "Current theme: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

local Tabs = {
    Main = Window:Section({ Title = "通用", Opened = true }),
    gn = Window:Section({ Title = "功能", Opened = true }),
    Settings = Window:Section({ Title = "UI设置", Opened = true }),
    Utilities = Window:Section({ Title = "保存配置", Opened = true })
}

local TabHandles = {
    xx = Tabs.Main:Tab({ Title = "游戏信息", Icon = "layout-grid" }),
    Elements = Tabs.Main:Tab({ Title = "玩家功能", Icon = "layout-grid" }),
    gn = Tabs.gn:Tab({ Title = "游戏功能", Icon = "layout-grid" }),
    Appearance = Tabs.Settings:Tab({ Title = "UI外观", Icon = "brush" }),
    Config = Tabs.Utilities:Tab({ Title = "调整配置", Icon = "settings" })
}

TabHandles.xx:Paragraph({
    Title = "您的游戏名称：",
    Desc = ""..game:GetService("Players").LocalPlayer.DisplayName.."",
    Buttons = {
        {
            Title = "复制您的名称",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.DisplayName)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Icon = "copy",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您的游戏用户名：",
    Desc = ""..game:GetService("Players").LocalPlayer.Name.."",
    Buttons = {
        {
            Title = "复制您的用户名",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.Name)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您的用户名ID：",
    Desc = ""..game:GetService("Players").LocalPlayer.UserId.."",
    Buttons = {
        {
            Title = "复制您的用户名ID",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.UserId)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您的账号注册时间（天）：",
    Desc = ""..game:GetService("Players").LocalPlayer.AccountAge.."",
    Buttons = {
        {
            Title = "复制您的注册时间",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("Players").LocalPlayer.AccountAge)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您所在的服务器名称：",
    Desc = ""..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."",
    Buttons = {
        {
            Title = "复制您所在的服务器名称",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Paragraph({
    Title = "您所在的服务器ID：",
    Desc = ""..game.PlaceId.."",
    Buttons = {
        {
            Title = "复制您所在的服务器ID",
            Icon = "copy",
            Variant = "Primary",
            Callback = function() 
            
            setclipboard("无法复制")

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功复制！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})



TabHandles.xx:Paragraph({
    Title = "您的注入器：",
    Desc = ""..identifyexecutor().."",
    Image = "rbxassetid://129287693322764",
    ImageSize = 42, -- default 30
    Thumbnail = "rbxassetid://94512740386917",
    ThumbnailSize = 120, -- Thumbnail height
    Buttons = {
        {
            Title = "测试您注入器的UNC",
            Variant = "Primary",
            Callback = function() 
            Window:Dialog({
            Title = "Rb脚本中心",
            Content = "温馨提示：请勿点击多次，\n否则会造成游戏卡顿!",
            Icon = "bell",
            Buttons = {
                {
                    Title = "确定",
                    Variant = "Primary",
                    Callback = function() 
                        print("ok")
                    end,
                }
            }
        })
            loadstring(game:HttpGet"https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/unc")()

local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
		WindUI:Notify({
            Title = "Rb脚本中心---提示：",
            Content = "已成功执行，请在控制台查看UNC！",
            Icon = "bell",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })

            end,
            Icon = "bird",
        },
    }
})

TabHandles.xx:Code({
    Title = "Rb脚本中心交流群（主群）",
    Code = [[https://qm.qq.com/q/csDfI4BZNm]],
})

TabHandles.xx:Code({
    Title = "Rb脚本中心交流群（Discord群）",
    Code = [[https://discord.gg/qZmW3PYd9T]],
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家速度",
    Desc = "speedwalk",
    Value = { Min = 0, Max = 1000, Default = 16 },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家速度V2",
    Desc = "tpwalk",
    Value = { Min = 0, Max = 10, Default = 0 },
    Callback = function(value)
        local tpWalk = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local teleportDistance = value -- 每次传送的距离
local isTeleporting = true -- 是否正在传送

-- 禁用所有与移动相关的状态
local function DisableDefaultMovement()
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
end

-- 启用所有与移动相关的状态
local function EnableDefaultMovement()
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
end

-- 自定义传送函数
local function Teleport()
    if not isTeleporting or not rootPart or not humanoid then
        return
    end

    -- 获取移动方向
    local moveDirection = humanoid.MoveDirection
    if moveDirection.Magnitude == 0 then
        return -- 如果没有移动方向，则停止传送
    end

    -- 计算传送向量
    local teleportVector = moveDirection * teleportDistance

    -- 检测前方是否有障碍物
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = workspace:Raycast(rootPart.Position, teleportVector, raycastParams)

    if raycastResult then
        -- 如果有障碍物，调整传送向量
        teleportVector = (raycastResult.Position - rootPart.Position).Unit * teleportDistance
    end

    -- 更新位置
    rootPart.CFrame = rootPart.CFrame + teleportVector
end

-- 控制开关函数
function tpWalk:Enabled(enabled)
    isTeleporting = enabled
    if enabled then DisableDefaultMovement() else EnableDefaultMovement() end
end

function tpWalk:GetEnabled()
    return isTeleporting
end

function tpWalk:SetSpeed(speed)
    teleportDistance = speed or 0.1
end

function tpWalk:GetSpeed()
    return teleportDistance
end

-- 每帧更新传送
RunService.Heartbeat:Connect(function()
    if isTeleporting then
        Teleport()
    end
end)

return tpWalk
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家跳跃",
    Desc = "JumpPower",
    Value = { Min = 0, Max = 1000, Default = 50 },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

local intensitySlider = TabHandles.Elements:Slider({
    Title = "玩家重力",
    Desc = "gravity",
    Value = { Min = 0, Max = 1000, Default = 309 },
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})



TabHandles.Elements:Divider()

local featureToggle = TabHandles.Elements:Toggle({
    Title = "夜视",
    Desc = "使你的游戏亮度提高",
    Value = false,
    Callback = function(state) 
        if state then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
            else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
            end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "夜视已开启，若仍不清楚可开启去雾功能" or "夜视已关闭",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

xrayEnabled = false
function xray()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChildWhichIsA("Humanoid") and not v.Parent.Parent:FindFirstChildWhichIsA("Humanoid") then
            v.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
        end
    end
end

local featureToggle = TabHandles.Elements:Toggle({
    Title = "地图透视",
    Desc = "Xray",
    Value = false,
    Callback = function(state) 
        if state then
		    xrayEnabled = true
    xray()
            else
		    xrayEnabled = false
    xray()
            end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = state and "地图透视已开启，若仍不清楚可开启其他视觉功能" or "地图透视已关闭",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local toggleState = false

game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
function NoFog()
    local c = game.Lighting
    c.FogEnd = 100000
    for r, v in pairs(c:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end
TabHandles.Elements:Button({
    Title = "去雾",
    Desc = "一键去除游戏中的雾",
    Icon = "bell",
    Callback = function()
NoFog()
local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已去雾",
            Icon = "bell",
            Duration = 3
        })
    end
})
TabHandles.Elements:Divider()

TabHandles.Elements:Button({
    Title = "飞行",
    Desc = "传统的飞行",
    Icon = "bell",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/CPSm1udG"))()
local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "成功加载飞行",
            Icon = "bell",
            Duration = 3
        })
    end
})

local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
            local StarterGui = game:GetService("StarterGui")
            local RunService = game:GetService("RunService")
            local TweenService = game:GetService("TweenService")
            local UserInputService = game:GetService("UserInputService")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Camera = game:GetService('Workspace').CurrentCamera

            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Humanoid
            local HumanoidRootPart

local function SafeDebugPrint(message)
                print("[DEBUG] " .. message)
            end

            local function InitializeHumanoid()
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                if character then
                    Humanoid = character:FindFirstChild("Humanoid")
                    if Humanoid then
                        HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if not HumanoidRootPart then
                            SafeDebugPrint("HumanoidRootPart not found for " .. LocalPlayer.Name)
                        else
                            SafeDebugPrint("HumanoidRootPart initialized for " .. LocalPlayer.Name)
                        end
                    else
                        SafeDebugPrint("Humanoid not found for " .. LocalPlayer.Name)
                    end
                end
            end

            if LocalPlayer.Character then
                InitializeHumanoid()
            end

            LocalPlayer.CharacterAdded:Connect(InitializeHumanoid)

            local kenConfiguration = {
                Main = {
                    Combat = {
                        AttackAura = false,
                        AutoParry = false
                    },
                    Farm = {
                        KillFarm = false,
                        AutoUltimate = true
                    }
                },
                Player = {
                    Character = {
                        OverwriteProperties = false,
                        WalkSpeed = 50,
                        JumpPower = 50
                    }
                }
            }

            local Functions = {}

            function Functions.BestTarget(MaxDistance)
                MaxDistance = MaxDistance or math.huge
                local Target = nil
                local MinKills = math.huge

                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                        local rootPart = v.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                            local kills = v:GetAttribute("Kills") or 0

                            if distance < MaxDistance and kills < MinKills then
                                Target = v
                                MaxDistance = distance
                                MinKills = kills
                            end
                        end
                    end
                end

                SafeDebugPrint("Best target found: " .. (Target and Target.Name or "None"))
                return Target
            end

            function Functions.UseAbility(Ability)
                if not LocalPlayer.Character then
                    return
                end
                local Tool = LocalPlayer.Backpack:FindFirstChild(Ability)
                if Tool then
                    SafeDebugPrint("Using ability: " .. Ability)
                    LocalPlayer.Character.Communicate:FireServer(
                        {
                            Tool = Tool,
                            Goal = "Console Move",
                            ToolName = tostring(Ability)
                        }
                    )
                else
                    SafeDebugPrint("Ability not found: " .. Ability)
                end
            end

            function Functions.RandomAbility()
                if not LocalPlayer.PlayerGui:FindFirstChild("Hotbar") then
                    return nil
                end
                local Hotbar = LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
                local Abilities = {}

                for _, v in pairs(Hotbar:GetChildren()) do
                    if v.ClassName ~= "UIListLayout" and v.Visible and v.Base.ToolName.Text ~= "N/A" and not v.Base:FindFirstChild("Cooldown") then
                        table.insert(Abilities, v)
                    end
                end

                if #Abilities > 0 then
                    local RandomAbility = Abilities[math.random(1, #Abilities)]
                    return RandomAbility.Base.ToolName.Text
                else
                    SafeDebugPrint("No available abilities")
                    return nil
                end
            end

            function Functions.ActivateUltimate()
                local UltimateBar = LocalPlayer:GetAttribute("Ultimate") or 0
                if UltimateBar >= 100 then
                    LocalPlayer.Character.Communicate:FireServer(
                        {
                            MoveDirection = Vector3.new(0, 0, 0),
                            Key = Enum.KeyCode.G,
                            Goal = "KeyPress"
                        }
                    )
                    SafeDebugPrint("Ultimate activated")
                else
                    SafeDebugPrint("Ultimate not ready: " .. UltimateBar .. "%")
                end
            end

            function Functions.TeleportUnderPlayer(player)
                if not player.Character then
                    return
                end
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = rootPart.CFrame * CFrame.new(0, -5, 0)
                    LocalPlayer.Character:SetPrimaryPartCFrame(targetCFrame)
                    SafeDebugPrint("Teleported under player: " .. player.Name)
                else
                    SafeDebugPrint("Failed to teleport under player: " .. player.Name)
                end
            end

local gnDropdown = TabHandles.gn:Dropdown({
    Title = "地图传送",
    Values = { "地图", "山脉", "安全港", "秘密房间1", "秘密房间2" },
    Value = "地图",
    Callback = function(option)
                            if option == "地图" then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.4928513, 440.505829, -92.9229507)
                        elseif option == "山脉" then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(253.515198, 699.103455, 420.533813)
                        elseif option == "安全港" then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-774.454834, -137.237228, 126.384216)
                        elseif option == "秘密房间1" then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-62, 29, 20338)
                        elseif option == "秘密房间2" then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1068, 133, 23015)
                        end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "你已选择: "..option,
            Duration = 2
        })
    end
})

local TPYW

TabHandles.gn:Button({
    Title = "设置传送位置",
    Icon = "bell",
    Callback = function()
    TPYW = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已设置",
            Icon = "bell",
            Duration = 3
        })
    end
})

TabHandles.gn:Button({
    Title = "传送至设置位置",
    Icon = "bell",
    Callback = function()
                        if TPYW then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = TPYW
                        end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = "已传送",
            Icon = "bell",
            Duration = 3
        })
    end
})

TabHandles.gn:Toggle({
    Title = "好友白名单",
    Value = false,
    Callback = function(state)
        BCXZJHYT = state
    end
})

TabHandles.gn:Divider()

local AUTO_TRASH_MASTER = false

TabHandles.gn:Toggle({
    Title = "自动拾取垃圾桶攻击",
    Value = false,
    Callback = function(state)
        AUTO_TRASH_MASTER = state

                        if state then
                            task.spawn(
                                function()
                                    local Players = game:GetService("Players")
                                    local Workspace = game:GetService("Workspace")
                                    local RunService = game:GetService("RunService")
                                    local TRASH_RANGE = 15
                                    local PLAYER_RANGE = 100
                                    local PICKUP_DISTANCE = 2
                                    local ATTACK_DISTANCE = 2
                                    local HEIGHT_OFFSET = 3
                                    local localPlayer = Players.LocalPlayer
                                    local character, rootPart, humanoid

                                    local function updateCharacter()
                                        character = localPlayer.Character
                                        if character then
                                            rootPart = character:FindFirstChild("HumanoidRootPart")
                                            humanoid = character:FindFirstChildOfClass("Humanoid")
                                        else
                                            rootPart = nil
                                            humanoid = nil
                                        end
                                    end

                                    updateCharacter()
                                    localPlayer.CharacterAdded:Connect(updateCharacter)

                                    local function getTrashPart(trashModel)
                                        return trashModel:FindFirstChild("Handle") or trashModel:FindFirstChild("MainPart") or trashModel:FindFirstChild("TrashCan") or trashModel.PrimaryPart or trashModel:FindFirstChildWhichIsA("BasePart")
                                    end

                                    local function performAction(action)
                                        if AUTO_TRASH_MASTER and character then
                                            local communicate = character:FindFirstChild("Communicate")
                                            if communicate then
                                                communicate:FireServer({["Goal"] = action})
                                            end
                                        end
                                    end

                                    local function calculateOffsetPosition(targetPos, referencePos)
                                        local direction = (targetPos - referencePos).Unit
                                        direction = Vector3.new(direction.X, 0, direction.Z).Unit

                                        if direction.Magnitude < 0.1 then
                                            direction = Vector3.new(math.random(), 0, math.random()).Unit
                                        end

                                        return targetPos + (direction * PICKUP_DISTANCE)
                                    end

                                    local function calculateBehindPosition(targetRoot)
                                        local lookVector = targetRoot.CFrame.LookVector
                                        lookVector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit

                                        return targetRoot.Position - (lookVector * ATTACK_DISTANCE)
                                    end

                                    local function findNearestPlayer()
                                        if not rootPart then
                                            return nil, nil
                                        end

                                        local nearestPlayer = nil
                                        local nearestDistance = math.huge
                                        local targetPosition = nil

                                        for _, targetPlayer in ipairs(Players:GetPlayers()) do
                                            if targetPlayer ~= localPlayer and targetPlayer.Character then
                                                local targetChar = targetPlayer.Character
                                                local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                                                local targetHum = targetChar:FindFirstChildOfClass("Humanoid")

                                                if targetRoot and targetHum and targetHum.Health > 0 then
                                                    local distance = (rootPart.Position - targetRoot.Position).Magnitude
                                                    if distance <= PLAYER_RANGE and distance < nearestDistance then
                                                        nearestDistance = distance
                                                        nearestPlayer = targetPlayer
                                                        targetPosition = calculateBehindPosition(targetRoot)
                                                    end
                                                end
                                            end
                                        end

                                        return nearestPlayer, targetPosition
                                    end

                                    local function teleportTo(position, faceTarget)
                                        if rootPart and AUTO_TRASH_MASTER then
                                            local raycastParams = RaycastParams.new()
                                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                            raycastParams.FilterDescendantsInstances = {character}

                                            local groundPosition = position
                                            local ray = Workspace:Raycast(position + Vector3.new(0, 10, 0), Vector3.new(0, -20, 0), raycastParams)
                                            if ray and ray.Position then
                                                groundPosition = ray.Position + Vector3.new(0, HEIGHT_OFFSET, 0)
                                            else
                                                groundPosition = position + Vector3.new(0, HEIGHT_OFFSET, 0)
                                            end

                                            if faceTarget then
                                                local lookVector = (faceTarget - groundPosition).Unit
                                                rootPart.CFrame = CFrame.new(groundPosition, groundPosition + lookVector)
                                            else
                                                rootPart.CFrame = CFrame.new(groundPosition)
                                            end
                                        end
                                    end

                                    while AUTO_TRASH_MASTER and game:GetService("RunService").Heartbeat:Wait() do
                                        pcall(
                                            function()
                                                updateCharacter()
                                                if not character or not rootPart or not humanoid or humanoid.Health <= 0 then
                                                    task.wait(1)
                                                    return
                                                end

                                                if not character:GetAttribute("HasTrashcan") then
                                                    local trashFolder = Workspace:FindFirstChild("Trash") or (Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Trash"))

                                                    if not trashFolder then
                                                        task.wait(1)
                                                        return
                                                    end

                                                    local nearestTrash, nearestDistance, trashPosition
                                                    for _, trashModel in ipairs(trashFolder:GetChildren()) do
                                                        if trashModel:IsA("Model") then
                                                            local trashPart = getTrashPart(trashModel)
                                                            if trashPart then
                                                                local distance = (rootPart.Position - trashPart.Position).Magnitude
                                                                if distance <= TRASH_RANGE and (not nearestDistance or distance < nearestDistance) then
                                                                    nearestTrash = trashModel
                                                                    nearestDistance = distance
                                                                    trashPosition = trashPart.Position
                                                                end
                                                            end
                                                        end
                                                    end

                                                    if nearestTrash and trashPosition then
                                                        local offsetPosition = calculateOffsetPosition(trashPosition, rootPart.Position)

                                                        teleportTo(offsetPosition, trashPosition)
                                                        task.wait(0.2)

                                                        local direction = (trashPosition - rootPart.Position).Unit
                                                        local lookVector = Vector3.new(direction.X, 0, direction.Z).Unit
                                                        if lookVector.Magnitude > 0.1 then
                                                            rootPart.CFrame = CFrame.new(rootPart.Position, rootPart.Position + lookVector)
                                                        end

                                                        performAction("LeftClick")
                                                        task.wait(0.15)
                                                        performAction("LeftClickRelease")

                                                        local waitTime = 0
                                                        while waitTime < 2 and AUTO_TRASH_MASTER do
                                                            if character:GetAttribute("HasTrashcan") then
                                                                SafeDebugPrint("成功拾取垃圾桶")
                                                                break
                                                            end
                                                            task.wait(0.1)
                                                            waitTime = waitTime + 0.1
                                                        end
                                                    else
                                                        task.wait(1)
                                                    end
                                                else
                                                    local nearestPlayer, behindPos = findNearestPlayer()

                                                    if nearestPlayer and behindPos then
                                                        local targetChar = nearestPlayer.Character
                                                        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")

                                                        if not targetRoot then
                                                            task.wait(0.5)
                                                            return
                                                        end

                                                        teleportTo(behindPos, targetRoot.Position)
                                                        task.wait(0.2)

                                                        local direction = (targetRoot.Position - rootPart.Position).Unit
                                                        local lookVector = Vector3.new(direction.X, 0, direction.Z).Unit
                                                        if lookVector.Magnitude > 0.1 then
                                                            rootPart.CFrame = CFrame.new(rootPart.Position, rootPart.Position + lookVector)
                                                        end

                                                        performAction("LeftClick")
                                                        task.wait(0.1)
                                                        performAction("LeftClickRelease")

                                                        SafeDebugPrint("攻击玩家: " .. nearestPlayer.Name)

                                                        task.wait(1.5)
                                                    else
                                                        SafeDebugPrint("未找到可攻击玩家")
                                                        task.wait(1)
                                                    end
                                                end
                                            end
                                        )
                                    end
                                end
                            )
                        end
    end
})

TabHandles.gn:Divider()

local attackAuraConnection

TabHandles.gn:Toggle({
    Title = "自动攻击最近玩家",
    Value = false,
    Callback = function(state)
        kenConfiguration.Main.Combat.AttackAura = state
                        SafeDebugPrint("自动攻击: " .. tostring(state))

                        if attackAuraConnection then
                            attackAuraConnection:Disconnect()
                            attackAuraConnection = nil
                        end

                        if state then
                            attackAuraConnection =
                                RunService.RenderStepped:Connect(
                                function()
                                    if not kenConfiguration.Main.Combat.AttackAura then
                                        return
                                    end
                                    if not HumanoidRootPart or not LocalPlayer.Character then
                                        return
                                    end

                                    local NearestTarget = Functions.BestTarget(5)
                                    if NearestTarget then
                                        Functions.TeleportUnderPlayer(NearestTarget)
                                        local RandomAbility = Functions.RandomAbility()
                                        if RandomAbility then
                                            Functions.UseAbility(RandomAbility)
                                        else
                                            if kenConfiguration.Main.Farm.AutoUltimate then
                                                Functions.ActivateUltimate()
                                            end
                                        end
                                    end
                                end
                            )
                        end
    end
})

local killFarmConnection

TabHandles.gn:Toggle({
    Title = "自动战斗",
    Value = false,
    Callback = function(state)
        kenConfiguration.Main.Farm.KillFarm = state
                        SafeDebugPrint("杀戮光环: " .. tostring(state))

                        if killFarmConnection then
                            killFarmConnection:Disconnect()
                            killFarmConnection = nil
                        end

                        if state then
                            killFarmConnection =
                                RunService.RenderStepped:Connect(
                                function()
                                    if not kenConfiguration.Main.Farm.KillFarm then
                                        return
                                    end
                                    if not HumanoidRootPart or not LocalPlayer.Character then
                                        return
                                    end

                                    local BestTarget = Functions.BestTarget()
                                    if BestTarget then
                                        Functions.TeleportUnderPlayer(BestTarget)
                                        local RandomAbility = Functions.RandomAbility()
                                        if RandomAbility then
                                            Functions.UseAbility(RandomAbility)
                                        else
                                            if kenConfiguration.Main.Farm.AutoUltimate then
                                                Functions.ActivateUltimate()
                                            end
                                        end
                                    end
                                end
                            )
                        end
    end
})

local ZDGJT = false

TabHandles.gn:Toggle({
    Title = "自动攻击",
    Value = false,
    Callback = function(state)
        ZDGJT = state
                        if state then
                            task.spawn(
                                function()
                                    while ZDGJT and task.wait(0.3) do
                                        if Character then
                                            local communicate = Character:FindFirstChild("Communicate")
                                            if communicate then
                                                communicate:FireServer({["Goal"] = "LeftClick"})
                                                task.wait(0.05)
                                                communicate:FireServer({["Goal"] = "LeftClickRelease"})
                                            end
                                        end
                                    end
                                end
                            )
                        end
    end
})

TabHandles.gn:Toggle({
    Title = "自动觉醒",
    Value = false,
    Callback = function(state)
                        kenConfiguration.Main.Farm.AutoUltimate = state
                        SafeDebugPrint("自动终极技能: " .. tostring(state))
    end
})

local ELZRCSXKT = false

TabHandles.gn:Toggle({
    Title = "将敌方传送至虚空",
    Desc = "仅“英雄猎人”角色二技能",
    Value = false,
    Callback = function(state)
        ELZRCSXKT = state

                        local Players = game:GetService("Players")
                        local ReplicatedStorage = game:GetService("ReplicatedStorage")
                        local UserInputService = game:GetService("UserInputService")
                        local LocalPlayer = Players.LocalPlayer
                        local Backpack = LocalPlayer:WaitForChild("Backpack")
                        local targetToolName = "Lethal Whirlwind Stream"
                        if state then
                            Backpack.ChildAdded:Connect(
                                function(tool)
                                    if ELZRCSXKT and tool:IsA("Tool") and tool.Name == targetToolName then
                                        tool.Equipped:Connect(
                                            function()
                                                local A = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                                                task.wait(1)
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-62, 29, 20338)
                                                task.wait(3)
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = A
                                            end
                                        )
                                    end
                                end
                            )
                        end
    end
})

local ZDNLJTT = false

TabHandles.gn:Toggle({
    Title = "自动拿垃圾桶",
    Value = false,
    Callback = function(state)
        ZDNLJTT = state
                        if state then
                            task.spawn(
                                function()
                                    local Players = game:GetService("Players")
                                    local Workspace = game:GetService("Workspace")
                                    local TRASH_RANGE = 5

                                    while ZDNLJTT and task.wait(0.1) do
                                        pcall(
                                            function()
                                                local localPlayer = Players.LocalPlayer
                                                local character = localPlayer.Character

                                                if character then
                                                    local humanoid = character:FindFirstChild("Humanoid")
                                                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                                                    local trashFolder = Workspace:FindFirstChild("Trash") or (Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Trash"))

                                                    if trashFolder and rootPart then
                                                        local nearestTrash = nil
                                                        local nearestDistance = math.huge

                                                        for _, trashModel in pairs(trashFolder:GetChildren()) do
                                                            if trashModel:IsA("Model") then
                                                                local trashPosition = trashModel:GetPivot().Position
                                                                local distance = (rootPart.Position - trashPosition).Magnitude

                                                                if distance <= TRASH_RANGE and distance < nearestDistance then
                                                                    nearestDistance = distance
                                                                    nearestTrash = trashModel
                                                                end
                                                            end
                                                        end

                                                        if nearestTrash then
                                                            local trashPosition = nearestTrash:GetPivot().Position
                                                            local direction = (trashPosition - rootPart.Position).Unit

                                                            local lookVector = Vector3.new(direction.X, 0, direction.Z).Unit
                                                            rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + lookVector)

                                                            local communicate = character:FindFirstChild("Communicate")
                                                            if communicate and character:GetAttribute("HasTrashcan") == false then
                                                                communicate:FireServer({["Goal"] = "LeftClick"})
                                                                task.wait(0.05)
                                                                communicate:FireServer({["Goal"] = "LeftClickRelease"})
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        )
                                    end
                                end
                            )
                        end
    end
})

local awdawdwaT = false

TabHandles.gn:Toggle({
    Title = "屏蔽冲刺后摇",
    Desc = "仅电脑，或使用键盘脚本",
    Value = false,
    Callback = function(state)
        awdawdwaT = state

                        local plr = game:GetService("Players").LocalPlayer
                        local uis = game:GetService("UserInputService")
                        local isMobile = uis.TouchEnabled

                        getgenv()._TempestAlreadyRan = true

                        local frontDashArgs = {
                            [1] = {
                                Dash = Enum.KeyCode.W,
                                Key = Enum.KeyCode.Q,
                                Goal = "KeyPress"
                            }
                        }

                        local function frontDash()
                            if plr.Character then
                                local communicate = plr.Character:FindFirstChild("Communicate")
                                if communicate then
                                    communicate:FireServer(unpack(frontDashArgs))
                                end
                            end
                        end

                        local function stopAnimation(char, animationId)
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            if humanoid then
                                local animator = humanoid:FindFirstChildWhichIsA("Animator")
                                if animator then
                                    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                                        if track.Animation and track.Animation.AnimationId == "rbxassetid://" .. tostring(animationId) then
                                            track:Stop()
                                        end
                                    end
                                end
                            end
                        end

                        local function isAnimationRunning(char, animationId)
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            if humanoid then
                                local animator = humanoid:FindFirstChildWhichIsA("Animator")
                                if animator then
                                    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                                        if track.Animation and track.Animation.AnimationId == "rbxassetid://" .. tostring(animationId) then
                                            return true
                                        end
                                    end
                                end
                            end
                            return false
                        end

                        local function getMovementAngle(hrp, moveDirection)
                            if moveDirection.Magnitude == 0 then
                                return 0
                            end

                            local relativeMoveDir = hrp.CFrame:VectorToObjectSpace(moveDirection)
                            local angle = math.deg(math.atan2(relativeMoveDir.Z, relativeMoveDir.X))

                            return (angle + 360) % 360
                        end

                        local inputBeganConnections = {}
                        local characterAddedConnections = {}
                        local dashButtonConnections = {}

                        local function setupNoEndlagDash()
                            if not plr.Character then
                                return
                            end

                            local connection =
                                uis.InputBegan:Connect(
                                function(input, t)
                                    if t then
                                        return
                                    end

                                    if awdawdwaT and input.KeyCode == Enum.KeyCode.Q and not uis:IsKeyDown(Enum.KeyCode.D) and not uis:IsKeyDown(Enum.KeyCode.A) and not uis:IsKeyDown(Enum.KeyCode.S) and plr.Character:FindFirstChild("UsedDash") then
                                        frontDash()
                                    end
                                end
                            )

                            table.insert(inputBeganConnections, connection)

                            local destroyConn =
                                plr.Character.Destroying:Connect(
                                function()
                                    for i, conn in ipairs(inputBeganConnections) do
                                        if conn == connection then
                                            conn:Disconnect()
                                            table.remove(inputBeganConnections, i)
                                            break
                                        end
                                    end
                                    destroyConn:Disconnect()
                                end
                            )
                        end

                        local function setupEmoteDash()
                            if not plr.Character then
                                return
                            end

                            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                            if not hrp then
                                return
                            end

                            local connection =
                                uis.InputBegan:Connect(
                                function(input, t)
                                    if t then
                                        return
                                    end

                                    if awdawdwaT and input.KeyCode == Enum.KeyCode.Q and not uis:IsKeyDown(Enum.KeyCode.W) and not uis:IsKeyDown(Enum.KeyCode.S) and not isAnimationRunning(plr.Character, 10491993682) then
                                        local vel = hrp:FindFirstChild("dodgevelocity")
                                        if vel then
                                            vel:Destroy()
                                            stopAnimation(plr.Character, 10480793962)
                                            stopAnimation(plr.Character, 10480796021)
                                        end
                                    end
                                end
                            )

                            table.insert(inputBeganConnections, connection)

                            local destroyConn =
                                plr.Character.Destroying:Connect(
                                function()
                                    for i, conn in ipairs(inputBeganConnections) do
                                        if conn == connection then
                                            conn:Disconnect()
                                            table.remove(inputBeganConnections, i)
                                            break
                                        end
                                    end
                                    destroyConn:Disconnect()
                                end
                            )
                        end

                        local function setupMobileDash()
                            if not isMobile or not plr.Character then
                                return
                            end

                            local dashButton
                            local playerGui = plr:FindFirstChild("PlayerGui")
                            if playerGui then
                                local touchGui = playerGui:FindFirstChild("TouchGui")
                                if touchGui then
                                    local controlFrame = touchGui:FindFirstChild("TouchControlFrame")
                                    if controlFrame then
                                        local jumpButton = controlFrame:FindFirstChild("JumpButton")
                                        if jumpButton then
                                            dashButton = jumpButton:FindFirstChild("DashButton")
                                        end
                                    end
                                end
                            end

                            if dashButton then
                                local connection =
                                    dashButton.MouseButton1Down:Connect(
                                    function()
                                        if not awdawdwaT or not plr.Character then
                                            return
                                        end

                                        local hum = plr.Character:FindFirstChild("Humanoid")
                                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")

                                        if not hum or not hrp then
                                            return
                                        end

                                        local angle = getMovementAngle(hrp, hum.MoveDirection)
                                        local directionResult = nil

                                        if angle == 0 then
                                            directionResult = "front"
                                        elseif angle >= 315 or angle < 45 then
                                            directionResult = "right"
                                        elseif angle >= 135 and angle < 225 then
                                            directionResult = "left"
                                        elseif angle >= 45 and angle < 135 then
                                            directionResult = "back"
                                        elseif angle >= 225 and angle < 315 then
                                            directionResult = "front"
                                        end

                                        if awdawdwaT and directionResult == "front" and not plr.Character:FindFirstChild("Freeze") and not plr.Character:FindFirstChild("Slowed") and not plr.Character:FindFirstChild("WallCombo") then
                                            frontDash()
                                        end

                                        if awdawdwaT and (directionResult == "left" or directionResult == "right") and not isAnimationRunning(plr.Character, 10491993682) then
                                            local vel = hrp:FindFirstChild("dodgevelocity")

                                            if vel then
                                                vel:Destroy()
                                                stopAnimation(plr.Character, 10480793962)
                                                stopAnimation(plr.Character, 10480796021)
                                            end
                                        end
                                    end
                                )

                                table.insert(dashButtonConnections, connection)

                                local destroyConn =
                                    plr.Character.Destroying:Connect(
                                    function()
                                        for i, conn in ipairs(dashButtonConnections) do
                                            if conn == connection then
                                                conn:Disconnect()
                                                table.remove(dashButtonConnections, i)
                                                break
                                            end
                                        end
                                        destroyConn:Disconnect()
                                    end
                                )
                            end
                        end

                        local function cleanupConnections()
                            for _, conn in ipairs(inputBeganConnections) do
                                conn:Disconnect()
                            end
                            for _, conn in ipairs(characterAddedConnections) do
                                conn:Disconnect()
                            end
                            for _, conn in ipairs(dashButtonConnections) do
                                conn:Disconnect()
                            end

                            inputBeganConnections = {}
                            characterAddedConnections = {}
                            dashButtonConnections = {}
                        end

                        if state then
                            if plr.Character then
                                setupNoEndlagDash()
                                setupEmoteDash()

                                if isMobile then
                                    setupMobileDash()
                                end
                            end

                            local charAddedConn1 = plr.CharacterAdded:Connect(setupNoEndlagDash)
                            local charAddedConn2 = plr.CharacterAdded:Connect(setupEmoteDash)

                            table.insert(characterAddedConnections, charAddedConn1)
                            table.insert(characterAddedConnections, charAddedConn2)

                            if isMobile then
                                local dashButtonConn =
                                    plr.PlayerGui.DescendantAdded:Connect(
                                    function(d)
                                        if d.Name == "DashButton" and plr.Character then
                                            setupMobileDash()
                                        end
                                    end
                                )

                                table.insert(characterAddedConnections, dashButtonConn)
                            end
                        else
                            cleanupConnections()
                        end
    end
})

local ZDFYT = false
            local Settings = {
                Autoparry = {
                    Toggle = ZDFYT,
                    Range = 25,
                    Delay = 0,
                    Fov = 180,
                    Facing = false,
                    Dodgerange = 3,
                    Aimhelper = false
                }
            }

            local anims = {
                ["rbxassetid://10469493270"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://10469630950"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://10469639222"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://10469643643"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13532562418"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13532600125"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13532604085"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13294471966"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13491635433"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13296577783"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13295919399"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13295936866"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13370310513"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13390230973"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13378751717"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13378708199"] = {[1] = 0, [2] = 0.30},
                ["rbxassetid://13500000000"] = {[1] = 0, [2] = 0.35},
                ["rbxassetid://13500000001"] = {[1] = 0.1, [2] = 0.4},
                ["rbxassetid://13500000002"] = {[1] = 0.05, [2] = 0.35},
                abilities = {}
            }

            local dodges = {
                ["rbxassetid://10479335397"] = {[1] = 0, [2] = 0.50},
                ["rbxassetid://13380255751"] = {[1] = 0, [2] = 0.50},
                ["rbxassetid://13500000003"] = {[1] = 0, [2] = 0.55},
                ["rbxassetid://13500000004"] = {[1] = 0.1, [2] = 0.6}
            }

            local barrages = {
                ["rbxassetid://10466974800"] = {[1] = 0.20, [2] = 1.80},
                ["rbxassetid://12534735382"] = {[1] = 0.20, [2] = 1.80},
                ["rbxassetid://13500000005"] = {[1] = 0.15, [2] = 1.75},
                ["rbxassetid://13500000006"] = {[1] = 0.25, [2] = 1.85}
            }

            local abilities = {
                ["rbxassetid://10468665991"] = {[1] = 0.15, [2] = 0.60},
                ["rbxassetid://13376869471"] = {[1] = 0.05, [2] = 1},
                ["rbxassetid://13376962659"] = {[1] = 0, [2] = 2},
                ["rbxassetid://12296882427"] = {[1] = 0.05, [2] = 1},
                ["rbxassetid://13309500827"] = {[1] = 0.05, [2] = 1},
                ["rbxassetid://13365849295"] = {[1] = 0, [2] = 1},
                ["rbxassetid://13377153603"] = {[1] = 0, [2] = 1},
                ["rbxassetid://12509505723"] = {[1] = 0.09, [2] = 2},
                ["rbxassetid://13500000007"] = {[1] = 0.1, [2] = 0.65},
                ["rbxassetid://13500000008"] = {[1] = 0.05, [2] = 1.1}
            }

            local closestplr, anim, plrDirection, unit, value, dodge
            local cd = false
            local parryCooldown = 0.2

            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            local function GetCharacterParts(char)
                if not char then
                    return nil, nil, nil
                end
                local root = char:FindFirstChild("HumanoidRootPart")
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                local head = char:FindFirstChild("Head")
                return root, humanoid, head
            end

            function closest()
                local closestPlayers = {}
                local localChar = LocalPlayer.Character
                local localRoot, localHumanoid = GetCharacterParts(localChar)

                if not localRoot or not localHumanoid or localHumanoid.Health <= 0 then
                    return closestPlayers
                end

                local myPosition = localRoot.Position

                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        local char = player.Character
                        local theirRoot, theirHumanoid = GetCharacterParts(char)

                        if theirRoot and theirHumanoid and theirHumanoid.Health > 0 then
                            local distance = (myPosition - theirRoot.Position).Magnitude
                            if distance < Settings.Autoparry.Range then
                                table.insert(closestPlayers, player)
                            end
                        end
                    end
                end

                table.sort(
                    closestPlayers,
                    function(a, b)
                        local aRoot = GetCharacterParts(a.Character)
                        local bRoot = GetCharacterParts(b.Character)
                        if not aRoot or not bRoot then
                            return false
                        end
                        return (myPosition - aRoot.Position).Magnitude < (myPosition - bRoot.Position).Magnitude
                    end
                )

                return closestPlayers
            end

            function attackchecker()
                local char = LocalPlayer.Character
                if not char then
                    return false
                end

                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.Health <= 0 then
                    return false
                end

                local animator = humanoid:FindFirstChild("Animator")
                if not animator then
                    return false
                end

                for _, animTrack in ipairs(animator:GetPlayingAnimationTracks()) do
                    local animId = animTrack.Animation and animTrack.Animation.AnimationId
                    if animId then
                        if anims[animId] or dodges[animId] or abilities[animId] or barrages[animId] then
                            return true
                        end
                    end
                end

                return false
            end

            function isfacing(enemyChar)
                if not Settings.Autoparry.Toggle then
                    return false
                end
                if not Settings.Autoparry.Facing then
                    return true
                end

                local localChar = LocalPlayer.Character
                local enemyHead = enemyChar and enemyChar:FindFirstChild("Head")
                local localHead = localChar and localChar:FindFirstChild("Head")

                if not localHead or not enemyHead then
                    return false
                end

                plrDirection = localHead.CFrame.LookVector
                unit = (enemyHead.CFrame.p - localHead.CFrame.p).Unit
                value = math.pow((plrDirection - unit).Magnitude / 2, 2)

                return value < (Settings.Autoparry.Fov / 360)
            end

            function allowed(enemyChar)
                if not enemyChar then
                    return false
                end

                local localChar = LocalPlayer.Character
                if not localChar then
                    return false
                end

                if localChar:FindFirstChild("M1ing") then
                    return false
                end
                if attackchecker() then
                    return false
                end

                return isfacing(enemyChar)
            end

            local durations = {
                ["anim"] = 0.3,
                ["dodge"] = 0.9,
                ["barrage"] = 0.9,
                ["ability"] = 0.6
            }

            function def(action)
                if cd then
                    return
                end
                task.wait(Settings.Autoparry.Delay)

                cd = true
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Communicate") then
                    char.Communicate:FireServer({["Goal"] = "KeyPress", ["Key"] = Enum.KeyCode.F})
                end

                task.wait(durations[action])

                if char and char:FindFirstChild("Communicate") then
                    char.Communicate:FireServer({["Goal"] = "KeyRelease", ["Key"] = Enum.KeyCode.F})
                end

                cd = false
            end

            function lookat(enemyChar)
                if not Settings.Autoparry.Aimhelper then
                    return
                end

                local localChar = LocalPlayer.Character
                if not localChar then
                    return
                end

                local localRoot = localChar:FindFirstChild("HumanoidRootPart")
                local enemyRoot = enemyChar and enemyChar:FindFirstChild("HumanoidRootPart")

                if localRoot and enemyRoot then
                    localRoot.CFrame = CFrame.lookAt(localRoot.Position, enemyRoot.Position)
                end
            end

            function parry()
                local closestPlayers = closest()

                for _, player in ipairs(closestPlayers) do
                    if not Settings.Autoparry.Toggle then
                        break
                    end

                    local enemyChar = player.Character
                    if not enemyChar then
                        continue
                    end

                    local enemyRoot, enemyHumanoid = GetCharacterParts(enemyChar)
                    if not enemyRoot or not enemyHumanoid or enemyHumanoid.Health <= 0 then
                        continue
                    end

                    local animator = enemyHumanoid:FindFirstChild("Animator")
                    if not animator then
                        continue
                    end

                    if not allowed(enemyChar) then
                        continue
                    end

                    for _, animTrack in ipairs(animator:GetPlayingAnimationTracks()) do
                        if not Settings.Autoparry.Toggle then
                            break
                        end

                        local animId = animTrack.Animation and animTrack.Animation.AnimationId
                        local animData = anims[animId]
                        local dodgeData = dodges[animId]
                        local abilityData = abilities[animId]
                        local barrageData = barrages[animId]

                        local timePos = animTrack.TimePosition

                        if animData and timePos >= animData[1] and timePos <= animData[2] then
                            task.spawn(
                                function()
                                    def("anim")
                                    lookat(enemyChar)
                                end
                            )
                            task.wait(parryCooldown)
                            break
                        elseif dodgeData and timePos >= dodgeData[1] and timePos <= dodgeData[2] then
                            task.spawn(
                                function()
                                    def("dodge")
                                    lookat(enemyChar)
                                end
                            )
                            task.wait(parryCooldown)
                            break
                        elseif barrageData and timePos >= barrageData[1] and timePos <= barrageData[2] then
                            task.spawn(
                                function()
                                    def("barrage")
                                    lookat(enemyChar)
                                end
                            )
                            task.wait(parryCooldown)
                            break
                        elseif abilityData and timePos >= abilityData[1] and timePos <= abilityData[2] then
                            task.spawn(
                                function()
                                    def("ability")
                                    lookat(enemyChar)
                                end
                            )
                            task.wait(parryCooldown)
                            break
                        end

                    end
                end
            end

TabHandles.gn:Toggle({
    Title = "自动格挡",
    Value = false,
    Callback = function(state)
        Settings.Autoparry.Toggle = state
                        if state then
                            task.spawn(
                                function()
                                    while Settings.Autoparry.Toggle do
                                        pcall(parry)
                                        task.wait(0.05)
                                    end
                                end
                            )
                        end
    end
})

local YCDSHYT = false

TabHandles.gn:Toggle({
    Title = "屏蔽攻击四下后摇",
    Value = false,
    Callback = function(state)
        YCDSHYT = state
                        if state then
                            task.spawn(
                                function()
                                    while YCDSHYT and task.wait(0.1) do
                                        pcall(
                                            function()
                                                local Freeze = LocalPlayer.Character:FindFirstChild("Freeze")
                                                if Freeze then
                                                    Freeze:Destroy()
                                                end
                                                local ComboStun = LocalPlayer.Character:FindFirstChild("ComboStun")
                                                if ComboStun then
                                                    ComboStun:Destroy()
                                                end
                                            end
                                        )
                                    end
                                end
                            )
                        end
    end
})

TabHandles.gn:Input({
    Title = "修改击杀数",
    Desc = "仅你可见",
    Value = "",
    Type = "Input",
    Placeholder = "",
    Callback = function(input)
        pcall(
                            function()
                                game:GetService("Players").LocalPlayer.leaderstats.Kills.Value = tonumber(input) or 0
                            end
                        )
    end
})

TabHandles.gn:Input({
    Title = "修改总击杀数",
    Desc = "仅你可见",
    Value
                
                local distanceBillboard = Instance.new("BillboardGui")
                distanceBillboard.Name = "GeneratorDistanceESP"
                distanceBillboard.Size = UDim2.new(4, 0, 1, 0)
                distanceBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
                distanceBillboard.Adornee = gen.Main
                distanceBillboard.Parent = gen.Main
                distanceBillboard.AlwaysOnTop = true
                
                local distanceLabel = Instance.new("TextLabel")
                distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
                distanceLabel.BackgroundTransparency = 1
                distanceLabel.TextScaled = false
                distanceLabel.Text = "计算距离中..."
                distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                distanceLabel.Font = Enum.Font.Arcade
                distanceLabel.TextStrokeTransparency = 0
                distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                distanceLabel.TextSize = 8
                distanceLabel.Parent = distanceBillboard
                
                local highlight = Instance.new("Highlight")
                highlight.Name = "GeneratorHighlight"
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Enabled = true
                highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
                highlight.FillColor = Color3.fromRGB(0, 255, 255)
                highlight.FillTransparency = 0.9
                highlight.OutlineTransparency = 0
                highlight.Parent = gen
                
                generatorData[gen] = {
                    billboard = billboard,
                    distanceBillboard = distanceBillboard,
                    textLabel = textLabel,
                    distanceLabel = distanceLabel,
                    highlight = highlight
                }
                
                gen.Destroying:Connect(function()
                    if generatorData[gen] then
                        if generatorData[gen].billboard then generatorData[gen].billboard:Destroy() end
                        if generatorData[gen].distanceBillboard then generatorData[gen].distanceBillboard:Destroy() end
                        if generatorData[gen].highlight then generatorData[gen].highlight:Destroy() end
                        generatorData[gen] = nil
                    end
                end)
            end
            
            local function scanGenerators()
                for _, gen in pairs(workspace:GetDescendants()) do
                    if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "Generator" then
                        createGeneratorESP(gen)
                    end
                end
            end
            
            local mainConnection = workspace.DescendantAdded:Connect(function(v)
                if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "Generator" then
                    createGeneratorESP(v)
                end
            end)
            
            local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
                lastScanTime = lastScanTime + deltaTime
                if lastScanTime >= scanInterval then
                    lastScanTime = 0
                    scanGenerators()
                end
                
                for gen, data in pairs(generatorData) do
                    if gen and gen.Parent then
                        updateGeneratorESP(gen, data)
                    else
                        if data.billboard then data.billboard:Destroy() end
                        if data.distanceBillboard then data.distanceBillboard:Destroy() end
                        if data.highlight then data.highlight:Destroy() end
                        generatorData[gen] = nil
                    end
                end
            end)
            
            -- 存储连接以便之后断开
            generatorData.connections = {
                main = mainConnection,
                heartbeat = heartbeatConnection
            }
        else
            -- 关闭功能时的清理逻辑
            if generatorData.connections then
                for _, connection in pairs(generatorData.connections) do
                    if connection then
                        connection:Disconnect()
                    end
                end
            end
            
            for gen, data in pairs(generatorData) do
                if type(data) == "table" then
                    if data.billboard then data.billboard:Destroy() end
                    if data.distanceBillboard then data.distanceBillboard:Destroy() end
                    if data.highlight then data.highlight:Destroy() end
                end
            end
        end
        WindUI:Notify({
            Title = "Rb脚本中心：",
            Content = enabled and "已开启发电机显示" or "已关闭发电机显示",
            Icon = enabled and "check" or "x",
            Durat
                        
firetouchinterest(game.Players.LocalPlayer.Character.Head,Workspace.Misc:FindFirstChild("Silver Armor - 15 min Playtime").Head,1)
                    elseif gettime()>=30 and gettime()<60 then
                        firetouchinterest(game.Players.LocalPlayer.Character.Head,Workspace.Misc:FindFirstChild("Golden Armor - 30 min Playtime").Head,0)
                        firetouchinterest(game.Players.LocalPlayer.Character.Head,Workspace.Misc:FindFirstChild("Golden Armor - 30 min Playtime").Head,1)
                    elseif gettime()>=60 then
                        firetouchinterest(game.Players.LocalPlayer.Character.Head,Workspace.Misc:FindFirstChild("Diamond Armor - 60 min Playtime").Head,0)
                        firetouchinterest(game.Players.LocalPlayer.Character.Head,Workspace.Misc:FindFirstChild("Diamond Armor - 60 min Playtime").Head,1)
                    end
                end)
            end
        end)
    end
})

MainGroup:AddDropdown("TeleportDropdown", {
    Text="传送",
    Values={"出生点","传送门","焚化炉(就叫这名字)","地铁","下水道","死神","制作区","矿井"},
    Callback=function(Value)
        local CFrameMap={
            ["出生点"]=CFrame.new(709,1150,744),
            ["传送门"]=CFrame.new(-101,982,805),
            ["焚化炉(就叫这名字)"]=CFrame.new(-322,1062,1159),
            ["地铁"]=CFrame.new(-469,922,749),
            ["下水道"]=CFrame.new(-495,916,-56),
            ["死神"]=CFrame.new(-202,982,294),
            ["制作区"]=CFrame.new(954,1070,735),
            ["矿井"]=CFrame.new(-471,753,920)
        }
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrameMap[Value]
    end
})

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("菜单")
MenuGroup:AddToggle("KeybindMenuOpen",{Default=Library.KeybindFrame.Visible,Text="打开快捷键菜单",Callback=function(value) Library.KeybindFrame.Visible=value end})
MenuGroup:AddToggle("ShowCustomCursor",{Text="显示自定义鼠标",Default=true,Callback=function(Value) Library.ShowCustomCursor=Value end})
MenuGroup:AddDropdown("NotificationSide",{Values={"左侧","右侧"},Default="右侧",Text="提示位置",Callback=function(Value) Library:SetNotifySide(Value) end})

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place")
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:BuildConfigSection(Tabs["UI Settings"])
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "成功", 
	Icon = "rbxassetid://119970903874014" 
})()
  elseif game.PlaceId == 14410213941 then 
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rb脚本中心付费版：", 
	Text = "正在加载...射击并吃掉Noob...", 
	Icon = "rbxassetid://119970903874014" 
})
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "Rb脚本中心付费版",
    Footer = "v1.0.0",
    Icon = 95816097006870,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab("主要功能", "user"),
    ["UI Settings"] = Window:AddTab("界面设置", "settings"),
}

local MainGroup = Tabs.Main:AddLeftGroupbox("战斗功能")

MainGroup:AddToggle("AutoEatNoob", {
    Text = "自动吃noob",
    Default = false,
    Callback = function(Value)
        if Value then
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RunService = game:GetService("RunService")
            local Workspace = game:GetService("Workspace")

            local LocalPlayer = Players.LocalPlayer
            local Camera = Workspace.CurrentCamera

            local gameFolder = Workspace:WaitForChild("#GAME", 10)
            local foldersFolder = gameFolder and gameFolder:WaitForChild("Folders", 5)
            local humanoidFolder = foldersFolder and foldersFolder:WaitForChild("HumanoidFolder", 5)
            local mainFolder = humanoidFolder and humanoidFolder:WaitForChild("NPCFolder", 5)

            local eventsFolder = ReplicatedStorage:WaitForChild("Events", 10)
            local remote = eventsFolder and eventsFolder:WaitForChild("MainAttack", 5)

            if not mainFolder or not remote then
                Library:Notify("自动吃noob: 找不到必要的游戏对象")
                return
            end

            local priorityNames1 = { "Amethyst", "Ruby", "Emerald", "Diamond", "Golden", "Silver" }
            local priorityNames2 = { "Werewolf", "Berend" }

            local function getDeadNPCs()
                local deadList = {}
                if not mainFolder then return deadList end
                for _, npc in ipairs(mainFolder:GetChildren()) do
                    if npc:IsA("Model") then
                        local humanoid = npc:FindFirstChildOfCla
