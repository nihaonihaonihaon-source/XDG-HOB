local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 0.3
background.Parent = screenGui

local countdownText = Instance.new("TextLabel")
countdownText.Size = UDim2.new(0, 200, 0, 100)
countdownText.Position = UDim2.new(0.5, -100, 0.5, -50)
countdownText.BackgroundTransparency = 1
countdownText.TextColor3 = Color3.new(1, 1, 1)
countdownText.TextScaled = true
countdownText.Font = Enum.Font.SourceSansBold
countdownText.Text = "3"
countdownText.Parent = screenGui

local function createParticleEffect(position)
local emitter = Instance.new("ParticleEmitter")
emitter.Size = NumberSequence.new(5)
emitter.Transparency = NumberSequence.new(0, 1)
emitter.Lifetime = NumberRange.new(0.5)
emitter.Speed = NumberRange.new(20)
emitter.Rate = 50
emitter.VelocitySpread = 180

end

local countdown = 3
local lastTime = tick()

local connection
connection = RunService.Heartbeat:Connect(function()
local currentTime = tick()
if currentTime - lastTime >= 1 then
lastTime = currentTime
countdown = countdown - 1

end)