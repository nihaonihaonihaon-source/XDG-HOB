local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local UI = {
    isOpen = false,
    isExpanded = true,
    x = 200, y = 100,
    w = 500, h = 300,
    minW = 200, minH = 60,
    drag = {active = false, x = 0, y = 0},
    rainbowHue = 0,
    titleHeight = 30,
    tabHeight = 35,
    triggerX = 50, triggerY = 50,
    triggerW = 120, triggerH = 30,
    currentTab = "速度区",
    tabs = {"速度区", "搞笑区", "其他脚本区", "实用区"},
    flyEnabled = false,
    flyUIOpen = false,
    flySpeed = 50,
    flyMinSpeed = 10,
    flyMaxSpeed = 200,
    flyStep = 10,
    flyUI = {
        x = 600, y = 300,
        w = 220, h = 80,
        drag = {active = false, x = 0, y = 0},
        speedBarWidth = 100,
        speedBarHeight = 10
    },
    moveDirection = Vector3.new(0, 0, 0),
    touchState = {
        active = false,
        startY = 0,
        currentY = 0
    }
}

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "XDG-HUB"
screenGui.IgnoreGuiInset = true

local function clearUI()
    for _, child in ipairs(screenGui:GetChildren()) do
        child:Destroy()
    end
end

local function hsl2rgb(h, s, l)
    h = h / 360
    local r, g, b
    if s == 0 then
        r, g, b = l, l, l
    else
        local function hue2rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1/6 then return p + (q - p) * 6 * t end
            if t < 1/2 then return q end
            if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
            return p
        end
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        r = hue2rgb(p, q, h + 1/3)
        g = hue2rgb(p, q, h)
        b = hue2rgb(p, q, h - 1/3)
    end
    return math.floor(r*255), math.floor(g*255), math.floor(b*255)
end

local function createFrame(x, y, w, h, r, g, b, a, parent)
    local frame = Instance.new("Frame")
    frame.Parent = parent or screenGui
    frame.Position = UDim2.new(0, x, 0, y)
    frame.Size = UDim2.new(0, w, 0, h)
    frame.BackgroundColor3 = Color3.fromRGB(r, g, b)
    frame.BackgroundTransparency = 1 - a
    frame.BorderSizePixel = 0
    return frame
end

local function createText(text, x, y, size, r, g, b, a, parent)
    local label = Instance.new("TextLabel")
    label.Parent = parent or screenGui
    label.Position = UDim2.new(0, x, 0, y)
    label.Size = UDim2.new(0, text:len() * size + 10, 0, size + 4)
    label.Text = text
    label.TextColor3 = Color3.fromRGB(r, g, b)
    label.TextTransparency = 1 - a
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = size
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    return label
end

function UI:update(deltaTime)
    if self.isOpen then
        self.rainbowHue = (self.rainbowHue + deltaTime * 80) % 360
    end
    if self.flyEnabled and humanoidRootPart and humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FreeFall, false)
        humanoid.GravityScale = 0
        humanoid.WalkSpeed = 0
        local moveDir = self.moveDirection
        local yDir = 0
        if self.touchState.active then
            local deltaY = self.touchState.currentY - self.touchState.startY
            yDir = deltaY < -20 and 1 or (deltaY > 20 and -1 or 0)
        end
        local direction = Vector3.new(moveDir.X, yDir, moveDir.Z)
        if direction.Magnitude > 0 then
            direction = direction.Unit
        end
        humanoidRootPart.Velocity = direction * self.flySpeed
    else
        if humanoid then
            humanoid.GravityScale = 1
            humanoid.WalkSpeed = 16
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FreeFall, true)
            humanoidRootPart.Velocity = Vector3.new(0, humanoidRootPart.Velocity.Y, 0)
        end
        self.moveDirection = Vector3.new(0, 0, 0)
    end
end

function UI:draw()
    clearUI()
    local triggerFrame = createFrame(self.triggerX, self.triggerY, self.triggerW, self.triggerH, 70, 70, 70, 1)
    createText("XDG-HUB", self.triggerX + 10, self.triggerY + 5, 16, 255, 255, 255, 1)
    if not self.isOpen then
        if self.flyUIOpen then
            self:drawFlyUI()
        end
        return
    end
    local currentW = self.isExpanded and self.w or self.minW
    local currentH = self.isExpanded and self.h or self.minH
    local mainFrame = createFrame(self.x, self.y, currentW, currentH, 0, 0, 0, 0.8)
    local titleFrame = createFrame(self.x, self.y, currentW, self.titleHeight, 30, 30, 30, 1)
    local r, g, b = hsl2rgb(self.rainbowHue, 0.8, 0.5)
    createText("XDG-HUB", self.x + currentW - 80, self.y + 5, 16, r, g, b, 1)
    local toggleText = self.isExpanded and "—" or "+"
    createText(toggleText, self.x + 10, self.y + 8, 18, 255, 255, 255, 1)
    createText("×", self.x + currentW - 30, self.y + 8, 18, 255, 80, 80, 1)
    if self.isExpanded then
        local tabW = currentW / #self.tabs
        for i, tab in ipairs(self.tabs) do
            local tabX = self.x + (i - 1) * tabW
            local cr, cg, cb = self.currentTab == tab and 60, 60, 60 or 40, 40, 40
            local tabFrame = createFrame(tabX, self.y + self.titleHeight, tabW, self.tabHeight, cr, cg, cb, 1)
            createText(tab, tabX + tabW/2, self.y + self.titleHeight + 5, 14, 255, 255, 255, 1)
        end
        local contentY = self.y + self.titleHeight + self.tabHeight
        if self.currentTab == "速度区" then
            createText("飞行功能", self.x + 20, contentY + 20, 16, 255, 255, 255, 1)
            local flyButton = createFrame(self.x + 20, contentY + 50, 100, 30, self.flyEnabled and 0, 200, 0 or 200, 0, 0, 0.8)
            createText(self.flyEnabled and "飞行[开启]" or "飞行[关闭]", self.x + 30, contentY + 55, 14, 255, 255, 255, 1)
        else
            createText("该分类暂未添加功能", self.x + 20, contentY + 20, 16, 180, 180, 180, 1)
        end
    end
    if self.flyUIOpen then
        self:drawFlyUI()
    end
end

function UI:drawFlyUI()
    local f = self.flyUI
    local mainFrame = createFrame(f.x, f.y, f.w, f.h, 20, 20, 20, 0.9)
    local dragFrame = createFrame(f.x, f.y, 40, f.h, 40, 40, 40, 1)
    createText("⬆️⬅️➡️⬇️", f.x + 5, f.y + 20, 14, 255, 255, 255, 1)
    local closeFrame = createFrame(f.x + f.w - 30, f.y, 30, 30, 150, 0, 0, 0.8)
    createText("×", f.x + f.w - 22, f.y + 5, 16, 255, 255, 255, 1)
    local toggleFrame = createFrame(f.x + 40, f.y, 60, 30, self.flyEnabled and 0, 180, 0 or 180, 0, 0, 0.8)
    createText(self.flyEnabled and "开" or "关", f.x + 70, f.y + 5, 14, 255, 255, 255, 1)
    local minusFrame = createFrame(f.x + 40, f.y + 35, 20, f.speedBarHeight + 4, 200, 0, 0, 1)
    createText("-", f.x + 50, f.y + 35, 14, 255, 255, 255, 1)
    local speedBg = createFrame(f.x + 60, f.y + 37, f.speedBarWidth, f.speedBarHeight, 60, 60, 60, 1)
    local speedFillW = (self.flySpeed - self.flyMinSpeed) / (self.flyMaxSpeed - self.flyMinSpeed) * f.speedBarWidth
    local speedFill = createFrame(f.x + 60, f.y + 37, math.max(0, speedFillW), f.speedBarHeight, 0, 150, 255, 1)
    local plusFrame = createFrame(f.x + 60 + f.speedBarWidth, f.y + 35, 20, f.speedBarHeight + 4, 0, 200, 0, 1)
    createText("+", f.x + 70 + f.speedBarWidth, f.y + 35, 14, 255, 255, 255, 1)
    createText("速度: " .. self.flySpeed, f.x + 80, f.y + 55, 12, 255, 255, 255, 1)
end

function UI:mousePressed(x, y, button)
    if button ~= 1 then return end
    if x >= self.triggerX and x <= self.triggerX + self.triggerW and y >= self.triggerY and y <= self.triggerY + self.triggerH then
        self.isOpen = not self.isOpen
        self:draw()
        return
    end
    if self.flyUIOpen then
        local f = self.flyUI
        if x >= f.x and x <= f.x + 40 and y >= f.y and y <= f.y + f.h then
            self.flyUI.drag.active = true
            self.flyUI.drag.x = x - f.x
            self.flyUI.drag.y = y - f.y
            self:draw()
            return
        end
        if x >= f.x + f.w - 30 and x <= f.x + f.w and y >= f.y and y <= f.y + 30 then
            self.flyUIOpen = false
            self:draw()
            return
        end
        if x >= f.x + 40 and x <= f.x + 100 and y >= f.y and y <= f.y + 30 then
            self.flyEnabled = not self.flyEnabled
            self.flyUIOpen = self.flyEnabled
            self:draw()
            return
        end
        if x >= f.x + 40 and x <= f.x + 60 and y >= f.y + 35 and y <= f.y + 45 then
            self.flySpeed = math.clamp(self.flySpeed - self.flyStep, self.flyMinSpeed, self.flyMaxSpeed)
            self:draw()
            return
        end
        if x >= f.x + 60 + f.speedBarWidth and x <= f.x + 80 + f.speedBarWidth and y >= f.y + 35 and y <= f.y + 45 then
            self.flySpeed = math.clamp(self.flySpeed + self.flyStep, self.flyMinSpeed, self.flyMaxSpeed)
            self:draw()
            return
        end
        if x >= f.x + 60 and x <= f.x + 60 + f.speedBarWidth and y >= f.y + 37 and y <= f.y + 47 then
            local newSpeed = math.clamp((x - (f.x + 60)) / f.speedBarWidth * (self.flyMaxSpeed - self.flyMinSpeed) + self.flyMinSpeed, self.flyMinSpeed, self.flyMaxSpeed)
            self.flySpeed = math.floor(newSpeed)
            self:draw()
            return
        end
    end
    if not self.isOpen then return end
    local currentW = self.isExpanded and self.w or self.minW
    local currentH = self.isExpanded and self.h or self.minH
    if x >= self.x + currentW - 30 and x <= self.x + currentW and y >= self.y and y <= self.y + self.titleHeight then
        self.isOpen = false
        self:draw()
        return
    end
    if x >= self.x + 5 and x <= self.x + 25 and y >= self.y and y <= self.y + self.titleHeight then
        self.isExpanded = not self.isExpanded
        self:draw()
        return
    end
    if x >= self.x and x <= self.x + currentW and y >= self.y and y <= self.y + self.titleHeight then
        self.drag.active = true
        self.drag.x = x - self.x
        self.drag.y = y - self.y
        self:draw()
        return
    end
    if self.isExpanded then
        local tabW = currentW / #self.tabs
        for i, tab in ipairs(self.tabs) do
            local tabX = self.x + (i - 1) * tabW
            if x >= tabX and x <= tabX + tabW and y >= self.y + self.titleHeight and y <= self.y + self.titleHeight + self.tabHeight then
                self.currentTab = tab
                self:draw()
                return
            end
        end
        local contentY = self.y + self.titleHeight + self.tabHeight
        if self.currentTab == "速度区" and x >= self.x + 20 and x <= self.x + 120 and y >= contentY + 50 and y <= contentY + 80 then
            self.flyEnabled = not self.flyEnabled
            self.flyUIOpen = self.flyEnabled
            self:draw()
            return
        end
    end
end

function UI:mouseMoved(x, y)
    if self.drag.active then
        self.x = x - self.drag.x
        self.y = y - self.drag.y
        self:draw()
    end
    if self.flyUI.drag.active then
        self.flyUI.x = x - self.flyUI.drag.x
        self.flyUI.y = y - self.flyUI.drag.y
        self:draw()
    end
end

function UI:mouseReleased(x, y, button)
    if button == 1 then
        self.drag.active = false
        self.flyUI.drag.active = false
        self.touchState.active = false
    end
end

local function onMove(actionName, inputState, inputObject)
    if not UI.flyEnabled then return end
    if inputState == Enum.UserInputState.Change then
        local x = inputObject.Position.X
        local z = inputObject.Position.Y
        UI.moveDirection = Vector3.new(x, 0, z)
    else
        UI.moveDirection = Vector3.new(0, 0, 0)
    end
end

ContextActionService:BindAction("Move", onMove, false, Enum.PlayerActions.Move)

UserInputService.TouchStarted:Connect(function(input, gameProcessed)
    if gameProcessed or not UI.flyEnabled then return end
    UI.touchState.active = true
    UI.touchState.startY = input.Position.Y
    UI.touchState.currentY = input.Position.Y
end)

UserInputService.TouchMoved:Connect(function(input, gameProcessed)
    if gameProcessed or not UI.flyEnabled or not UI.touchState.active then return end
    UI.touchState.currentY = input.Position.Y
end)

UserInputService.TouchEnded:Connect(function(input, gameProcessed)
    if not UI.touchState.active then return end
    UI.touchState.active = false
    UI.touchState.startY = 0
    UI.touchState.currentY = 0
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        UI:mousePressed(input.Position.X, input.Position.Y, 1)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        UI:mouseReleased(input.Position.X, input.Position.Y, 1)
    end
end)

UserInputService.MouseMoved:Connect(function(x, y)
    UI:mouseMoved(x, y)
end)

character.HumanoidRootPart.Changed:Connect(function(property)
    if property == "Parent" then
        humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
end)

Players.PlayerAdded:Connect(function(newPlayer)
    newPlayer.CharacterAdded:Wait()
    local cloneGui = screenGui:Clone()
    cloneGui.Parent = newPlayer.PlayerGui
end)

for _, existingPlayer in ipairs(Players:GetPlayers()) do
    if existingPlayer ~= player then
        local cloneGui = screenGui:Clone()
        cloneGui.Parent = existingPlayer.PlayerGui
    end
end

RunService.RenderStepped:Connect(function(deltaTime)
    UI:update(deltaTime)
    UI:draw()
end)
