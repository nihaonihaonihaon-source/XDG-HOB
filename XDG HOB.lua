if game.GameId == 7709344486 then  --- Doors Lobby
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "XDGHOB付费版：", -- Required
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
subtitleLabel.Text = "XDGHOB付费版"
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
                local hitbox = plot:F
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
local window = library:new("XDGHOB_付费版")
local tab = window:Tab("封禁信息")
local section = tab:section("封禁信息", true)
local banReasonLabel = section:Label("封禁原因：无")
local banCountLabel = section:Label("封禁次数：无")
local isBannedLabel = section:Label("是否封禁：否")
local banTimeLabel = section:Label("封禁时间：无")
local unbanTimeLabel = section:Label("解封时间：无")
local function fmt(ts)return os.date("%Y-%m-%d %H:%M:%S",ts)end local function a123()local banReason=nil 
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
    Title = "XDGHOB",
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
            Title = "XDGHOB"
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
                     "付费版用户，欢迎使用XDGHOB！"
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
if old then o                    if not enemyRoot or not enemyHumanoid or enemyHumanoid.Health <= 0 then
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
                                
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local INTERACTIONS_PER_SECOND = 800
local SCAN_INTERVAL = 0.05
local MAX_DISTANCE = 45

local collectPrompts = {}
local lastScanTime = 0
local lastInteractionTime = 0
local frameTime = 1/INTERACTIONS_PER_SECOND

local function scanForPrompts()
    collectPrompts = {}
    for _, instance in ipairs(workspace:GetDescendants()) do
        if instance:IsA("ProximityPrompt") and instance.ActionText == "Collect" and instance.Enabled then
            table.insert(collectPrompts, instance)
        end
    end
end

local function getNearestPrompt()
    local nearestPrompt = nil
    local minDistance = math.huge
    local myPos = humanoidRootPart.Position
    
    for _, prompt in ipairs(collectPrompts) do
        if prompt.Parent then
            local distance = (prompt.Parent.Position - myPos).Magnitude
            if distance <= MAX_DISTANCE and distance < minDistance then
                minDistance = distance
                nearestPrompt = prompt
            end
        end
    end
    
    return nearestPrompt
end

RunService.Heartbeat:Connect(function()
    local now = os.clock()
    
    if now - lastScanTime >= SCAN_INTERVAL then
        scanForPrompts()
        lastScanTime = now
    end
    
    if now - lastInteractionTime >= frameTime then
        local nearestPrompt = getNearestPrompt()
        if nearestPrompt then
            fireproximityprompt(nearestPrompt)
        end
        lastInteractionTime = now
    end
end)

TabHandles.gn:Toggle({
    Title = "自动收割所有果实",
    Desc = "自动种植所有类型的种子",
    Value = false,
    Callback = function(state)
        getgenv().scanForPrompts = state
        scanForPrompts()
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local cropData = {
    ["Carrot Seed"] = "Carrot",
    ["Strawberry Seed"] = "Strawberry",
    ["Blueberry Seed"] = "Blueberry",
    ["Orange Tulip Seed"] = "Orange Tulip",
    ["Tomato Seed"] = "Tomato",
    ["Corn Seed"] = "Corn",
    ["Daffodil Seed"] = "Daffodil",
    ["Watermelon Seed"] = "Watermelon",
    ["Pumpkin Seed"] = "Pumpkin",
    ["Apple Seed"] = "Apple",
    ["Bamboo Seed"] = "Bamboo",
    ["Coconut Seed"] = "Coconut",
    ["Cactus Seed"] = "Cactus",
    ["Dragon Seed"] = "Dragon",
    ["Mango Seed"] = "Mango",
    ["Grape Seed"] = "Grape",
    ["Mushroom Seed"] = "Mushroom",
    ["Pepper Seed"] = "Pepper",
    ["Cacao Seed"] = "Cacao",
    ["Beanstalk Seed"] = "Beanstalk",
    ["Ember Lily Seed"] = "Ember Lily",
    ["sugar Apple Seed"] = "sugar Apple",
    ["Burning Bud Seed"] = "Burning Bud",
    ["Giant Pinecone Seed"] = "Giant Pinecone",
    ["Elder Strawberry Seed"] = "Elder Strawberry",
    ["Romanesco"] = "Romanesco"
}

local function getSeedCount(toolName)
    local count = toolName:match("%[X(%d+)%]")
    return count and tonumber(count) or 1
end

local function autoPlant()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local plantEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Plant_RE")
    
    while getgenv().autoPlant == true do
        for toolName, cropType in pairs(cropData) do
            for _, tool in ipairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name:find(toolName, 1, true) then
                    humanoid:EquipTool(tool)
                    task.wait(0.05)
                    
                    local count = getSeedCount(tool.Name)
                    for i = 1, count do
                        local args = {
                            Vector3.new(rootPart.Position.X, 0.13552704453468323, rootPart.Position.Z),
                            cropType
                        }
                        plantEvent:FireServer(unpack(args))
                        task.wait(0.05)
                    end
                end
            end
        end
        task.wait(0.1)
    end
end

TabHandles.gn:Toggle({
    Title = "自动种植所有种子",
    Desc = "自动种你背包内的种子",
    Value = false,
    Callback = function(state)
        getgenv().autoPlant = state
        autoPlant()
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local cropTypes = {
    "Carrot", "Strawberry", "Blueberry", "Orange", "Tomato", "Corn",
    "Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut",
    "Cactus", "Dragon", "Mango", "Grape", "Mushroom", "Pepper",
    "Cacao", "B
        
        return min, max
    else
        -- 回退到遍历所有部件的方法
        local min = Vector3.new(math.huge, math.huge, math.huge)
        local max = Vector3.new(-math.huge, -math.huge, -math.huge)
        
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                local cframe = part.CFrame
                local size = part.Size
                
                local scale = isKiller and Box3DSettings.KillerBoxScale or Box3DSettings.SurvivorBoxScale
                size = size * scale
                
                -- 调整左右宽度
                local leftOffset = (size.X/2) * Box3DSettings.LeftWidthScale
                local rightOffset = (size.X/2) * Box3DSettings.RightWidthScale
                
                -- 调整前后延伸 (加强版)
                local frontOffset = (size.Z/2) * Box3DSettings.FrontExtend * Box3DSettings.FrontExtendMultiplier
                local backOffset = (size.Z/2) * Box3DSettings.BackExtend * Box3DSettings.BackExtendMultiplier
                
                -- 计算顶点（考虑前后延伸）
                local vertices = {
                    cframe * Vector3.new(rightOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(-leftOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(rightOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(-leftOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, frontOffset),
                    cframe * Vector3.new(rightOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset),
                    cframe * Vector3.new(-leftOffset, (size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset),
                    cframe * Vector3.new(rightOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset),
                    cframe * Vector3.new(-leftOffset, (-size.Y/2) * Box3DSettings.BoxHeightScale, -backOffset)
                }
                
                -- 更新最小和最大点
                for _, vertex in ipairs(vertices) do
                    min = Vector3.new(
                        math.min(min.X, vertex.X),
                        math.min(min.Y, vertex.Y),
                        math.min(min.Z, vertex.Z)
                    )
                    max = Vector3.new(
                        math.max(max.X, vertex.X),
                        math.max(max.Y, vertex.Y),
                        math.max(max.Z, vertex.Z)
                    )
                end
            end
        end
        
        -- 应用高度偏移和垂直偏移
        min = Vector3.new(min.X, min.Y + Box3DSettings.BoxHeightOffset + Box3DSettings.VerticalOffset, min.Z)
        max = Vector3.new(max.X, max.Y + Box3DSettings.BoxHeightOffset + Box3DSettings.VerticalOffset, max.Z)
        
        return min, max
    end
end

-- 更新单个3D方框
local function updateSingle3DBox(model, drawing, color, isKiller)
    local camera = workspace.CurrentCamera
    local min, max = calculateModelBoundingBox(model, isKiller)
    
    -- 计算立方体的8个顶点
    local vertices = {
        Vector3.new(max.X, max.Y, max.Z), -- 右上后
        Vector3.new(min.X, max.Y, max.Z), -- 左上后
        Vector3.new(max.X, min.Y, max.Z), -- 右下后
        Vector3.new(min.X, min.Y, max.Z), -- 左下后
        Vector3.new(max.X, max.Y, min.Z), -- 右上前
        Vector3.new(min.X, max.Y, min.Z), -- 左上前
        Vector3.new(max.X, min.Y, min.Z), -- 右下前
        Vector3.new(min.X, min.Y, min.Z)  -- 左下前
    }
    
    -- 转换顶点到屏幕空间
    local screenVertices = {}
    local anyVisible = false
    
    for i, vertex in ipairs(vertices) do
        local screenPos, onScreen = camera:WorldToViewportPoint(vertex)
        screenVertices[i] = Vector2.new(screenPos.X, screenPos.Y)
        if onScreen then anyVisible = true end
    end
    
    -- 设置线条属性
    for _, line in pairs(drawing.lines) do
        line.Color = color
        line.Thickness = Box3DSettings.Thickness
        line.Transparency = Box3DSettings.Transparency
    end
    
    -- 绘制立方体边线
    if anyVisible then
        -- 前面4条边
        drawing.lines[1].From = screenVertices[5] drawing.lines[1].To = screenVertices[6] -- 上面前
        drawing.lines[2].From = screenVertices[6] drawing.lines[2].To = screenVertices[8] -- 左边前
        drawing.lines[3].From = screenVertices[8] drawing.lines[3].To = screenVertices[7] -- 下面前
        drawing.lines[4].From = screenVertices[7] drawing.lines[4].To = screenVertices[5] -- 右边前
        
        -- 后面4条边
        drawing.lines[5].From = screenVertices[1] drawing.lines[5].To = screenVertices[2] -- 上面后
        drawing.lines[6].From = screenVertices[2] drawing.lines[6].To = screenVertices[4] -- 左边后
        drawing.lines[7].From = screenVertices[4] drawing.lines[7].To = screenVertices[3] -- 下面后
        drawing.lines[8].From = screenVertices[3] drawing.lines[8].To = screenVertices[1] -- 右边后
        
        -- 连接前后面的4条边
        drawing.lines[9].From = screenVertices[1] drawing.lines[9].To = scree
		    xrayEnabled = true
    xray()
            else
		    xrayEnabled = false
    xray()
            end
        WindUI:Notify({
            Title = "XDGHOB：",
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
            Title = "XDGHOB：",
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
            Title = "XDGHOB：",
            Content = "成功加载飞行",
            Icon = "bell",
            Duration = 3
        })
    end
})

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Plr = game:GetService("Players")
local LP = Plr.LocalPlayer

local Part = Instance.new("Part", workspace)
Part.Material = Enum.Material.ForceField
Part.Anchored = true
Part.CanCollide = false
Part.CastShadow = false
Part.Shape = Enum.PartType.Ball
Part.Color = Color3.fromRGB(132, 0, 255)
Part.Transparency = 0.5

local BaseGui = Instance.new("ScreenGui", game.CoreGui)
BaseGui.Name = "BaseGui"

local TL = Instance.new("TextLabel", BaseGui)
TL.Name = "TL"
TL.Parent = BaseGui
TL.BackgroundColor3 = Color3.new(1, 1, 1)
TL.BackgroundTransparency = 1
TL.BorderColor3 = Color3.new(0, 0, 0)
TL.Position = UDim2.new(0.95, -300, 0.85, 0)
TL.Size = UDim2.new(0, 300, 0, 50)
TL.FontFace = Font.new("rbxassetid://12187370000", Enum.FontWeight.Bold)
TL.Text = ""
TL.TextColor3 = Color3.new(1, 1, 1)
TL.TextScaled = true
TL.TextSize = 14
TL.TextWrapped = true
TL.Visible = true
TL.RichText = true

local function rainbowColor(hue)
  return Color3.fromHSV(hue, 1, 1)
end

local function updateRainbowText(distance, ballSpeed, spamRadius, minDistance)
  local hue = (tick() * 0.1) % 1
  local color1 = rainbowColor(hue)
  local color2 = rainbowColor((hue + 0.3) % 1)
  local color3 = rainbowColor((hue + 0.6) % 1)
  local color4 = rainbowColor((hue + 0.9) % 1)

  TL.Text = string.format(
  "<font color='#%s'>distance: %s</font>\n"..
  "<font color='#%s'>ballSpeed: %s</font>\n"..
  "<font color='#%s'>spamRadius: %s</font>\n"..
  "<font color='#%s'>minDistance: %s</font>",
  color1:ToHex(), tostring(distance),
  color2:ToHex(), tostring(ballSpeed),
  color3:ToHex(), tostring(spamRadius),
  color4:ToHex(), tostring(minDistance)
  )
end

local last1, last2
local Cam = workspace.CurrentCamera

local function ZJ()
  local Nearest, Min = nil, math.huge
  for A, B in next, workspace.Alive:GetChildren() do
    if B.Name ~= LP.Name and B:FindFirstChild("HumanoidRootPart") then
      local distance = LP:DistanceFromCharacter(B:GetPivot().Position)
      if distance < Min then
        Min = distance
        Nearest = B
      end
    end
  end
  return Min
end

local function Parry()
  task.spawn(function() game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, nil, 0) end)
end

local function GetBall()
  for a, b in next, workspace.Balls:GetChildren() do
    if b:IsA("BasePart") and b:GetAttribute("realBall") then
      return b
    end
  end
end

local function IsTarget(a)
  return a:GetAttribute("target") == LP.Name
end

local function IsSpamming(a, b)
  if not type(last1) == "number" then return false end
  if not type(last2) == "number" then return false end
  if last1 - last2 > 0.8 then
    return false
  end
  if a > b then
    return false
  end
  if #workspace.Alive:GetChildren() <= 1 then
    return false
  end
  return true
end

local function spin(enabled)
    local root = LP.Character and (LP.Character:FindFirstChild("HumanoidRootPart") or LP.Character:FindFirstChild("UpperTorso"))
    if not root then return end
    for _, v in pairs(root:GetChildren()) do
        if v.Name == "Spinning" then v:Destroy() end
    end
    if enabled then
        local Spin = Instance.new("BodyAngula
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
	Title = "XDGHOB付费版：", 
	Text = "成功", 
	Icon = "rbxassetid://119970903874014" 
})()
  elseif game.PlaceId == 14410213941 then 
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "XDGHOB付费版：", 
	Text = "正在加载...射击并吃掉Noob...", 
	Icon = "rbxassetid://119970903874014" 
})
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "XDGHOB付费版",
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
                        local humanoid = npc:FindFirstChildOfClass("Humanoid")
                        if humanoid and (humanoid.Health <= 0 or string.find(humanoid.Name, "Dead", 1, true)) then
