local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

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
    local currentW = self.isExpanded and 