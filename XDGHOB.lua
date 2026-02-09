--[[偷你妈的源码呢,没妈的孤儿😂😂😂
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--偷我源码的人全家死完

local Players = game:GetService("Players");
local player = Players.LocalPlayer;
local StarterGui = game:GetService("StarterGui");
local UIS = game:GetService("UserInputService");
local RunService = game:GetService("RunService");
StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="欢迎使用XDG-HOB",Duration=5});
print("欢迎使用XDG-HOB");
task.spawn(function()
	local FlatIdent_2584C = 0;
	local success;
	while true do
		if (FlatIdent_2584C == 0) then
			task.wait(1);
			success = pcall(function()
				setclipboard("作者QQ361097232");
			end);
			FlatIdent_2584C = 1;
		end
		if (FlatIdent_2584C == 1) then
			if success then
				StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="作者QQ已复制到剪贴板: 361097232",Duration=5,Icon="rbxassetid://4483345998"});
			end
			break;
		end
	end
end);
task.wait(0.5);
local function detectExecutor()
	local FlatIdent_6D4CB = 0;
	local executors;
	while true do
		if (FlatIdent_6D4CB == 1) then
			return "忍者注入器";
		end
		if (FlatIdent_6D4CB == 0) then
			executors = {["Synapse X"]=function()
				return tostring(identifyexecutor or gethui):find("Synapse");
			end,["Script-Ware"]=function()
				return tostring(getexecutorname):find("Script");
			end,Krnl=function()
				return tostring(KRNL_LOADED):find("true");
			end,Fluxus=function()
				return tostring(get_hui):find("Fluxus");
			end,Comet=function()
				return tostring(comet):find("table");
			end,["Oxygen U"]=function()
				return tostring(Oxygen):find("table");
			end,Delta=function()
				return tostring(delta):find("table");
			end};
			for name, checkFunc in pairs(executors) do
				local FlatIdent_12703 = 0;
				local success;
				local result;
				while true do
					if (FlatIdent_12703 == 0) then
						success, result = pcall(checkFunc);
						if (success and result) then
							return name;
						end
						break;
					end
				end
			end
			FlatIdent_6D4CB = 1;
		end
	end
end
local executorName = detectExecutor();
local function getBeijingTime()
	local FlatIdent_2BD95 = 0;
	local currentTime;
	local adjustedTime;
	local timeData;
	while true do
		if (FlatIdent_2BD95 == 1) then
			timeData = os.date("*t", adjustedTime);
			return string.format("%04d年%02d月%02d日 %02d:%02d:%02d", timeData.year, timeData.month, timeData.day, timeData.hour, timeData.min, timeData.sec);
		end
		if (FlatIdent_2BD95 == 0) then
			currentTime = os.time();
			adjustedTime = currentTime - (8 * 3600);
			FlatIdent_2BD95 = 1;
		end
	end
end
local AntiDetectSpeedModule = {};
do
	local FlatIdent_60EA1 = 0;
	local Player;
	local Character;
	local Humanoid;
	local WalkSpeedBackup;
	local TargetSpeed;
	local IsUpdating;
	local UpdateConnection;
	local GetRealSpeed;
	local SetRealSpeed;
	local SafeUpdateLoop;
	local SetupPropertyProtection;
	while true do
		if (FlatIdent_60EA1 == 2) then
			function GetRealSpeed()
				return TargetSpeed;
			end
			SetRealSpeed = nil;
			function SetRealSpeed(NewSpeed)
				local FlatIdent_104D4 = 0;
				while true do
					if (FlatIdent_104D4 == 0) then
						TargetSpeed = NewSpeed;
						if not IsUpdating then
							IsUpdating = true;
							task.spawn(function()
								local FlatIdent_940A0 = 0;
								local RandomDelay;
								while true do
									if (1 == FlatIdent_940A0) then
										if (Humanoid and Humanoid.Parent) then
											Humanoid.WalkSpeed = TargetSpeed;
										end
										IsUpdating = false;
										break;
									end
									if (FlatIdent_940A0 == 0) then
										RandomDelay = math.random(10, 30) / 100;
										task.wait(RandomDelay);
										FlatIdent_940A0 = 1;
									end
								end
							end);
						end
						break;
					end
				end
			end
			SafeUpdateLoop = nil;
			FlatIdent_60EA1 = 3;
		end
		if (1 == FlatIdent_60EA1) then
			TargetSpeed = WalkSpeedBackup;
			IsUpdating = false;
			UpdateConnection = nil;
			GetRealSpeed = nil;
			FlatIdent_60EA1 = 2;
		end
		if (FlatIdent_60EA1 == 4) then
			SetupPropertyProtection();
			SafeUpdateLoop();
			AntiDetectSpeedModule.GetRealSpeed = GetRealSpeed;
			AntiDetectSpeedModule.SetRealSpeed = SetRealSpeed;
			break;
		end
		if (FlatIdent_60EA1 == 0) then
			Player = game:GetService("Players").LocalPlayer;
			Character = Player.Character or Player.CharacterAdded:Wait();
			Humanoid = Character:WaitForChild("Humanoid");
			WalkSpeedBackup = Humanoid.WalkSpeed;
			FlatIdent_60EA1 = 1;
		end
		if (FlatIdent_60EA1 == 3) then
			function SafeUpdateLoop()
				if UpdateConnection then
					UpdateConnection:Disconnect();
				end
				UpdateConnection = game:GetService("RunService").Heartbeat:Connect(function()
					if (Humanoid and Humanoid.Parent) then
						local FlatIdent_40CF = 0;
						local Current;
						local Target;
						while true do
							if (FlatIdent_40CF == 0) then
								Current = Humanoid.WalkSpeed;
								Target = GetRealSpeed();
								FlatIdent_40CF = 1;
							end
							if (FlatIdent_40CF == 1) then
								if (math.abs(Current - Target) > 0.1) then
									local Step = math.sign(Target - Current) * math.min(math.abs(Target - Current), 2);
									Humanoid.WalkSpeed = Current + Step;
								end
								break;
							end
						end
					end
				end);
			end
			SetupPropertyProtection = nil;
			function SetupPropertyProtection()
				Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
					if (Humanoid.WalkSpeed ~= GetRealSpeed()) then
						local FlatIdent_79536 = 0;
						while true do
							if (FlatIdent_79536 == 0) then
								task.wait(math.random(5, 15) / 100);
								Humanoid.WalkSpeed = GetRealSpeed();
								break;
							end
						end
					end
				end);
			end
			Player.CharacterAdded:Connect(function(NewChar)
				task.wait(0.5);
				Character = NewChar;
				Humanoid = Character:WaitForChild("Humanoid");
				SetupPropertyProtection();
				SafeUpdateLoop();
				Humanoid.WalkSpeed = GetRealSpeed();
			end);
			FlatIdent_60EA1 = 4;
		end
	end
end
local sg = Instance.new("ScreenGui");
sg.Name = "XDGHOB_UI";
sg.ResetOnSpawn = false;
sg.Parent = player:WaitForChild("PlayerGui");
local uiFrame = Instance.new("Frame");
uiFrame.Name = "MainUI";
uiFrame.Size = UDim2.new(0, 380, 0, 240);
local viewportSize = workspace.CurrentCamera.ViewportSize;
local frameSize = uiFrame.AbsoluteSize;
local centerX = (viewportSize.X - frameSize.X) / 2;
local centerY = (viewportSize.Y - frameSize.Y) / 2;
uiFrame.Position = UDim2.new(0, centerX, 0, centerY);
uiFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35);
uiFrame.BackgroundTransparency = 0.1;
uiFrame.BorderSizePixel = 0;
uiFrame.Active = true;
uiFrame.Selectable = true;
uiFrame.Parent = sg;
local outerStroke = Instance.new("UIStroke");
outerStroke.Name = "OuterStroke";
outerStroke.Thickness = 3;
outerStroke.Color = Color3.fromRGB(70, 145, 255);
outerStroke.Transparency = 0.1;
outerStroke.Parent = uiFrame;
local innerStroke = Instance.new("UIStroke");
innerStroke.Name = "InnerStroke";
innerStroke.Thickness = 1;
innerStroke.Color = Color3.fromRGB(120, 200, 255);
innerStroke.Transparency = 0.3;
innerStroke.Parent = uiFrame;
local cornerGlow = Instance.new("Frame");
cornerGlow.Name = "CornerGlow";
cornerGlow.Size = UDim2.new(1, 6, 1, 6);
cornerGlow.Position = UDim2.new(0, -3, 0, -3);
cornerGlow.BackgroundColor3 = Color3.fromRGB(70, 145, 255);
cornerGlow.BackgroundTransparency = 0.95;
cornerGlow.BorderSizePixel = 0;
cornerGlow.ZIndex = -1;
cornerGlow.Parent = uiFrame;
local titleBar = Instance.new("Frame");
titleBar.Name = "TitleBar";
titleBar.Size = UDim2.new(1, 0, 0, 40);
titleBar.Position = UDim2.new(0, 0, 0, 0);
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 48);
titleBar.BorderSizePixel = 0;
titleBar.Active = true;
titleBar.Selectable = true;
titleBar.Parent = uiFrame;
local gradient = Instance.new("UIGradient");
gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 145, 255)),ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 180, 255))});
gradient.Rotation = 90;
gradient.Parent = titleBar;
local rainbowText = Instance.new("TextLabel");
rainbowText.Name = "RainbowTitle";
rainbowText.Size = UDim2.new(1, 0, 1, 0);
rainbowText.Position = UDim2.new(0, 0, 0, 0);
rainbowText.BackgroundTransparency = 1;
rainbowText.Text = "✨ XDG-HOB ✨";
rainbowText.TextColor3 = Color3.new(1, 1, 1);
rainbowText.Font = Enum.Font.GothamBlack;
rainbowText.TextSize = 20;
rainbowText.TextStrokeTransparency = 0.7;
rainbowText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
rainbowText.Parent = titleBar;
local controlBtn = Instance.new("TextButton");
controlBtn.Name = "ControlButton";
controlBtn.Size = UDim2.new(0, 100, 0, 36);
controlBtn.Position = UDim2.new(0, 100, 0, 100);
controlBtn.BackgroundColor3 = Color3.fromRGB(70, 145, 255);
controlBtn.Text = "XDG-HOB";
controlBtn.TextColor3 = Color3.new(1, 1, 1);
controlBtn.Font = Enum.Font.GothamBlack;
controlBtn.TextSize = 14;
controlBtn.TextStrokeTransparency = 0.6;
controlBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
controlBtn.Active = true;
controlBtn.Selectable = true;
controlBtn.Parent = sg;
local btnOuterStroke = Instance.new("UIStroke");
btnOuterStroke.Name = "BtnOuterStroke";
btnOuterStroke.Thickness = 2;
btnOuterStroke.Color = Color3.fromRGB(200, 220, 255);
btnOuterStroke.Transparency = 0.2;
btnOuterStroke.Parent = controlBtn;
local btnInnerStroke = Instance.new("UIStroke");
btnInnerStroke.Name = "BtnInnerStroke";
btnInnerStroke.Thickness = 1;
btnInnerStroke.Color = Color3.fromRGB(255, 255, 255);
btnInnerStroke.Transparency = 0.4;
btnInnerStroke.Parent = controlBtn;
local btnGlow = Instance.new("Frame");
btnGlow.Name = "BtnGlow";
btnGlow.Size = UDim2.new(1, 8, 1, 8);
btnGlow.Position = UDim2.new(0, -4, 0, -4);
btnGlow.BackgroundColor3 = Color3.fromRGB(70, 145, 255);
btnGlow.BackgroundTransparency = 0.9;
btnGlow.BorderSizePixel = 0;
btnGlow.ZIndex = -1;
btnGlow.Parent = controlBtn;
local leftPanel = Instance.new("Frame");
leftPanel.Name = "LeftPanel";
leftPanel.Size = UDim2.new(0, 110, 1, -40);
leftPanel.Position = UDim2.new(0, 0, 0, 40);
leftPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 42);
leftPanel.BorderSizePixel = 0;
leftPanel.Parent = uiFrame;
local leftPanelStroke = Instance.new("UIStroke");
leftPanelStroke.Name = "LeftPanelStroke";
leftPanelStroke.Thickness = 1;
leftPanelStroke.Color = Color3.fromRGB(60, 60, 70);
leftPanelStroke.Transparency = 0.5;
leftPanelStroke.Parent = leftPanel;
local scrollFrame = Instance.new("ScrollingFrame");
scrollFrame.Name = "CategoryScroll";
scrollFrame.Size = UDim2.new(1, 0, 1, 0);
scrollFrame.BackgroundTransparency = 1;
scrollFrame.ScrollBarThickness = 6;
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110);
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 160);
scrollFrame.Parent = leftPanel;
local listLayout = Instance.new("UIListLayout");
listLayout.Parent = scrollFrame;
listLayout.Padding = UDim.new(0, 8);
local categories = {"实用区","功能区","信息区","其他脚本区"};
local selectedCategory = 1;
local contentContainers = {};
local contentFrame = Instance.new("Frame");
contentFrame.Name = "ContentFrame";
contentFrame.Size = UDim2.new(1, -110, 1, -40);
contentFrame.Position = UDim2.new(0, 110, 0, 40);
contentFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 40);
contentFrame.BorderSizePixel = 0;
contentFrame.Parent = uiFrame;
local contentFrameStroke = Instance.new("UIStroke");
contentFrameStroke.Name = "ContentFrameStroke";
contentFrameStroke.Thickness = 1;
contentFrameStroke.Color = Color3.fromRGB(60, 60, 70);
contentFrameStroke.Transparency = 0.5;
contentFrameStroke.Parent = contentFrame;
local WallWalkModule = {Enabled=false,Connection=nil,Speed=26,LastUpdate=0,NoClipParts={},CharacterAddedConnection=nil,JumpConnection=nil};
WallWalkModule.Toggle = function(self)
	local FlatIdent_65290 = 0;
	while true do
		if (FlatIdent_65290 == 1) then
			return self.Enabled;
		end
		if (FlatIdent_65290 == 0) then
			self.Enabled = not self.Enabled;
			if self.Enabled then
				self:Start();
			else
				self:Stop();
			end
			FlatIdent_65290 = 1;
		end
	end
end;
WallWalkModule.Start = function(self)
	local FlatIdent_2D2B8 = 0;
	local plr;
	while true do
		if (FlatIdent_2D2B8 == 2) then
			self.Connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
				if (not self.Enabled or ((tick() - self.LastUpdate) < 0.05)) then
					return;
				end
				self.LastUpdate = tick();
				local char = plr.Character;
				if not char then
					return;
				end
				local root = char:FindFirstChild("HumanoidRootPart");
				if not root then
					return;
				end
				local UIS = game:GetService("UserInputService");
				local dir = Vector3.zero;
				local cf = root.CFrame;
				if UIS:IsKeyDown(Enum.KeyCode.W) then
					dir = dir + cf.LookVector;
				end
				if UIS:IsKeyDown(Enum.KeyCode.S) then
					dir = dir - cf.LookVector;
				end
				if UIS:IsKeyDown(Enum.KeyCode.A) then
					dir = dir - cf.RightVector;
				end
				if UIS:IsKeyDown(Enum.KeyCode.D) then
					dir = dir + cf.RightVector;
				end
				if UIS:IsKeyDown(Enum.KeyCode.Space) then
					dir = dir + Vector3.new(0, 1, 0);
				end
				if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
					dir = dir + Vector3.new(0, -1, 0);
				end
				if (dir.Magnitude > 0) then
					local FlatIdent_324DE = 0;
					local speed;
					while true do
						if (FlatIdent_324DE == 1) then
							root.CFrame = root.CFrame + (dir * speed * dt);
							break;
						end
						if (0 == FlatIdent_324DE) then
							dir = dir.Unit;
							speed = self.Speed * (0.9 + (math.random() * 0.2));
							FlatIdent_324DE = 1;
						end
					end
				end
			end);
			break;
		end
		if (FlatIdent_2D2B8 == 1) then
			if plr.Character then
				self:SetupCharacter(plr.Character);
			end
			self.CharacterAddedConnection = plr.CharacterAdded:Connect(function(char)
				self:SetupCharacter(char);
			end);
			FlatIdent_2D2B8 = 2;
		end
		if (FlatIdent_2D2B8 == 0) then
			plr = game:GetService("Players").LocalPlayer;
			self.NoClipParts = {};
			FlatIdent_2D2B8 = 1;
		end
	end
end;
WallWalkModule.SetupCharacter = function(self, char)
	local FlatIdent_7909D = 0;
	local humanoid;
	while true do
		if (FlatIdent_7909D == 0) then
			task.wait(0.2);
			if self.JumpConnection then
				local FlatIdent_D79D = 0;
				while true do
					if (0 == FlatIdent_D79D) then
						self.JumpConnection:Disconnect();
						self.JumpConnection = nil;
						break;
					end
				end
			end
			FlatIdent_7909D = 1;
		end
		if (FlatIdent_7909D == 2) then
			humanoid = char:WaitForChild("Humanoid");
			self.JumpConnection = humanoid.StateChanged:Connect(function(oldState, newState)
				if (newState == Enum.HumanoidStateType.Jumping) then
					local FlatIdent_28F3E = 0;
					while true do
						if (FlatIdent_28F3E == 0) then
							task.wait(0.05);
							for _, part in pairs(char:GetDescendants()) do
								if part:IsA("BasePart") then
									part.CanCollide = not self.Enabled;
								end
							end
							break;
						end
					end
				elseif (newState == Enum.HumanoidStateType.Landed) then
					if not self.Enabled then
						task.wait(0.1);
						for _, part in pairs(char:GetDescendants()) do
							if part:IsA("BasePart") then
								part.CanCollide = true;
							end
						end
					end
				end
			end);
			break;
		end
		if (FlatIdent_7909D == 1) then
			for _, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") then
					local FlatIdent_40B41 = 0;
					while true do
						if (FlatIdent_40B41 == 0) then
							part.CanCollide = not self.Enabled;
							table.insert(self.NoClipParts, part);
							break;
						end
					end
				end
			end
			char.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("BasePart") then
					local FlatIdent_AC2F = 0;
					while true do
						if (FlatIdent_AC2F == 0) then
							task.wait(0.1);
							descendant.CanCollide = not self.Enabled;
							FlatIdent_AC2F = 1;
						end
						if (FlatIdent_AC2F == 1) then
							table.insert(self.NoClipParts, descendant);
							break;
						end
					end
				end
			end);
			FlatIdent_7909D = 2;
		end
	end
end;
WallWalkModule.Stop = function(self)
	if self.Connection then
		local FlatIdent_2F37F = 0;
		while true do
			if (FlatIdent_2F37F == 0) then
				self.Connection:Disconnect();
				self.Connection = nil;
				break;
			end
		end
	end
	if self.CharacterAddedConnection then
		local FlatIdent_5998C = 0;
		while true do
			if (FlatIdent_5998C == 0) then
				self.CharacterAddedConnection:Disconnect();
				self.CharacterAddedConnection = nil;
				break;
			end
		end
	end
	if self.JumpConnection then
		local FlatIdent_2388 = 0;
		while true do
			if (FlatIdent_2388 == 0) then
				self.JumpConnection:Disconnect();
				self.JumpConnection = nil;
				break;
			end
		end
	end
	local plr = game:GetService("Players").LocalPlayer;
	if plr.Character then
		for _, part in pairs(plr.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = true;
			end
		end
	end
	self.NoClipParts = {};
end;
local AntiDetectJumpModule = {};
do
	local FlatIdent_8BC55 = 0;
	local Player;
	local TargetJumpHeight;
	local JumpConnection;
	local CharacterAddedConnection;
	local updateJumpHeight;
	local setupCharacter;
	while true do
		if (FlatIdent_8BC55 == 4) then
			AntiDetectJumpModule.SetJumpHeight = function(NewHeight)
				local FlatIdent_634AF = 0;
				while true do
					if (0 == FlatIdent_634AF) then
						if ((NewHeight >= 7.2) and (NewHeight <= 500)) then
							local FlatIdent_4223E = 0;
							local character;
							while true do
								if (FlatIdent_4223E == 0) then
									TargetJumpHeight = NewHeight;
									updateJumpHeight();
									FlatIdent_4223E = 1;
								end
								if (FlatIdent_4223E == 1) then
									character = Player.Character;
									if character then
										local humanoids = character:GetDescendants();
										for _, obj in pairs(humanoids) do
											if obj:IsA("Humanoid") then
												obj.JumpHeight = TargetJumpHeight;
											end
										end
										local mainHumanoid = character:FindFirstChildOfClass("Humanoid");
										if mainHumanoid then
											mainHumanoid.JumpHeight = TargetJumpHeight;
										end
									end
									FlatIdent_4223E = 2;
								end
								if (FlatIdent_4223E == 2) then
									return true;
								end
							end
						end
						return false;
					end
				end
			end;
			AntiDetectJumpModule.Cleanup = function()
				local FlatIdent_28855 = 0;
				local character;
				while true do
					if (FlatIdent_28855 == 1) then
						character = Player.Character;
						if character then
							local FlatIdent_4A248 = 0;
							local humanoids;
							while true do
								if (0 == FlatIdent_4A248) then
									humanoids = character:GetDescendants();
									for _, obj in pairs(humanoids) do
										if obj:IsA("Humanoid") then
											obj.JumpHeight = 7.2;
										end
									end
									break;
								end
							end
						end
						break;
					end
					if (FlatIdent_28855 == 0) then
						if JumpConnection then
							local FlatIdent_276C2 = 0;
							while true do
								if (FlatIdent_276C2 == 0) then
									JumpConnection:Disconnect();
									JumpConnection = nil;
									break;
								end
							end
						end
						if CharacterAddedConnection then
							local FlatIdent_6D68E = 0;
							while true do
								if (FlatIdent_6D68E == 0) then
									CharacterAddedConnection:Disconnect();
									CharacterAddedConnection = nil;
									break;
								end
							end
						end
						FlatIdent_28855 = 1;
					end
				end
			end;
			break;
		end
		if (FlatIdent_8BC55 == 0) then
			Player = game:GetService("Players").LocalPlayer;
			TargetJumpHeight = 7.2;
			JumpConnection = nil;
			FlatIdent_8BC55 = 1;
		end
		if (2 == FlatIdent_8BC55) then
			setupCharacter = nil;
			function setupCharacter()
				local FlatIdent_FA88 = 0;
				local character;
				while true do
					if (FlatIdent_FA88 == 0) then
						character = Player.Character;
						if character then
							local FlatIdent_580CB = 0;
							local humanoids;
							local mainHumanoid;
							while true do
								if (FlatIdent_580CB == 2) then
									if mainHumanoid then
										mainHumanoid.JumpHeight = TargetJumpHeight;
									end
									break;
								end
								if (FlatIdent_580CB == 1) then
									for _, obj in pairs(humanoids) do
										if obj:IsA("Humanoid") then
											local FlatIdent_67517 = 0;
											while true do
												if (FlatIdent_67517 == 0) then
													task.wait(0.2);
													obj.JumpHeight = TargetJumpHeight;
													break;
												end
											end
										end
									end
									mainHumanoid = character:FindFirstChildOfClass("Humanoid");
									FlatIdent_580CB = 2;
								end
								if (FlatIdent_580CB == 0) then
									task.wait(1);
									humanoids = character:GetDescendants();
									FlatIdent_580CB = 1;
								end
							end
						end
						break;
					end
				end
			end
			setupCharacter();
			FlatIdent_8BC55 = 3;
		end
		if (FlatIdent_8BC55 == 3) then
			if CharacterAddedConnection then
				CharacterAddedConnection:Disconnect();
			end
			CharacterAddedConnection = Player.CharacterAdded:Connect(function(character)
				local FlatIdent_628E3 = 0;
				while true do
					if (FlatIdent_628E3 == 0) then
						task.wait(1);
						setupCharacter();
						FlatIdent_628E3 = 1;
					end
					if (FlatIdent_628E3 == 1) then
						updateJumpHeight();
						break;
					end
				end
			end);
			AntiDetectJumpModule.GetJumpHeight = function()
				return TargetJumpHeight;
			end;
			FlatIdent_8BC55 = 4;
		end
		if (1 == FlatIdent_8BC55) then
			CharacterAddedConnection = nil;
			updateJumpHeight = nil;
			function updateJumpHeight()
				local FlatIdent_6D9D2 = 0;
				while true do
					if (FlatIdent_6D9D2 == 0) then
						if JumpConnection then
							local FlatIdent_6225E = 0;
							while true do
								if (FlatIdent_6225E == 0) then
									JumpConnection:Disconnect();
									JumpConnection = nil;
									break;
								end
							end
						end
						JumpConnection = game:GetService("RunService").Heartbeat:Connect(function()
							local character = Player.Character;
							if character then
								local FlatIdent_21DDC = 0;
								local humanoid;
								while true do
									if (FlatIdent_21DDC == 0) then
										humanoid = character:FindFirstChildOfClass("Humanoid");
										if (humanoid and (humanoid.JumpHeight ~= TargetJumpHeight)) then
											humanoid.JumpHeight = TargetJumpHeight;
										end
										break;
									end
								end
							end
						end);
						break;
					end
				end
			end
			FlatIdent_8BC55 = 2;
		end
	end
end
local function createUtilityContainer()
	local utilityContainer = Instance.new("Frame");
	utilityContainer.Name = "UtilityContainer";
	utilityContainer.Size = UDim2.new(1, 0, 1, 0);
	utilityContainer.BackgroundTransparency = 1;
	utilityContainer.Visible = true;
	utilityContainer.Parent = contentFrame;
	local scrollContainer = Instance.new("ScrollingFrame");
	scrollContainer.Name = "UtilityScroll";
	scrollContainer.Size = UDim2.new(1, -20, 1, -20);
	scrollContainer.Position = UDim2.new(0, 10, 0, 10);
	scrollContainer.BackgroundTransparency = 1;
	scrollContainer.ScrollBarThickness = 6;
	scrollContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110);
	scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 450);
	scrollContainer.Parent = utilityContainer;
	local utilityLayout = Instance.new("UIListLayout");
	utilityLayout.Parent = scrollContainer;
	utilityLayout.Padding = UDim.new(0, 12);
	utilityLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local antiDetectFlightBtn = Instance.new("TextButton");
	antiDetectFlightBtn.Name = "AntiDetectFlight";
	antiDetectFlightBtn.Size = UDim2.new(0.9, 0, 0, 40);
	antiDetectFlightBtn.Text = "防检测飞行";
	antiDetectFlightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	antiDetectFlightBtn.TextColor3 = Color3.new(1, 1, 1);
	antiDetectFlightBtn.Font = Enum.Font.GothamSemibold;
	antiDetectFlightBtn.TextSize = 15;
	antiDetectFlightBtn.TextStrokeTransparency = 0.5;
	antiDetectFlightBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	antiDetectFlightBtn.AutoButtonColor = false;
	local btnStroke1 = Instance.new("UIStroke");
	btnStroke1.Thickness = 2;
	btnStroke1.Color = Color3.fromRGB(80, 80, 90);
	btnStroke1.Transparency = 0.3;
	btnStroke1.Parent = antiDetectFlightBtn;
	local btnCorner1 = Instance.new("UICorner");
	btnCorner1.CornerRadius = UDim.new(0, 8);
	btnCorner1.Parent = antiDetectFlightBtn;
	local originalColor1 = Color3.fromRGB(60, 60, 70);
	local flightEnabled = false;
	antiDetectFlightBtn.MouseEnter:Connect(function()
		if not flightEnabled then
			local FlatIdent_2593F = 0;
			while true do
				if (FlatIdent_2593F == 0) then
					antiDetectFlightBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke1.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	antiDetectFlightBtn.MouseLeave:Connect(function()
		if not flightEnabled then
			antiDetectFlightBtn.BackgroundColor3 = originalColor1;
			btnStroke1.Color = Color3.fromRGB(80, 80, 90);
		end
	end);
	antiDetectFlightBtn.MouseButton1Click:Connect(function()
		flightEnabled = not flightEnabled;
		if flightEnabled then
			antiDetectFlightBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
			btnStroke1.Color = Color3.fromRGB(120, 200, 255);
			antiDetectFlightBtn.Text = "防检测飞行 ✓";
			local success = pcall(function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/mbhivhjjb.lua"))();
			end);
			if success then
				StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测飞行已启用",Duration=3,Icon="rbxassetid://4483345998"});
			else
				StarterGui:SetCore("SendNotification", {Title="错误",Text="加载飞行脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
				flightEnabled = false;
				antiDetectFlightBtn.BackgroundColor3 = originalColor1;
				btnStroke1.Color = Color3.fromRGB(80, 80, 90);
				antiDetectFlightBtn.Text = "防检测飞行";
			end
		else
			local FlatIdent_3B08E = 0;
			while true do
				if (FlatIdent_3B08E == 0) then
					antiDetectFlightBtn.BackgroundColor3 = originalColor1;
					btnStroke1.Color = Color3.fromRGB(80, 80, 90);
					FlatIdent_3B08E = 1;
				end
				if (FlatIdent_3B08E == 1) then
					antiDetectFlightBtn.Text = "防检测飞行";
					StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测飞行已禁用",Duration=3,Icon="rbxassetid://4483345998"});
					break;
				end
			end
		end
	end);
	antiDetectFlightBtn.Parent = scrollContainer;
	local antiDetectWallBtn = Instance.new("TextButton");
	antiDetectWallBtn.Name = "AntiDetectWall";
	antiDetectWallBtn.Size = UDim2.new(0.9, 0, 0, 40);
	antiDetectWallBtn.Text = "防检测穿墙";
	antiDetectWallBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	antiDetectWallBtn.TextColor3 = Color3.new(1, 1, 1);
	antiDetectWallBtn.Font = Enum.Font.GothamSemibold;
	antiDetectWallBtn.TextSize = 15;
	antiDetectWallBtn.TextStrokeTransparency = 0.5;
	antiDetectWallBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	antiDetectWallBtn.AutoButtonColor = false;
	local btnStroke2 = Instance.new("UIStroke");
	btnStroke2.Thickness = 2;
	btnStroke2.Color = Color3.fromRGB(80, 80, 90);
	btnStroke2.Transparency = 0.3;
	btnStroke2.Parent = antiDetectWallBtn;
	local btnCorner2 = Instance.new("UICorner");
	btnCorner2.CornerRadius = UDim.new(0, 8);
	btnCorner2.Parent = antiDetectWallBtn;
	local originalColor2 = Color3.fromRGB(60, 60, 70);
	antiDetectWallBtn.MouseEnter:Connect(function()
		if not WallWalkModule.Enabled then
			local FlatIdent_3CDED = 0;
			while true do
				if (0 == FlatIdent_3CDED) then
					antiDetectWallBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke2.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	antiDetectWallBtn.MouseLeave:Connect(function()
		if not WallWalkModule.Enabled then
			local FlatIdent_6E549 = 0;
			while true do
				if (FlatIdent_6E549 == 0) then
					antiDetectWallBtn.BackgroundColor3 = originalColor2;
					btnStroke2.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	antiDetectWallBtn.MouseButton1Click:Connect(function()
		local FlatIdent_21CA5 = 0;
		local enabled;
		while true do
			if (FlatIdent_21CA5 == 0) then
				enabled = WallWalkModule:Toggle();
				if enabled then
					local FlatIdent_7517F = 0;
					while true do
						if (FlatIdent_7517F == 1) then
							antiDetectWallBtn.Text = "防检测穿墙 ✓";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测穿墙已启用\nWASD移动 空格上升 Ctrl下降",Duration=5,Icon="rbxassetid://4483345998"});
							break;
						end
						if (0 == FlatIdent_7517F) then
							antiDetectWallBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							btnStroke2.Color = Color3.fromRGB(120, 200, 255);
							FlatIdent_7517F = 1;
						end
					end
				else
					local FlatIdent_55D83 = 0;
					while true do
						if (FlatIdent_55D83 == 1) then
							antiDetectWallBtn.Text = "防检测穿墙";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测穿墙已禁用",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
						if (FlatIdent_55D83 == 0) then
							antiDetectWallBtn.BackgroundColor3 = originalColor2;
							btnStroke2.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_55D83 = 1;
						end
					end
				end
				break;
			end
		end
	end);
	antiDetectWallBtn.Parent = scrollContainer;
	local playerJoinBtn = Instance.new("TextButton");
	playerJoinBtn.Name = "PlayerJoinNotification";
	playerJoinBtn.Size = UDim2.new(0.9, 0, 0, 40);
	playerJoinBtn.Text = "玩家进入提示";
	playerJoinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	playerJoinBtn.TextColor3 = Color3.new(1, 1, 1);
	playerJoinBtn.Font = Enum.Font.GothamSemibold;
	playerJoinBtn.TextSize = 15;
	playerJoinBtn.TextStrokeTransparency = 0.5;
	playerJoinBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	playerJoinBtn.AutoButtonColor = false;
	local btnStroke4 = Instance.new("UIStroke");
	btnStroke4.Thickness = 2;
	btnStroke4.Color = Color3.fromRGB(80, 80, 90);
	btnStroke4.Transparency = 0.3;
	btnStroke4.Parent = playerJoinBtn;
	local btnCorner4 = Instance.new("UICorner");
	btnCorner4.CornerRadius = UDim.new(0, 8);
	btnCorner4.Parent = playerJoinBtn;
	local originalColor4 = Color3.fromRGB(60, 60, 70);
	local playerJoinEnabled = false;
	playerJoinBtn.MouseEnter:Connect(function()
		if not playerJoinEnabled then
			playerJoinBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
			btnStroke4.Color = Color3.fromRGB(90, 90, 100);
		end
	end);
	playerJoinBtn.MouseLeave:Connect(function()
		if not playerJoinEnabled then
			local FlatIdent_30F75 = 0;
			while true do
				if (0 == FlatIdent_30F75) then
					playerJoinBtn.BackgroundColor3 = originalColor4;
					btnStroke4.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	playerJoinBtn.MouseButton1Click:Connect(function()
		local FlatIdent_8BA1E = 0;
		while true do
			if (FlatIdent_8BA1E == 0) then
				playerJoinEnabled = not playerJoinEnabled;
				if playerJoinEnabled then
					playerJoinBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
					btnStroke4.Color = Color3.fromRGB(120, 200, 255);
					playerJoinBtn.Text = "玩家进入提示 ✓";
					local success = pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))();
					end);
					if success then
						StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="玩家进入提示脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
					else
						local FlatIdent_527C6 = 0;
						while true do
							if (FlatIdent_527C6 == 0) then
								StarterGui:SetCore("SendNotification", {Title="错误",Text="加载玩家进入提示脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
								playerJoinEnabled = false;
								FlatIdent_527C6 = 1;
							end
							if (FlatIdent_527C6 == 2) then
								playerJoinBtn.Text = "玩家进入提示";
								break;
							end
							if (1 == FlatIdent_527C6) then
								playerJoinBtn.BackgroundColor3 = originalColor4;
								btnStroke4.Color = Color3.fromRGB(80, 80, 90);
								FlatIdent_527C6 = 2;
							end
						end
					end
				else
					local FlatIdent_6DFD9 = 0;
					while true do
						if (FlatIdent_6DFD9 == 1) then
							playerJoinBtn.Text = "玩家进入提示";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="玩家进入提示脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
						if (FlatIdent_6DFD9 == 0) then
							playerJoinBtn.BackgroundColor3 = originalColor4;
							btnStroke4.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_6DFD9 = 1;
						end
					end
				end
				break;
			end
		end
	end);
	playerJoinBtn.Parent = scrollContainer;
	local floatWalkBtn = Instance.new("TextButton");
	floatWalkBtn.Name = "FloatWalk";
	floatWalkBtn.Size = UDim2.new(0.9, 0, 0, 40);
	floatWalkBtn.Text = "踏空";
	floatWalkBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	floatWalkBtn.TextColor3 = Color3.new(1, 1, 1);
	floatWalkBtn.Font = Enum.Font.GothamSemibold;
	floatWalkBtn.TextSize = 15;
	floatWalkBtn.TextStrokeTransparency = 0.5;
	floatWalkBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	floatWalkBtn.AutoButtonColor = false;
	local btnStroke5 = Instance.new("UIStroke");
	btnStroke5.Thickness = 2;
	btnStroke5.Color = Color3.fromRGB(80, 80, 90);
	btnStroke5.Transparency = 0.3;
	btnStroke5.Parent = floatWalkBtn;
	local btnCorner5 = Instance.new("UICorner");
	btnCorner5.CornerRadius = UDim.new(0, 8);
	btnCorner5.Parent = floatWalkBtn;
	local originalColor5 = Color3.fromRGB(60, 60, 70);
	local floatWalkEnabled = false;
	floatWalkBtn.MouseEnter:Connect(function()
		if not floatWalkEnabled then
			floatWalkBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
			btnStroke5.Color = Color3.fromRGB(90, 90, 100);
		end
	end);
	floatWalkBtn.MouseLeave:Connect(function()
		if not floatWalkEnabled then
			local FlatIdent_56F59 = 0;
			while true do
				if (FlatIdent_56F59 == 0) then
					floatWalkBtn.BackgroundColor3 = originalColor5;
					btnStroke5.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	floatWalkBtn.MouseButton1Click:Connect(function()
		local FlatIdent_3121 = 0;
		while true do
			if (FlatIdent_3121 == 0) then
				floatWalkEnabled = not floatWalkEnabled;
				if floatWalkEnabled then
					local FlatIdent_90A69 = 0;
					local success;
					while true do
						if (FlatIdent_90A69 == 1) then
							floatWalkBtn.Text = "踏空 ✓";
							success = pcall(function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))();
							end);
							FlatIdent_90A69 = 2;
						end
						if (FlatIdent_90A69 == 0) then
							floatWalkBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							btnStroke5.Color = Color3.fromRGB(120, 200, 255);
							FlatIdent_90A69 = 1;
						end
						if (FlatIdent_90A69 == 2) then
							if success then
								StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="踏空脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
							else
								StarterGui:SetCore("SendNotification", {Title="错误",Text="加载踏空脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
								floatWalkEnabled = false;
								floatWalkBtn.BackgroundColor3 = originalColor5;
								btnStroke5.Color = Color3.fromRGB(80, 80, 90);
								floatWalkBtn.Text = "踏空";
							end
							break;
						end
					end
				else
					local FlatIdent_1BAD7 = 0;
					while true do
						if (FlatIdent_1BAD7 == 0) then
							floatWalkBtn.BackgroundColor3 = originalColor5;
							btnStroke5.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_1BAD7 = 1;
						end
						if (FlatIdent_1BAD7 == 1) then
							floatWalkBtn.Text = "踏空";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="踏空脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	floatWalkBtn.Parent = scrollContainer;
	local wallClimbBtn = Instance.new("TextButton");
	wallClimbBtn.Name = "WallClimb";
	wallClimbBtn.Size = UDim2.new(0.9, 0, 0, 40);
	wallClimbBtn.Text = "爬墙";
	wallClimbBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	wallClimbBtn.TextColor3 = Color3.new(1, 1, 1);
	wallClimbBtn.Font = Enum.Font.GothamSemibold;
	wallClimbBtn.TextSize = 15;
	wallClimbBtn.TextStrokeTransparency = 0.5;
	wallClimbBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	wallClimbBtn.AutoButtonColor = false;
	local btnStroke6 = Instance.new("UIStroke");
	btnStroke6.Thickness = 2;
	btnStroke6.Color = Color3.fromRGB(80, 80, 90);
	btnStroke6.Transparency = 0.3;
	btnStroke6.Parent = wallClimbBtn;
	local btnCorner6 = Instance.new("UICorner");
	btnCorner6.CornerRadius = UDim.new(0, 8);
	btnCorner6.Parent = wallClimbBtn;
	local originalColor6 = Color3.fromRGB(60, 60, 70);
	local wallClimbEnabled = false;
	wallClimbBtn.MouseEnter:Connect(function()
		if not wallClimbEnabled then
			local FlatIdent_6EF7B = 0;
			while true do
				if (FlatIdent_6EF7B == 0) then
					wallClimbBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke6.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	wallClimbBtn.MouseLeave:Connect(function()
		if not wallClimbEnabled then
			local FlatIdent_5CA49 = 0;
			while true do
				if (FlatIdent_5CA49 == 0) then
					wallClimbBtn.BackgroundColor3 = originalColor6;
					btnStroke6.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	wallClimbBtn.MouseButton1Click:Connect(function()
		wallClimbEnabled = not wallClimbEnabled;
		if wallClimbEnabled then
			local FlatIdent_6C34 = 0;
			local success;
			while true do
				if (2 == FlatIdent_6C34) then
					if success then
						StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="爬墙脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
					else
						StarterGui:SetCore("SendNotification", {Title="错误",Text="加载爬墙脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
						wallClimbEnabled = false;
						wallClimbBtn.BackgroundColor3 = originalColor6;
						btnStroke6.Color = Color3.fromRGB(80, 80, 90);
						wallClimbBtn.Text = "爬墙";
					end
					break;
				end
				if (0 == FlatIdent_6C34) then
					wallClimbBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
					btnStroke6.Color = Color3.fromRGB(120, 200, 255);
					FlatIdent_6C34 = 1;
				end
				if (FlatIdent_6C34 == 1) then
					wallClimbBtn.Text = "爬墙 ✓";
					success = pcall(function()
						loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))();
					end);
					FlatIdent_6C34 = 2;
				end
			end
		else
			local FlatIdent_71493 = 0;
			while true do
				if (FlatIdent_71493 == 1) then
					wallClimbBtn.Text = "爬墙";
					StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="爬墙脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
					break;
				end
				if (FlatIdent_71493 == 0) then
					wallClimbBtn.BackgroundColor3 = originalColor6;
					btnStroke6.Color = Color3.fromRGB(80, 80, 90);
					FlatIdent_71493 = 1;
				end
			end
		end
	end);
	wallClimbBtn.Parent = scrollContainer;
	local ironFistBtn = Instance.new("TextButton");
	ironFistBtn.Name = "IronFist";
	ironFistBtn.Size = UDim2.new(0.9, 0, 0, 40);
	ironFistBtn.Text = "铁拳";
	ironFistBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	ironFistBtn.TextColor3 = Color3.new(1, 1, 1);
	ironFistBtn.Font = Enum.Font.GothamSemibold;
	ironFistBtn.TextSize = 15;
	ironFistBtn.TextStrokeTransparency = 0.5;
	ironFistBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	ironFistBtn.AutoButtonColor = false;
	local btnStroke7 = Instance.new("UIStroke");
	btnStroke7.Thickness = 2;
	btnStroke7.Color = Color3.fromRGB(80, 80, 90);
	btnStroke7.Transparency = 0.3;
	btnStroke7.Parent = ironFistBtn;
	local btnCorner7 = Instance.new("UICorner");
	btnCorner7.CornerRadius = UDim.new(0, 8);
	btnCorner7.Parent = ironFistBtn;
	local originalColor7 = Color3.fromRGB(60, 60, 70);
	local ironFistEnabled = false;
	ironFistBtn.MouseEnter:Connect(function()
		if not ironFistEnabled then
			ironFistBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
			btnStroke7.Color = Color3.fromRGB(90, 90, 100);
		end
	end);
	ironFistBtn.MouseLeave:Connect(function()
		if not ironFistEnabled then
			ironFistBtn.BackgroundColor3 = originalColor7;
			btnStroke7.Color = Color3.fromRGB(80, 80, 90);
		end
	end);
	ironFistBtn.MouseButton1Click:Connect(function()
		ironFistEnabled = not ironFistEnabled;
		if ironFistEnabled then
			local FlatIdent_75331 = 0;
			local success;
			while true do
				if (FlatIdent_75331 == 2) then
					if success then
						StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="铁拳脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
					else
						StarterGui:SetCore("SendNotification", {Title="错误",Text="加载铁拳脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
						ironFistEnabled = false;
						ironFistBtn.BackgroundColor3 = originalColor7;
						btnStroke7.Color = Color3.fromRGB(80, 80, 90);
						ironFistBtn.Text = "铁拳";
					end
					break;
				end
				if (FlatIdent_75331 == 1) then
					ironFistBtn.Text = "铁拳 ✓";
					success = pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))();
					end);
					FlatIdent_75331 = 2;
				end
				if (FlatIdent_75331 == 0) then
					ironFistBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
					btnStroke7.Color = Color3.fromRGB(120, 200, 255);
					FlatIdent_75331 = 1;
				end
			end
		else
			ironFistBtn.BackgroundColor3 = originalColor7;
			btnStroke7.Color = Color3.fromRGB(80, 80, 90);
			ironFistBtn.Text = "铁拳";
			StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="铁拳脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
		end
	end);
	ironFistBtn.Parent = scrollContainer;
	return utilityContainer;
end
local function createFunctionContainer()
	local container = Instance.new("Frame");
	container.Name = "FunctionContainer";
	container.Size = UDim2.new(1, 0, 1, 0);
	container.BackgroundTransparency = 1;
	container.Visible = false;
	container.Parent = contentFrame;
	local scrollContainer = Instance.new("ScrollingFrame");
	scrollContainer.Name = "FunctionScroll";
	scrollContainer.Size = UDim2.new(1, -20, 1, -20);
	scrollContainer.Position = UDim2.new(0, 10, 0, 10);
	scrollContainer.BackgroundTransparency = 1;
	scrollContainer.ScrollBarThickness = 6;
	scrollContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110);
	scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 780);
	scrollContainer.Parent = container;
	local functionLayout = Instance.new("UIListLayout");
	functionLayout.Parent = scrollContainer;
	functionLayout.Padding = UDim.new(0, 12);
	functionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local speedFrame = Instance.new("Frame");
	speedFrame.Name = "SpeedFrame";
	speedFrame.Size = UDim2.new(0.9, 0, 0, 120);
	speedFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	speedFrame.BackgroundTransparency = 0.1;
	local speedCorner = Instance.new("UICorner");
	speedCorner.CornerRadius = UDim.new(0, 8);
	speedCorner.Parent = speedFrame;
	local speedStroke = Instance.new("UIStroke");
	speedStroke.Thickness = 2;
	speedStroke.Color = Color3.fromRGB(80, 160, 255);
	speedStroke.Transparency = 0.2;
	speedStroke.Parent = speedFrame;
	local speedIcon = Instance.new("ImageLabel");
	speedIcon.Name = "SpeedIcon";
	speedIcon.Size = UDim2.new(0, 32, 0, 32);
	speedIcon.Position = UDim2.new(0, 10, 0, 10);
	speedIcon.BackgroundTransparency = 1;
	speedIcon.Image = "rbxassetid://3926305904";
	speedIcon.ImageRectSize = Vector2.new(64, 64);
	speedIcon.ImageRectOffset = Vector2.new(0, 128);
	speedIcon.Parent = speedFrame;
	local speedTitle = Instance.new("TextLabel");
	speedTitle.Name = "SpeedTitle";
	speedTitle.Size = UDim2.new(1, -50, 0, 20);
	speedTitle.Position = UDim2.new(0, 50, 0, 2);
	speedTitle.BackgroundTransparency = 1;
	speedTitle.Text = "防检测速度调整";
	speedTitle.TextColor3 = Color3.fromRGB(180, 200, 255);
	speedTitle.Font = Enum.Font.GothamBold;
	speedTitle.TextSize = 12;
	speedTitle.TextXAlignment = Enum.TextXAlignment.Left;
	speedTitle.Parent = speedFrame;
	local speedInput = Instance.new("TextBox");
	speedInput.Name = "SpeedInput";
	speedInput.Size = UDim2.new(0.7, 0, 0, 30);
	speedInput.Position = UDim2.new(0.15, 0, 0, 40);
	speedInput.BackgroundColor3 = Color3.fromRGB(45, 45, 55);
	speedInput.TextColor3 = Color3.fromRGB(220, 220, 230);
	speedInput.Font = Enum.Font.GothamSemibold;
	speedInput.TextSize = 14;
	speedInput.PlaceholderText = "输入速度 (16-400)";
	speedInput.Text = "16";
	speedInput.ClearTextOnFocus = false;
	local inputCorner = Instance.new("UICorner");
	inputCorner.CornerRadius = UDim.new(0, 6);
	inputCorner.Parent = speedInput;
	local inputStroke = Instance.new("UIStroke");
	inputStroke.Thickness = 1;
	inputStroke.Color = Color3.fromRGB(100, 100, 110);
	inputStroke.Parent = speedInput;
	speedInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local speedNum = tonumber(speedInput.Text);
			if (speedNum and (speedNum >= 16) and (speedNum <= 400)) then
				local FlatIdent_23521 = 0;
				while true do
					if (FlatIdent_23521 == 0) then
						AntiDetectSpeedModule.SetRealSpeed(speedNum);
						StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text=("速度已设置为: " .. speedNum),Duration=3,Icon="rbxassetid://4483345998"});
						break;
					end
				end
			else
				local FlatIdent_87441 = 0;
				while true do
					if (FlatIdent_87441 == 0) then
						speedInput.Text = "16";
						StarterGui:SetCore("SendNotification", {Title="错误",Text="请输入16-400之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
						break;
					end
				end
			end
		end
	end);
	speedInput.Parent = speedFrame;
	local applyBtn = Instance.new("TextButton");
	applyBtn.Name = "ApplySpeedButton";
	applyBtn.Size = UDim2.new(0.5, 0, 0, 30);
	applyBtn.Position = UDim2.new(0.25, 0, 0, 80);
	applyBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
	applyBtn.Text = "应用速度";
	applyBtn.TextColor3 = Color3.new(1, 1, 1);
	applyBtn.Font = Enum.Font.GothamSemibold;
	applyBtn.TextSize = 14;
	applyBtn.TextStrokeTransparency = 0.6;
	applyBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	local applyCorner = Instance.new("UICorner");
	applyCorner.CornerRadius = UDim.new(0, 6);
	applyCorner.Parent = applyBtn;
	local applyStroke = Instance.new("UIStroke");
	applyStroke.Thickness = 1;
	applyStroke.Color = Color3.fromRGB(120, 200, 255);
	applyStroke.Parent = applyBtn;
	applyBtn.MouseEnter:Connect(function()
		applyBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255);
	end);
	applyBtn.MouseLeave:Connect(function()
		applyBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
	end);
	applyBtn.MouseButton1Click:Connect(function()
		local FlatIdent_243F3 = 0;
		local speedNum;
		while true do
			if (FlatIdent_243F3 == 0) then
				speedNum = tonumber(speedInput.Text);
				if (speedNum and (speedNum >= 16) and (speedNum <= 400)) then
					local FlatIdent_5C408 = 0;
					while true do
						if (FlatIdent_5C408 == 0) then
							AntiDetectSpeedModule.SetRealSpeed(speedNum);
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text=("速度已设置为: " .. speedNum),Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				else
					speedInput.Text = "16";
					StarterGui:SetCore("SendNotification", {Title="错误",Text="请输入16-400之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
				end
				break;
			end
		end
	end);
	applyBtn.Parent = speedFrame;
	local currentSpeedLabel = Instance.new("TextLabel");
	currentSpeedLabel.Name = "CurrentSpeedLabel";
	currentSpeedLabel.Size = UDim2.new(1, 0, 0, 20);
	currentSpeedLabel.Position = UDim2.new(0, 0, 0, 115);
	currentSpeedLabel.BackgroundTransparency = 1;
	currentSpeedLabel.TextColor3 = Color3.fromRGB(180, 200, 255);
	currentSpeedLabel.Font = Enum.Font.GothamSemibold;
	currentSpeedLabel.TextSize = 11;
	currentSpeedLabel.Text = "当前速度: 16";
	currentSpeedLabel.Parent = speedFrame;
	local function updateCurrentSpeed()
		currentSpeedLabel.Text = "当前速度: " .. math.floor(AntiDetectSpeedModule.GetRealSpeed());
	end
	game:GetService("RunService").Heartbeat:Connect(function()
		updateCurrentSpeed();
	end);
	speedFrame.Parent = scrollContainer;
	local jumpPowerFrame = Instance.new("Frame");
	jumpPowerFrame.Name = "JumpPowerFrame";
	jumpPowerFrame.Size = UDim2.new(0.9, 0, 0, 120);
	jumpPowerFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	jumpPowerFrame.BackgroundTransparency = 0.1;
	local jumpPowerCorner = Instance.new("UICorner");
	jumpPowerCorner.CornerRadius = UDim.new(0, 8);
	jumpPowerCorner.Parent = jumpPowerFrame;
	local jumpPowerStroke = Instance.new("UIStroke");
	jumpPowerStroke.Thickness = 2;
	jumpPowerStroke.Color = Color3.fromRGB(80, 160, 255);
	jumpPowerStroke.Transparency = 0.2;
	jumpPowerStroke.Parent = jumpPowerFrame;
	local jumpPowerIcon = Instance.new("ImageLabel");
	jumpPowerIcon.Name = "JumpPowerIcon";
	jumpPowerIcon.Size = UDim2.new(0, 32, 0, 32);
	jumpPowerIcon.Position = UDim2.new(0, 10, 0, 10);
	jumpPowerIcon.BackgroundTransparency = 1;
	jumpPowerIcon.Image = "rbxassetid://3926305904";
	jumpPowerIcon.ImageRectSize = Vector2.new(64, 64);
	jumpPowerIcon.ImageRectOffset = Vector2.new(0, 384);
	jumpPowerIcon.Parent = jumpPowerFrame;
	local jumpPowerTitle = Instance.new("TextLabel");
	jumpPowerTitle.Name = "JumpPowerTitle";
	jumpPowerTitle.Size = UDim2.new(1, -50, 0, 20);
	jumpPowerTitle.Position = UDim2.new(0, 50, 0, 2);
	jumpPowerTitle.BackgroundTransparency = 1;
	jumpPowerTitle.Text = "防检测跳跃高度";
	jumpPowerTitle.TextColor3 = Color3.fromRGB(180, 200, 255);
	jumpPowerTitle.Font = Enum.Font.GothamBold;
	jumpPowerTitle.TextSize = 12;
	jumpPowerTitle.TextXAlignment = Enum.TextXAlignment.Left;
	jumpPowerTitle.Parent = jumpPowerFrame;
	local jumpPowerInput = Instance.new("TextBox");
	jumpPowerInput.Name = "JumpPowerInput";
	jumpPowerInput.Size = UDim2.new(0.7, 0, 0, 30);
	jumpPowerInput.Position = UDim2.new(0.15, 0, 0, 40);
	jumpPowerInput.BackgroundColor3 = Color3.fromRGB(45, 45, 55);
	jumpPowerInput.TextColor3 = Color3.fromRGB(220, 220, 230);
	jumpPowerInput.Font = Enum.Font.GothamSemibold;
	jumpPowerInput.TextSize = 14;
	jumpPowerInput.PlaceholderText = "输入跳跃高度 (7.2-500)";
	jumpPowerInput.Text = "7.2";
	jumpPowerInput.ClearTextOnFocus = false;
	local jumpPowerInputCorner = Instance.new("UICorner");
	jumpPowerInputCorner.CornerRadius = UDim.new(0, 6);
	jumpPowerInputCorner.Parent = jumpPowerInput;
	local jumpPowerInputStroke = Instance.new("UIStroke");
	jumpPowerInputStroke.Thickness = 1;
	jumpPowerInputStroke.Color = Color3.fromRGB(100, 100, 110);
	jumpPowerInputStroke.Parent = jumpPowerInput;
	jumpPowerInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local FlatIdent_6E23 = 0;
			local heightNum;
			while true do
				if (FlatIdent_6E23 == 0) then
					heightNum = tonumber(jumpPowerInput.Text);
					if (heightNum and (heightNum >= 7.2) and (heightNum <= 500)) then
						local success = AntiDetectJumpModule.SetJumpHeight(heightNum);
						if success then
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text=("跳跃高度已设置为: " .. string.format("%.1f", heightNum)),Duration=3,Icon="rbxassetid://4483345998"});
						end
					else
						local FlatIdent_43E8E = 0;
						while true do
							if (FlatIdent_43E8E == 0) then
								jumpPowerInput.Text = "7.2";
								StarterGui:SetCore("SendNotification", {Title="错误",Text="请输入7.2-500之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
								break;
							end
						end
					end
					break;
				end
			end
		end
	end);
	jumpPowerInput.Parent = jumpPowerFrame;
	local applyJumpBtn = Instance.new("TextButton");
	applyJumpBtn.Name = "ApplyJumpPowerButton";
	applyJumpBtn.Size = UDim2.new(0.5, 0, 0, 30);
	applyJumpBtn.Position = UDim2.new(0.25, 0, 0, 80);
	applyJumpBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
	applyJumpBtn.Text = "应用高度";
	applyJumpBtn.TextColor3 = Color3.new(1, 1, 1);
	applyJumpBtn.Font = Enum.Font.GothamSemibold;
	applyJumpBtn.TextSize = 14;
	applyJumpBtn.TextStrokeTransparency = 0.6;
	applyJumpBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	local applyJumpCorner = Instance.new("UICorner");
	applyJumpCorner.CornerRadius = UDim.new(0, 6);
	applyJumpCorner.Parent = applyJumpBtn;
	local applyJumpStroke = Instance.new("UIStroke");
	applyJumpStroke.Thickness = 1;
	applyJumpStroke.Color = Color3.fromRGB(120, 200, 255);
	applyJumpStroke.Parent = applyJumpBtn;
	applyJumpBtn.MouseEnter:Connect(function()
		applyJumpBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255);
	end);
	applyJumpBtn.MouseLeave:Connect(function()
		applyJumpBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
	end);
	applyJumpBtn.MouseButton1Click:Connect(function()
		local FlatIdent_12E4E = 0;
		local heightNum;
		while true do
			if (0 == FlatIdent_12E4E) then
				heightNum = tonumber(jumpPowerInput.Text);
				if (heightNum and (heightNum >= 7.2) and (heightNum <= 500)) then
					local FlatIdent_89126 = 0;
					local success;
					while true do
						if (FlatIdent_89126 == 0) then
							success = AntiDetectJumpModule.SetJumpHeight(heightNum);
							if success then
								StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text=("跳跃高度已设置为: " .. string.format("%.1f", heightNum)),Duration=3,Icon="rbxassetid://4483345998"});
							end
							break;
						end
					end
				else
					local FlatIdent_386FF = 0;
					while true do
						if (FlatIdent_386FF == 0) then
							jumpPowerInput.Text = "7.2";
							StarterGui:SetCore("SendNotification", {Title="错误",Text="请输入7.2-500之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	applyJumpBtn.Parent = jumpPowerFrame;
	local currentJumpLabel = Instance.new("TextLabel");
	currentJumpLabel.Name = "CurrentJumpLabel";
	currentJumpLabel.Size = UDim2.new(1, 0, 0, 20);
	currentJumpLabel.Position = UDim2.new(0, 0, 0, 115);
	currentJumpLabel.BackgroundTransparency = 1;
	currentJumpLabel.TextColor3 = Color3.fromRGB(180, 200, 255);
	currentJumpLabel.Font = Enum.Font.GothamSemibold;
	currentJumpLabel.TextSize = 11;
	currentJumpLabel.Text = "当前高度: 7.2";
	currentJumpLabel.Parent = jumpPowerFrame;
	game:GetService("RunService").Heartbeat:Connect(function()
		currentJumpLabel.Text = "当前高度: " .. string.format("%.1f", AntiDetectJumpModule.GetJumpHeight());
	end);
	applyJumpBtn.Parent = jumpPowerFrame;
	jumpPowerFrame.Parent = scrollContainer;
	local gravityFrame = Instance.new("Frame");
	gravityFrame.Name = "GravityFrame";
	gravityFrame.Size = UDim2.new(0.9, 0, 0, 120);
	gravityFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	gravityFrame.BackgroundTransparency = 0.1;
	local gravityCorner = Instance.new("UICorner");
	gravityCorner.CornerRadius = UDim.new(0, 8);
	gravityCorner.Parent = gravityFrame;
	local gravityStroke = Instance.new("UIStroke");
	gravityStroke.Thickness = 2;
	gravityStroke.Color = Color3.fromRGB(80, 160, 255);
	gravityStroke.Transparency = 0.2;
	gravityStroke.Parent = gravityFrame;
	local gravityIcon = Instance.new("ImageLabel");
	gravityIcon.Name = "GravityIcon";
	gravityIcon.Size = UDim2.new(0, 32, 0, 32);
	gravityIcon.Position = UDim2.new(0, 10, 0, 10);
	gravityIcon.BackgroundTransparency = 1;
	gravityIcon.Image = "rbxassetid://3926305904";
	gravityIcon.ImageRectSize = Vector2.new(64, 64);
	gravityIcon.ImageRectOffset = Vector2.new(0, 256);
	gravityIcon.Parent = gravityFrame;
	local gravityTitle = Instance.new("TextLabel");
	gravityTitle.Name = "GravityTitle";
	gravityTitle.Size = UDim2.new(1, -50, 0, 20);
	gravityTitle.Position = UDim2.new(0, 50, 0, 2);
	gravityTitle.BackgroundTransparency = 1;
	gravityTitle.Text = "重力调整";
	gravityTitle.TextColor3 = Color3.fromRGB(180, 200, 255);
	gravityTitle.Font = Enum.Font.GothamBold;
	gravityTitle.TextSize = 12;
	gravityTitle.TextXAlignment = Enum.TextXAlignment.Left;
	gravityTitle.Parent = gravityFrame;
	local gravityInput = Instance.new("TextBox");
	gravityInput.Name = "GravityInput";
	gravityInput.Size = UDim2.new(0.7, 0, 0, 30);
	gravityInput.Position = UDim2.new(0.15, 0, 0, 40);
	gravityInput.BackgroundColor3 = Color3.fromRGB(45, 45, 55);
	gravityInput.TextColor3 = Color3.fromRGB(220, 220, 230);
	gravityInput.Font = Enum.Font.GothamSemibold;
	gravityInput.TextSize = 14;
	gravityInput.PlaceholderText = "输入重力 (0-196.2)";
	gravityInput.Text = "196.2";
	gravityInput.ClearTextOnFocus = false;
	local gravityInputCorner = Instance.new("UICorner");
	gravityInputCorner.CornerRadius = UDim.new(0, 6);
	gravityInputCorner.Parent = gravityInput;
	local gravityInputStroke = Instance.new("UIStroke");
	gravityInputStroke.Thickness = 1;
	gravityInputStroke.Color = Color3.fromRGB(100, 100, 110);
	gravityInputStroke.Parent = gravityInput;
	gravityInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local FlatIdent_87C42 = 0;
			local gravityNum;
			while true do
				if (0 == FlatIdent_87C42) then
					gravityNum = tonumber(gravityInput.Text);
					if (gravityNum and (gravityNum >= 0) and (gravityNum <= 196.2)) then
						local FlatIdent_437D4 = 0;
						while true do
							if (FlatIdent_437D4 == 0) then
								workspace.Gravity = gravityNum;
								StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text=("重力已设置为: " .. string.format("%.1f", gravityNum)),Duration=3,Icon="rbxassetid://4483345998"});
								break;
							end
						end
					else
						local FlatIdent_94BA0 = 0;
						while true do
							if (0 == FlatIdent_94BA0) then
								gravityInput.Text = "196.2";
								StarterGui:SetCore("SendNotification", {Title="错误",Text="请输入0-196.2之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
								break;
							end
						end
					end
					break;
				end
			end
		end
	end);
	gravityInput.Parent = gravityFrame;
	local applyGravityBtn = Instance.new("TextButton");
	applyGravityBtn.Name = "ApplyGravityButton";
	applyGravityBtn.Size = UDim2.new(0.5, 0, 0, 30);
	applyGravityBtn.Position = UDim2.new(0.25, 0, 0, 80);
	applyGravityBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
	applyGravityBtn.Text = "应用重力";
	applyGravityBtn.TextColor3 = Color3.new(1, 1, 1);
	applyGravityBtn.Font = Enum.Font.GothamSemibold;
	applyGravityBtn.TextSize = 14;
	applyGravityBtn.TextStrokeTransparency = 0.6;
	applyGravityBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	local applyGravityCorner = Instance.new("UICorner");
	applyGravityCorner.CornerRadius = UDim.new(0, 6);
	applyGravityCorner.Parent = applyGravityBtn;
	local applyGravityStroke = Instance.new("UIStroke");
	applyGravityStroke.Thickness = 1;
	applyGravityStroke.Color = Color3.fromRGB(120, 200, 255);
	applyGravityStroke.Parent = applyGravityBtn;
	applyGravityBtn.MouseEnter:Connect(function()
		applyGravityBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255);
	end);
	applyGravityBtn.MouseLeave:Connect(function()
		applyGravityBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
	end);
	applyGravityBtn.MouseButton1Click:Connect(function()
		local gravityNum = tonumber(gravityInput.Text);
		if (gravityNum and (gravityNum >= 0) and (gravityNum <= 196.2)) then
			workspace.Gravity = gravityNum;
			StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text=("重力已设置为: " .. string.format("%.1f", gravityNum)),Duration=3,Icon="rbxassetid://4483345998"});
		else
			gravityInput.Text = "196.2";
			StarterGui:SetCore("SendNotification", {Title="错误",Text="请输入0-196.2之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
		end
	end);
	applyGravityBtn.Parent = gravityFrame;
	local currentGravityLabel = Instance.new("TextLabel");
	currentGravityLabel.Name = "CurrentGravityLabel";
	currentGravityLabel.Size = UDim2.new(1, 0, 0, 20);
	currentGravityLabel.Position = UDim2.new(0, 0, 0, 115);
	currentGravityLabel.BackgroundTransparency = 1;
	currentGravityLabel.TextColor3 = Color3.fromRGB(180, 200, 255);
	currentGravityLabel.Font = Enum.Font.GothamSemibold;
	currentGravityLabel.TextSize = 11;
	currentGravityLabel.Text = "当前重力: 196.2";
	currentGravityLabel.Parent = gravityFrame;
	spawn(function()
		while true do
			currentGravityLabel.Text = "当前重力: " .. string.format("%.1f", workspace.Gravity);
			task.wait(0.5);
		end
	end);
	gravityFrame.Parent = scrollContainer;
	local nightVisionFrame = Instance.new("Frame");
	nightVisionFrame.Name = "NightVisionFrame";
	nightVisionFrame.Size = UDim2.new(0.9, 0, 0, 140);
	nightVisionFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	nightVisionFrame.BackgroundTransparency = 0.1;
	local nightVisionCorner = Instance.new("UICorner");
	nightVisionCorner.CornerRadius = UDim.new(0, 8);
	nightVisionCorner.Parent = nightVisionFrame;
	local nightVisionStroke = Instance.new("UIStroke");
	nightVisionStroke.Thickness = 2;
	nightVisionStroke.Color = Color3.fromRGB(80, 160, 255);
	nightVisionStroke.Transparency = 0.2;
	nightVisionStroke.Parent = nightVisionFrame;
	local nightVisionIcon = Instance.new("ImageLabel");
	nightVisionIcon.Name = "NightVisionIcon";
	nightVisionIcon.Size = UDim2.new(0, 32, 0, 32);
	nightVisionIcon.Position = UDim2.new(0, 10, 0, 10);
	nightVisionIcon.BackgroundTransparency = 1;
	nightVisionIcon.Image = "rbxassetid://3926305904";
	nightVisionIcon.ImageRectSize = Vector2.new(64, 64);
	nightVisionIcon.ImageRectOffset = Vector2.new(0, 704);
	nightVisionIcon.Parent = nightVisionFrame;
	local nightVisionTitle = Instance.new("TextLabel");
	nightVisionTitle.Name = "NightVisionTitle";
	nightVisionTitle.Size = UDim2.new(1, -50, 0, 20);
	nightVisionTitle.Position = UDim2.new(0, 50, 0, 2);
	nightVisionTitle.BackgroundTransparency = 1;
	nightVisionTitle.Text = "夜视模式";
	nightVisionTitle.TextColor3 = Color3.fromRGB(180, 200, 255);
	nightVisionTitle.Font = Enum.Font.GothamBold;
	nightVisionTitle.TextSize = 12;
	nightVisionTitle.TextXAlignment = Enum.TextXAlignment.Left;
	nightVisionTitle.Parent = nightVisionFrame;
	local nightVisionToggleBtn = Instance.new("TextButton");
	nightVisionToggleBtn.Name = "NightVisionToggle";
	nightVisionToggleBtn.Size = UDim2.new(0.7, 0, 0, 40);
	nightVisionToggleBtn.Position = UDim2.new(0.15, 0, 0, 40);
	nightVisionToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	nightVisionToggleBtn.Text = "启用夜视";
	nightVisionToggleBtn.TextColor3 = Color3.fromRGB(220, 220, 230);
	nightVisionToggleBtn.Font = Enum.Font.GothamSemibold;
	nightVisionToggleBtn.TextSize = 14;
	nightVisionToggleBtn.TextStrokeTransparency = 0.5;
	nightVisionToggleBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	nightVisionToggleBtn.AutoButtonColor = false;
	local toggleCorner = Instance.new("UICorner");
	toggleCorner.CornerRadius = UDim.new(0, 6);
	toggleCorner.Parent = nightVisionToggleBtn;
	local toggleStroke = Instance.new("UIStroke");
	toggleStroke.Thickness = 2;
	toggleStroke.Color = Color3.fromRGB(80, 80, 90);
	toggleStroke.Transparency = 0.3;
	toggleStroke.Parent = nightVisionToggleBtn;
	local nightVisionEnabled = false;
	local nightVisionConnection = nil;
	nightVisionToggleBtn.MouseEnter:Connect(function()
		if not nightVisionEnabled then
			nightVisionToggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
			toggleStroke.Color = Color3.fromRGB(90, 90, 100);
		end
	end);
	nightVisionToggleBtn.MouseLeave:Connect(function()
		if not nightVisionEnabled then
			local FlatIdent_1F138 = 0;
			while true do
				if (FlatIdent_1F138 == 0) then
					nightVisionToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
					toggleStroke.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	nightVisionToggleBtn.MouseButton1Click:Connect(function()
		local FlatIdent_61AEE = 0;
		while true do
			if (FlatIdent_61AEE == 0) then
				nightVisionEnabled = not nightVisionEnabled;
				if nightVisionEnabled then
					local FlatIdent_15C08 = 0;
					while true do
						if (FlatIdent_15C08 == 0) then
							nightVisionToggleBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							toggleStroke.Color = Color3.fromRGB(120, 200, 255);
							FlatIdent_15C08 = 1;
						end
						if (1 == FlatIdent_15C08) then
							nightVisionToggleBtn.Text = "夜视启用中 ✓";
							spawn(function()
								while task.wait() do
									if nightVisionEnabled then
										game.Lighting.Ambient = Color3.new(1, 1, 1);
									else
										game.Lighting.Ambient = Color3.new(0, 0, 0);
									end
								end
							end);
							FlatIdent_15C08 = 2;
						end
						if (FlatIdent_15C08 == 2) then
							if game:GetService("RunService"):IsClient() then
								local FlatIdent_16207 = 0;
								while true do
									if (FlatIdent_16207 == 0) then
										if nightVisionConnection then
											nightVisionConnection:Disconnect();
										end
										nightVisionConnection = game:GetService("RunService").RenderStepped:Connect(function()
										end);
										break;
									end
								end
							end
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="夜视已启用",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				else
					nightVisionToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
					toggleStroke.Color = Color3.fromRGB(80, 80, 90);
					nightVisionToggleBtn.Text = "启用夜视";
					game.Lighting.Ambient = Color3.new(0, 0, 0);
					if nightVisionConnection then
						local FlatIdent_59C45 = 0;
						while true do
							if (FlatIdent_59C45 == 0) then
								nightVisionConnection:Disconnect();
								nightVisionConnection = nil;
								break;
							end
						end
					end
					StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="夜视已禁用",Duration=3,Icon="rbxassetid://4483345998"});
				end
				break;
			end
		end
	end);
	nightVisionToggleBtn.Parent = nightVisionFrame;
	local nightVisionStatus = Instance.new("TextLabel");
	nightVisionStatus.Name = "NightVisionStatus";
	nightVisionStatus.Size = UDim2.new(1, 0, 0, 20);
	nightVisionStatus.Position = UDim2.new(0, 0, 0, 115);
	nightVisionStatus.BackgroundTransparency = 1;
	nightVisionStatus.TextColor3 = Color3.fromRGB(180, 200, 255);
	nightVisionStatus.Font = Enum.Font.GothamSemibold;
	nightVisionStatus.TextSize = 11;
	nightVisionStatus.Text = "状态: 已禁用";
	nightVisionStatus.Parent = nightVisionFrame;
	game:GetService("RunService").Heartbeat:Connect(function()
		if nightVisionEnabled then
			nightVisionStatus.Text = "状态: 已启用";
		else
			nightVisionStatus.Text = "状态: 已禁用";
		end
	end);
	nightVisionFrame.Parent = scrollContainer;
	return container;
end
local function createInfoContainer()
	local FlatIdent_31791 = 0;
	local container;
	local scrollFrame;
	local infoLayout;
	local timeFrame;
	local timeCorner;
	local timeStroke;
	local timeIcon;
	local timeLabel;
	local titleLabel1;
	local playerFrame;
	local playerCorner;
	local playerStroke;
	local playerIcon;
	local playerLabel;
	local titleLabel2;
	local executorFrame;
	local executorCorner;
	local executorStroke;
	local executorIcon;
	local executorLabel;
	local titleLabel3;
	local statusFrame;
	local statusCorner;
	local statusStroke;
	local statusIcon;
	local statusLabel;
	local titleLabel4;
	local updateInfo;
	while true do
		if (FlatIdent_31791 == 14) then
			executorFrame.Size = UDim2.new(0.9, 0, 0, 50);
			executorFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
			executorFrame.BackgroundTransparency = 0.1;
			executorCorner = Instance.new("UICorner");
			executorCorner.CornerRadius = UDim.new(0, 8);
			executorCorner.Parent = executorFrame;
			executorStroke = Instance.new("UIStroke");
			executorStroke.Thickness = 2;
			FlatIdent_31791 = 15;
		end
		if (4 == FlatIdent_31791) then
			timeIcon = Instance.new("ImageLabel");
			timeIcon.Name = "TimeIcon";
			timeIcon.Size = UDim2.new(0, 32, 0, 32);
			timeIcon.Position = UDim2.new(0, 10, 0.5, -16);
			timeIcon.BackgroundTransparency = 1;
			timeIcon.Image = "rbxassetid://3926305904";
			timeIcon.ImageRectSize = Vector2.new(64, 64);
			timeIcon.ImageRectOffset = Vector2.new(0, 576);
			FlatIdent_31791 = 5;
		end
		if (FlatIdent_31791 == 25) then
			titleLabel4.TextSize = 12;
			titleLabel4.TextXAlignment = Enum.TextXAlignment.Left;
			titleLabel4.Parent = statusFrame;
			statusFrame.Parent = scrollFrame;
			updateInfo = nil;
			function updateInfo()
				timeLabel.Text = getBeijingTime();
				playerLabel.Text = player.Name;
				executorLabel.Text = executorName;
				statusLabel.Text = string.format("脚本状态：正常运行\n游戏ID：%d\n玩家数量：%d", game.PlaceId, #Players:GetPlayers());
			end
			RunService.RenderStepped:Connect(function()
				updateInfo();
			end);
			return container;
		end
		if (FlatIdent_31791 == 8) then
			playerFrame = Instance.new("Frame");
			playerFrame.Name = "PlayerFrame";
			playerFrame.Size = UDim2.new(0.9, 0, 0, 50);
			playerFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
			playerFrame.BackgroundTransparency = 0.1;
			playerCorner = Instance.new("UICorner");
			playerCorner.CornerRadius = UDim.new(0, 8);
			playerCorner.Parent = playerFrame;
			FlatIdent_31791 = 9;
		end
		if (FlatIdent_31791 == 12) then
			playerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			playerLabel.Parent = playerFrame;
			titleLabel2 = Instance.new("TextLabel");
			titleLabel2.Name = "PlayerTitle";
			titleLabel2.Size = UDim2.new(1, -50, 0, 20);
			titleLabel2.Position = UDim2.new(0, 50, 0, 2);
			titleLabel2.BackgroundTransparency = 1;
			titleLabel2.Text = "角色名称";
			FlatIdent_31791 = 13;
		end
		if (FlatIdent_31791 == 22) then
			statusIcon.ImageRectOffset = Vector2.new(0, 64);
			statusIcon.Parent = statusFrame;
			statusLabel = Instance.new("TextLabel");
			statusLabel.Name = "StatusLabel";
			statusLabel.Size = UDim2.new(1, -50, 0, 60);
			statusLabel.Position = UDim2.new(0, 50, 0, 10);
			statusLabel.BackgroundTransparency = 1;
			statusLabel.Text = "脚本状态：正常运行\n游戏ID：" .. game.PlaceId .. "\n玩家数量：" .. #Players:GetPlayers();
			FlatIdent_31791 = 23;
		end
		if (7 == FlatIdent_31791) then
			titleLabel1.BackgroundTransparency = 1;
			titleLabel1.Text = "北京时间";
			titleLabel1.TextColor3 = Color3.fromRGB(180, 200, 255);
			titleLabel1.Font = Enum.Font.GothamBold;
			titleLabel1.TextSize = 12;
			titleLabel1.TextXAlignment = Enum.TextXAlignment.Left;
			titleLabel1.Parent = timeFrame;
			timeFrame.Parent = scrollFrame;
			FlatIdent_31791 = 8;
		end
		if (FlatIdent_31791 == 24) then
			titleLabel4 = Instance.new("TextLabel");
			titleLabel4.Name = "StatusTitle";
			titleLabel4.Size = UDim2.new(1, -50, 0, 20);
			titleLabel4.Position = UDim2.new(0, 50, 0, 2);
			titleLabel4.BackgroundTransparency = 1;
			titleLabel4.Text = "系统状态";
			titleLabel4.TextColor3 = Color3.fromRGB(180, 200, 255);
			titleLabel4.Font = Enum.Font.GothamBold;
			FlatIdent_31791 = 25;
		end
		if (FlatIdent_31791 == 15) then
			executorStroke.Color = Color3.fromRGB(80, 160, 255);
			executorStroke.Transparency = 0.2;
			executorStroke.Parent = executorFrame;
			executorIcon = Instance.new("ImageLabel");
			executorIcon.Name = "ExecutorIcon";
			executorIcon.Size = UDim2.new(0, 32, 0, 32);
			executorIcon.Position = UDim2.new(0, 10, 0.5, -16);
			executorIcon.BackgroundTransparency = 1;
			FlatIdent_31791 = 16;
		end
		if (17 == FlatIdent_31791) then
			executorLabel.BackgroundTransparency = 1;
			executorLabel.Text = executorName;
			executorLabel.TextColor3 = Color3.fromRGB(220, 220, 230);
			executorLabel.Font = Enum.Font.GothamSemibold;
			executorLabel.TextSize = 14;
			executorLabel.TextStrokeTransparency = 0.7;
			executorLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			executorLabel.Parent = executorFrame;
			FlatIdent_31791 = 18;
		end
		if (FlatIdent_31791 == 20) then
			statusFrame.BackgroundTransparency = 0.1;
			statusCorner = Instance.new("UICorner");
			statusCorner.CornerRadius = UDim.new(0, 8);
			statusCorner.Parent = statusFrame;
			statusStroke = Instance.new("UIStroke");
			statusStroke.Thickness = 2;
			statusStroke.Color = Color3.fromRGB(80, 160, 255);
			statusStroke.Transparency = 0.2;
			FlatIdent_31791 = 21;
		end
		if (FlatIdent_31791 == 2) then
			infoLayout.Parent = scrollFrame;
			infoLayout.Padding = UDim.new(0, 15);
			infoLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			timeFrame = Instance.new("Frame");
			timeFrame.Name = "TimeFrame";
			timeFrame.Size = UDim2.new(0.9, 0, 0, 50);
			timeFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
			timeFrame.BackgroundTransparency = 0.1;
			FlatIdent_31791 = 3;
		end
		if (FlatIdent_31791 == 0) then
			container = Instance.new("Frame");
			container.Name = "InfoContainer";
			container.Size = UDim2.new(1, 0, 1, 0);
			container.BackgroundTransparency = 1;
			container.Visible = false;
			container.Parent = contentFrame;
			scrollFrame = Instance.new("ScrollingFrame");
			scrollFrame.Name = "InfoScroll";
			FlatIdent_31791 = 1;
		end
		if (FlatIdent_31791 == 9) then
			playerStroke = Instance.new("UIStroke");
			playerStroke.Thickness = 2;
			playerStroke.Color = Color3.fromRGB(80, 160, 255);
			playerStroke.Transparency = 0.2;
			playerStroke.Parent = playerFrame;
			playerIcon = Instance.new("ImageLabel");
			playerIcon.Name = "PlayerIcon";
			playerIcon.Size = UDim2.new(0, 32, 0, 32);
			FlatIdent_31791 = 10;
		end
		if (16 == FlatIdent_31791) then
			executorIcon.Image = "rbxassetid://3926305904";
			executorIcon.ImageRectSize = Vector2.new(64, 64);
			executorIcon.ImageRectOffset = Vector2.new(192, 128);
			executorIcon.Parent = executorFrame;
			executorLabel = Instance.new("TextLabel");
			executorLabel.Name = "ExecutorName";
			executorLabel.Size = UDim2.new(1, -50, 1, 0);
			executorLabel.Position = UDim2.new(0, 50, 0, 0);
			FlatIdent_31791 = 17;
		end
		if (FlatIdent_31791 == 11) then
			playerLabel.Size = UDim2.new(1, -50, 1, 0);
			playerLabel.Position = UDim2.new(0, 50, 0, 0);
			playerLabel.BackgroundTransparency = 1;
			playerLabel.Text = player.Name;
			playerLabel.TextColor3 = Color3.fromRGB(220, 220, 230);
			playerLabel.Font = Enum.Font.GothamSemibold;
			playerLabel.TextSize = 14;
			playerLabel.TextStrokeTransparency = 0.7;
			FlatIdent_31791 = 12;
		end
		if (FlatIdent_31791 == 18) then
			titleLabel3 = Instance.new("TextLabel");
			titleLabel3.Name = "ExecutorTitle";
			titleLabel3.Size = UDim2.new(1, -50, 0, 20);
			titleLabel3.Position = UDim2.new(0, 50, 0, 2);
			titleLabel3.BackgroundTransparency = 1;
			titleLabel3.Text = "注入器";
			titleLabel3.TextColor3 = Color3.fromRGB(180, 200, 255);
			titleLabel3.Font = Enum.Font.GothamBold;
			FlatIdent_31791 = 19;
		end
		if (FlatIdent_31791 == 23) then
			statusLabel.TextColor3 = Color3.fromRGB(220, 220, 230);
			statusLabel.Font = Enum.Font.GothamSemibold;
			statusLabel.TextSize = 12;
			statusLabel.TextStrokeTransparency = 0.7;
			statusLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			statusLabel.TextXAlignment = Enum.TextXAlignment.Left;
			statusLabel.TextYAlignment = Enum.TextYAlignment.Top;
			statusLabel.Parent = statusFrame;
			FlatIdent_31791 = 24;
		end
		if (10 == FlatIdent_31791) then
			playerIcon.Position = UDim2.new(0, 10, 0.5, -16);
			playerIcon.BackgroundTransparency = 1;
			playerIcon.Image = "rbxassetid://3926305904";
			playerIcon.ImageRectSize = Vector2.new(64, 64);
			playerIcon.ImageRectOffset = Vector2.new(128, 256);
			playerIcon.Parent = playerFrame;
			playerLabel = Instance.new("TextLabel");
			playerLabel.Name = "PlayerName";
			FlatIdent_31791 = 11;
		end
		if (FlatIdent_31791 == 13) then
			titleLabel2.TextColor3 = Color3.fromRGB(180, 200, 255);
			titleLabel2.Font = Enum.Font.GothamBold;
			titleLabel2.TextSize = 12;
			titleLabel2.TextXAlignment = Enum.TextXAlignment.Left;
			titleLabel2.Parent = playerFrame;
			playerFrame.Parent = scrollFrame;
			executorFrame = Instance.new("Frame");
			executorFrame.Name = "ExecutorFrame";
			FlatIdent_31791 = 14;
		end
		if (1 == FlatIdent_31791) then
			scrollFrame.Size = UDim2.new(1, -20, 1, -20);
			scrollFrame.Position = UDim2.new(0, 10, 0, 10);
			scrollFrame.BackgroundTransparency = 1;
			scrollFrame.ScrollBarThickness = 6;
			scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110);
			scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 350);
			scrollFrame.Parent = container;
			infoLayout = Instance.new("UIListLayout");
			FlatIdent_31791 = 2;
		end
		if (3 == FlatIdent_31791) then
			timeCorner = Instance.new("UICorner");
			timeCorner.CornerRadius = UDim.new(0, 8);
			timeCorner.Parent = timeFrame;
			timeStroke = Instance.new("UIStroke");
			timeStroke.Thickness = 2;
			timeStroke.Color = Color3.fromRGB(80, 160, 255);
			timeStroke.Transparency = 0.2;
			timeStroke.Parent = timeFrame;
			FlatIdent_31791 = 4;
		end
		if (21 == FlatIdent_31791) then
			statusStroke.Parent = statusFrame;
			statusIcon = Instance.new("ImageLabel");
			statusIcon.Name = "StatusIcon";
			statusIcon.Size = UDim2.new(0, 32, 0, 32);
			statusIcon.Position = UDim2.new(0, 10, 0, 10);
			statusIcon.BackgroundTransparency = 1;
			statusIcon.Image = "rbxassetid://3926305904";
			statusIcon.ImageRectSize = Vector2.new(64, 64);
			FlatIdent_31791 = 22;
		end
		if (FlatIdent_31791 == 6) then
			timeLabel.TextSize = 14;
			timeLabel.TextStrokeTransparency = 0.7;
			timeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			timeLabel.Parent = timeFrame;
			titleLabel1 = Instance.new("TextLabel");
			titleLabel1.Name = "TimeTitle";
			titleLabel1.Size = UDim2.new(1, -50, 0, 20);
			titleLabel1.Position = UDim2.new(0, 50, 0, 2);
			FlatIdent_31791 = 7;
		end
		if (FlatIdent_31791 == 19) then
			titleLabel3.TextSize = 12;
			titleLabel3.TextXAlignment = Enum.TextXAlignment.Left;
			titleLabel3.Parent = executorFrame;
			executorFrame.Parent = scrollFrame;
			statusFrame = Instance.new("Frame");
			statusFrame.Name = "StatusFrame";
			statusFrame.Size = UDim2.new(0.9, 0, 0, 80);
			statusFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
			FlatIdent_31791 = 20;
		end
		if (FlatIdent_31791 == 5) then
			timeIcon.Parent = timeFrame;
			timeLabel = Instance.new("TextLabel");
			timeLabel.Name = "BeijingTime";
			timeLabel.Size = UDim2.new(1, -50, 1, 0);
			timeLabel.Position = UDim2.new(0, 50, 0, 0);
			timeLabel.BackgroundTransparency = 1;
			timeLabel.TextColor3 = Color3.fromRGB(220, 220, 230);
			timeLabel.Font = Enum.Font.GothamSemibold;
			FlatIdent_31791 = 6;
		end
	end
end
local function createOtherScriptsContainer()
	local container = Instance.new("Frame");
	container.Name = "OtherScriptsContainer";
	container.Size = UDim2.new(1, 0, 1, 0);
	container.BackgroundTransparency = 1;
	container.Visible = false;
	container.Parent = contentFrame;
	local scrollContainer = Instance.new("ScrollingFrame");
	scrollContainer.Name = "OtherScriptsScroll";
	scrollContainer.Size = UDim2.new(1, -20, 1, -20);
	scrollContainer.Position = UDim2.new(0, 10, 0, 10);
	scrollContainer.BackgroundTransparency = 1;
	scrollContainer.ScrollBarThickness = 6;
	scrollContainer.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 110);
	scrollContainer.CanvasSize = UDim2.new(0, 0, 0, 650);
	scrollContainer.Parent = container;
	local scriptLayout = Instance.new("UIListLayout");
	scriptLayout.Parent = scrollContainer;
	scriptLayout.Padding = UDim.new(0, 12);
	scriptLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local voidChinese99NightBtn = Instance.new("TextButton");
	voidChinese99NightBtn.Name = "VoidChinese99Night";
	voidChinese99NightBtn.Size = UDim2.new(0.9, 0, 0, 40);
	voidChinese99NightBtn.Text = "虚空汉化99夜";
	voidChinese99NightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	voidChinese99NightBtn.TextColor3 = Color3.new(1, 1, 1);
	voidChinese99NightBtn.Font = Enum.Font.GothamSemibold;
	voidChinese99NightBtn.TextSize = 15;
	voidChinese99NightBtn.TextStrokeTransparency = 0.5;
	voidChinese99NightBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	voidChinese99NightBtn.AutoButtonColor = false;
	local btnStroke1 = Instance.new("UIStroke");
	btnStroke1.Thickness = 2;
	btnStroke1.Color = Color3.fromRGB(80, 80, 90);
	btnStroke1.Transparency = 0.3;
	btnStroke1.Parent = voidChinese99NightBtn;
	local btnCorner1 = Instance.new("UICorner");
	btnCorner1.CornerRadius = UDim.new(0, 8);
	btnCorner1.Parent = voidChinese99NightBtn;
	local originalColor1 = Color3.fromRGB(60, 60, 70);
	local voidChinese99NightEnabled = false;
	voidChinese99NightBtn.MouseEnter:Connect(function()
		if not voidChinese99NightEnabled then
			local FlatIdent_54124 = 0;
			while true do
				if (FlatIdent_54124 == 0) then
					voidChinese99NightBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke1.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	voidChinese99NightBtn.MouseLeave:Connect(function()
		if not voidChinese99NightEnabled then
			local FlatIdent_68E5B = 0;
			while true do
				if (FlatIdent_68E5B == 0) then
					voidChinese99NightBtn.BackgroundColor3 = originalColor1;
					btnStroke1.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	voidChinese99NightBtn.MouseButton1Click:Connect(function()
		voidChinese99NightEnabled = not voidChinese99NightEnabled;
		if voidChinese99NightEnabled then
			voidChinese99NightBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
			btnStroke1.Color = Color3.fromRGB(120, 200, 255);
			voidChinese99NightBtn.Text = "虚空汉化99夜 ✓";
			local success = pcall(function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/99%E5%A4%9C%E8%99%9A%E7%A9%BA.txt"))();
			end);
			if success then
				StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="虚空汉化99夜脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
			else
				StarterGui:SetCore("SendNotification", {Title="错误",Text="加载虚空汉化99夜脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
				voidChinese99NightEnabled = false;
				voidChinese99NightBtn.BackgroundColor3 = originalColor1;
				btnStroke1.Color = Color3.fromRGB(80, 80, 90);
				voidChinese99NightBtn.Text = "虚空汉化99夜";
			end
		else
			local FlatIdent_70C30 = 0;
			while true do
				if (FlatIdent_70C30 == 1) then
					voidChinese99NightBtn.Text = "虚空汉化99夜";
					StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="虚空汉化99夜脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
					break;
				end
				if (FlatIdent_70C30 == 0) then
					voidChinese99NightBtn.BackgroundColor3 = originalColor1;
					btnStroke1.Color = Color3.fromRGB(80, 80, 90);
					FlatIdent_70C30 = 1;
				end
			end
		end
	end);
	voidChinese99NightBtn.Parent = scrollContainer;
	local skyboxBugBtn = Instance.new("TextButton");
	skyboxBugBtn.Name = "SkyboxBug";
	skyboxBugBtn.Size = UDim2.new(0.9, 0, 0, 40);
	skyboxBugBtn.Text = "天空盒子bug(只能在特定服务器使用)";
	skyboxBugBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	skyboxBugBtn.TextColor3 = Color3.new(1, 1, 1);
	skyboxBugBtn.Font = Enum.Font.GothamSemibold;
	skyboxBugBtn.TextSize = 13;
	skyboxBugBtn.TextStrokeTransparency = 0.5;
	skyboxBugBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	skyboxBugBtn.AutoButtonColor = false;
	local btnStroke2 = Instance.new("UIStroke");
	btnStroke2.Thickness = 2;
	btnStroke2.Color = Color3.fromRGB(80, 80, 90);
	btnStroke2.Transparency = 0.3;
	btnStroke2.Parent = skyboxBugBtn;
	local btnCorner2 = Instance.new("UICorner");
	btnCorner2.CornerRadius = UDim.new(0, 8);
	btnCorner2.Parent = skyboxBugBtn;
	local originalColor2 = Color3.fromRGB(60, 60, 70);
	local skyboxBugEnabled = false;
	skyboxBugBtn.MouseEnter:Connect(function()
		if not skyboxBugEnabled then
			skyboxBugBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
			btnStroke2.Color = Color3.fromRGB(90, 90, 100);
		end
	end);
	skyboxBugBtn.MouseLeave:Connect(function()
		if not skyboxBugEnabled then
			local FlatIdent_6245F = 0;
			while true do
				if (FlatIdent_6245F == 0) then
					skyboxBugBtn.BackgroundColor3 = originalColor2;
					btnStroke2.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	skyboxBugBtn.MouseButton1Click:Connect(function()
		local FlatIdent_14A42 = 0;
		while true do
			if (FlatIdent_14A42 == 0) then
				skyboxBugEnabled = not skyboxBugEnabled;
				if skyboxBugEnabled then
					skyboxBugBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
					btnStroke2.Color = Color3.fromRGB(120, 200, 255);
					skyboxBugBtn.Text = "天空盒子bug(只能在特定服务器使用) ✓";
					local success = pcall(function()
						loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Skybox-Brookhaven-61921"))();
					end);
					if success then
						StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="天空盒子bug脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
					else
						local FlatIdent_2C1E9 = 0;
						while true do
							if (FlatIdent_2C1E9 == 1) then
								skyboxBugBtn.BackgroundColor3 = originalColor2;
								btnStroke2.Color = Color3.fromRGB(80, 80, 90);
								FlatIdent_2C1E9 = 2;
							end
							if (FlatIdent_2C1E9 == 2) then
								skyboxBugBtn.Text = "天空盒子bug(只能在特定服务器使用)";
								break;
							end
							if (FlatIdent_2C1E9 == 0) then
								StarterGui:SetCore("SendNotification", {Title="错误",Text="加载天空盒子bug脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
								skyboxBugEnabled = false;
								FlatIdent_2C1E9 = 1;
							end
						end
					end
				else
					local FlatIdent_8A1DB = 0;
					while true do
						if (0 == FlatIdent_8A1DB) then
							skyboxBugBtn.BackgroundColor3 = originalColor2;
							btnStroke2.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_8A1DB = 1;
						end
						if (FlatIdent_8A1DB == 1) then
							skyboxBugBtn.Text = "天空盒子bug(只能在特定服务器使用)";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="天空盒子bug脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	skyboxBugBtn.Parent = scrollContainer;
	local stealBrainRedBtn = Instance.new("TextButton");
	stealBrainRedBtn.Name = "StealBrainRed";
	stealBrainRedBtn.Size = UDim2.new(0.9, 0, 0, 40);
	stealBrainRedBtn.Text = "偷走脑红";
	stealBrainRedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	stealBrainRedBtn.TextColor3 = Color3.new(1, 1, 1);
	stealBrainRedBtn.Font = Enum.Font.GothamSemibold;
	stealBrainRedBtn.TextSize = 15;
	stealBrainRedBtn.TextStrokeTransparency = 0.5;
	stealBrainRedBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	stealBrainRedBtn.AutoButtonColor = false;
	local btnStroke3 = Instance.new("UIStroke");
	btnStroke3.Thickness = 2;
	btnStroke3.Color = Color3.fromRGB(80, 80, 90);
	btnStroke3.Transparency = 0.3;
	btnStroke3.Parent = stealBrainRedBtn;
	local btnCorner3 = Instance.new("UICorner");
	btnCorner3.CornerRadius = UDim.new(0, 8);
	btnCorner3.Parent = stealBrainRedBtn;
	local originalColor3 = Color3.fromRGB(60, 60, 70);
	local stealBrainRedEnabled = false;
	stealBrainRedBtn.MouseEnter:Connect(function()
		if not stealBrainRedEnabled then
			local FlatIdent_4EC26 = 0;
			while true do
				if (FlatIdent_4EC26 == 0) then
					stealBrainRedBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke3.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	stealBrainRedBtn.MouseLeave:Connect(function()
		if not stealBrainRedEnabled then
			stealBrainRedBtn.BackgroundColor3 = originalColor3;
			btnStroke3.Color = Color3.fromRGB(80, 80, 90);
		end
	end);
	stealBrainRedBtn.MouseButton1Click:Connect(function()
		local FlatIdent_58C0A = 0;
		while true do
			if (FlatIdent_58C0A == 0) then
				stealBrainRedEnabled = not stealBrainRedEnabled;
				if stealBrainRedEnabled then
					local FlatIdent_96598 = 0;
					local success;
					while true do
						if (FlatIdent_96598 == 2) then
							if success then
								StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="偷走脑红脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
							else
								local FlatIdent_D6BD = 0;
								while true do
									if (FlatIdent_D6BD == 2) then
										stealBrainRedBtn.Text = "偷走脑红";
										break;
									end
									if (FlatIdent_D6BD == 1) then
										stealBrainRedBtn.BackgroundColor3 = originalColor3;
										btnStroke3.Color = Color3.fromRGB(80, 80, 90);
										FlatIdent_D6BD = 2;
									end
									if (FlatIdent_D6BD == 0) then
										StarterGui:SetCore("SendNotification", {Title="错误",Text="加载偷走脑红脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
										stealBrainRedEnabled = false;
										FlatIdent_D6BD = 1;
									end
								end
							end
							break;
						end
						if (0 == FlatIdent_96598) then
							stealBrainRedBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							btnStroke3.Color = Color3.fromRGB(120, 200, 255);
							FlatIdent_96598 = 1;
						end
						if (FlatIdent_96598 == 1) then
							stealBrainRedBtn.Text = "偷走脑红 ✓";
							success = pcall(function()
								loadstring(game:HttpGet("https://pastefy.app/AZeSJL5d/raw"))();
							end);
							FlatIdent_96598 = 2;
						end
					end
				else
					local FlatIdent_4FBC5 = 0;
					while true do
						if (FlatIdent_4FBC5 == 1) then
							stealBrainRedBtn.Text = "偷走脑红";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="偷走脑红脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
						if (0 == FlatIdent_4FBC5) then
							stealBrainRedBtn.BackgroundColor3 = originalColor3;
							btnStroke3.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_4FBC5 = 1;
						end
					end
				end
				break;
			end
		end
	end);
	stealBrainRedBtn.Parent = scrollContainer;
	local bfChineseScriptBtn = Instance.new("TextButton");
	bfChineseScriptBtn.Name = "BfChineseScript";
	bfChineseScriptBtn.Size = UDim2.new(0.9, 0, 0, 40);
	bfChineseScriptBtn.Text = "Bf汉化脚本";
	bfChineseScriptBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	bfChineseScriptBtn.TextColor3 = Color3.new(1, 1, 1);
	bfChineseScriptBtn.Font = Enum.Font.GothamSemibold;
	bfChineseScriptBtn.TextSize = 15;
	bfChineseScriptBtn.TextStrokeTransparency = 0.5;
	bfChineseScriptBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	bfChineseScriptBtn.AutoButtonColor = false;
	local btnStroke4 = Instance.new("UIStroke");
	btnStroke4.Thickness = 2;
	btnStroke4.Color = Color3.fromRGB(80, 80, 90);
	btnStroke4.Transparency = 0.3;
	btnStroke4.Parent = bfChineseScriptBtn;
	local btnCorner4 = Instance.new("UICorner");
	btnCorner4.CornerRadius = UDim.new(0, 8);
	btnCorner4.Parent = bfChineseScriptBtn;
	local originalColor4 = Color3.fromRGB(60, 60, 70);
	local bfChineseScriptEnabled = false;
	bfChineseScriptBtn.MouseEnter:Connect(function()
		if not bfChineseScriptEnabled then
			local FlatIdent_4609C = 0;
			while true do
				if (FlatIdent_4609C == 0) then
					bfChineseScriptBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke4.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	bfChineseScriptBtn.MouseLeave:Connect(function()
		if not bfChineseScriptEnabled then
			local FlatIdent_45D0C = 0;
			while true do
				if (FlatIdent_45D0C == 0) then
					bfChineseScriptBtn.BackgroundColor3 = originalColor4;
					btnStroke4.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	bfChineseScriptBtn.MouseButton1Click:Connect(function()
		local FlatIdent_761C4 = 0;
		while true do
			if (0 == FlatIdent_761C4) then
				bfChineseScriptEnabled = not bfChineseScriptEnabled;
				if bfChineseScriptEnabled then
					local FlatIdent_5B0A0 = 0;
					local success;
					while true do
						if (FlatIdent_5B0A0 == 2) then
							if success then
								StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="Bf汉化脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
							else
								local FlatIdent_74EA4 = 0;
								while true do
									if (1 == FlatIdent_74EA4) then
										bfChineseScriptBtn.BackgroundColor3 = originalColor4;
										btnStroke4.Color = Color3.fromRGB(80, 80, 90);
										FlatIdent_74EA4 = 2;
									end
									if (FlatIdent_74EA4 == 0) then
										StarterGui:SetCore("SendNotification", {Title="错误",Text="加载Bf汉化脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
										bfChineseScriptEnabled = false;
										FlatIdent_74EA4 = 1;
									end
									if (2 == FlatIdent_74EA4) then
										bfChineseScriptBtn.Text = "Bf汉化脚本";
										break;
									end
								end
							end
							break;
						end
						if (FlatIdent_5B0A0 == 1) then
							bfChineseScriptBtn.Text = "Bf汉化脚本 ✓";
							success = pcall(function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))();
							end);
							FlatIdent_5B0A0 = 2;
						end
						if (FlatIdent_5B0A0 == 0) then
							bfChineseScriptBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							btnStroke4.Color = Color3.fromRGB(120, 200, 255);
							FlatIdent_5B0A0 = 1;
						end
					end
				else
					local FlatIdent_943B = 0;
					while true do
						if (FlatIdent_943B == 0) then
							bfChineseScriptBtn.BackgroundColor3 = originalColor4;
							btnStroke4.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_943B = 1;
						end
						if (FlatIdent_943B == 1) then
							bfChineseScriptBtn.Text = "Bf汉化脚本";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="Bf汉化脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	bfChineseScriptBtn.Parent = scrollContainer;
	local backdoorExecutorBtn = Instance.new("TextButton");
	backdoorExecutorBtn.Name = "BackdoorExecutor";
	backdoorExecutorBtn.Size = UDim2.new(0.9, 0, 0, 40);
	backdoorExecutorBtn.Text = "后门执行器";
	backdoorExecutorBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	backdoorExecutorBtn.TextColor3 = Color3.new(1, 1, 1);
	backdoorExecutorBtn.Font = Enum.Font.GothamSemibold;
	backdoorExecutorBtn.TextSize = 15;
	backdoorExecutorBtn.TextStrokeTransparency = 0.5;
	backdoorExecutorBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	backdoorExecutorBtn.AutoButtonColor = false;
	local btnStroke5 = Instance.new("UIStroke");
	btnStroke5.Thickness = 2;
	btnStroke5.Color = Color3.fromRGB(80, 80, 90);
	btnStroke5.Transparency = 0.3;
	btnStroke5.Parent = backdoorExecutorBtn;
	local btnCorner5 = Instance.new("UICorner");
	btnCorner5.CornerRadius = UDim.new(0, 8);
	btnCorner5.Parent = backdoorExecutorBtn;
	local originalColor5 = Color3.fromRGB(60, 60, 70);
	local backdoorExecutorEnabled = false;
	backdoorExecutorBtn.MouseEnter:Connect(function()
		if not backdoorExecutorEnabled then
			local FlatIdent_55482 = 0;
			while true do
				if (FlatIdent_55482 == 0) then
					backdoorExecutorBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke5.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	backdoorExecutorBtn.MouseLeave:Connect(function()
		if not backdoorExecutorEnabled then
			local FlatIdent_23A2C = 0;
			while true do
				if (FlatIdent_23A2C == 0) then
					backdoorExecutorBtn.BackgroundColor3 = originalColor5;
					btnStroke5.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	backdoorExecutorBtn.MouseButton1Click:Connect(function()
		local FlatIdent_23B4 = 0;
		while true do
			if (FlatIdent_23B4 == 0) then
				backdoorExecutorEnabled = not backdoorExecutorEnabled;
				if backdoorExecutorEnabled then
					local FlatIdent_1351F = 0;
					local success;
					while true do
						if (FlatIdent_1351F == 2) then
							if success then
								StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="后门执行器脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
							else
								StarterGui:SetCore("SendNotification", {Title="错误",Text="加载后门执行器脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
								backdoorExecutorEnabled = false;
								backdoorExecutorBtn.BackgroundColor3 = originalColor5;
								btnStroke5.Color = Color3.fromRGB(80, 80, 90);
								backdoorExecutorBtn.Text = "后门执行器";
							end
							break;
						end
						if (1 == FlatIdent_1351F) then
							backdoorExecutorBtn.Text = "后门执行器 ✓";
							success = pcall(function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v6x/source.lua"))();
							end);
							FlatIdent_1351F = 2;
						end
						if (0 == FlatIdent_1351F) then
							backdoorExecutorBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							btnStroke5.Color = Color3.fromRGB(120, 200, 255);
							FlatIdent_1351F = 1;
						end
					end
				else
					local FlatIdent_8BD63 = 0;
					while true do
						if (0 == FlatIdent_8BD63) then
							backdoorExecutorBtn.BackgroundColor3 = originalColor5;
							btnStroke5.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_8BD63 = 1;
						end
						if (FlatIdent_8BD63 == 1) then
							backdoorExecutorBtn.Text = "后门执行器";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="后门执行器脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	backdoorExecutorBtn.Parent = scrollContainer;
	local skinScriptBtn = Instance.new("TextButton");
	skinScriptBtn.Name = "SkinScript";
	skinScriptBtn.Size = UDim2.new(0.9, 0, 0, 40);
	skinScriptBtn.Text = "皮脚本";
	skinScriptBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
	skinScriptBtn.TextColor3 = Color3.new(1, 1, 1);
	skinScriptBtn.Font = Enum.Font.GothamSemibold;
	skinScriptBtn.TextSize = 15;
	skinScriptBtn.TextStrokeTransparency = 0.5;
	skinScriptBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	skinScriptBtn.AutoButtonColor = false;
	local btnStroke6 = Instance.new("UIStroke");
	btnStroke6.Thickness = 2;
	btnStroke6.Color = Color3.fromRGB(80, 80, 90);
	btnStroke6.Transparency = 0.3;
	btnStroke6.Parent = skinScriptBtn;
	local btnCorner6 = Instance.new("UICorner");
	btnCorner6.CornerRadius = UDim.new(0, 8);
	btnCorner6.Parent = skinScriptBtn;
	local originalColor6 = Color3.fromRGB(60, 60, 70);
	local skinScriptEnabled = false;
	skinScriptBtn.MouseEnter:Connect(function()
		if not skinScriptEnabled then
			local FlatIdent_D076 = 0;
			while true do
				if (0 == FlatIdent_D076) then
					skinScriptBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80);
					btnStroke6.Color = Color3.fromRGB(90, 90, 100);
					break;
				end
			end
		end
	end);
	skinScriptBtn.MouseLeave:Connect(function()
		if not skinScriptEnabled then
			local FlatIdent_80263 = 0;
			while true do
				if (FlatIdent_80263 == 0) then
					skinScriptBtn.BackgroundColor3 = originalColor6;
					btnStroke6.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	skinScriptBtn.MouseButton1Click:Connect(function()
		local FlatIdent_88CAD = 0;
		while true do
			if (FlatIdent_88CAD == 0) then
				skinScriptEnabled = not skinScriptEnabled;
				if skinScriptEnabled then
					skinScriptBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
					btnStroke6.Color = Color3.fromRGB(120, 200, 255);
					skinScriptBtn.Text = "皮脚本 ✓";
					local success = pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/xiao122231/xiao122231/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3"))();
					end);
					if success then
						StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="皮脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
					else
						local FlatIdent_5C3A6 = 0;
						while true do
							if (FlatIdent_5C3A6 == 1) then
								skinScriptBtn.BackgroundColor3 = originalColor6;
								btnStroke6.Color = Color3.fromRGB(80, 80, 90);
								FlatIdent_5C3A6 = 2;
							end
							if (FlatIdent_5C3A6 == 2) then
								skinScriptBtn.Text = "皮脚本";
								break;
							end
							if (0 == FlatIdent_5C3A6) then
								StarterGui:SetCore("SendNotification", {Title="错误",Text="加载皮脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
								skinScriptEnabled = false;
								FlatIdent_5C3A6 = 1;
							end
						end
					end
				else
					local FlatIdent_30B76 = 0;
					while true do
						if (FlatIdent_30B76 == 0) then
							skinScriptBtn.BackgroundColor3 = originalColor6;
							btnStroke6.Color = Color3.fromRGB(80, 80, 90);
							FlatIdent_30B76 = 1;
						end
						if (FlatIdent_30B76 == 1) then
							skinScriptBtn.Text = "皮脚本";
							StarterGui:SetCore("SendNotification", {Title="XDG-HOB",Text="皮脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	skinScriptBtn.Parent = scrollContainer;
	return container;
end
local function createCategoryBtn(name, index)
	local FlatIdent_674F6 = 0;
	local btn;
	local btnStroke;
	while true do
		if (FlatIdent_674F6 == 2) then
			btn.Font = Enum.Font.GothamSemibold;
			btn.TextSize = 13;
			btn.TextStrokeTransparency = 0.5;
			FlatIdent_674F6 = 3;
		end
		if (FlatIdent_674F6 == 3) then
			btn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			btn.MouseButton1Click:Connect(function()
				selectedCategory = index;
				for _, child in pairs(scrollFrame:GetChildren()) do
					if child:IsA("TextButton") then
						child.BackgroundColor3 = Color3.fromRGB(50, 50, 60);
						child.BorderSizePixel = 0;
					end
				end
				btn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
				btn.BorderSizePixel = 2;
				btn.BorderColor3 = Color3.fromRGB(255, 255, 255);
				for i, container in ipairs(contentContainers) do
					container.Visible = i == index;
				end
			end);
			if (index == selectedCategory) then
				local FlatIdent_6B578 = 0;
				while true do
					if (FlatIdent_6B578 == 0) then
						btn.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
						btn.BorderSizePixel = 2;
						FlatIdent_6B578 = 1;
					end
					if (FlatIdent_6B578 == 1) then
						btn.BorderColor3 = Color3.fromRGB(255, 255, 255);
						break;
					end
				end
			end
			FlatIdent_674F6 = 4;
		end
		if (FlatIdent_674F6 == 5) then
			btnStroke.Transparency = 0.3;
			btnStroke.Parent = btn;
			btn.MouseEnter:Connect(function()
				if (btn.BackgroundColor3 ~= Color3.fromRGB(80, 160, 255)) then
					btn.BackgroundColor3 = Color3.fromRGB(60, 60, 70);
				end
			end);
			FlatIdent_674F6 = 6;
		end
		if (FlatIdent_674F6 == 4) then
			btnStroke = Instance.new("UIStroke");
			btnStroke.Thickness = 1;
			btnStroke.Color = Color3.fromRGB(70, 70, 80);
			FlatIdent_674F6 = 5;
		end
		if (FlatIdent_674F6 == 6) then
			btn.MouseLeave:Connect(function()
				if (btn.BackgroundColor3 ~= Color3.fromRGB(80, 160, 255)) then
					btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60);
				end
			end);
			btn.Parent = scrollFrame;
			break;
		end
		if (FlatIdent_674F6 == 1) then
			btn.Text = name;
			btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60);
			btn.TextColor3 = Color3.new(1, 1, 1);
			FlatIdent_674F6 = 2;
		end
		if (FlatIdent_674F6 == 0) then
			btn = Instance.new("TextButton");
			btn.Name = name;
			btn.Size = UDim2.new(0, 100, 0, 34);
			FlatIdent_674F6 = 1;
		end
	end
end
for i, name in ipairs(categories) do
	createCategoryBtn(name, i);
end
table.insert(contentContainers, createUtilityContainer());
table.insert(contentContainers, createFunctionContainer());
table.insert(contentContainers, createInfoContainer());
table.insert(contentContainers, createOtherScriptsContainer());
uiFrame.Visible = true;
controlBtn.Visible = true;
local uiVisible = true;
local frameDragging = false;
local frameStartPos;
local frameStartOffset;
local btnDragging = false;
local btnStartPos;
local btnStartOffset;
local function updateFrameDrag(input)
	if frameDragging then
		local FlatIdent_186F = 0;
		local delta;
		local viewportSize;
		local frameSize;
		local newX;
		local newY;
		while true do
			if (0 == FlatIdent_186F) then
				delta = input.Position - frameStartPos;
				viewportSize = workspace.CurrentCamera.ViewportSize;
				FlatIdent_186F = 1;
			end
			if (FlatIdent_186F == 1) then
				frameSize = uiFrame.AbsoluteSize;
				newX = math.clamp(frameStartOffset.X + delta.X, 0, viewportSize.X - frameSize.X);
				FlatIdent_186F = 2;
			end
			if (2 == FlatIdent_186F) then
				newY = math.clamp(frameStartOffset.Y + delta.Y, 0, viewportSize.Y - frameSize.Y);
				uiFrame.Position = UDim2.new(0, newX, 0, newY);
				break;
			end
		end
	end
end
local function updateBtnDrag(input)
	if btnDragging then
		local FlatIdent_2E3FF = 0;
		local delta;
		local viewportSize;
		local btnSize;
		local newX;
		local newY;
		while true do
			if (FlatIdent_2E3FF == 0) then
				delta = input.Position - btnStartPos;
				viewportSize = workspace.CurrentCamera.ViewportSize;
				FlatIdent_2E3FF = 1;
			end
			if (FlatIdent_2E3FF == 2) then
				newY = math.clamp(btnStartOffset.Y + delta.Y, 0, viewportSize.Y - btnSize.Y);
				controlBtn.Position = UDim2.new(0, newX, 0, newY);
				break;
			end
			if (FlatIdent_2E3FF == 1) then
				btnSize = controlBtn.AbsoluteSize;
				newX = math.clamp(btnStartOffset.X + delta.X, 0, viewportSize.X - btnSize.X);
				FlatIdent_2E3FF = 2;
			end
		end
	end
end
titleBar.InputBegan:Connect(function(input)
	if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
		local FlatIdent_4C119 = 0;
		while true do
			if (FlatIdent_4C119 == 0) then
				frameDragging = true;
				frameStartPos = input.Position;
				FlatIdent_4C119 = 1;
			end
			if (FlatIdent_4C119 == 1) then
				frameStartOffset = Vector2.new(uiFrame.Position.X.Offset, uiFrame.Position.Y.Offset);
				break;
			end
		end
	end
end);
titleBar.InputEnded:Connect(function(input)
	if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
		frameDragging = false;
	end
end);
controlBtn.InputBegan:Connect(function(input)
	if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
		local FlatIdent_8B6ED = 0;
		while true do
			if (FlatIdent_8B6ED == 0) then
				btnDragging = true;
				btnStartPos = input.Position;
				FlatIdent_8B6ED = 1;
			end
			if (FlatIdent_8B6ED == 1) then
				btnStartOffset = Vector2.new(controlBtn.Position.X.Offset, controlBtn.Position.Y.Offset);
				break;
			end
		end
	end
end);
controlBtn.InputEnded:Connect(function(input)
	if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
		if btnDragging then
			local FlatIdent_2C3E6 = 0;
			local moved;
			while true do
				if (FlatIdent_2C3E6 == 0) then
					moved = (input.Position - btnStartPos).Magnitude;
					if (moved < 5) then
						local FlatIdent_9018E = 0;
						while true do
							if (FlatIdent_9018E == 0) then
								uiVisible = not uiVisible;
								uiFrame.Visible = uiVisible;
								break;
							end
						end
					end
					break;
				end
			end
		end
		btnDragging = false;
	end
end);
UIS.InputChanged:Connect(function(input)
	if ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch)) then
		if frameDragging then
			updateFrameDrag(input);
		elseif btnDragging then
			updateBtnDrag(input);
		end
	end
end);
controlBtn.MouseEnter:Connect(function()
	controlBtn.BackgroundColor3 = Color3.fromRGB(90, 170, 255);
end);
controlBtn.MouseLeave:Connect(function()
	controlBtn.BackgroundColor3 = Color3.fromRGB(70, 145, 255);
end);
local rainbowColors = {Color3.fromRGB(255, 100, 100),Color3.fromRGB(255, 180, 100),Color3.fromRGB(255, 255, 100),Color3.fromRGB(180, 255, 100),Color3.fromRGB(100, 220, 255),Color3.fromRGB(180, 100, 255),Color3.fromRGB(255, 100, 220)};
local colorIndex = 1;
RunService.RenderStepped:Connect(function(delta)
	local FlatIdent_56394 = 0;
	local color1;
	local color2;
	local t;
	while true do
		if (FlatIdent_56394 == 1) then
			color2 = rainbowColors[((math.floor(colorIndex) + 1) % #rainbowColors) + 1];
			t = colorIndex % 1;
			FlatIdent_56394 = 2;
		end
		if (2 == FlatIdent_56394) then
			rainbowText.TextColor3 = color1:Lerp(color2, t);
			break;
		end
		if (FlatIdent_56394 == 0) then
			colorIndex = (colorIndex + (delta * 2)) % #rainbowColors;
			color1 = rainbowColors[math.floor(colorIndex) + 1];
			FlatIdent_56394 = 1;
		end
	end
end);
print("XDG-HOB UI 创建完成");