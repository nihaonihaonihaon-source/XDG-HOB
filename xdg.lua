local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local P = game:GetService("Players")
local CAS = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")

local CONFIG = {
    FlySpeedMin = 10,
    FlySpeedMax = 200,
    FlySpeedStep = 10,
    DeadZone = 0.12,
    PanelX = 200,
    PanelY = 100,
    HubX = 50,
    HubY = 50,
    HubWidth = 120,
    HubHeight = 30,
    CASPriority = 255,
    TargetScriptURL = "https://pastebin.com/raw/U27yQRxS"
}

local plr = P.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")
local camera = Workspace.CurrentCamera

local State = {
    FlyEnabled = false,
    PanelOpen = false,
    PanelExpanded = true,
    FlyUIOpen = false,
    FlySpeed = 50,
    IsLoading = false,
    LoadSuccess = false,
    NeedRedraw = true,
    IsDraggingHub = false,
    DragOffset = Vector2.new(0, 0),
    HubPos = Vector2.new(CONFIG.HubX, CONFIG.HubY)
}

local sg = Instance.new("ScreenGui")
sg.Name = "CustomLoadScript"
sg.Parent = plr.PlayerGui
sg.IgnoreGuiInset = true
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sg.AncestryChanged:Connect(function()
    if not sg:IsDescendantOf(plr.PlayerGui) then
        sg.Parent = plr.PlayerGui
    end
end)

local function isAllValid()
    plr = plr or P.LocalPlayer
    char = char or plr.Character
    hum = hum or (char and char:FindFirstChildOfClass("Humanoid"))
    hrp = hrp or (char and char:FindFirstChild("HumanoidRootPart"))
    camera = camera or Workspace.CurrentCamera
    return plr and char and hum and hrp and camera and hum.Health > 0
end

local function resetAllState()
    State.FlyEnabled = false
    State.IsLoading = false
    State.LoadSuccess = false
    State.FlyUIOpen = false
    State.NeedRedraw = true
    if isAllValid() then
        hum.GravityScale = 1
        hum.WalkSpeed = 16
        hum.JumpPower = 50
        hum.PlatformStand = false
        local states = {Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.FreeFall}
        for _, state in ipairs(states) do
            hum:SetStateEnabled(state, true)
        end
    end
end

local function createFrame(x, y, w, h, r, g, b, a)
    local f = Instance.new("Frame")
    f.Parent = sg
    f.Position = UDim2.new(0, x, 0, y)
    f.Size = UDim2.new(0, w, 0, h)
    f.BackgroundColor3 = Color3.fromRGB(r, g, b)
    f.BackgroundTransparency = 1 - math.clamp(a, 0, 1)
    f.BorderSizePixel = 0
    f.ZIndex = 2
    return f
end

local function createText(t, x, y, s, r, g, b, a)
    local l = Instance.new("TextLabel")
    l.Parent = sg
    l.Position = UDim2.new(0, x, 0, y)
    l.Size = UDim2.new(0, s * #t + 10, 0, s + 4)
    l.Text = t
    l.TextColor3 = Color3.fromRGB(r, g, b)
    l.TextTransparency = 1 - math.clamp(a, 0, 1)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.SourceSansBold
    l.TextSize = s
    l.TextXAlignment = Enum.TextXAlignment.Center
    l.TextYAlignment = Enum.TextYAlignment.Center
    l.ZIndex = 3
    return l
end

local function hsl2rgb(h, s, l)
    h = h / 360
    local function hue2rgb(p, q, t)
        t = t < 0 and t + 1 or t > 1 and t - 1 or t
        return t < 1/6 and p + (q - p) * 6 * t or t < 1/2 and q or t < 2/3 and p + (q - p) * (2/3 - t) * 6 or p
    end
    local r, g, b = (s == 0) and l or (local q = l < 0.5 and l*(1+s) or l+s-l*s; local p=2*l-q; hue2rgb(p,q,h+1/3), hue2rgb(p,q,h), hue2rgb(p,q,h-1/3))
    return math.floor(r*255), math.floor(g*255), math.floor(b*255)
end

local function loadTargetScript()
    if State.IsLoading then return end
    State.IsLoading = true
    State.LoadSuccess = false
    State.NeedRedraw = true

    task.spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(CONFIG.TargetScriptURL))()
        end)
        State.IsLoading = false
        State.LoadSuccess = success
        State.NeedRedraw = true

        if not success then
            local errText = createText("❌ 脚本加载失败："..tostring(err), 200, 60, 12, 255, 0, 0, 1)
            task.wait(3)
            if errText and errText.Parent then errText:Destroy() end
        end
    end)
end

local rainbowHue = 0
local function drawFlyUI()
    local x, y = 600, 300
    createFrame(x, y, 220, 80, 20, 20, 20, 0.9)
    createFrame(x + 190, y, 30, 30, 150, 0, 0, 0.8)
    createText("×", x + 205, y + 8, 16, 255, 255, 255, 1)
    local flyColor = State.FlyEnabled and {0,200,0} or {180,0,0}
    createFrame(x + 40, y, 60, 30, flyColor[1], flyColor[2], flyColor[3], 0.8)
    createText(State.FlyEnabled and "开" or "关", x + 70, y + 8, 14, 255, 255, 255, 1)
    createText("速度："..State.FlySpeed, x + 140, y + 38, 12, 255, 255, 255, 1)
    createFrame(x + 180, y + 35, 20, 20, 0, 150, 0, 0.8)
    createText("+", x + 190, y + 40, 14, 255, 255, 255, 1)
    createFrame(x + 200, y + 35, 20, 20, 150, 0, 0, 0.8)
    createText("-", x + 210, y + 40, 14, 255, 255, 255, 1)
end

local function drawUI()
    for _, v in ipairs(sg:GetChildren()) do v:Destroy() end

    local hubX, hubY = State.HubPos.X, State.HubPos.Y
    createFrame(hubX, hubY, CONFIG.HubWidth, CONFIG.HubHeight, 70, 70, 70, 1)
    createText("HUB", hubX + CONFIG.HubWidth/2, hubY + 8, 16, 255, 255, 255, 1)

    if State.IsLoading then
        createText("⏳ 脚本加载中...", 200, 20, 14, 255, 200, 0, 1)
    elseif State.LoadSuccess then
        createText("✅ 脚本加载成功！", 200, 20, 14, 0, 255, 0, 1)
    elseif State.FlyEnabled and not State.IsLoading then
        createText("⚠️  请等待加载完成", 200, 20, 14, 255, 100, 0, 1)
    end

    if not State.PanelOpen then
        if State.FlyUIOpen then drawFlyUI() end
        return
    end

    local cw = State.PanelExpanded and 500 or 200
    local ch = State.PanelExpanded and 300 or 60
    createFrame(CONFIG.PanelX, CONFIG.PanelY, cw, ch, 0, 0, 0, 0.85)
    local r, g, b = hsl2rgb(rainbowHue, 0.8, 0.5)
    createFrame(CONFIG.PanelX, CONFIG.PanelY, cw, 30, 30, 30, 30, 1)
    createText("定制版 | 加载目标脚本", CONFIG.PanelX + cw/2, CONFIG.PanelY + 8, 16, r, g, b, 1)
    createText(State.PanelExpanded and "—" or "+", CONFIG.PanelX + 15, CONFIG.PanelY + 8, 18, 255, 255, 255, 1)
    createText("×", CONFIG.PanelX + cw - 25, CONFIG.PanelY + 8, 18, 255, 80, 80, 1)

    if State.PanelExpanded then
        local tabs = {"速度区", "搞笑区", "其他", "实用"}
        local tw = cw / #tabs
        for i, tab in ipairs(tabs) do
            local tx = CONFIG.PanelX + (i-1)*tw
            createFrame(tx, CONFIG.PanelY + 30, tw, 35, 40, 40, 40, 1)
            createText(tab, tx + tw/2, CONFIG.PanelY + 30 + 10, 14, 255, 255, 255, 1)
        end

        local cy = CONFIG.PanelY + 65
        createText("加载目标脚本", CONFIG.PanelX + 20, cy + 20, 16, 255, 255, 255, 1)
        local flyColor = State.FlyEnabled and {0,200,0} or {200,0,0}
        createFrame(CONFIG.PanelX + 20, cy + 50, 100, 30, flyColor[1], flyColor[2], flyColor[3], 0.8)
        createText(State.FlyEnabled and "已开启" or "开启加载", CONFIG.PanelX + 70, cy + 65, 14, 255, 255, 255, 1)

        createText("✅ 点击开启 → 自动加载目标脚本", CONFIG.PanelX + 200, cy + 20, 1lua
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local P = game:GetService("Players")
local CAS = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")

local CONFIG = {
    FlySpeedMin = 10,
    FlySpeedMax = 200,
    FlySpeedStep = 10,
    DeadZone = 0.12,
    PanelX = 200,
    PanelY = 100,
    HubX = 50,
    HubY = 50,
    HubWidth = 120,
    HubHeight = 30,
    CASPriority = 255,
    TargetScriptURL = "https://pastebin.com/raw/U27yQRxS"
}

local plr = P.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")
local camera = Workspace.CurrentCamera

local State = {
    FlyEnabled = false,
    PanelOpen = false,
    PanelExpanded = true,
    FlyUIOpen = false,
    FlySpeed = 50,
    IsLoading = false,
    LoadSuccess = false,
    NeedRedraw = true,
    IsDraggingHub = false,
    DragOffset = Vector2.new(0, 0),
    HubPos = Vector2.new(CONFIG.HubX, CONFIG.HubY)
}

local sg = Instance.new("ScreenGui")
sg.Name = "CustomLoadScript"
sg.Parent = plr.PlayerGui
sg.IgnoreGuiInset = true
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sg.AncestryChanged:Connect(function()
    if not sg:IsDescendantOf(plr.PlayerGui) then
        sg.Parent = plr.PlayerGui
    end
end)

local function isAllValid()
    plr = plr or P.LocalPlayer
    char = char or plr.Character
    hum = hum or (char and char:FindFirstChildOfClass("Humanoid"))
    hrp = hrp or (char and char:FindFirstChild("HumanoidRootPart"))
    camera = camera or Workspace.CurrentCamera
    return plr and char and hum and hrp and camera and hum.Health > 0
end

local function resetAllState()
    State.FlyEnabled = false
    State.IsLoading = false
    State.LoadSuccess = false
    State.FlyUIOpen = false
    State.NeedRedraw = true
    if isAllValid() then
        hum.GravityScale = 1
        hum.WalkSpeed = 16
        hum.JumpPower = 50
        hum.PlatformStand = false
        local states = {Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.FreeFall}
        for _, state in ipairs(states) do
            hum:SetStateEnabled(state, true)
        end
    end
end

local function createFrame(x, y, w, h, r, g, b, a)
    local f = Instance.new("Frame")
    f.Parent = sg
    f.Position = UDim2.new(0, x, 0, y)
    f.Size = UDim2.new(0, w, 0, h)
    f.BackgroundColor3 = Color3.fromRGB(r, g, b)
    f.BackgroundTransparency = 1 - math.clamp(a, 0, 1)
    f.BorderSizePixel = 0
    f.ZIndex = 2
    return f
end

local function createText(t, x, y, s, r, g, b, a)
    local l = Instance.new("TextLabel")
    l.Parent = sg
    l.Position = UDim2.new(0, x, 0, y)
    l.Size = UDim2.new(0, s * #t + 10, 0, s + 4)
    l.Text = t
    l.TextColor3 = Color3.fromRGB(r, g, b)
    l.TextTransparency = 1 - math.clamp(a, 0, 1)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.SourceSansBold
    l.TextSize = s
    l.TextXAlignment = Enum.TextXAlignment.Center
    l.TextYAlignment = Enum.TextYAlignment.Center
    l.ZIndex = 3
    return l
end

local function hsl2rgb(h, s, l)
    h = h / 360
    local function hue2rgb(p, q, t)
        t = t < 0 and t + 1 or t > 1 and t - 1 or t
        return t < 1/6 and p + (q - p) * 6 * t or t < 1/2 and q or t < 2/3 and p + (q - p) * (2/3 - t) * 6 or p
    end
    local r, g, b = (s == 0) and l or (local q = l < 0.5 and l*(1+s) or l+s-l*s; local p=2*l-q; hue2rgb(p,q,h+1/3), hue2rgb(p,q,h), hue2rgb(p,q,h-1/3))
    return math.floor(r*255), math.floor(g*255), math.floor(b*255)
end

local function loadTargetScript()
    if State.IsLoading then return end
    State.IsLoading = true
    State.LoadSuccess = false
    State.NeedRedraw = true

    task.spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(CONFIG.TargetScriptURL))()
        end)
        State.IsLoading = false
        State.LoadSuccess = success
        State.NeedRedraw = true

        if not success then
            local errText = createText("❌ 脚本加载失败："..tostring(err), 200, 60, 12, 255, 0, 0, 1)
            task.wait(3)
            if errText and errText.Parent then errText:Destroy() end
        end
    end)
end

local rainbowHue = 0
local function drawFlyUI()
    local x, y = 600, 300
    createFrame(x, y, 220, 80, 20, 20, 20, 0.9)
    createFrame(x + 190, y, 30, 30, 150, 0, 0, 0.8)
    createText("×", x + 205, y + 8, 16, 255, 255, 255, 1)
    local flyColor = State.FlyEnabled and {0,200,0} or {180,0,0}
    createFrame(x + 40, y, 60, 30, flyColor[1], flyColor[2], flyColor[3], 0.8)
    createText(State.FlyEnabled and "开" or "关", x + 70, y + 8, 14, 255, 255, 255, 1)
    createText("速度："..State.FlySpeed, x + 140, y + 38, 12, 255, 255, 255, 1)
    createFrame(x + 180, y + 35, 20, 20, 0, 150, 0, 0.8)
    createText("+", x + 190, y + 40, 14, 255, 255, 255, 1)
    createFrame(x + 200, y + 35, 20, 20, 150, 0, 0, 0.8)
    createText("-", x + 210, y + 40, 14, 255, 255, 255, 1)
end

local function drawUI()
    for _, v in ipairs(sg:GetChildren()) do v:Destroy() end

    local hubX, hubY = State.HubPos.X, State.HubPos.Y
    createFrame(hubX, hubY, CONFIG.HubWidth, CONFIG.HubHeight, 70, 70, 70, 1)
    createText("HUB", hubX + CONFIG.HubWidth/2, hubY + 8, 16, 255, 255, 255, 1)

    if State.IsLoading then
        createText("⏳ 脚本加载中...", 200, 20, 14, 255, 200, 0, 1)
    elseif State.LoadSuccess then
        createText("✅ 脚本加载成功！", 200, 20, 14, 0, 255, 0, 1)
    elseif State.FlyEnabled and not State.IsLoading then
        createText("⚠️  请等待加载完成", 200, 20, 14, 255, 100, 0, 1)
    end

    if not State.PanelOpen then
        if State.FlyUIOpen then drawFlyUI() end
        return
    end

    local cw = State.PanelExpanded and 500 or 200
    local ch = State.PanelExpanded and 300 or 60
    createFrame(CONFIG.PanelX, CONFIG.PanelY, cw, ch, 0, 0, 0, 0.85)
    local r, g, b = hsl2rgb(rainbowHue, 0.8, 0.5)
    createFrame(CONFIG.PanelX, CONFIG.PanelY, cw, 30, 30, 30, 30, 1)
    createText("定制版 | 加载目标脚本", CONFIG.PanelX + cw/2, CONFIG.PanelY + 8, 16, r, g, b, 1)
    createText(State.PanelExpanded and "—" or "+", CONFIG.PanelX + 15, CONFIG.PanelY + 8, 18, 255, 255, 255, 1)
    createText("×", CONFIG.PanelX + cw - 25, CONFIG.PanelY + 8, 18, 255, 80, 80, 1)

    if State.PanelExpanded then
        local tabs = {"速度区", "搞笑区", "其他", "实用"}
        local tw = cw / #tabs
        for i, tab in ipairs(tabs) do
            local tx = CONFIG.PanelX + (i-1)*tw
            createFrame(tx, CONFIG.PanelY + 30, tw, 35, 40, 40, 40, 1)
            createText(tab, tx + tw/2, CONFIG.PanelY + 30 + 10, 14, 255, 255, 255, 1)
        end

        local cy = CONFIG.PanelY + 65
        createText("加载目标脚本", CONFIG.PanelX + 20, cy + 20, 16, 255, 255, 255, 1)
        local flyColor = State.FlyEnabled and {0,200,0} or {200,0,0}
        createFrame(CONFIG.PanelX + 20, cy + 50, 100, 30, flyColor[1], flyColor[2], flyColor[3], 0.8)
        createText(State.FlyEnabled and "已开启" or "开启加载", CONFIG.PanelX + 70, cy + 65, 14, 255, 255, 255, 1)

        createText("✅ 点击开启 → 自动加载目标脚本", CONFIG.PanelX + 200, cy + 20, 12, 255, 255, 255, 1)
        createText("✅ 加载状态实时显示在顶部", CONFIG.PanelX + 200, cy + 45, 12, 255, 255, 255, 1)
        createText("✅ 点击关闭 → 重置所有状态", CONFIG.PanelX + 200, cy + 70, 12, 255, 255, 255, 1)
    end

    if State.FlyUIOpen then drawFlyUI() end
end

local function bindInput()
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then return end

        local x, y = input.Position.X, input.Position.Y
        local hubX, hubY = State.HubPos.X, State.HubPos.Y
        if x >= hubX and x <= hubX + CONFIG.HubWidth and y >= hubY and y <= hubY + CONFIG.HubHeight then
            State.IsDraggingHub = true
            State.DragOffset = Vector2.new(x - hubX, y - hubY)
            return
        end

        if inputType == Enum.UserInputType.MouseButton1 then
            if not State.IsDraggingHub and x >= hubX and x <= hubX + CONFIG.HubWidth and y >= hubY and y <= hubY + CONFIG.HubHeight then
                State.PanelOpen = not State.PanelOpen
                State.NeedRedraw = true
                return
            end

            if State.PanelOpen then
                local cw = State.PanelExpanded and 500 or 200
                if x >= CONFIG.PanelX+5 and x <= CONFIG.PanelX+25 and y >= CONFIG.PanelY+5 and y <= CONFIG.PanelY+25 then
                    State.PanelExpanded = not State.PanelExpanded
                    State.NeedRedraw = true
                    return
                end
                if x >= CONFIG.PanelX+cw-25 and x <= CONFIG.PanelX+cw-5 and y >= CONFIG.PanelY+5 and y <= CONFIG.PanelY+25 then
                    State.PanelOpen = false
                    State.NeedRedraw = true
                    return
                end
                if State.PanelExpanded then
                    local cy = CONFIG.PanelY + 65
                    if x >= CONFIG.PanelX+20 and x <= CONFIG.PanelX+120 and y >= cy+50 and y <= cy+80 then
                        State.FlyEnabled = not State.FlyEnabled
                        State.FlyUIOpen = State.FlyEnabled
                        if State.FlyEnabled then
                            loadTargetScript()
                        else
                            resetAllState()
                        end
                        State.NeedRedraw = true
                        return
                    end
                end
            end

            if State.FlyUIOpen then
                local fx, fy = 600, 300
                if x >= fx+190 and x <= fx+220 and y >= fy and y <= fy+30 then
                    State.FlyUIOpen = false
                    State.NeedRedraw = true
                    return
                end
                if x >= fx+40 and x <= fx+100 and y >= fy and y <= fy+30 then
                    State.FlyEnabled = not State.FlyEnabled
                    if State.FlyEnabled then loadTargetScript() else resetAllState() end
                    State.NeedRedraw = true
                    return
                end
                if x >= fx+180 and x <= fx+200 and y >= fy+35 and y <= fy+55 then
                    State.FlySpeed = math.min(CONFIG.FlySpeedMax, State.FlySpeed + CONFIG.FlySpeedStep)
                    State.NeedRedraw = true
                    return
                end
                if x >= fx+200 and x <= fx+220 and y >= fy+35 and y <= fy+55 then
                    State.FlySpeed = math.max(CONFIG.FlySpeedMin, State.FlySpeed - CONFIG.FlySpeedStep)
                    State.NeedRedraw = true
                    return
                end
            end
        end
    end)

    UIS.InputChanged:Connect(function(input, gameProcessed)
        if gameProcessed or not State.IsDraggingHub then return end
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseMovement and inputType ~= Enum.UserInputType.Touch then return end

        local x, y = input.Position.X, input.Position.Y
        local newHubX = x - State.DragOffset.X
        local newHubY = y - State.DragOffset.Y
        newHubX = math.clamp(newHubX, 0, UIS.ViewSizeX - CONFIG.HubWidth)
        newHubY = math.clamp(newHubY, 0, UIS.ViewSizeY - CONFIG.HubHeight)
        State.HubPos = Vector2.new(newHubX, newHubY)
        State.NeedRedraw = true
    end)

    UIS.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            State.IsDraggingHub = false
        end
    end)
end

plr.CharacterAdded:Connect(function(newChar)
    char = newChar
    hum = newChar:WaitForChild("Humanoid")
    hrp = newChar:WaitForChild("HumanoidRootPart")
    resetAllState()
    State.NeedRedraw = true
end)

hum.Died:Connect(resetAllState)

RS.RenderStepped:Connect(function(dt)
    if State.PanelOpen then
        rainbowHue = (rainbowHue + dt * 80) % 360
    end
    if State.NeedRedraw then
        drawUI()
        State.NeedRedraw = false
    end
end)

bindInput()
resetAllState()
drawUI()

pcall(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if not sg:IsDescendantOf(plr.PlayerGui) then
            sg.Parent = plr.PlayerGui
        end
    end)
end)
