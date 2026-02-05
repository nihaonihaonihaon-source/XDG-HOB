local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XDGHOBAnimation"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.new(0, 0, 0)
Background.BorderSizePixel = 0
Background.ZIndex = 1

local ParticleContainer = Instance.new("Frame")
ParticleContainer.Name = "ParticleContainer"
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.ZIndex = 2

local TextContainer = Instance.new("Frame")
TextContainer.Name = "TextContainer"
TextContainer.Size = UDim2.new(1, 0, 1, 0)
TextContainer.BackgroundTransparency = 1
TextContainer.ZIndex = 3

local particles = {}
local colors = {
    Color3.new(1, 0.2, 0.2),
    Color3.new(0.2, 0.6, 1),
    Color3.new(0.8, 0.2, 1),
    Color3.new(0.2, 1, 0.4),
    Color3.new(1, 0.8, 0.2)
}

local function createParticle()
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(4, 12), 0, math.random(4, 12))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = colors[math.random(#colors)]
    particle.BorderSizePixel = 0
    particle.ZIndex = 2
    particle.Rotation = math.random(0, 360)
    particle.BackgroundTransparency = 0.7
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    
    particle.Parent = ParticleContainer
    table.insert(particles, {
        frame = particle,
        speedX = (math.random() - 0.5) * 0.5,
        speedY = (math.random() - 0.5) * 0.5,
        rotationSpeed = (math.random() - 0.5) * 5
    })
end

for i = 1, 50 do
    createParticle()
end

local textLetters = {}
local letterTexts = {"X", "D", "G", "-", "H", "O", "B"}

for i = 1, 7 do
    local letter = Instance.new("TextLabel")
    letter.Name = "Letter"..i
    letter.Size = UDim2.new(0, 80, 0, 120)
    letter.Position = UDim2.new(0.2 + (i-1) * 0.1, 0, 0.4, 0)
    letter.BackgroundTransparency = 1
    letter.Text = letterTexts[i]
    letter.TextColor3 = colors[((i-1) % #colors) + 1]
    letter.TextSize = 100
    letter.Font = Enum.Font.GothamBlack
    letter.TextTransparency = 1
    letter.TextStrokeTransparency = 0.8
    letter.TextStrokeColor3 = Color3.new(1, 1, 1)
    letter.ZIndex = 3
    
    local glow = Instance.new("TextLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(-0.125, 0, -0.083, 0)
    glow.BackgroundTransparency = 1
    glow.Text = letterTexts[i]
    glow.TextColor3 = letter.TextColor3
    glow.TextSize = 100
    glow.Font = Enum.Font.GothamBlack
    glow.TextTransparency = 0.9
    glow.TextStrokeTransparency = 1
    glow.ZIndex = 2
    glow.Parent = letter
    
    letter.Parent = TextContainer
    textLetters[i] = letter
end

ScreenGui.Parent = CoreGui
Background.Parent = ScreenGui
ParticleContainer.Parent = ScreenGui
TextContainer.Parent = ScreenGui

local function pulseEffect(target, intensity)
    spawn(function()
        for i = 1, 10 do
            local scale = 1 + (i/10) * intensity
            target.TextSize = 100 * scale
            task.wait(0.03)
        end
        for i = 10, 1, -1 do
            local scale = 1 + (i/10) * intensity
            target.TextSize = 100 * scale
            task.wait(0.03)
        end
        target.TextSize = 100
    end)
end

local function createExplosion(x, y, color)
    spawn(function()
        for i = 1, 15 do
            local star = Instance.new("Frame")
            star.Size = UDim2.new(0, math.random(8, 20), 0, math.random(8, 20))
            star.Position = UDim2.new(x, 0, y, 0)
            star.BackgroundColor3 = color
            star.BorderSizePixel = 0
            star.ZIndex = 4
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = star
            
            star.Parent = ParticleContainer
            
            local angle = math.rad(math.random(0, 360))
            local distance = 0.05
            local speedX = math.cos(angle) * distance
            local speedY = math.sin(angle) * distance
            
            spawn(function()
                for j = 1, 20 do
                    star.Position = UDim2.new(
                        star.Position.X.Scale + speedX,
                        star.Position.X.Offset,
                        star.Position.Y.Scale + speedY,
                        star.Position.Y.Offset
                    )
                    star.BackgroundTransparency = j/20
                    star.Size = UDim2.new(
                        0, star.Size.X.Offset * 0.9,
                        0, star.Size.Y.Offset * 0.9
                    )
                    task.wait(0.03)
                end
                star:Destroy()
            end)
            
            task.wait(0.05)
        end
    end)
end

local function animateBackground()
    local time = 0
    local connection
    connection = RunService.RenderStepped:Connect(function(delta)
        time = time + delta
        
        local r = (math.sin(time * 0.5) * 0.1) + 0.1
        local g = (math.sin(time * 0.7 + 1) * 0.05) + 0.05
        local b = (math.sin(time * 0.9 + 2) * 0.05) + 0.05
        Background.BackgroundColor3 = Color3.new(r, g, b)
        
        for i, particle in ipairs(particles) do
            local posX = particle.frame.Position.X.Scale + particle.speedX * delta
            local posY = particle.frame.Position.Y.Scale + particle.speedY * delta
            
            if posX < -0.1 then posX = 1.1 end
            if posX > 1.1 then posX = -0.1 end
            if posY < -0.1 then posY = 1.1 end
            if posY > 1.1 then posY = -0.1 end
            
            particle.frame.Position = UDim2.new(posX, 0, posY, 0)
            particle.frame.Rotation = particle.frame.Rotation + particle.rotationSpeed * delta
            
            local pulse = math.sin(time * 3 + i * 0.1) * 0.3 + 0.7
            particle.frame.BackgroundTransparency = 1 - (0.7 * pulse)
            
            local size = 4 + math.sin(time * 2 + i) * 4
            particle.frame.Size = UDim2.new(0, size, 0, size)
        end
    end)
    
    return connection
end

local function showLetters()
    for i = 1, 7 do
        local letter = textLetters[i]
        
        local tweenIn = TweenService:Create(letter, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            TextTransparency = 0,
            Position = UDim2.new(0.15 + (i-1) * 0.1, 0, 0.4, 0)
        })
        
        local glowTween = TweenService:Create(letter.Glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0.7
        })
        
        tweenIn:Play()
        glowTween:Play()
        
        createExplosion(0.15 + (i-1) * 0.1, 0.4, letter.TextColor3)
        pulseEffect(letter, 0.3)
        
        if i == 4 then
            task.wait(0.8)
        else
            task.wait(0.3)
        end
    end
    
    for i = 1, 3 do
        for _, letter in ipairs(textLetters) do
            pulseEffect(letter, 0.5)
        end
        task.wait(0.5)
    end
end

local bgConnection = animateBackground()

task.wait(1.5)

showLetters()

task.wait(3)

bgConnection:Disconnect()

local finalTween = TweenService:Create(Background, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    BackgroundTransparency = 1
})

for i = 1, 7 do
    local letter = textLetters[i]
    local letterTween = TweenService:Create(letter, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        TextTransparency = 1,
        Position = UDim2.new(0.15 + (i-1) * 0.1, 0, 0.35, 0)
    })
    letterTween:Play()
    
    local glowTween = TweenService:Create(letter.Glow, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        TextTransparency = 1
    })
    glowTween:Play()
end

for _, particle in ipairs(particles) do
    local particleTween = TweenService:Create(particle.frame, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 0, 0, 0)
    })
    particleTween:Play()
end

finalTween:Play()
task.wait(2.5)

ScreenGui:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/Play.lua"))()