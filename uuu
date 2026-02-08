--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	local FlatIdent_95CAC = 0;
	while true do
		if (FlatIdent_95CAC == 0) then
			x = x % P;
			return (P - 1) - x;
		end
	end
end;
bit32.band = function(x, y)
	local FlatIdent_76979 = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_76979 == 0) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_76979 = 1;
		end
		if (FlatIdent_76979 == 3) then
			for i = 1, N do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 2) then
					r = r + p;
				end
				p = 2 * p;
			end
			return r;
		end
		if (FlatIdent_76979 == 2) then
			r = 0;
			p = 1;
			FlatIdent_76979 = 3;
		end
		if (FlatIdent_76979 == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % P, y % P;
			FlatIdent_76979 = 2;
		end
	end
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local FlatIdent_2FBEB = 0;
		local a;
		local b;
		while true do
			if (FlatIdent_2FBEB == 1) then
				if ((a + b) >= 1) then
					r = r + p;
				end
				p = 2 * p;
				break;
			end
			if (FlatIdent_2FBEB == 0) then
				a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				FlatIdent_2FBEB = 1;
			end
		end
	end
	return r;
end;
bit32.bxor = function(x, y)
	local FlatIdent_63487 = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_63487 == 1) then
			p = 1;
			for i = 1, N do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 1) then
					r = r + p;
				end
				p = 2 * p;
			end
			FlatIdent_63487 = 2;
		end
		if (FlatIdent_63487 == 0) then
			x, y = x % P, y % P;
			r = 0;
			FlatIdent_63487 = 1;
		end
		if (FlatIdent_63487 == 2) then
			return r;
		end
	end
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	local FlatIdent_31A5A = 0;
	while true do
		if (FlatIdent_31A5A == 1) then
			if (s_amount > 0) then
				return math.floor(x * (2 ^ -s_amount));
			else
				return (x * (2 ^ -s_amount)) % P;
			end
			break;
		end
		if (FlatIdent_31A5A == 0) then
			if (math.abs(s_amount) >= N) then
				return 0;
			end
			x = x % P;
			FlatIdent_31A5A = 1;
		end
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local FlatIdent_31905 = 0;
		local add;
		while true do
			if (FlatIdent_31905 == 1) then
				return math.floor(x * (2 ^ -s_amount)) + add;
			end
			if (0 == FlatIdent_31905) then
				add = 0;
				if (x >= (P / 2)) then
					add = P - (2 ^ (N - s_amount));
				end
				FlatIdent_31905 = 1;
			end
		end
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local v0 = game:GetService("Players");
local v1 = v0.LocalPlayer;
local v2 = game:GetService("StarterGui");
local v3 = game:GetService("UserInputService");
local v4 = game:GetService("RunService");
v2:SetCore("SendNotification", {Title="XDG-HOB",Text="欢迎使用XDG-HOB",Duration=(11 - 6)});
print("欢迎使用XDG-HOB");
task.spawn(function()
	local FlatIdent_61B23 = 0;
	local v173;
	local v174;
	while true do
		if (FlatIdent_61B23 == 0) then
			v173 = 0 + 0;
			v174 = nil;
			FlatIdent_61B23 = 1;
		end
		if (FlatIdent_61B23 == 1) then
			while true do
				if (v173 == 1) then
					if v174 then
						v2:SetCore("SendNotification", {Title="XDG-HOB",Text="作者QQ已复制到剪贴板: 361097232",Duration=(268 - (100 + 163)),Icon="rbxassetid://4483345998"});
					end
					break;
				end
				if (v173 == (0 - 0)) then
					local FlatIdent_27957 = 0;
					while true do
						if (FlatIdent_27957 == 1) then
							v173 = 1;
							break;
						end
						if (0 == FlatIdent_27957) then
							task.wait(1228 - (322 + 905));
							v174 = pcall(function()
								setclipboard("作者QQ361097232");
							end);
							FlatIdent_27957 = 1;
						end
					end
				end
			end
			break;
		end
	end
end);
task.wait(611.5 - (602 + 9));
local function v5()
	local FlatIdent_8F59B = 0;
	local v175;
	local v176;
	while true do
		if (FlatIdent_8F59B == 0) then
			v175 = 0;
			v176 = nil;
			FlatIdent_8F59B = 1;
		end
		if (FlatIdent_8F59B == 1) then
			while true do
				local FlatIdent_8CEDF = 0;
				local v840;
				while true do
					if (FlatIdent_8CEDF == 0) then
						v840 = 1189 - (449 + 740);
						while true do
							if (v840 == (872 - (826 + 46))) then
								if (v175 == 0) then
									local FlatIdent_17196 = 0;
									local v1166;
									while true do
										if (FlatIdent_17196 == 0) then
											v1166 = 947 - (245 + 702);
											while true do
												if (v1166 == (0 - 0)) then
													local FlatIdent_E0D0 = 0;
													while true do
														if (FlatIdent_E0D0 == 0) then
															v176 = {["Synapse X"]=function()
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
															for v1403, v1404 in pairs(v176) do
																local FlatIdent_3EEE1 = 0;
																local v1405;
																local v1406;
																local v1407;
																while true do
																	if (FlatIdent_3EEE1 == 0) then
																		v1405 = 0;
																		v1406 = nil;
																		FlatIdent_3EEE1 = 1;
																	end
																	if (FlatIdent_3EEE1 == 1) then
																		v1407 = nil;
																		while true do
																			if ((0 + 0) == v1405) then
																				v1406, v1407 = pcall(v1404);
																				if (v1406 and v1407) then
																					return v1403;
																				end
																				break;
																			end
																		end
																		break;
																	end
																end
															end
															FlatIdent_E0D0 = 1;
														end
														if (FlatIdent_E0D0 == 1) then
															v1166 = 1899 - (260 + 1638);
															break;
														end
													end
												end
												if (v1166 == 1) then
													v175 = 441 - (382 + 58);
													break;
												end
											end
											break;
										end
									end
								end
								if (v175 == 1) then
									return "忍者注入器";
								end
								break;
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end
local v6 = v5();
local function v7()
	local FlatIdent_494DF = 0;
	local v177;
	local v178;
	local v179;
	local v180;
	local v181;
	while true do
		if (FlatIdent_494DF == 2) then
			v181 = nil;
			while true do
				local FlatIdent_64E40 = 0;
				while true do
					if (FlatIdent_64E40 == 0) then
						if (v177 == 0) then
							local FlatIdent_207CC = 0;
							while true do
								if (FlatIdent_207CC == 1) then
									v177 = 1 + 0;
									break;
								end
								if (FlatIdent_207CC == 0) then
									v178 = os.date("!*t");
									v179 = os.time(v178);
									FlatIdent_207CC = 1;
								end
							end
						end
						if (v177 == (3 - 1)) then
							return string.format("%04d年%02d月%02d日 %02d:%02d:%02d", v181.year, v181.month, v181.day, v181.hour, v181.min, v181.sec);
						end
						FlatIdent_64E40 = 1;
					end
					if (FlatIdent_64E40 == 1) then
						if ((2 - 1) == v177) then
							local FlatIdent_AC2F = 0;
							while true do
								if (FlatIdent_AC2F == 0) then
									v180 = 8 * 3600;
									v181 = os.date("*t", v179 + v180);
									FlatIdent_AC2F = 1;
								end
								if (FlatIdent_AC2F == 1) then
									v177 = 2;
									break;
								end
							end
						end
						break;
					end
				end
			end
			break;
		end
		if (FlatIdent_494DF == 1) then
			v179 = nil;
			v180 = nil;
			FlatIdent_494DF = 2;
		end
		if (FlatIdent_494DF == 0) then
			v177 = 0 - 0;
			v178 = nil;
			FlatIdent_494DF = 1;
		end
	end
end
local v8 = {};
do
	local FlatIdent_28F3E = 0;
	local v182;
	local v183;
	local v184;
	local v185;
	local v186;
	local v187;
	local v188;
	local v189;
	local v190;
	local v191;
	local v192;
	local v193;
	while true do
		if (FlatIdent_28F3E == 2) then
			v190 = nil;
			v191 = nil;
			v192 = nil;
			v193 = nil;
			FlatIdent_28F3E = 3;
		end
		if (FlatIdent_28F3E == 3) then
			while true do
				if (v182 == (1 - 0)) then
					local FlatIdent_47ABB = 0;
					while true do
						if (FlatIdent_47ABB == 0) then
							v187 = v186;
							v188 = false;
							FlatIdent_47ABB = 1;
						end
						if (2 == FlatIdent_47ABB) then
							v182 = 4 - 2;
							break;
						end
						if (FlatIdent_47ABB == 1) then
							v189 = nil;
							v190 = nil;
							FlatIdent_47ABB = 2;
						end
					end
				end
				if (3 == v182) then
					function v192()
						local v1133 = 0 + 0;
						while true do
							if (v1133 == (1690 - (1121 + 569))) then
								if v189 then
									v189:Disconnect();
								end
								v189 = game:GetService("RunService").Heartbeat:Connect(function()
									if (v185 and v185.Parent) then
										local FlatIdent_6A091 = 0;
										local v1408;
										local v1409;
										local v1410;
										while true do
											if (1 == FlatIdent_6A091) then
												v1410 = nil;
												while true do
													if (v1408 == (684 - (483 + 200))) then
														if (math.abs(v1409 - v1410) > (1463.1 - (1404 + 59))) then
															local FlatIdent_581C8 = 0;
															local v1470;
															local v1471;
															while true do
																if (FlatIdent_581C8 == 1) then
																	while true do
																		if (v1470 == (0 - 0)) then
																			v1471 = math.sign(v1410 - v1409) * math.min(math.abs(v1410 - v1409), 767 - (468 + 297));
																			v185.WalkSpeed = v1409 + v1471;
																			break;
																		end
																	end
																	break;
																end
																if (FlatIdent_581C8 == 0) then
																	v1470 = 0 - 0;
																	v1471 = nil;
																	FlatIdent_581C8 = 1;
																end
															end
														end
														break;
													end
													if (v1408 == (562 - (334 + 228))) then
														local FlatIdent_32B97 = 0;
														while true do
															if (FlatIdent_32B97 == 0) then
																v1409 = v185.WalkSpeed;
																v1410 = v190();
																FlatIdent_32B97 = 1;
															end
															if (FlatIdent_32B97 == 1) then
																v1408 = 3 - 2;
																break;
															end
														end
													end
												end
												break;
											end
											if (FlatIdent_6A091 == 0) then
												v1408 = 214 - (22 + 192);
												v1409 = nil;
												FlatIdent_6A091 = 1;
											end
										end
									end
								end);
								break;
							end
						end
					end
					v193 = nil;
					function v193()
						v185:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
							if (v185.WalkSpeed ~= v190()) then
								local FlatIdent_580CB = 0;
								local v1299;
								local v1300;
								while true do
									if (FlatIdent_580CB == 1) then
										while true do
											if (v1299 == (0 - 0)) then
												v1300 = 0 + 0;
												while true do
													if (0 == v1300) then
														task.wait(math.random(241 - (141 + 95), 15) / (99 + 1));
														v185.WalkSpeed = v190();
														break;
													end
												end
												break;
											end
										end
										break;
									end
									if (FlatIdent_580CB == 0) then
										v1299 = 0 - 0;
										v1300 = nil;
										FlatIdent_580CB = 1;
									end
								end
							end
						end);
					end
					v183.CharacterAdded:Connect(function(v1134)
						local v1135 = 0 - 0;
						while true do
							if (v1135 == (0 - 0)) then
								local FlatIdent_1013A = 0;
								while true do
									if (0 == FlatIdent_1013A) then
										task.wait(0.5 + 0);
										v184 = v1134;
										FlatIdent_1013A = 1;
									end
									if (FlatIdent_1013A == 1) then
										v1135 = 2 - 1;
										break;
									end
								end
							end
							if (v1135 == (1 + 0)) then
								local FlatIdent_70B9A = 0;
								while true do
									if (FlatIdent_70B9A == 0) then
										v185 = v184:WaitForChild("Humanoid");
										v193();
										FlatIdent_70B9A = 1;
									end
									if (FlatIdent_70B9A == 1) then
										v1135 = 2 + 0;
										break;
									end
								end
							end
							if ((2 - 0) == v1135) then
								v192();
								v185.WalkSpeed = v190();
								break;
							end
						end
					end);
					v182 = 3 + 1;
				end
				if (v182 == 2) then
					function UpdateLogList()
						return v187;
					end
					v191 = nil;
					function v191(v1136)
						local FlatIdent_32BB2 = 0;
						local v1137;
						local v1138;
						while true do
							if (FlatIdent_32BB2 == 0) then
								v1137 = 163 - (92 + 71);
								v1138 = nil;
								FlatIdent_32BB2 = 1;
							end
							if (FlatIdent_32BB2 == 1) then
								while true do
									if (v1137 == (0 + 0)) then
										v1138 = 0 - 0;
										while true do
											if (v1138 == (765 - (574 + 191))) then
												v187 = v1136;
												if not v188 then
													local FlatIdent_5E109 = 0;
													while true do
														if (FlatIdent_5E109 == 0) then
															v188 = true;
															task.spawn(function()
																local FlatIdent_2DA99 = 0;
																local v1452;
																while true do
																	if (FlatIdent_2DA99 == 1) then
																		if (v185 and v185.Parent) then
																			v185.WalkSpeed = v187;
																		end
																		v188 = false;
																		break;
																	end
																	if (FlatIdent_2DA99 == 0) then
																		v1452 = math.random(9 + 1, 30) / (250 - 150);
																		task.wait(v1452);
																		FlatIdent_2DA99 = 1;
																	end
																end
															end);
															break;
														end
													end
												end
												break;
											end
										end
										break;
									end
								end
								break;
							end
						end
					end
					v192 = nil;
					v182 = 2 + 1;
				end
				if (v182 == (853 - (254 + 595))) then
					v193();
					v192();
					v8.GetRealSpeed = v190;
					v8.SetRealSpeed = v191;
					break;
				end
				if (v182 == (126 - (55 + 71))) then
					v183 = game:GetService("Players").LocalPlayer;
					v184 = v183.Character or v183.CharacterAdded:Wait();
					v185 = v184:WaitForChild("Humanoid");
					v186 = v185.WalkSpeed;
					v182 = 1;
				end
			end
			break;
		end
		if (FlatIdent_28F3E == 1) then
			v186 = nil;
			v187 = nil;
			v188 = nil;
			v189 = nil;
			FlatIdent_28F3E = 2;
		end
		if (0 == FlatIdent_28F3E) then
			v182 = 1205 - (902 + 303);
			v183 = nil;
			v184 = nil;
			v185 = nil;
			FlatIdent_28F3E = 1;
		end
	end
end
local v9 = Instance.new("ScreenGui");
v9.Name = "XDGHOB_UI";
v9.ResetOnSpawn = false;
v9.Parent = v1:WaitForChild("PlayerGui");
local v13 = Instance.new("Frame");
v13.Name = "MainUI";
v13.Size = UDim2.new(0 - 0, 2170 - (573 + 1217), 0 - 0, 19 + 221);
local v16 = workspace.CurrentCamera.ViewportSize;
local v17 = v13.AbsoluteSize;
local v18 = (v16.X - v17.X) / (2 - 0);
local v19 = (v16.Y - v17.Y) / 2;
v13.Position = UDim2.new(939 - (714 + 225), v18, 0 - 0, v19);
v13.BackgroundColor3 = Color3.fromRGB(28, 28, 48 - 13);
v13.BackgroundTransparency = 0.1 + 0;
v13.BorderSizePixel = 0 - 0;
v13.Active = true;
v13.Selectable = true;
v13.Parent = v9;
local v27 = Instance.new("UIStroke");
v27.Name = "OuterStroke";
v27.Thickness = 809 - (118 + 688);
v27.Color = Color3.fromRGB(118 - (25 + 23), 29 + 116, 255);
v27.Transparency = 1886.1 - (927 + 959);
v27.Parent = v13;
local v33 = Instance.new("UIStroke");
v33.Name = "InnerStroke";
v33.Thickness = 1;
v33.Color = Color3.fromRGB(404 - 284, 932 - (16 + 716), 255);
v33.Transparency = 0.3;
v33.Parent = v13;
local v39 = Instance.new("Frame");
v39.Name = "CornerGlow";
v39.Size = UDim2.new(1 - 0, 103 - (11 + 86), 2 - 1, 291 - (175 + 110));
v39.Position = UDim2.new(0, -(6 - 3), 0 - 0, -(1799 - (503 + 1293)));
v39.BackgroundColor3 = Color3.fromRGB(70, 404 - 259, 255);
v39.BackgroundTransparency = 0.95 + 0;
v39.BorderSizePixel = 0;
v39.ZIndex = -1;
v39.Parent = v13;
local v48 = Instance.new("Frame");
v48.Name = "TitleBar";
v48.Size = UDim2.new(1, 1061 - (810 + 251), 0, 40);
v48.Position = UDim2.new(0 + 0, 0, 0 + 0, 0);
v48.BackgroundColor3 = Color3.fromRGB(40, 37 + 3, 581 - (43 + 490));
v48.BorderSizePixel = 733 - (711 + 22);
v48.Active = true;
v48.Selectable = true;
v48.Parent = v13;
local v57 = Instance.new("UIGradient");
v57.Color = ColorSequence.new({ColorSequenceKeypoint.new(859 - (240 + 619), Color3.fromRGB(70, 145, 255)),ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 44 + 136, 405 - 150))});
v57.Rotation = 90;
v57.Parent = v48;
local v61 = Instance.new("TextLabel");
v61.Name = "RainbowTitle";
v61.Size = UDim2.new(1 + 0, 0, 1745 - (1344 + 400), 405 - (255 + 150));
v61.Position = UDim2.new(0 + 0, 0 + 0, 0 - 0, 0 - 0);
v61.BackgroundTransparency = 1;
v61.Text = "✨ XDG-HOB ✨";
v61.TextColor3 = Color3.new(1740 - (404 + 1335), 1, 407 - (183 + 223));
v61.Font = Enum.Font.GothamBlack;
v61.TextSize = 24 - 4;
v61.TextStrokeTransparency = 0.7;
v61.TextStrokeColor3 = Color3.fromRGB(0 + 0, 0, 0);
v61.Parent = v48;
local v74 = Instance.new("TextButton");
v74.Name = "ControlButton";
v74.Size = UDim2.new(0, 36 + 64, 337 - (10 + 327), 26 + 10);
v74.Position = UDim2.new(0, 438 - (118 + 220), 0 + 0, 549 - (108 + 341));
v74.BackgroundColor3 = Color3.fromRGB(32 + 38, 145, 255);
v74.Text = "XDG-HOB";
v74.TextColor3 = Color3.new(4 - 3, 1494 - (711 + 782), 1 - 0);
v74.Font = Enum.Font.GothamBlack;
v74.TextSize = 483 - (270 + 199);
v74.TextStrokeTransparency = 0.6 + 0;
v74.TextStrokeColor3 = Color3.fromRGB(1819 - (580 + 1239), 0, 0 - 0);
v74.Active = true;
v74.Selectable = true;
v74.Parent = v9;
local v88 = Instance.new("UIStroke");
v88.Name = "BtnOuterStroke";
v88.Thickness = 2 + 0;
v88.Color = Color3.fromRGB(8 + 192, 96 + 124, 255);
v88.Transparency = 0.2 - 0;
v88.Parent = v74;
local v94 = Instance.new("UIStroke");
v94.Name = "BtnInnerStroke";
v94.Thickness = 1;
v94.Color = Color3.fromRGB(255, 159 + 96, 1422 - (645 + 522));
v94.Transparency = 1790.4 - (1010 + 780);
v94.Parent = v74;
local v100 = Instance.new("Frame");
v100.Name = "BtnGlow";
v100.Size = UDim2.new(1, 8 + 0, 4 - 3, 8);
v100.Position = UDim2.new(0 - 0, -4, 0, -4);
v100.BackgroundColor3 = Color3.fromRGB(70, 1981 - (1045 + 791), 255);
v100.BackgroundTransparency = 0.9 - 0;
v100.BorderSizePixel = 0 - 0;
v100.ZIndex = -1;
v100.Parent = v74;
local v109 = Instance.new("Frame");
v109.Name = "LeftPanel";
v109.Size = UDim2.new(505 - (351 + 154), 110, 1, -40);
v109.Position = UDim2.new(1574 - (1281 + 293), 266 - (28 + 238), 0 - 0, 1599 - (1381 + 178));
v109.BackgroundColor3 = Color3.fromRGB(33 + 2, 35, 34 + 8);
v109.BorderSizePixel = 0;
v109.Parent = v13;
local v116 = Instance.new("UIStroke");
v116.Name = "LeftPanelStroke";
v116.Thickness = 1 + 0;
v116.Color = Color3.fromRGB(60, 60, 241 - 171);
v116.Transparency = 0.5 + 0;
v116.Parent = v109;
local v122 = Instance.new("ScrollingFrame");
v122.Name = "CategoryScroll";
v122.Size = UDim2.new(471 - (381 + 89), 0 + 0, 1 + 0, 0 - 0);
v122.BackgroundTransparency = 1;
v122.ScrollBarThickness = 1162 - (1074 + 82);
v122.ScrollBarImageColor3 = Color3.fromRGB(100, 219 - 119, 1894 - (214 + 1570));
v122.CanvasSize = UDim2.new(1455 - (990 + 465), 0, 0 + 0, 70 + 90);
v122.Parent = v109;
local v130 = Instance.new("UIListLayout");
v130.Parent = v122;
v130.Padding = UDim.new(0, 8 + 0);
local v133 = {"实用区","功能区","信息区","其他脚本区"};
local v134 = 1;
local v135 = {};
local v136 = Instance.new("Frame");
v136.Name = "ContentFrame";
v136.Size = UDim2.new(627 - (512 + 114), -(286 - 176), 1 - 0, -40);
v136.Position = UDim2.new(0 - 0, 110, 0 + 0, 40);
v136.BackgroundColor3 = Color3.fromRGB(32, 6 + 26, 35 + 5);
v136.BorderSizePixel = 0;
v136.Parent = v13;
local v143 = Instance.new("UIStroke");
v143.Name = "ContentFrameStroke";
v143.Thickness = 3 - 2;
v143.Color = Color3.fromRGB(2054 - (109 + 1885), 60, 1539 - (1269 + 200));
v143.Transparency = 0.5 - 0;
v143.Parent = v136;
local v149 = {Enabled=false,Connection=nil,Speed=(841 - (98 + 717)),LastUpdate=0,NoClipParts={},CharacterAddedConnection=nil,JumpConnection=nil};
v149.Toggle = function(v194)
	local FlatIdent_912A7 = 0;
	local v195;
	local v196;
	while true do
		if (FlatIdent_912A7 == 0) then
			v195 = 826 - (802 + 24);
			v196 = nil;
			FlatIdent_912A7 = 1;
		end
		if (FlatIdent_912A7 == 1) then
			while true do
				if ((0 - 0) == v195) then
					v196 = 0 - 0;
					while true do
						local FlatIdent_5724B = 0;
						local v1139;
						while true do
							if (0 == FlatIdent_5724B) then
								v1139 = 0 + 0;
								while true do
									if (v1139 == 0) then
										if (0 == v196) then
											local FlatIdent_8E5B4 = 0;
											while true do
												if (FlatIdent_8E5B4 == 1) then
													v196 = 1;
													break;
												end
												if (FlatIdent_8E5B4 == 0) then
													v194.Enabled = not v194.Enabled;
													if v194.Enabled then
														v194:Start();
													else
														v194:Stop();
													end
													FlatIdent_8E5B4 = 1;
												end
											end
										end
										if (v196 == (1 + 0)) then
											return v194.Enabled;
										end
										break;
									end
								end
								break;
							end
						end
					end
					break;
				end
			end
			break;
		end
	end
end;
v149.Start = function(v197)
	local FlatIdent_7063 = 0;
	local v198;
	while true do
		if (FlatIdent_7063 == 0) then
			v198 = game:GetService("Players").LocalPlayer;
			v197.NoClipParts = {};
			FlatIdent_7063 = 1;
		end
		if (FlatIdent_7063 == 2) then
			v197.Connection = game:GetService("RunService").Heartbeat:Connect(function(v842)
				if (not v197.Enabled or ((tick() - v197.LastUpdate) < (0.05 + 0))) then
					return;
				end
				v197.LastUpdate = tick();
				local v844 = v198.Character;
				if not v844 then
					return;
				end
				local v845 = v844:FindFirstChild("HumanoidRootPart");
				if not v845 then
					return;
				end
				local v846 = game:GetService("UserInputService");
				local v847 = Vector3.zero;
				local v848 = v845.CFrame;
				if v846:IsKeyDown(Enum.KeyCode.W) then
					v847 = v847 + v848.LookVector;
				end
				if v846:IsKeyDown(Enum.KeyCode.S) then
					v847 = v847 - v848.LookVector;
				end
				if v846:IsKeyDown(Enum.KeyCode.A) then
					v847 = v847 - v848.RightVector;
				end
				if v846:IsKeyDown(Enum.KeyCode.D) then
					v847 = v847 + v848.RightVector;
				end
				if v846:IsKeyDown(Enum.KeyCode.Space) then
					v847 = v847 + Vector3.new(0 + 0, 2 - 1, 0 - 0);
				end
				if v846:IsKeyDown(Enum.KeyCode.LeftControl) then
					v847 = v847 + Vector3.new(0 + 0, -(1 + 0), 0 + 0);
				end
				if (v847.Magnitude > (0 + 0)) then
					local FlatIdent_651C5 = 0;
					local v894;
					local v895;
					while true do
						if (FlatIdent_651C5 == 0) then
							v894 = 0;
							v895 = nil;
							FlatIdent_651C5 = 1;
						end
						if (FlatIdent_651C5 == 1) then
							while true do
								if (v894 == 0) then
									v847 = v847.Unit;
									v895 = v197.Speed * (0.9 + 0 + (math.random() * 0.2));
									v894 = 1;
								end
								if (1 == v894) then
									v845.CFrame = v845.CFrame + (v847 * v895 * v842);
									break;
								end
							end
							break;
						end
					end
				end
			end);
			break;
		end
		if (FlatIdent_7063 == 1) then
			if v198.Character then
				v197:SetupCharacter(v198.Character);
			end
			v197.CharacterAddedConnection = v198.CharacterAdded:Connect(function(v841)
				v197:SetupCharacter(v841);
			end);
			FlatIdent_7063 = 2;
		end
	end
end;
v149.SetupCharacter = function(v202, v203)
	local FlatIdent_4E551 = 0;
	local v204;
	local v205;
	while true do
		if (FlatIdent_4E551 == 0) then
			v204 = 1433 - (797 + 636);
			v205 = nil;
			FlatIdent_4E551 = 1;
		end
		if (FlatIdent_4E551 == 1) then
			while true do
				if (v204 == (4 - 3)) then
					local FlatIdent_6EEC8 = 0;
					while true do
						if (0 == FlatIdent_6EEC8) then
							for v1140, v1141 in pairs(v203:GetDescendants()) do
								if v1141:IsA("BasePart") then
									local FlatIdent_2BE68 = 0;
									while true do
										if (FlatIdent_2BE68 == 0) then
											v1141.CanCollide = not v202.Enabled;
											table.insert(v202.NoClipParts, v1141);
											break;
										end
									end
								end
							end
							v203.DescendantAdded:Connect(function(v1142)
								if v1142:IsA("BasePart") then
									local FlatIdent_31077 = 0;
									local v1170;
									while true do
										if (FlatIdent_31077 == 0) then
											v1170 = 1619 - (1427 + 192);
											while true do
												if (v1170 == (0 + 0)) then
													local FlatIdent_835BC = 0;
													while true do
														if (FlatIdent_835BC == 1) then
															v1170 = 1 + 0;
															break;
														end
														if (0 == FlatIdent_835BC) then
															task.wait(0.1 - 0);
															v1142.CanCollide = not v202.Enabled;
															FlatIdent_835BC = 1;
														end
													end
												end
												if (v1170 == 1) then
													table.insert(v202.NoClipParts, v1142);
													break;
												end
											end
											break;
										end
									end
								end
							end);
							FlatIdent_6EEC8 = 1;
						end
						if (FlatIdent_6EEC8 == 1) then
							v204 = 1 + 1;
							break;
						end
					end
				end
				if (v204 == (328 - (192 + 134))) then
					v205 = v203:WaitForChild("Humanoid");
					v202.JumpConnection = v205.StateChanged:Connect(function(v1143, v1144)
						if (v1144 == Enum.HumanoidStateType.Jumping) then
							local v1171 = 1276 - (316 + 960);
							local v1172;
							while true do
								if (v1171 == 0) then
									v1172 = 0 + 0;
									while true do
										if (v1172 == (0 + 0)) then
											task.wait(0.05 + 0);
											for v1453, v1454 in pairs(v203:GetDescendants()) do
												if v1454:IsA("BasePart") then
													v1454.CanCollide = not v202.Enabled;
												end
											end
											break;
										end
									end
									break;
								end
							end
						elseif (v1144 == Enum.HumanoidStateType.Landed) then
							if not v202.Enabled then
								local v1411 = 0 - 0;
								local v1412;
								while true do
									if (v1411 == (551 - (83 + 468))) then
										v1412 = 0;
										while true do
											if (v1412 == (1806 - (1202 + 604))) then
												task.wait(0.1 - 0);
												for v1478, v1479 in pairs(v203:GetDescendants()) do
													if v1479:IsA("BasePart") then
														v1479.CanCollide = true;
													end
												end
												break;
											end
										end
										break;
									end
								end
							end
						end
					end);
					break;
				end
				if (v204 == 0) then
					local FlatIdent_5AA23 = 0;
					while true do
						if (FlatIdent_5AA23 == 0) then
							task.wait(0.2 - 0);
							if v202.JumpConnection then
								local FlatIdent_3F15E = 0;
								local v1150;
								local v1151;
								while true do
									if (FlatIdent_3F15E == 1) then
										while true do
											if (v1150 == (0 - 0)) then
												v1151 = 0;
												while true do
													if (v1151 == (325 - (45 + 280))) then
														v202.JumpConnection:Disconnect();
														v202.JumpConnection = nil;
														break;
													end
												end
												break;
											end
										end
										break;
									end
									if (FlatIdent_3F15E == 0) then
										v1150 = 0;
										v1151 = nil;
										FlatIdent_3F15E = 1;
									end
								end
							end
							FlatIdent_5AA23 = 1;
						end
						if (FlatIdent_5AA23 == 1) then
							v204 = 1 + 0;
							break;
						end
					end
				end
			end
			break;
		end
	end
end;
v149.Stop = function(v206)
	local v207 = 0 + 0;
	local v208;
	while true do
		if (v207 == (1 + 1)) then
			if v208.Character then
				for v1173, v1174 in pairs(v208.Character:GetDescendants()) do
					if v1174:IsA("BasePart") then
						v1174.CanCollide = true;
					end
				end
			end
			v206.NoClipParts = {};
			break;
		end
		if (v207 == (1 + 0)) then
			local FlatIdent_71E8F = 0;
			while true do
				if (FlatIdent_71E8F == 1) then
					v207 = 2;
					break;
				end
				if (FlatIdent_71E8F == 0) then
					if v206.JumpConnection then
						local FlatIdent_5AB84 = 0;
						local v1152;
						while true do
							if (FlatIdent_5AB84 == 0) then
								v1152 = 0 + 0;
								while true do
									if ((0 - 0) == v1152) then
										v206.JumpConnection:Disconnect();
										v206.JumpConnection = nil;
										break;
									end
								end
								break;
							end
						end
					end
					v208 = game:GetService("Players").LocalPlayer;
					FlatIdent_71E8F = 1;
				end
			end
		end
		if (v207 == (1911 - (340 + 1571))) then
			local FlatIdent_13B77 = 0;
			while true do
				if (0 == FlatIdent_13B77) then
					if v206.Connection then
						local FlatIdent_7699F = 0;
						local v1153;
						while true do
							if (FlatIdent_7699F == 0) then
								v1153 = 0 + 0;
								while true do
									if (v1153 == (1772 - (1733 + 39))) then
										v206.Connection:Disconnect();
										v206.Connection = nil;
										break;
									end
								end
								break;
							end
						end
					end
					if v206.CharacterAddedConnection then
						local FlatIdent_77529 = 0;
						local v1154;
						while true do
							if (0 == FlatIdent_77529) then
								v1154 = 0;
								while true do
									if (0 == v1154) then
										v206.CharacterAddedConnection:Disconnect();
										v206.CharacterAddedConnection = nil;
										break;
									end
								end
								break;
							end
						end
					end
					FlatIdent_13B77 = 1;
				end
				if (FlatIdent_13B77 == 1) then
					v207 = 1;
					break;
				end
			end
		end
	end
end;
local v154 = {};
do
	local v209 = 0 - 0;
	local v210;
	local v211;
	local v212;
	local v213;
	local v214;
	local v215;
	while true do
		if (v209 == (1036 - (125 + 909))) then
			v215 = nil;
			function v215()
				local FlatIdent_8A9D7 = 0;
				local v1145;
				local v1146;
				while true do
					if (FlatIdent_8A9D7 == 0) then
						v1145 = 1948 - (1096 + 852);
						v1146 = nil;
						FlatIdent_8A9D7 = 1;
					end
					if (FlatIdent_8A9D7 == 1) then
						while true do
							if ((0 + 0) == v1145) then
								v1146 = v210.Character;
								if v1146 then
									local FlatIdent_22A5C = 0;
									local v1350;
									local v1351;
									local v1352;
									local v1353;
									while true do
										if (FlatIdent_22A5C == 2) then
											while true do
												if (v1350 == (1 + 0)) then
													v1353 = nil;
													while true do
														if (v1351 == (513 - (409 + 103))) then
															for v1474, v1475 in pairs(v1352) do
																if v1475:IsA("Humanoid") then
																	local FlatIdent_2C7C4 = 0;
																	while true do
																		if (FlatIdent_2C7C4 == 0) then
																			task.wait(236.2 - (46 + 190));
																			v1475.JumpHeight = v211;
																			break;
																		end
																	end
																end
															end
															v1353 = v1146:FindFirstChildOfClass("Humanoid");
															v1351 = 2;
														end
														if (v1351 == (97 - (51 + 44))) then
															if v1353 then
																v1353.JumpHeight = v211;
															end
															break;
														end
														if (v1351 == 0) then
															local FlatIdent_6F99F = 0;
															while true do
																if (FlatIdent_6F99F == 0) then
																	task.wait(1 + 0);
																	v1352 = v1146:GetDescendants();
																	FlatIdent_6F99F = 1;
																end
																if (FlatIdent_6F99F == 1) then
																	v1351 = 1;
																	break;
																end
															end
														end
													end
													break;
												end
												if (v1350 == (1317 - (1114 + 203))) then
													local FlatIdent_8A8EC = 0;
													while true do
														if (0 == FlatIdent_8A8EC) then
															v1351 = 726 - (228 + 498);
															v1352 = nil;
															FlatIdent_8A8EC = 1;
														end
														if (FlatIdent_8A8EC == 1) then
															v1350 = 1;
															break;
														end
													end
												end
											end
											break;
										end
										if (0 == FlatIdent_22A5C) then
											v1350 = 0 - 0;
											v1351 = nil;
											FlatIdent_22A5C = 1;
										end
										if (FlatIdent_22A5C == 1) then
											v1352 = nil;
											v1353 = nil;
											FlatIdent_22A5C = 2;
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
			end
			v215();
			v209 = 1 + 2;
		end
		if (v209 == (1 + 0)) then
			local v899 = 0;
			while true do
				if (v899 == (663 - (174 + 489))) then
					v213 = nil;
					v214 = nil;
					v899 = 1;
				end
				if (1 == v899) then
					function v214()
						local FlatIdent_69D54 = 0;
						local v1303;
						while true do
							if (FlatIdent_69D54 == 0) then
								v1303 = 0;
								while true do
									if (v1303 == (0 - 0)) then
										if v212 then
											local FlatIdent_740DC = 0;
											while true do
												if (FlatIdent_740DC == 0) then
													v212:Disconnect();
													v212 = nil;
													break;
												end
											end
										end
										v212 = game:GetService("RunService").Heartbeat:Connect(function()
											local FlatIdent_1CFC3 = 0;
											local v1420;
											local v1421;
											while true do
												if (FlatIdent_1CFC3 == 0) then
													v1420 = 0;
													v1421 = nil;
													FlatIdent_1CFC3 = 1;
												end
												if (FlatIdent_1CFC3 == 1) then
													while true do
														if (v1420 == (1905 - (830 + 1075))) then
															v1421 = v210.Character;
															if v1421 then
																local FlatIdent_2DF14 = 0;
																local v1476;
																local v1477;
																while true do
																	if (FlatIdent_2DF14 == 1) then
																		while true do
																			if (v1476 == 0) then
																				v1477 = v1421:FindFirstChildOfClass("Humanoid");
																				if (v1477 and (v1477.JumpHeight ~= v211)) then
																					v1477.JumpHeight = v211;
																				end
																				break;
																			end
																		end
																		break;
																	end
																	if (0 == FlatIdent_2DF14) then
																		v1476 = 0;
																		v1477 = nil;
																		FlatIdent_2DF14 = 1;
																	end
																end
															end
															break;
														end
													end
													break;
												end
											end
										end);
										break;
									end
								end
								break;
							end
						end
					end
					v209 = 2;
					break;
				end
			end
		end
		if (v209 == (528 - (303 + 221))) then
			v154.SetJumpHeight = function(v1147)
				local FlatIdent_61F8E = 0;
				while true do
					if (FlatIdent_61F8E == 0) then
						if ((v1147 >= (1276.2 - (231 + 1038))) and (v1147 <= (417 + 83))) then
							local v1175 = 1162 - (171 + 991);
							local v1176;
							while true do
								if ((0 - 0) == v1175) then
									local FlatIdent_974E = 0;
									while true do
										if (FlatIdent_974E == 0) then
											v211 = v1147;
											v214();
											FlatIdent_974E = 1;
										end
										if (FlatIdent_974E == 1) then
											v1175 = 1;
											break;
										end
									end
								end
								if (v1175 == (5 - 3)) then
									return true;
								end
								if (v1175 == (2 - 1)) then
									local FlatIdent_129E6 = 0;
									while true do
										if (0 == FlatIdent_129E6) then
											v1176 = v210.Character;
											if v1176 then
												local FlatIdent_91A09 = 0;
												local v1422;
												local v1423;
												local v1424;
												local v1425;
												while true do
													if (FlatIdent_91A09 == 1) then
														v1424 = nil;
														v1425 = nil;
														FlatIdent_91A09 = 2;
													end
													if (FlatIdent_91A09 == 0) then
														v1422 = 0 + 0;
														v1423 = nil;
														FlatIdent_91A09 = 1;
													end
													if (FlatIdent_91A09 == 2) then
														while true do
															if (v1422 == (0 - 0)) then
																local FlatIdent_386FF = 0;
																while true do
																	if (1 == FlatIdent_386FF) then
																		v1422 = 1 - 0;
																		break;
																	end
																	if (FlatIdent_386FF == 0) then
																		v1423 = 0 - 0;
																		v1424 = nil;
																		FlatIdent_386FF = 1;
																	end
																end
															end
															if (v1422 == (3 - 2)) then
																v1425 = nil;
																while true do
																	if (v1423 == (1249 - (111 + 1137))) then
																		v1425 = v1176:FindFirstChildOfClass("Humanoid");
																		if v1425 then
																			v1425.JumpHeight = v211;
																		end
																		break;
																	end
																	if (v1423 == (158 - (91 + 67))) then
																		local FlatIdent_1B418 = 0;
																		while true do
																			if (FlatIdent_1B418 == 0) then
																				v1424 = v1176:GetDescendants();
																				for v1486, v1487 in pairs(v1424) do
																					if v1487:IsA("Humanoid") then
																						v1487.JumpHeight = v211;
																					end
																				end
																				FlatIdent_1B418 = 1;
																			end
																			if (FlatIdent_1B418 == 1) then
																				v1423 = 2 - 1;
																				break;
																			end
																		end
																	end
																end
																break;
															end
														end
														break;
													end
												end
											end
											FlatIdent_129E6 = 1;
										end
										if (FlatIdent_129E6 == 1) then
											v1175 = 2;
											break;
										end
									end
								end
							end
						end
						return false;
					end
				end
			end;
			v154.Cleanup = function()
				local FlatIdent_1F138 = 0;
				local v1148;
				while true do
					if (FlatIdent_1F138 == 0) then
						if v212 then
							local FlatIdent_2B4B0 = 0;
							while true do
								if (FlatIdent_2B4B0 == 0) then
									v212:Disconnect();
									v212 = nil;
									break;
								end
							end
						end
						if v213 then
							local FlatIdent_1077D = 0;
							local v1177;
							local v1178;
							while true do
								if (0 == FlatIdent_1077D) then
									v1177 = 0;
									v1178 = nil;
									FlatIdent_1077D = 1;
								end
								if (1 == FlatIdent_1077D) then
									while true do
										if (v1177 == (0 + 0)) then
											v1178 = 0;
											while true do
												if (v1178 == (523 - (423 + 100))) then
													v213:Disconnect();
													v213 = nil;
													break;
												end
											end
											break;
										end
									end
									break;
								end
							end
						end
						FlatIdent_1F138 = 1;
					end
					if (FlatIdent_1F138 == 1) then
						v1148 = v210.Character;
						if v1148 then
							local FlatIdent_2E3CE = 0;
							local v1179;
							local v1180;
							while true do
								if (FlatIdent_2E3CE == 0) then
									v1179 = 0;
									v1180 = nil;
									FlatIdent_2E3CE = 1;
								end
								if (FlatIdent_2E3CE == 1) then
									while true do
										if (v1179 == (0 + 0)) then
											v1180 = v1148:GetDescendants();
											for v1413, v1414 in pairs(v1180) do
												if v1414:IsA("Humanoid") then
													v1414.JumpHeight = 19.2 - 12;
												end
											end
											break;
										end
									end
									break;
								end
							end
						end
						break;
					end
				end
			end;
			break;
		end
		if (v209 == (0 + 0)) then
			local FlatIdent_98E39 = 0;
			while true do
				if (0 == FlatIdent_98E39) then
					v210 = game:GetService("Players").LocalPlayer;
					v211 = 7.2;
					FlatIdent_98E39 = 1;
				end
				if (FlatIdent_98E39 == 1) then
					v212 = nil;
					v209 = 772 - (326 + 445);
					break;
				end
			end
		end
		if (v209 == 3) then
			local v903 = 0 - 0;
			while true do
				if (v903 == 1) then
					v154.GetJumpHeight = function()
						return v211;
					end;
					v209 = 8 - 4;
					break;
				end
				if (v903 == (0 - 0)) then
					local FlatIdent_D07E = 0;
					while true do
						if (FlatIdent_D07E == 0) then
							if v213 then
								v213:Disconnect();
							end
							v213 = v210.CharacterAdded:Connect(function(v1304)
								local FlatIdent_8C1D5 = 0;
								local v1305;
								local v1306;
								while true do
									if (FlatIdent_8C1D5 == 1) then
										while true do
											if (v1305 == 0) then
												v1306 = 881 - (614 + 267);
												while true do
													if (v1306 == (33 - (19 + 13))) then
														v214();
														break;
													end
													if (v1306 == (0 - 0)) then
														local FlatIdent_16F8D = 0;
														while true do
															if (FlatIdent_16F8D == 1) then
																v1306 = 2 - 1;
																break;
															end
															if (FlatIdent_16F8D == 0) then
																task.wait(2 - 1);
																v215();
																FlatIdent_16F8D = 1;
															end
														end
													end
												end
												break;
											end
										end
										break;
									end
									if (FlatIdent_8C1D5 == 0) then
										v1305 = 711 - (530 + 181);
										v1306 = nil;
										FlatIdent_8C1D5 = 1;
									end
								end
							end);
							FlatIdent_D07E = 1;
						end
						if (1 == FlatIdent_D07E) then
							v903 = 1 + 0;
							break;
						end
					end
				end
			end
		end
	end
end
local function v155()
	local v216 = Instance.new("Frame");
	v216.Name = "UtilityContainer";
	v216.Size = UDim2.new(1 - 0, 0, 1, 0 - 0);
	v216.BackgroundTransparency = 1;
	v216.Visible = true;
	v216.Parent = v136;
	local v222 = Instance.new("ScrollingFrame");
	v222.Name = "UtilityScroll";
	v222.Size = UDim2.new(1, -(1832 - (1293 + 519)), 1, -(40 - 20));
	v222.Position = UDim2.new(0, 26 - 16, 0 - 0, 43 - 33);
	v222.BackgroundTransparency = 1;
	v222.ScrollBarThickness = 13 - 7;
	v222.ScrollBarImageColor3 = Color3.fromRGB(53 + 47, 21 + 79, 255 - 145);
	v222.CanvasSize = UDim2.new(0, 0 + 0, 0 + 0, 282 + 168);
	v222.Parent = v216;
	local v231 = Instance.new("UIListLayout");
	v231.Parent = v222;
	v231.Padding = UDim.new(1096 - (709 + 387), 12);
	v231.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local v236 = Instance.new("TextButton");
	v236.Name = "AntiDetectFlight";
	v236.Size = UDim2.new(1858.9 - (673 + 1185), 0, 0 - 0, 128 - 88);
	v236.Text = "防检测飞行";
	v236.BackgroundColor3 = Color3.fromRGB(98 - 38, 43 + 17, 53 + 17);
	v236.TextColor3 = Color3.new(1, 1 - 0, 1);
	v236.Font = Enum.Font.GothamSemibold;
	v236.TextSize = 15;
	v236.TextStrokeTransparency = 0.5;
	v236.TextStrokeColor3 = Color3.fromRGB(0, 0 + 0, 0 - 0);
	v236.AutoButtonColor = false;
	local v248 = Instance.new("UIStroke");
	v248.Thickness = 2;
	v248.Color = Color3.fromRGB(157 - 77, 1960 - (446 + 1434), 1373 - (1040 + 243));
	v248.Transparency = 0.3 - 0;
	v248.Parent = v236;
	local v253 = Instance.new("UICorner");
	v253.CornerRadius = UDim.new(1847 - (559 + 1288), 1939 - (609 + 1322));
	v253.Parent = v236;
	local v256 = Color3.fromRGB(60, 514 - (13 + 441), 261 - 191);
	local v257 = false;
	v236.MouseEnter:Connect(function()
		if not v257 then
			local FlatIdent_8EF6C = 0;
			local v904;
			while true do
				if (0 == FlatIdent_8EF6C) then
					v904 = 0 - 0;
					while true do
						if (v904 == 0) then
							v236.BackgroundColor3 = Color3.fromRGB(348 - 278, 70, 3 + 77);
							v248.Color = Color3.fromRGB(90, 326 - 236, 36 + 64);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v236.MouseLeave:Connect(function()
		if not v257 then
			local v905 = 0;
			local v906;
			while true do
				if (v905 == 0) then
					v906 = 0 + 0;
					while true do
						if (v906 == 0) then
							v236.BackgroundColor3 = v256;
							v248.Color = Color3.fromRGB(80, 80, 267 - 177);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v236.MouseButton1Click:Connect(function()
		local v849 = 0;
		while true do
			if (v849 == (0 + 0)) then
				v257 = not v257;
				if v257 then
					local FlatIdent_8DAB1 = 0;
					local v1187;
					while true do
						if (FlatIdent_8DAB1 == 0) then
							v236.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
							v248.Color = Color3.fromRGB(220 - 100, 133 + 67, 142 + 113);
							FlatIdent_8DAB1 = 1;
						end
						if (FlatIdent_8DAB1 == 2) then
							if v1187 then
								v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测飞行已启用",Duration=(3 + 0),Icon="rbxassetid://4483345998"});
							else
								local v1321 = 0 + 0;
								while true do
									if (v1321 == (2 + 0)) then
										v236.Text = "防检测飞行";
										break;
									end
									if (v1321 == (433 - (153 + 280))) then
										local FlatIdent_32708 = 0;
										while true do
											if (FlatIdent_32708 == 1) then
												v1321 = 1 + 0;
												break;
											end
											if (FlatIdent_32708 == 0) then
												v2:SetCore("SendNotification", {Title="错误",Text="加载飞行脚本失败",Duration=(14 - 9),Icon="rbxassetid://4483345998"});
												v257 = false;
												FlatIdent_32708 = 1;
											end
										end
									end
									if ((1 + 0) == v1321) then
										local FlatIdent_6A6C4 = 0;
										while true do
											if (FlatIdent_6A6C4 == 0) then
												v236.BackgroundColor3 = v256;
												v248.Color = Color3.fromRGB(42 + 38, 80, 82 + 8);
												FlatIdent_6A6C4 = 1;
											end
											if (FlatIdent_6A6C4 == 1) then
												v1321 = 2 + 0;
												break;
											end
										end
									end
								end
							end
							break;
						end
						if (FlatIdent_8DAB1 == 1) then
							v236.Text = "防检测飞行 ✓";
							v1187 = pcall(function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/mbhivhjjb.lua"))();
							end);
							FlatIdent_8DAB1 = 2;
						end
					end
				else
					local FlatIdent_6038 = 0;
					local v1188;
					while true do
						if (FlatIdent_6038 == 0) then
							v1188 = 0;
							while true do
								if (v1188 == 1) then
									v236.Text = "防检测飞行";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测飞行已禁用",Duration=(4 - 1),Icon="rbxassetid://4483345998"});
									break;
								end
								if (v1188 == (0 + 0)) then
									local FlatIdent_79884 = 0;
									while true do
										if (FlatIdent_79884 == 0) then
											v236.BackgroundColor3 = v256;
											v248.Color = Color3.fromRGB(747 - (89 + 578), 58 + 22, 90);
											FlatIdent_79884 = 1;
										end
										if (FlatIdent_79884 == 1) then
											v1188 = 1;
											break;
										end
									end
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	v236.Parent = v222;
	local v259 = Instance.new("TextButton");
	v259.Name = "AntiDetectWall";
	v259.Size = UDim2.new(0.9, 0 - 0, 1049 - (572 + 477), 6 + 34);
	v259.Text = "防检测穿墙";
	v259.BackgroundColor3 = Color3.fromRGB(37 + 23, 8 + 52, 70);
	v259.TextColor3 = Color3.new(87 - (84 + 2), 1 - 0, 1 + 0);
	v259.Font = Enum.Font.GothamSemibold;
	v259.TextSize = 15;
	v259.TextStrokeTransparency = 842.5 - (497 + 345);
	v259.TextStrokeColor3 = Color3.fromRGB(0, 0, 0 + 0);
	v259.AutoButtonColor = false;
	local v270 = Instance.new("UIStroke");
	v270.Thickness = 1 + 1;
	v270.Color = Color3.fromRGB(1413 - (605 + 728), 58 + 22, 200 - 110);
	v270.Transparency = 0.3 + 0;
	v270.Parent = v259;
	local v275 = Instance.new("UICorner");
	v275.CornerRadius = UDim.new(0 - 0, 8 + 0);
	v275.Parent = v259;
	local v278 = Color3.fromRGB(166 - 106, 46 + 14, 70);
	v259.MouseEnter:Connect(function()
		if not v149.Enabled then
			local FlatIdent_2B407 = 0;
			while true do
				if (FlatIdent_2B407 == 0) then
					v259.BackgroundColor3 = Color3.fromRGB(559 - (457 + 32), 30 + 40, 80);
					v270.Color = Color3.fromRGB(1492 - (832 + 570), 85 + 5, 27 + 73);
					break;
				end
			end
		end
	end);
	v259.MouseLeave:Connect(function()
		if not v149.Enabled then
			local v909 = 0 - 0;
			local v910;
			while true do
				if (0 == v909) then
					v910 = 0 + 0;
					while true do
						if (0 == v910) then
							v259.BackgroundColor3 = v278;
							v270.Color = Color3.fromRGB(876 - (588 + 208), 215 - 135, 1890 - (884 + 916));
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v259.MouseButton1Click:Connect(function()
		local FlatIdent_7EE98 = 0;
		local v850;
		while true do
			if (FlatIdent_7EE98 == 0) then
				v850 = v149:Toggle();
				if v850 then
					local FlatIdent_285D = 0;
					local v911;
					while true do
						if (FlatIdent_285D == 0) then
							v911 = 0;
							while true do
								if (0 == v911) then
									v259.BackgroundColor3 = Color3.fromRGB(167 - 87, 93 + 67, 908 - (232 + 421));
									v270.Color = Color3.fromRGB(2009 - (1569 + 320), 50 + 150, 49 + 206);
									v911 = 3 - 2;
								end
								if (v911 == (606 - (316 + 289))) then
									v259.Text = "防检测穿墙 ✓";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测穿墙已启用\nWASD移动 空格上升 Ctrl下降",Duration=(13 - 8),Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
				else
					local FlatIdent_81F9 = 0;
					local v912;
					while true do
						if (FlatIdent_81F9 == 0) then
							v912 = 0 + 0;
							while true do
								if (v912 == (1453 - (666 + 787))) then
									local FlatIdent_44652 = 0;
									while true do
										if (FlatIdent_44652 == 1) then
											v912 = 1 + 0;
											break;
										end
										if (FlatIdent_44652 == 0) then
											v259.BackgroundColor3 = v278;
											v270.Color = Color3.fromRGB(80, 80, 515 - (360 + 65));
											FlatIdent_44652 = 1;
										end
									end
								end
								if (v912 == (255 - (79 + 175))) then
									v259.Text = "防检测穿墙";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测穿墙已禁用",Duration=3,Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	v259.Parent = v222;
	local v280 = Instance.new("TextButton");
	v280.Name = "PlayerJoinNotification";
	v280.Size = UDim2.new(0.9 - 0, 0 + 0, 0 - 0, 40);
	v280.Text = "玩家进入提示";
	v280.BackgroundColor3 = Color3.fromRGB(60, 115 - 55, 969 - (503 + 396));
	v280.TextColor3 = Color3.new(182 - (92 + 89), 1 - 0, 1);
	v280.Font = Enum.Font.GothamSemibold;
	v280.TextSize = 15;
	v280.TextStrokeTransparency = 0.5 + 0;
	v280.TextStrokeColor3 = Color3.fromRGB(0 + 0, 0, 0);
	v280.AutoButtonColor = false;
	local v291 = Instance.new("UIStroke");
	v291.Thickness = 2;
	v291.Color = Color3.fromRGB(80, 313 - 233, 13 + 77);
	v291.Transparency = 0.3 - 0;
	v291.Parent = v280;
	local v296 = Instance.new("UICorner");
	v296.CornerRadius = UDim.new(0, 8);
	v296.Parent = v280;
	local v299 = Color3.fromRGB(53 + 7, 29 + 31, 70);
	local v300 = false;
	v280.MouseEnter:Connect(function()
		if not v300 then
			local v913 = 0 - 0;
			while true do
				if (v913 == (0 + 0)) then
					v280.BackgroundColor3 = Color3.fromRGB(106 - 36, 1314 - (485 + 759), 80);
					v291.Color = Color3.fromRGB(208 - 118, 90, 1289 - (442 + 747));
					break;
				end
			end
		end
	end);
	v280.MouseLeave:Connect(function()
		if not v300 then
			local v914 = 1135 - (832 + 303);
			while true do
				if (v914 == 0) then
					v280.BackgroundColor3 = v299;
					v291.Color = Color3.fromRGB(80, 80, 90);
					break;
				end
			end
		end
	end);
	v280.MouseButton1Click:Connect(function()
		local v851 = 946 - (88 + 858);
		while true do
			if (v851 == (0 + 0)) then
				v300 = not v300;
				if v300 then
					v280.BackgroundColor3 = Color3.fromRGB(80, 160, 255);
					v291.Color = Color3.fromRGB(120, 166 + 34, 255);
					v280.Text = "玩家进入提示 ✓";
					local v1202 = pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))();
					end);
					if v1202 then
						v2:SetCore("SendNotification", {Title="XDG-HOB",Text="玩家进入提示脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
					else
						local FlatIdent_1E39B = 0;
						local v1322;
						while true do
							if (FlatIdent_1E39B == 0) then
								v1322 = 0;
								while true do
									if (v1322 == 0) then
										v2:SetCore("SendNotification", {Title="错误",Text="加载玩家进入提示脚本失败",Duration=(1 + 4),Icon="rbxassetid://4483345998"});
										v300 = false;
										v1322 = 1;
									end
									if (v1322 == 1) then
										local FlatIdent_51FCC = 0;
										while true do
											if (FlatIdent_51FCC == 1) then
												v1322 = 2 - 0;
												break;
											end
											if (FlatIdent_51FCC == 0) then
												v280.BackgroundColor3 = v299;
												v291.Color = Color3.fromRGB(869 - (766 + 23), 394 - 314, 90);
												FlatIdent_51FCC = 1;
											end
										end
									end
									if (2 == v1322) then
										v280.Text = "玩家进入提示";
										break;
									end
								end
								break;
							end
						end
					end
				else
					local v1203 = 0 - 0;
					while true do
						if (v1203 == (3 - 2)) then
							v280.Text = "玩家进入提示";
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="玩家进入提示脚本已卸载",Duration=(1076 - (1036 + 37)),Icon="rbxassetid://4483345998"});
							break;
						end
						if (v1203 == 0) then
							local FlatIdent_58C0A = 0;
							while true do
								if (FlatIdent_58C0A == 0) then
									v280.BackgroundColor3 = v299;
									v291.Color = Color3.fromRGB(57 + 23, 155 - 75, 71 + 19);
									FlatIdent_58C0A = 1;
								end
								if (FlatIdent_58C0A == 1) then
									v1203 = 1;
									break;
								end
							end
						end
					end
				end
				break;
			end
		end
	end);
	v280.Parent = v222;
	local v302 = Instance.new("TextButton");
	v302.Name = "FloatWalk";
	v302.Size = UDim2.new(0.9, 1480 - (641 + 839), 913 - (910 + 3), 40);
	v302.Text = "踏空";
	v302.BackgroundColor3 = Color3.fromRGB(152 - 92, 1744 - (1466 + 218), 33 + 37);
	v302.TextColor3 = Color3.new(1149 - (556 + 592), 1, 1);
	v302.Font = Enum.Font.GothamSemibold;
	v302.TextSize = 6 + 9;
	v302.TextStrokeTransparency = 0.5;
	v302.TextStrokeColor3 = Color3.fromRGB(808 - (329 + 479), 854 - (174 + 680), 0 - 0);
	v302.AutoButtonColor = false;
	local v313 = Instance.new("UIStroke");
	v313.Thickness = 3 - 1;
	v313.Color = Color3.fromRGB(58 + 22, 819 - (396 + 343), 8 + 82);
	v313.Transparency = 1477.3 - (29 + 1448);
	v313.Parent = v302;
	local v318 = Instance.new("UICorner");
	v318.CornerRadius = UDim.new(0, 8);
	v318.Parent = v302;
	local v321 = Color3.fromRGB(1449 - (135 + 1254), 226 - 166, 326 - 256);
	local v322 = false;
	v302.MouseEnter:Connect(function()
		if not v322 then
			local FlatIdent_2F8E7 = 0;
			while true do
				if (FlatIdent_2F8E7 == 0) then
					v302.BackgroundColor3 = Color3.fromRGB(70, 47 + 23, 1607 - (389 + 1138));
					v313.Color = Color3.fromRGB(664 - (102 + 472), 85 + 5, 100);
					break;
				end
			end
		end
	end);
	v302.MouseLeave:Connect(function()
		if not v322 then
			local FlatIdent_35F25 = 0;
			local v917;
			local v918;
			while true do
				if (FlatIdent_35F25 == 0) then
					v917 = 0;
					v918 = nil;
					FlatIdent_35F25 = 1;
				end
				if (FlatIdent_35F25 == 1) then
					while true do
						if (v917 == (0 + 0)) then
							v918 = 0 + 0;
							while true do
								if (v918 == 0) then
									v302.BackgroundColor3 = v321;
									v313.Color = Color3.fromRGB(1625 - (320 + 1225), 142 - 62, 56 + 34);
									break;
								end
							end
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v302.MouseButton1Click:Connect(function()
		local FlatIdent_4185D = 0;
		local v852;
		local v853;
		while true do
			if (FlatIdent_4185D == 0) then
				v852 = 1464 - (157 + 1307);
				v853 = nil;
				FlatIdent_4185D = 1;
			end
			if (FlatIdent_4185D == 1) then
				while true do
					if (v852 == (1859 - (821 + 1038))) then
						v853 = 0 - 0;
						while true do
							if ((0 + 0) == v853) then
								v322 = not v322;
								if v322 then
									v302.BackgroundColor3 = Color3.fromRGB(142 - 62, 160, 255);
									v313.Color = Color3.fromRGB(120, 75 + 125, 255);
									v302.Text = "踏空 ✓";
									local v1370 = pcall(function()
										loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))();
									end);
									if v1370 then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text="踏空脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
									else
										local v1432 = 0 - 0;
										while true do
											if (v1432 == 0) then
												local FlatIdent_5F7B5 = 0;
												while true do
													if (FlatIdent_5F7B5 == 1) then
														v1432 = 1 + 0;
														break;
													end
													if (0 == FlatIdent_5F7B5) then
														v2:SetCore("SendNotification", {Title="错误",Text="加载踏空脚本失败",Duration=(1031 - (834 + 192)),Icon="rbxassetid://4483345998"});
														v322 = false;
														FlatIdent_5F7B5 = 1;
													end
												end
											end
											if (v1432 == (1 + 1)) then
												v302.Text = "踏空";
												break;
											end
											if (v1432 == (1 + 0)) then
												local FlatIdent_28DC7 = 0;
												while true do
													if (FlatIdent_28DC7 == 0) then
														v302.BackgroundColor3 = v321;
														v313.Color = Color3.fromRGB(123 - 43, 384 - (300 + 4), 25 + 65);
														FlatIdent_28DC7 = 1;
													end
													if (FlatIdent_28DC7 == 1) then
														v1432 = 2;
														break;
													end
												end
											end
										end
									end
								else
									local FlatIdent_1D0A6 = 0;
									while true do
										if (FlatIdent_1D0A6 == 1) then
											v302.Text = "踏空";
											v2:SetCore("SendNotification", {Title="XDG-HOB",Text="踏空脚本已卸载",Duration=(2 + 1),Icon="rbxassetid://4483345998"});
											break;
										end
										if (FlatIdent_1D0A6 == 0) then
											v302.BackgroundColor3 = v321;
											v313.Color = Color3.fromRGB(209 - 129, 442 - (112 + 250), 90);
											FlatIdent_1D0A6 = 1;
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	end);
	v302.Parent = v222;
	local v324 = Instance.new("TextButton");
	v324.Name = "WallClimb";
	v324.Size = UDim2.new(0.9 - 0, 0 + 0, 0 + 0, 30 + 10);
	v324.Text = "爬墙";
	v324.BackgroundColor3 = Color3.fromRGB(30 + 30, 60, 53 + 17);
	v324.TextColor3 = Color3.new(1415 - (1001 + 413), 2 - 1, 883 - (244 + 638));
	v324.Font = Enum.Font.GothamSemibold;
	v324.TextSize = 708 - (627 + 66);
	v324.TextStrokeTransparency = 0.5 - 0;
	v324.TextStrokeColor3 = Color3.fromRGB(0, 602 - (512 + 90), 0);
	v324.AutoButtonColor = false;
	local v335 = Instance.new("UIStroke");
	v335.Thickness = 1908 - (1665 + 241);
	v335.Color = Color3.fromRGB(80, 80, 90);
	v335.Transparency = 717.3 - (373 + 344);
	v335.Parent = v324;
	local v340 = Instance.new("UICorner");
	v340.CornerRadius = UDim.new(0 + 0, 8);
	v340.Parent = v324;
	local v343 = Color3.fromRGB(16 + 44, 158 - 98, 118 - 48);
	local v344 = false;
	v324.MouseEnter:Connect(function()
		if not v344 then
			local FlatIdent_3EDDC = 0;
			local v919;
			while true do
				if (FlatIdent_3EDDC == 0) then
					v919 = 1099 - (35 + 1064);
					while true do
						if (v919 == (0 + 0)) then
							v324.BackgroundColor3 = Color3.fromRGB(70, 149 - 79, 1 + 79);
							v335.Color = Color3.fromRGB(1326 - (298 + 938), 1349 - (233 + 1026), 1766 - (636 + 1030));
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v324.MouseLeave:Connect(function()
		if not v344 then
			v324.BackgroundColor3 = v343;
			v335.Color = Color3.fromRGB(41 + 39, 79 + 1, 27 + 63);
		end
	end);
	v324.MouseButton1Click:Connect(function()
		v344 = not v344;
		if v344 then
			local v922 = 0;
			local v923;
			while true do
				if (v922 == (1 + 1)) then
					if v923 then
						v2:SetCore("SendNotification", {Title="XDG-HOB",Text="爬墙脚本已加载",Duration=(224 - (55 + 166)),Icon="rbxassetid://4483345998"});
					else
						local v1323 = 0;
						while true do
							if (v1323 == (1 + 0)) then
								local FlatIdent_5AC6 = 0;
								while true do
									if (1 == FlatIdent_5AC6) then
										v1323 = 2;
										break;
									end
									if (FlatIdent_5AC6 == 0) then
										v324.BackgroundColor3 = v343;
										v335.Color = Color3.fromRGB(9 + 71, 80, 343 - 253);
										FlatIdent_5AC6 = 1;
									end
								end
							end
							if (v1323 == (299 - (36 + 261))) then
								v324.Text = "爬墙";
								break;
							end
							if ((0 - 0) == v1323) then
								v2:SetCore("SendNotification", {Title="错误",Text="加载爬墙脚本失败",Duration=(1373 - (34 + 1334)),Icon="rbxassetid://4483345998"});
								v344 = false;
								v1323 = 1 + 0;
							end
						end
					end
					break;
				end
				if (v922 == (0 + 0)) then
					v324.BackgroundColor3 = Color3.fromRGB(1363 - (1035 + 248), 181 - (20 + 1), 255);
					v335.Color = Color3.fromRGB(63 + 57, 519 - (134 + 185), 1388 - (549 + 584));
					v922 = 686 - (314 + 371);
				end
				if (v922 == (3 - 2)) then
					local FlatIdent_73069 = 0;
					while true do
						if (FlatIdent_73069 == 0) then
							v324.Text = "爬墙 ✓";
							v923 = pcall(function()
								loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))();
							end);
							FlatIdent_73069 = 1;
						end
						if (FlatIdent_73069 == 1) then
							v922 = 970 - (478 + 490);
							break;
						end
					end
				end
			end
		else
			local v924 = 0 + 0;
			local v925;
			while true do
				if (v924 == 0) then
					v925 = 1172 - (786 + 386);
					while true do
						if (v925 == (0 - 0)) then
							local FlatIdent_1F799 = 0;
							while true do
								if (FlatIdent_1F799 == 1) then
									v925 = 1341 - (1093 + 247);
									break;
								end
								if (0 == FlatIdent_1F799) then
									v324.BackgroundColor3 = v343;
									v335.Color = Color3.fromRGB(80, 1459 - (1055 + 324), 90);
									FlatIdent_1F799 = 1;
								end
							end
						end
						if (v925 == 1) then
							v324.Text = "爬墙";
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="爬墙脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v324.Parent = v222;
	local v346 = Instance.new("TextButton");
	v346.Name = "IronFist";
	v346.Size = UDim2.new(0.9 + 0, 0 + 0, 0 - 0, 135 - 95);
	v346.Text = "铁拳";
	v346.BackgroundColor3 = Color3.fromRGB(60, 170 - 110, 70);
	v346.TextColor3 = Color3.new(2 - 1, 1 + 0, 3 - 2);
	v346.Font = Enum.Font.GothamSemibold;
	v346.TextSize = 15;
	v346.TextStrokeTransparency = 0.5;
	v346.TextStrokeColor3 = Color3.fromRGB(0 - 0, 0, 0 + 0);
	v346.AutoButtonColor = false;
	local v357 = Instance.new("UIStroke");
	v357.Thickness = 4 - 2;
	v357.Color = Color3.fromRGB(768 - (364 + 324), 219 - 139, 215 - 125);
	v357.Transparency = 0.3 + 0;
	v357.Parent = v346;
	local v362 = Instance.new("UICorner");
	v362.CornerRadius = UDim.new(0 - 0, 12 - 4);
	v362.Parent = v346;
	local v365 = Color3.fromRGB(182 - 122, 1328 - (1249 + 19), 70);
	local v366 = false;
	v346.MouseEnter:Connect(function()
		if not v366 then
			local FlatIdent_5062 = 0;
			local v926;
			local v927;
			while true do
				if (FlatIdent_5062 == 1) then
					while true do
						if (v926 == 0) then
							v927 = 0 + 0;
							while true do
								if (v927 == (0 - 0)) then
									v346.BackgroundColor3 = Color3.fromRGB(1156 - (686 + 400), 55 + 15, 309 - (73 + 156));
									v357.Color = Color3.fromRGB(90, 1 + 89, 911 - (721 + 90));
									break;
								end
							end
							break;
						end
					end
					break;
				end
				if (0 == FlatIdent_5062) then
					v926 = 0;
					v927 = nil;
					FlatIdent_5062 = 1;
				end
			end
		end
	end);
	v346.MouseLeave:Connect(function()
		if not v366 then
			local v928 = 0 + 0;
			local v929;
			while true do
				if (v928 == 0) then
					v929 = 0;
					while true do
						if (v929 == (0 - 0)) then
							v346.BackgroundColor3 = v365;
							v357.Color = Color3.fromRGB(550 - (224 + 246), 129 - 49, 165 - 75);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v346.MouseButton1Click:Connect(function()
		local FlatIdent_81F6A = 0;
		local v854;
		while true do
			if (FlatIdent_81F6A == 0) then
				v854 = 0 + 0;
				while true do
					if (v854 == 0) then
						v366 = not v366;
						if v366 then
							local FlatIdent_D076 = 0;
							local v1212;
							while true do
								if (0 == FlatIdent_D076) then
									v346.BackgroundColor3 = Color3.fromRGB(2 + 78, 118 + 42, 506 - 251);
									v357.Color = Color3.fromRGB(399 - 279, 200, 768 - (203 + 310));
									FlatIdent_D076 = 1;
								end
								if (FlatIdent_D076 == 1) then
									v346.Text = "铁拳 ✓";
									v1212 = pcall(function()
										loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))();
									end);
									FlatIdent_D076 = 2;
								end
								if (FlatIdent_D076 == 2) then
									if v1212 then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text="铁拳脚本已加载",Duration=(1996 - (1238 + 755)),Icon="rbxassetid://4483345998"});
									else
										v2:SetCore("SendNotification", {Title="错误",Text="加载铁拳脚本失败",Duration=(1 + 4),Icon="rbxassetid://4483345998"});
										v366 = false;
										v346.BackgroundColor3 = v365;
										v357.Color = Color3.fromRGB(80, 1614 - (709 + 825), 165 - 75);
										v346.Text = "铁拳";
									end
									break;
								end
							end
						else
							local FlatIdent_66193 = 0;
							while true do
								if (FlatIdent_66193 == 0) then
									v346.BackgroundColor3 = v365;
									v357.Color = Color3.fromRGB(116 - 36, 80, 954 - (196 + 668));
									FlatIdent_66193 = 1;
								end
								if (1 == FlatIdent_66193) then
									v346.Text = "铁拳";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="铁拳脚本已卸载",Duration=(11 - 8),Icon="rbxassetid://4483345998"});
									break;
								end
							end
						end
						break;
					end
				end
				break;
			end
		end
	end);
	v346.Parent = v222;
	return v216;
end
local function v156()
	local v368 = Instance.new("Frame");
	v368.Name = "FunctionContainer";
	v368.Size = UDim2.new(1 - 0, 0, 834 - (171 + 662), 93 - (4 + 89));
	v368.BackgroundTransparency = 1;
	v368.Visible = false;
	v368.Parent = v136;
	local v374 = Instance.new("ScrollingFrame");
	v374.Name = "FunctionScroll";
	v374.Size = UDim2.new(3 - 2, -(8 + 12), 1, -(87 - 67));
	v374.Position = UDim2.new(0 + 0, 10, 0, 1496 - (35 + 1451));
	v374.BackgroundTransparency = 1;
	v374.ScrollBarThickness = 1459 - (28 + 1425);
	v374.ScrollBarImageColor3 = Color3.fromRGB(2093 - (941 + 1052), 96 + 4, 1624 - (822 + 692));
	v374.CanvasSize = UDim2.new(0, 0, 0, 650);
	v374.Parent = v368;
	local v383 = Instance.new("UIListLayout");
	v383.Parent = v374;
	v383.Padding = UDim.new(0 - 0, 12);
	v383.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local v388 = Instance.new("Frame");
	v388.Name = "SpeedFrame";
	v388.Size = UDim2.new(0.9, 0 + 0, 0, 417 - (45 + 252));
	v388.BackgroundColor3 = Color3.fromRGB(60, 60 + 0, 25 + 45);
	v388.BackgroundTransparency = 0.1 - 0;
	local v393 = Instance.new("UICorner");
	v393.CornerRadius = UDim.new(433 - (114 + 319), 11 - 3);
	v393.Parent = v388;
	local v396 = Instance.new("UIStroke");
	v396.Thickness = 2 - 0;
	v396.Color = Color3.fromRGB(51 + 29, 160, 379 - 124);
	v396.Transparency = 0.2 - 0;
	v396.Parent = v388;
	local v401 = Instance.new("ImageLabel");
	v401.Name = "SpeedIcon";
	v401.Size = UDim2.new(0, 1995 - (556 + 1407), 0, 1238 - (741 + 465));
	v401.Position = UDim2.new(465 - (170 + 295), 6 + 4, 0 + 0, 24 - 14);
	v401.BackgroundTransparency = 1 + 0;
	v401.Image = "rbxassetid://3926305904";
	v401.ImageRectSize = Vector2.new(64, 42 + 22);
	v401.ImageRectOffset = Vector2.new(0 + 0, 1358 - (957 + 273));
	v401.Parent = v388;
	local v410 = Instance.new("TextLabel");
	v410.Name = "SpeedTitle";
	v410.Size = UDim2.new(1 + 0, -50, 0 + 0, 76 - 56);
	v410.Position = UDim2.new(0 - 0, 152 - 102, 0 - 0, 1782 - (389 + 1391));
	v410.BackgroundTransparency = 1 + 0;
	v410.Text = "防检测速度调整";
	v410.TextColor3 = Color3.fromRGB(180, 21 + 179, 255);
	v410.Font = Enum.Font.GothamBold;
	v410.TextSize = 26 - 14;
	v410.TextXAlignment = Enum.TextXAlignment.Left;
	v410.Parent = v388;
	local v423 = Instance.new("TextBox");
	v423.Name = "SpeedInput";
	v423.Size = UDim2.new(951.7 - (783 + 168), 0 - 0, 0 + 0, 30);
	v423.Position = UDim2.new(0.15, 0, 0, 40);
	v423.BackgroundColor3 = Color3.fromRGB(45, 356 - (309 + 2), 168 - 113);
	v423.TextColor3 = Color3.fromRGB(1432 - (1090 + 122), 220, 75 + 155);
	v423.Font = Enum.Font.GothamSemibold;
	v423.TextSize = 46 - 32;
	v423.PlaceholderText = "输入速度 (16-400)";
	v423.Text = "16";
	v423.ClearTextOnFocus = false;
	local v435 = Instance.new("UICorner");
	v435.CornerRadius = UDim.new(0, 6);
	v435.Parent = v423;
	local v438 = Instance.new("UIStroke");
	v438.Thickness = 1 + 0;
	v438.Color = Color3.fromRGB(1218 - (628 + 490), 18 + 82, 272 - 162);
	v438.Parent = v423;
	v423.FocusLost:Connect(function(v855)
		if v855 then
			local FlatIdent_3A655 = 0;
			local v930;
			local v931;
			while true do
				if (FlatIdent_3A655 == 1) then
					while true do
						if (v930 == (774 - (431 + 343))) then
							v931 = tonumber(v423.Text);
							if (v931 and (v931 >= (32 - 16)) and (v931 <= (1157 - 757))) then
								local FlatIdent_771FD = 0;
								local v1327;
								while true do
									if (FlatIdent_771FD == 0) then
										v1327 = 0 + 0;
										while true do
											if (v1327 == 0) then
												v8.SetRealSpeed(v931);
												v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("速度已设置为: " .. v931),Duration=3,Icon="rbxassetid://4483345998"});
												break;
											end
										end
										break;
									end
								end
							else
								local v1328 = 0;
								while true do
									if ((0 + 0) == v1328) then
										v423.Text = "16";
										v2:SetCore("SendNotification", {Title="错误",Text="请输入16-400之间的数字",Duration=(1700 - (556 + 1139)),Icon="rbxassetid://4483345998"});
										break;
									end
								end
							end
							break;
						end
					end
					break;
				end
				if (FlatIdent_3A655 == 0) then
					v930 = 0 - 0;
					v931 = nil;
					FlatIdent_3A655 = 1;
				end
			end
		end
	end);
	v423.Parent = v388;
	local v443 = Instance.new("TextButton");
	v443.Name = "ApplySpeedButton";
	v443.Size = UDim2.new(15.5 - (6 + 9), 0 + 0, 0, 16 + 14);
	v443.Position = UDim2.new(169.25 - (28 + 141), 0 + 0, 0 - 0, 57 + 23);
	v443.BackgroundColor3 = Color3.fromRGB(1397 - (486 + 831), 416 - 256, 255);
	v443.Text = "应用速度";
	v443.TextColor3 = Color3.new(3 - 2, 1 + 0, 3 - 2);
	v443.Font = Enum.Font.GothamSemibold;
	v443.TextSize = 1277 - (668 + 595);
	v443.TextStrokeTransparency = 0.6 + 0;
	v443.TextStrokeColor3 = Color3.fromRGB(0 + 0, 0 - 0, 0);
	local v454 = Instance.new("UICorner");
	v454.CornerRadius = UDim.new(290 - (23 + 267), 6);
	v454.Parent = v443;
	local v457 = Instance.new("UIStroke");
	v457.Thickness = 1;
	v457.Color = Color3.fromRGB(120, 200, 2199 - (1129 + 815));
	v457.Parent = v443;
	v443.MouseEnter:Connect(function()
		v443.BackgroundColor3 = Color3.fromRGB(100, 567 - (371 + 16), 2005 - (1326 + 424));
	end);
	v443.MouseLeave:Connect(function()
		v443.BackgroundColor3 = Color3.fromRGB(80, 303 - 143, 931 - 676);
	end);
	v443.MouseButton1Click:Connect(function()
		local FlatIdent_3423 = 0;
		local v858;
		local v859;
		while true do
			if (0 == FlatIdent_3423) then
				v858 = 0;
				v859 = nil;
				FlatIdent_3423 = 1;
			end
			if (FlatIdent_3423 == 1) then
				while true do
					if (v858 == 0) then
						v859 = tonumber(v423.Text);
						if (v859 and (v859 >= (134 - (88 + 30))) and (v859 <= 400)) then
							local FlatIdent_4479E = 0;
							local v1216;
							local v1217;
							while true do
								if (1 == FlatIdent_4479E) then
									while true do
										if (v1216 == (0 - 0)) then
											v1217 = 1776 - (421 + 1355);
											while true do
												if (v1217 == (0 - 0)) then
													v8.SetRealSpeed(v859);
													v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("速度已设置为: " .. v859),Duration=(2 + 1),Icon="rbxassetid://4483345998"});
													break;
												end
											end
											break;
										end
									end
									break;
								end
								if (FlatIdent_4479E == 0) then
									v1216 = 771 - (720 + 51);
									v1217 = nil;
									FlatIdent_4479E = 1;
								end
							end
						else
							local FlatIdent_32B1C = 0;
							local v1218;
							local v1219;
							while true do
								if (FlatIdent_32B1C == 1) then
									while true do
										if (v1218 == (1083 - (286 + 797))) then
											v1219 = 0 - 0;
											while true do
												if (v1219 == 0) then
													v423.Text = "16";
													v2:SetCore("SendNotification", {Title="错误",Text="请输入16-400之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
													break;
												end
											end
											break;
										end
									end
									break;
								end
								if (FlatIdent_32B1C == 0) then
									v1218 = 0;
									v1219 = nil;
									FlatIdent_32B1C = 1;
								end
							end
						end
						break;
					end
				end
				break;
			end
		end
	end);
	v443.Parent = v388;
	local v462 = Instance.new("TextLabel");
	v462.Name = "CurrentSpeedLabel";
	v462.Size = UDim2.new(1 - 0, 439 - (397 + 42), 0 + 0, 820 - (24 + 776));
	v462.Position = UDim2.new(0 - 0, 785 - (222 + 563), 0, 253 - 138);
	v462.BackgroundTransparency = 1 + 0;
	v462.TextColor3 = Color3.fromRGB(370 - (23 + 167), 1998 - (690 + 1108), 93 + 162);
	v462.Font = Enum.Font.GothamSemibold;
	v462.TextSize = 11;
	v462.Text = "当前速度: 16";
	v462.Parent = v388;
	local v472;
	function updateCurrentSpeed()
		v462.Text = "当前速度: " .. math.floor(v8.GetRealSpeed());
	end
	game:GetService("RunService").Heartbeat:Connect(function()
		v472();
	end);
	v388.Parent = v374;
	local v474 = Instance.new("Frame");
	v474.Name = "JumpPowerFrame";
	v474.Size = UDim2.new(0.9 + 0, 848 - (40 + 808), 0, 20 + 100);
	v474.BackgroundColor3 = Color3.fromRGB(229 - 169, 58 + 2, 38 + 32);
	v474.BackgroundTransparency = 0.1;
	local v479 = Instance.new("UICorner");
	v479.CornerRadius = UDim.new(0 + 0, 579 - (47 + 524));
	v479.Parent = v474;
	local v482 = Instance.new("UIStroke");
	v482.Thickness = 2 + 0;
	v482.Color = Color3.fromRGB(218 - 138, 239 - 79, 581 - 326);
	v482.Transparency = 1726.2 - (1165 + 561);
	v482.Parent = v474;
	local v487 = Instance.new("ImageLabel");
	v487.Name = "JumpPowerIcon";
	v487.Size = UDim2.new(0, 1 + 31, 0 - 0, 13 + 19);
	v487.Position = UDim2.new(479 - (341 + 138), 10, 0 + 0, 10);
	v487.BackgroundTransparency = 1 - 0;
	v487.Image = "rbxassetid://3926305904";
	v487.ImageRectSize = Vector2.new(64, 390 - (89 + 237));
	v487.ImageRectOffset = Vector2.new(0 - 0, 808 - 424);
	v487.Parent = v474;
	local v496 = Instance.new("TextLabel");
	v496.Name = "JumpPowerTitle";
	v496.Size = UDim2.new(882 - (581 + 300), -(1270 - (855 + 365)), 0, 47 - 27);
	v496.Position = UDim2.new(0 + 0, 50, 1235 - (1030 + 205), 2 + 0);
	v496.BackgroundTransparency = 1;
	v496.Text = "防检测跳跃高度";
	v496.TextColor3 = Color3.fromRGB(168 + 12, 486 - (156 + 130), 579 - 324);
	v496.Font = Enum.Font.GothamBold;
	v496.TextSize = 19 - 7;
	v496.TextXAlignment = Enum.TextXAlignment.Left;
	v496.Parent = v474;
	local v507 = Instance.new("TextBox");
	v507.Name = "JumpPowerInput";
	v507.Size = UDim2.new(0.7 - 0, 0, 0, 8 + 22);
	v507.Position = UDim2.new(0.15 + 0, 0, 0, 109 - (10 + 59));
	v507.BackgroundColor3 = Color3.fromRGB(13 + 32, 221 - 176, 55);
	v507.TextColor3 = Color3.fromRGB(1383 - (671 + 492), 176 + 44, 230);
	v507.Font = Enum.Font.GothamSemibold;
	v507.TextSize = 14;
	v507.PlaceholderText = "输入跳跃高度 (7.2-500)";
	v507.Text = "7.2";
	v507.ClearTextOnFocus = false;
	local v518 = Instance.new("UICorner");
	v518.CornerRadius = UDim.new(0, 1221 - (369 + 846));
	v518.Parent = v507;
	local v521 = Instance.new("UIStroke");
	v521.Thickness = 1;
	v521.Color = Color3.fromRGB(27 + 73, 100, 94 + 16);
	v521.Parent = v507;
	v507.FocusLost:Connect(function(v861)
		if v861 then
			local FlatIdent_885BC = 0;
			local v932;
			local v933;
			while true do
				if (FlatIdent_885BC == 0) then
					v932 = 1945 - (1036 + 909);
					v933 = nil;
					FlatIdent_885BC = 1;
				end
				if (FlatIdent_885BC == 1) then
					while true do
						if (v932 == 0) then
							v933 = tonumber(v507.Text);
							if (v933 and (v933 >= (6.2 + 1)) and (v933 <= 500)) then
								local FlatIdent_4C119 = 0;
								local v1329;
								local v1330;
								while true do
									if (FlatIdent_4C119 == 0) then
										v1329 = 0 - 0;
										v1330 = nil;
										FlatIdent_4C119 = 1;
									end
									if (FlatIdent_4C119 == 1) then
										while true do
											if ((203 - (11 + 192)) == v1329) then
												v1330 = v154.SetJumpHeight(v933);
												if v1330 then
													v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("跳跃高度已设置为: " .. string.format("%.1f", v933)),Duration=(2 + 1),Icon="rbxassetid://4483345998"});
												end
												break;
											end
										end
										break;
									end
								end
							else
								local FlatIdent_8B6ED = 0;
								local v1331;
								while true do
									if (FlatIdent_8B6ED == 0) then
										v1331 = 175 - (135 + 40);
										while true do
											if (v1331 == (0 - 0)) then
												v507.Text = "7.2";
												v2:SetCore("SendNotification", {Title="错误",Text="请输入7.2-500之间的数字",Duration=(4 + 1),Icon="rbxassetid://4483345998"});
												break;
											end
										end
										break;
									end
								end
							end
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v507.Parent = v474;
	local v526 = Instance.new("TextButton");
	v526.Name = "ApplyJumpPowerButton";
	v526.Size = UDim2.new(0.5 - 0, 0 - 0, 176 - (50 + 126), 83 - 53);
	v526.Position = UDim2.new(0.25, 0 + 0, 0, 1493 - (1233 + 180));
	v526.BackgroundColor3 = Color3.fromRGB(1049 - (522 + 447), 160, 1676 - (107 + 1314));
	v526.Text = "应用高度";
	v526.TextColor3 = Color3.new(1 + 0, 2 - 1, 1 + 0);
	v526.Font = Enum.Font.GothamSemibold;
	v526.TextSize = 27 - 13;
	v526.TextStrokeTransparency = 0.6 - 0;
	v526.TextStrokeColor3 = Color3.fromRGB(1910 - (716 + 1194), 0, 0 + 0);
	local v537 = Instance.new("UICorner");
	v537.CornerRadius = UDim.new(0 + 0, 509 - (74 + 429));
	v537.Parent = v526;
	local v540 = Instance.new("UIStroke");
	v540.Thickness = 1 - 0;
	v540.Color = Color3.fromRGB(120, 200, 127 + 128);
	v540.Parent = v526;
	v526.MouseEnter:Connect(function()
		v526.BackgroundColor3 = Color3.fromRGB(228 - 128, 128 + 52, 255);
	end);
	v526.MouseLeave:Connect(function()
		v526.BackgroundColor3 = Color3.fromRGB(80, 160, 785 - 530);
	end);
	v526.MouseButton1Click:Connect(function()
		local FlatIdent_772BD = 0;
		local v864;
		while true do
			if (FlatIdent_772BD == 0) then
				v864 = tonumber(v507.Text);
				if (v864 and (v864 >= 7.2) and (v864 <= (1236 - 736))) then
					local FlatIdent_2CB11 = 0;
					local v934;
					while true do
						if (FlatIdent_2CB11 == 0) then
							v934 = v154.SetJumpHeight(v864);
							if v934 then
								v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("跳跃高度已设置为: " .. string.format("%.1f", v864)),Duration=3,Icon="rbxassetid://4483345998"});
							end
							break;
						end
					end
				else
					local FlatIdent_6E337 = 0;
					local v935;
					while true do
						if (FlatIdent_6E337 == 0) then
							v935 = 433 - (279 + 154);
							while true do
								if (v935 == (778 - (454 + 324))) then
									v507.Text = "7.2";
									v2:SetCore("SendNotification", {Title="错误",Text="请输入7.2-500之间的数字",Duration=(4 + 1),Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	v526.Parent = v474;
	local v545 = Instance.new("TextLabel");
	v545.Name = "CurrentJumpLabel";
	v545.Size = UDim2.new(1, 17 - (12 + 5), 0 + 0, 20);
	v545.Position = UDim2.new(0 - 0, 0, 0 + 0, 115);
	v545.BackgroundTransparency = 1094 - (277 + 816);
	v545.TextColor3 = Color3.fromRGB(769 - 589, 1383 - (1058 + 125), 255);
	v545.Font = Enum.Font.GothamSemibold;
	v545.TextSize = 3 + 8;
	v545.Text = "当前高度: 7.2";
	v545.Parent = v474;
	game:GetService("RunService").Heartbeat:Connect(function()
		v545.Text = "当前高度: " .. string.format("%.1f", v154.GetJumpHeight());
	end);
	v526.Parent = v474;
	v474.Parent = v374;
	local v556 = Instance.new("Frame");
	v556.Name = "NightVisionFrame";
	v556.Size = UDim2.new(0.9, 975 - (815 + 160), 0 - 0, 140);
	v556.BackgroundColor3 = Color3.fromRGB(60, 142 - 82, 17 + 53);
	v556.BackgroundTransparency = 0.1 - 0;
	local v561 = Instance.new("UICorner");
	v561.CornerRadius = UDim.new(1898 - (41 + 1857), 1901 - (1222 + 671));
	v561.Parent = v556;
	local v564 = Instance.new("UIStroke");
	v564.Thickness = 5 - 3;
	v564.Color = Color3.fromRGB(114 - 34, 160, 1437 - (229 + 953));
	v564.Transparency = 1774.2 - (1111 + 663);
	v564.Parent = v556;
	local v569 = Instance.new("ImageLabel");
	v569.Name = "NightVisionIcon";
	v569.Size = UDim2.new(1579 - (874 + 705), 32, 0, 32);
	v569.Position = UDim2.new(0 + 0, 7 + 3, 0 - 0, 1 + 9);
	v569.BackgroundTransparency = 680 - (642 + 37);
	v569.Image = "rbxassetid://3926305904";
	v569.ImageRectSize = Vector2.new(64, 15 + 49);
	v569.ImageRectOffset = Vector2.new(0 + 0, 1767 - 1063);
	v569.Parent = v556;
	local v578 = Instance.new("TextLabel");
	v578.Name = "NightVisionTitle";
	v578.Size = UDim2.new(1, -50, 454 - (233 + 221), 46 - 26);
	v578.Position = UDim2.new(0 + 0, 50, 1541 - (718 + 823), 2 + 0);
	v578.BackgroundTransparency = 806 - (266 + 539);
	v578.Text = "夜视模式";
	v578.TextColor3 = Color3.fromRGB(509 - 329, 1425 - (636 + 589), 605 - 350);
	v578.Font = Enum.Font.GothamBold;
	v578.TextSize = 24 - 12;
	v578.TextXAlignment = Enum.TextXAlignment.Left;
	v578.Parent = v556;
	local v589 = Instance.new("TextButton");
	v589.Name = "NightVisionToggle";
	v589.Size = UDim2.new(0.7 + 0, 0, 0 + 0, 40);
	v589.Position = UDim2.new(0.15, 1015 - (657 + 358), 0 - 0, 91 - 51);
	v589.BackgroundColor3 = Color3.fromRGB(1247 - (1151 + 36), 58 + 2, 19 + 51);
	v589.Text = "启用夜视";
	v589.TextColor3 = Color3.fromRGB(657 - 437, 2052 - (1552 + 280), 1064 - (64 + 770));
	v589.Font = Enum.Font.GothamSemibold;
	v589.TextSize = 10 + 4;
	v589.TextStrokeTransparency = 0.5 - 0;
	v589.TextStrokeColor3 = Color3.fromRGB(0 + 0, 1243 - (157 + 1086), 0 - 0);
	v589.AutoButtonColor = false;
	local v601 = Instance.new("UICorner");
	v601.CornerRadius = UDim.new(0, 6);
	v601.Parent = v589;
	local v604 = Instance.new("UIStroke");
	v604.Thickness = 8 - 6;
	v604.Color = Color3.fromRGB(122 - 42, 109 - 29, 909 - (599 + 220));
	v604.Transparency = 0.3 - 0;
	v604.Parent = v589;
	local v609 = false;
	local v610 = nil;
	v589.MouseEnter:Connect(function()
		if not v609 then
			local FlatIdent_13AEB = 0;
			local v936;
			while true do
				if (FlatIdent_13AEB == 0) then
					v936 = 1931 - (1813 + 118);
					while true do
						if (v936 == (0 + 0)) then
							v589.BackgroundColor3 = Color3.fromRGB(1287 - (841 + 376), 98 - 28, 19 + 61);
							v604.Color = Color3.fromRGB(245 - 155, 949 - (464 + 395), 100);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v589.MouseLeave:Connect(function()
		if not v609 then
			local FlatIdent_398FF = 0;
			local v937;
			while true do
				if (FlatIdent_398FF == 0) then
					v937 = 0;
					while true do
						if (0 == v937) then
							v589.BackgroundColor3 = Color3.fromRGB(153 - 93, 60, 34 + 36);
							v604.Color = Color3.fromRGB(80, 917 - (467 + 370), 185 - 95);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v589.MouseButton1Click:Connect(function()
		v609 = not v609;
		if v609 then
			local FlatIdent_3397E = 0;
			local v938;
			while true do
				if (FlatIdent_3397E == 0) then
					v938 = 0 + 0;
					while true do
						if ((6 - 4) == v938) then
							if game:GetService("RunService"):IsClient() then
								local v1332 = 0 + 0;
								while true do
									if (v1332 == 0) then
										if v610 then
											v610:Disconnect();
										end
										v610 = game:GetService("RunService").RenderStepped:Connect(function()
										end);
										break;
									end
								end
							end
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="夜视已启用",Duration=(6 - 3),Icon="rbxassetid://4483345998"});
							break;
						end
						if ((521 - (150 + 370)) == v938) then
							local FlatIdent_360C0 = 0;
							while true do
								if (FlatIdent_360C0 == 0) then
									v589.Text = "夜视启用中 ✓";
									spawn(function()
										while task.wait() do
											if v609 then
												game.Lighting.Ambient = Color3.new(1283 - (74 + 1208), 1, 2 - 1);
											else
												game.Lighting.Ambient = Color3.new(0, 0, 0 - 0);
											end
										end
									end);
									FlatIdent_360C0 = 1;
								end
								if (1 == FlatIdent_360C0) then
									v938 = 2 + 0;
									break;
								end
							end
						end
						if (v938 == (390 - (14 + 376))) then
							local FlatIdent_43917 = 0;
							while true do
								if (FlatIdent_43917 == 1) then
									v938 = 1 + 0;
									break;
								end
								if (FlatIdent_43917 == 0) then
									v589.BackgroundColor3 = Color3.fromRGB(138 - 58, 104 + 56, 225 + 30);
									v604.Color = Color3.fromRGB(120, 191 + 9, 747 - 492);
									FlatIdent_43917 = 1;
								end
							end
						end
					end
					break;
				end
			end
		else
			local FlatIdent_530E4 = 0;
			local v939;
			while true do
				if (0 == FlatIdent_530E4) then
					v939 = 78 - (23 + 55);
					while true do
						if (v939 == (4 - 2)) then
							if v610 then
								local FlatIdent_1B638 = 0;
								local v1333;
								while true do
									if (FlatIdent_1B638 == 0) then
										v1333 = 0;
										while true do
											if (v1333 == (0 + 0)) then
												v610:Disconnect();
												v610 = nil;
												break;
											end
										end
										break;
									end
								end
							end
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="夜视已禁用",Duration=(3 + 0),Icon="rbxassetid://4483345998"});
							break;
						end
						if (v939 == 0) then
							local FlatIdent_82627 = 0;
							while true do
								if (FlatIdent_82627 == 1) then
									v939 = 1 - 0;
									break;
								end
								if (FlatIdent_82627 == 0) then
									v589.BackgroundColor3 = Color3.fromRGB(93 - 33, 19 + 41, 971 - (652 + 249));
									v604.Color = Color3.fromRGB(214 - 134, 1948 - (708 + 1160), 244 - 154);
									FlatIdent_82627 = 1;
								end
							end
						end
						if (v939 == (28 - (10 + 17))) then
							local FlatIdent_571C4 = 0;
							while true do
								if (FlatIdent_571C4 == 0) then
									v589.Text = "启用夜视";
									game.Lighting.Ambient = Color3.new(0, 0 + 0, 0);
									FlatIdent_571C4 = 1;
								end
								if (FlatIdent_571C4 == 1) then
									v939 = 1734 - (1400 + 332);
									break;
								end
							end
						end
					end
					break;
				end
			end
		end
	end);
	v589.Parent = v556;
	local v612 = Instance.new("TextLabel");
	v612.Name = "NightVisionStatus";
	v612.Size = UDim2.new(1 - 0, 1908 - (242 + 1666), 0 + 0, 20);
	v612.Position = UDim2.new(0 + 0, 0 + 0, 940 - (850 + 90), 115);
	v612.BackgroundTransparency = 1 - 0;
	v612.TextColor3 = Color3.fromRGB(1570 - (360 + 1030), 177 + 23, 255);
	v612.Font = Enum.Font.GothamSemibold;
	v612.TextSize = 11;
	v612.Text = "状态: 已禁用";
	v612.Parent = v556;
	game:GetService("RunService").Heartbeat:Connect(function()
		if v609 then
			v612.Text = "状态: 已启用";
		else
			v612.Text = "状态: 已禁用";
		end
	end);
	v556.Parent = v374;
	return v368;
end
local function v157()
	local v623 = 0 - 0;
	local v624;
	local v625;
	local v626;
	local v627;
	local v628;
	local v629;
	local v630;
	local v631;
	local v632;
	local v633;
	local v634;
	local v635;
	local v636;
	local v637;
	local v638;
	local v639;
	local v640;
	local v641;
	local v642;
	local v643;
	local v644;
	local v645;
	local v646;
	local v647;
	local v648;
	local v649;
	local v650;
	local v651;
	while true do
		if (v623 == (20 - 5)) then
			v644.TextColor3 = Color3.fromRGB(1841 - (909 + 752), 1423 - (109 + 1114), 255);
			v644.Font = Enum.Font.GothamBold;
			v644.TextSize = 21 - 9;
			v644.TextXAlignment = Enum.TextXAlignment.Left;
			v644.Parent = v639;
			v639.Parent = v625;
			v645 = Instance.new("Frame");
			v645.Name = "StatusFrame";
			v645.Size = UDim2.new(0.9, 0 + 0, 242 - (6 + 236), 51 + 29);
			v645.BackgroundColor3 = Color3.fromRGB(49 + 11, 141 - 81, 122 - 52);
			v623 = 1149 - (1076 + 57);
		end
		if (4 == v623) then
			local FlatIdent_19705 = 0;
			while true do
				if (FlatIdent_19705 == 0) then
					v630.Parent = v627;
					v631 = Instance.new("TextLabel");
					v631.Name = "BeijingTime";
					v631.Size = UDim2.new(1, -(9 + 41), 690 - (579 + 110), 0 + 0);
					FlatIdent_19705 = 1;
				end
				if (FlatIdent_19705 == 2) then
					v631.TextSize = 1188 - (663 + 511);
					v631.TextStrokeTransparency = 0.7;
					v623 = 5;
					break;
				end
				if (FlatIdent_19705 == 1) then
					v631.Position = UDim2.new(0 + 0, 27 + 23, 407 - (174 + 233), 0);
					v631.BackgroundTransparency = 2 - 1;
					v631.TextColor3 = Color3.fromRGB(386 - 166, 220, 103 + 127);
					v631.Font = Enum.Font.GothamSemibold;
					FlatIdent_19705 = 2;
				end
			end
		end
		if (v623 == (16 + 1)) then
			local FlatIdent_39734 = 0;
			local v963;
			while true do
				if (FlatIdent_39734 == 0) then
					v963 = 0;
					while true do
						if (v963 == (1 + 1)) then
							v648.ImageRectOffset = Vector2.new(0 - 0, 39 + 25);
							v648.Parent = v645;
							v649 = Instance.new("TextLabel");
							v963 = 6 - 3;
						end
						if (v963 == (7 - 4)) then
							v649.Name = "StatusLabel";
							v623 = 9 + 9;
							break;
						end
						if (v963 == 0) then
							v648.Name = "StatusIcon";
							v648.Size = UDim2.new(0, 62 - 30, 0 + 0, 3 + 29);
							v648.Position = UDim2.new(722 - (478 + 244), 10, 517 - (440 + 77), 5 + 5);
							v963 = 3 - 2;
						end
						if (v963 == (1557 - (655 + 901))) then
							local FlatIdent_14E41 = 0;
							while true do
								if (FlatIdent_14E41 == 0) then
									v648.BackgroundTransparency = 1 + 0;
									v648.Image = "rbxassetid://3926305904";
									FlatIdent_14E41 = 1;
								end
								if (FlatIdent_14E41 == 1) then
									v648.ImageRectSize = Vector2.new(49 + 15, 44 + 20);
									v963 = 7 - 5;
									break;
								end
							end
						end
					end
					break;
				end
			end
		end
		if ((1455 - (695 + 750)) == v623) then
			local FlatIdent_5B644 = 0;
			local v964;
			while true do
				if (FlatIdent_5B644 == 0) then
					v964 = 0 - 0;
					while true do
						if (v964 == 0) then
							local FlatIdent_284B8 = 0;
							while true do
								if (FlatIdent_284B8 == 2) then
									v964 = 1311 - (682 + 628);
									break;
								end
								if (FlatIdent_284B8 == 0) then
									v638.Size = UDim2.new(1 - 0, -50, 0, 20);
									v638.Position = UDim2.new(0 - 0, 50, 351 - (285 + 66), 4 - 2);
									FlatIdent_284B8 = 1;
								end
								if (FlatIdent_284B8 == 1) then
									v638.BackgroundTransparency = 1;
									v638.Text = "角色名称";
									FlatIdent_284B8 = 2;
								end
							end
						end
						if (v964 == (1 + 0)) then
							local FlatIdent_2789B = 0;
							while true do
								if (FlatIdent_2789B == 2) then
									v964 = 2;
									break;
								end
								if (FlatIdent_2789B == 0) then
									v638.TextColor3 = Color3.fromRGB(180, 499 - (176 + 123), 107 + 148);
									v638.Font = Enum.Font.GothamBold;
									FlatIdent_2789B = 1;
								end
								if (FlatIdent_2789B == 1) then
									v638.TextSize = 9 + 3;
									v638.TextXAlignment = Enum.TextXAlignment.Left;
									FlatIdent_2789B = 2;
								end
							end
						end
						if (v964 == 2) then
							v638.Parent = v633;
							v633.Parent = v625;
							v623 = 280 - (239 + 30);
							break;
						end
					end
					break;
				end
			end
		end
		if ((2 + 5) == v623) then
			v634.CornerRadius = UDim.new(0 + 0, 8);
			v634.Parent = v633;
			v635 = Instance.new("UIStroke");
			v635.Thickness = 3 - 1;
			v635.Color = Color3.fromRGB(249 - 169, 475 - (306 + 9), 889 - 634);
			v635.Transparency = 0.2;
			v635.Parent = v633;
			v636 = Instance.new("ImageLabel");
			v636.Name = "PlayerIcon";
			v636.Size = UDim2.new(0, 6 + 26, 0 + 0, 32);
			v623 = 8;
		end
		if (v623 == (8 + 8)) then
			v645.BackgroundTransparency = 0.1 - 0;
			v646 = Instance.new("UICorner");
			v646.CornerRadius = UDim.new(0, 8);
			v646.Parent = v645;
			v647 = Instance.new("UIStroke");
			v647.Thickness = 2;
			v647.Color = Color3.fromRGB(1455 - (1140 + 235), 102 + 58, 234 + 21);
			v647.Transparency = 0.2 + 0;
			v647.Parent = v645;
			v648 = Instance.new("ImageLabel");
			v623 = 17;
		end
		if (v623 == 5) then
			local FlatIdent_94874 = 0;
			while true do
				if (FlatIdent_94874 == 2) then
					v632.BackgroundTransparency = 1 - 0;
					v632.Text = "北京时间";
					v632.TextColor3 = Color3.fromRGB(169 + 11, 889 - (586 + 103), 24 + 231);
					FlatIdent_94874 = 3;
				end
				if (FlatIdent_94874 == 0) then
					v631.TextStrokeColor3 = Color3.fromRGB(0, 52 - (33 + 19), 0);
					v631.Parent = v627;
					v632 = Instance.new("TextLabel");
					FlatIdent_94874 = 1;
				end
				if (1 == FlatIdent_94874) then
					v632.Name = "TimeTitle";
					v632.Size = UDim2.new(1, -(19 + 31), 0, 59 - 39);
					v632.Position = UDim2.new(0, 50, 0, 1 + 1);
					FlatIdent_94874 = 2;
				end
				if (FlatIdent_94874 == 3) then
					v632.Font = Enum.Font.GothamBold;
					v623 = 18 - 12;
					break;
				end
			end
		end
		if (v623 == (1501 - (1309 + 179))) then
			v642.ImageRectOffset = Vector2.new(192, 230 - 102);
			v642.Parent = v639;
			v643 = Instance.new("TextLabel");
			v643.Name = "ExecutorName";
			v643.Size = UDim2.new(1 + 0, -(134 - 84), 1 + 0, 0 - 0);
			v643.Position = UDim2.new(0 - 0, 659 - (295 + 314), 0, 0 - 0);
			v643.BackgroundTransparency = 1963 - (1300 + 662);
			v643.Text = v6;
			v643.TextColor3 = Color3.fromRGB(690 - 470, 1975 - (1178 + 577), 120 + 110);
			v643.Font = Enum.Font.GothamSemibold;
			v623 = 14;
		end
		if (v623 == (5 - 3)) then
			v627.Name = "TimeFrame";
			v627.Size = UDim2.new(1405.9 - (851 + 554), 0, 0 + 0, 138 - 88);
			v627.BackgroundColor3 = Color3.fromRGB(60, 130 - 70, 70);
			v627.BackgroundTransparency = 302.1 - (115 + 187);
			v628 = Instance.new("UICorner");
			v628.CornerRadius = UDim.new(0 + 0, 8);
			v628.Parent = v627;
			v629 = Instance.new("UIStroke");
			v629.Thickness = 2;
			v629.Color = Color3.fromRGB(80, 152 + 8, 255);
			v623 = 3;
		end
		if (v623 == (0 - 0)) then
			local FlatIdent_B6A2 = 0;
			while true do
				if (FlatIdent_B6A2 == 2) then
					v625 = Instance.new("ScrollingFrame");
					v625.Name = "InfoScroll";
					v625.Size = UDim2.new(359 - (237 + 121), -20, 898 - (525 + 372), -(37 - 17));
					FlatIdent_B6A2 = 3;
				end
				if (3 == FlatIdent_B6A2) then
					v625.Position = UDim2.new(0, 32 - 22, 0, 10);
					v623 = 143 - (96 + 46);
					break;
				end
				if (FlatIdent_B6A2 == 1) then
					v624.BackgroundTransparency = 1 - 0;
					v624.Visible = false;
					v624.Parent = v136;
					FlatIdent_B6A2 = 2;
				end
				if (FlatIdent_B6A2 == 0) then
					v624 = Instance.new("Frame");
					v624.Name = "InfoContainer";
					v624.Size = UDim2.new(1, 1161 - (160 + 1001), 1 + 0, 0 + 0);
					FlatIdent_B6A2 = 1;
				end
			end
		end
		if (v623 == (789 - (643 + 134))) then
			local FlatIdent_7B4B6 = 0;
			while true do
				if (1 == FlatIdent_7B4B6) then
					v642.Name = "ExecutorIcon";
					v642.Size = UDim2.new(0 - 0, 31 + 1, 0 - 0, 32);
					v642.Position = UDim2.new(0 - 0, 10, 719.5 - (316 + 403), -16);
					v642.BackgroundTransparency = 1 + 0;
					FlatIdent_7B4B6 = 2;
				end
				if (FlatIdent_7B4B6 == 0) then
					v641.Color = Color3.fromRGB(29 + 51, 160, 611 - 356);
					v641.Transparency = 0.2;
					v641.Parent = v639;
					v642 = Instance.new("ImageLabel");
					FlatIdent_7B4B6 = 1;
				end
				if (FlatIdent_7B4B6 == 2) then
					v642.Image = "rbxassetid://3926305904";
					v642.ImageRectSize = Vector2.new(175 - 111, 24 + 40);
					v623 = 32 - 19;
					break;
				end
			end
		end
		if (v623 == (1 + 0)) then
			local FlatIdent_1FCD6 = 0;
			while true do
				if (FlatIdent_1FCD6 == 2) then
					v626.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					v627 = Instance.new("Frame");
					v623 = 1 + 1;
					break;
				end
				if (FlatIdent_1FCD6 == 0) then
					v625.BackgroundTransparency = 1;
					v625.ScrollBarThickness = 6;
					v625.ScrollBarImageColor3 = Color3.fromRGB(100, 33 + 67, 110);
					v625.CanvasSize = UDim2.new(0, 0 - 0, 0 - 0, 350);
					FlatIdent_1FCD6 = 1;
				end
				if (FlatIdent_1FCD6 == 1) then
					v625.Parent = v624;
					v626 = Instance.new("UIListLayout");
					v626.Parent = v625;
					v626.Padding = UDim.new(0, 31 - 16);
					FlatIdent_1FCD6 = 2;
				end
			end
		end
		if (v623 == 14) then
			local FlatIdent_57893 = 0;
			while true do
				if (FlatIdent_57893 == 0) then
					v643.TextSize = 14;
					v643.TextStrokeTransparency = 0.7;
					v643.TextStrokeColor3 = Color3.fromRGB(0, 0 - 0, 0 + 0);
					v643.Parent = v639;
					FlatIdent_57893 = 1;
				end
				if (FlatIdent_57893 == 2) then
					v644.BackgroundTransparency = 2 - 1;
					v644.Text = "注入器";
					v623 = 4 + 11;
					break;
				end
				if (FlatIdent_57893 == 1) then
					v644 = Instance.new("TextLabel");
					v644.Name = "ExecutorTitle";
					v644.Size = UDim2.new(2 - 1, -50, 17 - (12 + 5), 77 - 57);
					v644.Position = UDim2.new(0, 106 - 56, 0, 3 - 1);
					FlatIdent_57893 = 2;
				end
			end
		end
		if (v623 == (1993 - (1656 + 317))) then
			local FlatIdent_91F32 = 0;
			while true do
				if (1 == FlatIdent_91F32) then
					v650.Parent = v645;
					v645.Parent = v625;
					FlatIdent_91F32 = 2;
				end
				if (FlatIdent_91F32 == 3) then
					v4.RenderStepped:Connect(function()
						v651();
					end);
					return v624;
				end
				if (FlatIdent_91F32 == 2) then
					v651 = nil;
					function v651()
						local v1149 = 0;
						while true do
							if (v1149 == (1 + 0)) then
								v643.Text = v6;
								v649.Text = string.format("脚本状态：正常运行\n游戏ID：%d\n玩家数量：%d", game.PlaceId, #v0:GetPlayers());
								break;
							end
							if (v1149 == 0) then
								local FlatIdent_67777 = 0;
								while true do
									if (0 == FlatIdent_67777) then
										v631.Text = v7();
										v637.Text = v1.Name;
										FlatIdent_67777 = 1;
									end
									if (FlatIdent_67777 == 1) then
										v1149 = 1;
										break;
									end
								end
							end
						end
					end
					FlatIdent_91F32 = 3;
				end
				if (FlatIdent_91F32 == 0) then
					v650.TextSize = 11 + 1;
					v650.TextXAlignment = Enum.TextXAlignment.Left;
					FlatIdent_91F32 = 1;
				end
			end
		end
		if ((29 - 18) == v623) then
			v639 = Instance.new("Frame");
			v639.Name = "ExecutorFrame";
			v639.Size = UDim2.new(0.9 - 0, 354 - (5 + 349), 0 - 0, 1321 - (266 + 1005));
			v639.BackgroundColor3 = Color3.fromRGB(40 + 20, 204 - 144, 70);
			v639.BackgroundTransparency = 0.1;
			v640 = Instance.new("UICorner");
			v640.CornerRadius = UDim.new(0 - 0, 1704 - (561 + 1135));
			v640.Parent = v639;
			v641 = Instance.new("UIStroke");
			v641.Thickness = 2 - 0;
			v623 = 12;
		end
		if (v623 == (19 - 13)) then
			local FlatIdent_75E0E = 0;
			while true do
				if (FlatIdent_75E0E == 0) then
					v632.TextSize = 1078 - (507 + 559);
					v632.TextXAlignment = Enum.TextXAlignment.Left;
					v632.Parent = v627;
					v627.Parent = v625;
					FlatIdent_75E0E = 1;
				end
				if (FlatIdent_75E0E == 1) then
					v633 = Instance.new("Frame");
					v633.Name = "PlayerFrame";
					v633.Size = UDim2.new(0.9, 0, 0 - 0, 154 - 104);
					v633.BackgroundColor3 = Color3.fromRGB(60, 448 - (212 + 176), 70);
					FlatIdent_75E0E = 2;
				end
				if (FlatIdent_75E0E == 2) then
					v633.BackgroundTransparency = 0.1;
					v634 = Instance.new("UICorner");
					v623 = 912 - (250 + 655);
					break;
				end
			end
		end
		if ((8 - 5) == v623) then
			v629.Transparency = 0.2;
			v629.Parent = v627;
			v630 = Instance.new("ImageLabel");
			v630.Name = "TimeIcon";
			v630.Size = UDim2.new(0 - 0, 49 - 17, 1956 - (1869 + 87), 32);
			v630.Position = UDim2.new(0 - 0, 1911 - (484 + 1417), 0.5 - 0, -16);
			v630.BackgroundTransparency = 1 - 0;
			v630.Image = "rbxassetid://3926305904";
			v630.ImageRectSize = Vector2.new(837 - (48 + 725), 103 - 39);
			v630.ImageRectOffset = Vector2.new(0, 1544 - 968);
			v623 = 3 + 1;
		end
		if (v623 == 19) then
			local FlatIdent_2D63C = 0;
			local v1073;
			while true do
				if (FlatIdent_2D63C == 0) then
					v1073 = 0;
					while true do
						if (v1073 == 2) then
							v650.BackgroundTransparency = 2 - 1;
							v650.Text = "系统状态";
							v650.TextColor3 = Color3.fromRGB(180, 200, 255);
							v1073 = 3;
						end
						if (v1073 == 3) then
							v650.Font = Enum.Font.GothamBold;
							v623 = 6 + 14;
							break;
						end
						if (v1073 == (1 + 0)) then
							local FlatIdent_3A1C6 = 0;
							while true do
								if (FlatIdent_3A1C6 == 1) then
									v650.Position = UDim2.new(895 - (557 + 338), 50, 0, 1 + 1);
									v1073 = 2;
									break;
								end
								if (0 == FlatIdent_3A1C6) then
									v650.Name = "StatusTitle";
									v650.Size = UDim2.new(1, -(903 - (152 + 701)), 1311 - (430 + 881), 8 + 12);
									FlatIdent_3A1C6 = 1;
								end
							end
						end
						if (v1073 == (0 - 0)) then
							local FlatIdent_28BB6 = 0;
							while true do
								if (FlatIdent_28BB6 == 0) then
									v649.TextYAlignment = Enum.TextYAlignment.Top;
									v649.Parent = v645;
									FlatIdent_28BB6 = 1;
								end
								if (1 == FlatIdent_28BB6) then
									v650 = Instance.new("TextLabel");
									v1073 = 1;
									break;
								end
							end
						end
					end
					break;
				end
			end
		end
		if (v623 == (31 - 22)) then
			local FlatIdent_2876F = 0;
			while true do
				if (FlatIdent_2876F == 1) then
					v637.Font = Enum.Font.GothamSemibold;
					v637.TextSize = 38 - 24;
					v637.TextStrokeTransparency = 0.7 - 0;
					FlatIdent_2876F = 2;
				end
				if (FlatIdent_2876F == 0) then
					v637.BackgroundTransparency = 2 - 1;
					v637.Text = v1.Name;
					v637.TextColor3 = Color3.fromRGB(474 - 254, 1021 - (499 + 302), 1096 - (39 + 827));
					FlatIdent_2876F = 1;
				end
				if (FlatIdent_2876F == 3) then
					v638.Name = "PlayerTitle";
					v623 = 10;
					break;
				end
				if (2 == FlatIdent_2876F) then
					v637.TextStrokeColor3 = Color3.fromRGB(0 - 0, 0 - 0, 0);
					v637.Parent = v633;
					v638 = Instance.new("TextLabel");
					FlatIdent_2876F = 3;
				end
			end
		end
		if (v623 == (2 + 16)) then
			local FlatIdent_15AD5 = 0;
			while true do
				if (FlatIdent_15AD5 == 2) then
					v649.TextSize = 2 + 10;
					v649.TextStrokeTransparency = 0.7 + 0;
					v649.TextStrokeColor3 = Color3.fromRGB(0, 1503 - (1395 + 108), 0);
					FlatIdent_15AD5 = 3;
				end
				if (0 == FlatIdent_15AD5) then
					v649.Size = UDim2.new(2 - 1, -50, 0, 10 + 50);
					v649.Position = UDim2.new(0, 79 - 29, 104 - (103 + 1), 564 - (475 + 79));
					v649.BackgroundTransparency = 2 - 1;
					FlatIdent_15AD5 = 1;
				end
				if (1 == FlatIdent_15AD5) then
					v649.Text = "脚本状态：正常运行\n游戏ID：" .. game.PlaceId .. "\n玩家数量：" .. #v0:GetPlayers();
					v649.TextColor3 = Color3.fromRGB(220, 220, 736 - 506);
					v649.Font = Enum.Font.GothamSemibold;
					FlatIdent_15AD5 = 2;
				end
				if (FlatIdent_15AD5 == 3) then
					v649.TextXAlignment = Enum.TextXAlignment.Left;
					v623 = 54 - 35;
					break;
				end
			end
		end
		if ((1212 - (7 + 1197)) == v623) then
			v636.Position = UDim2.new(0, 5 + 5, 0.5, -(6 + 10));
			v636.BackgroundTransparency = 320 - (27 + 292);
			v636.Image = "rbxassetid://3926305904";
			v636.ImageRectSize = Vector2.new(187 - 123, 80 - 16);
			v636.ImageRectOffset = Vector2.new(536 - 408, 504 - 248);
			v636.Parent = v633;
			v637 = Instance.new("TextLabel");
			v637.Name = "PlayerName";
			v637.Size = UDim2.new(1 - 0, -(189 - (43 + 96)), 4 - 3, 0 - 0);
			v637.Position = UDim2.new(0, 50, 0, 0);
			v623 = 8 + 1;
		end
	end
end
local function v158()
	local v652 = Instance.new("Frame");
	v652.Name = "OtherScriptsContainer";
	v652.Size = UDim2.new(1 + 0, 0, 1 - 0, 0 + 0);
	v652.BackgroundTransparency = 1 - 0;
	v652.Visible = false;
	v652.Parent = v136;
	local v658 = Instance.new("ScrollingFrame");
	v658.Name = "OtherScriptsScroll";
	v658.Size = UDim2.new(1 + 0, -(2 + 18), 1, -20);
	v658.Position = UDim2.new(1751 - (1414 + 337), 10, 1940 - (1642 + 298), 10);
	v658.BackgroundTransparency = 1;
	v658.ScrollBarThickness = 6;
	v658.ScrollBarImageColor3 = Color3.fromRGB(260 - 160, 100, 110);
	v658.CanvasSize = UDim2.new(0 - 0, 0 - 0, 0 + 0, 650);
	v658.Parent = v652;
	local v667 = Instance.new("UIListLayout");
	v667.Parent = v658;
	v667.Padding = UDim.new(0 + 0, 12);
	v667.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local v672 = Instance.new("TextButton");
	v672.Name = "VoidChinese99Night";
	v672.Size = UDim2.new(972.9 - (357 + 615), 0 + 0, 0, 98 - 58);
	v672.Text = "虚空汉化99夜";
	v672.BackgroundColor3 = Color3.fromRGB(52 + 8, 128 - 68, 56 + 14);
	v672.TextColor3 = Color3.new(1, 1 + 0, 1 + 0);
	v672.Font = Enum.Font.GothamSemibold;
	v672.TextSize = 1316 - (384 + 917);
	v672.TextStrokeTransparency = 697.5 - (128 + 569);
	v672.TextStrokeColor3 = Color3.fromRGB(0, 1543 - (1407 + 136), 1887 - (687 + 1200));
	v672.AutoButtonColor = false;
	local v684 = Instance.new("UIStroke");
	v684.Thickness = 1712 - (556 + 1154);
	v684.Color = Color3.fromRGB(281 - 201, 175 - (9 + 86), 511 - (275 + 146));
	v684.Transparency = 0.3 + 0;
	v684.Parent = v672;
	local v689 = Instance.new("UICorner");
	v689.CornerRadius = UDim.new(64 - (29 + 35), 35 - 27);
	v689.Parent = v672;
	local v692 = Color3.fromRGB(179 - 119, 264 - 204, 70);
	local v693 = false;
	v672.MouseEnter:Connect(function()
		if not v693 then
			v672.BackgroundColor3 = Color3.fromRGB(46 + 24, 1082 - (53 + 959), 80);
			v684.Color = Color3.fromRGB(498 - (312 + 96), 90, 173 - 73);
		end
	end);
	v672.MouseLeave:Connect(function()
		if not v693 then
			local FlatIdent_7FF98 = 0;
			local v1108;
			while true do
				if (FlatIdent_7FF98 == 0) then
					v1108 = 0;
					while true do
						if ((285 - (147 + 138)) == v1108) then
							v672.BackgroundColor3 = v692;
							v684.Color = Color3.fromRGB(979 - (813 + 86), 73 + 7, 90);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v672.MouseButton1Click:Connect(function()
		local v866 = 0;
		while true do
			if (v866 == (0 - 0)) then
				v693 = not v693;
				if v693 then
					v672.BackgroundColor3 = Color3.fromRGB(572 - (18 + 474), 54 + 106, 832 - 577);
					v684.Color = Color3.fromRGB(120, 200, 255);
					v672.Text = "虚空汉化99夜 ✓";
					local v1269 = pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/99%E5%A4%9C%E8%99%9A%E7%A9%BA.txt"))();
					end);
					if v1269 then
						v2:SetCore("SendNotification", {Title="XDG-HOB",Text="虚空汉化99夜脚本已加载",Duration=(1089 - (860 + 226)),Icon="rbxassetid://4483345998"});
					else
						local FlatIdent_8C7C9 = 0;
						local v1334;
						local v1335;
						while true do
							if (FlatIdent_8C7C9 == 1) then
								while true do
									if (v1334 == 0) then
										v1335 = 0 + 0;
										while true do
											if ((1242 - (988 + 252)) == v1335) then
												v672.Text = "虚空汉化99夜";
												break;
											end
											if (v1335 == (0 + 0)) then
												v2:SetCore("SendNotification", {Title="错误",Text="加载虚空汉化99夜脚本失败",Duration=(2 + 3),Icon="rbxassetid://4483345998"});
												v693 = false;
												v1335 = 1971 - (49 + 1921);
											end
											if (1 == v1335) then
												local FlatIdent_34A16 = 0;
												while true do
													if (FlatIdent_34A16 == 0) then
														v672.BackgroundColor3 = v692;
														v684.Color = Color3.fromRGB(970 - (223 + 667), 132 - (51 + 1), 154 - 64);
														FlatIdent_34A16 = 1;
													end
													if (FlatIdent_34A16 == 1) then
														v1335 = 3 - 1;
														break;
													end
												end
											end
										end
										break;
									end
								end
								break;
							end
							if (0 == FlatIdent_8C7C9) then
								v1334 = 303 - (121 + 182);
								v1335 = nil;
								FlatIdent_8C7C9 = 1;
							end
						end
					end
				else
					local FlatIdent_950AF = 0;
					local v1270;
					while true do
						if (FlatIdent_950AF == 0) then
							v1270 = 1125 - (146 + 979);
							while true do
								if (v1270 == (0 + 0)) then
									v672.BackgroundColor3 = v692;
									v684.Color = Color3.fromRGB(80, 685 - (311 + 294), 250 - 160);
									v1270 = 1 + 0;
								end
								if ((1444 - (496 + 947)) == v1270) then
									v672.Text = "虚空汉化99夜";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="虚空汉化99夜脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	v672.Parent = v658;
	local v695 = Instance.new("TextButton");
	v695.Name = "SkyboxBug";
	v695.Size = UDim2.new(1358.9 - (1233 + 125), 0 + 0, 0 + 0, 8 + 32);
	v695.Text = "天空盒子bug(只能在特定服务器使用)";
	v695.BackgroundColor3 = Color3.fromRGB(1705 - (963 + 682), 60, 70);
	v695.TextColor3 = Color3.new(1 + 0, 1, 1505 - (504 + 1000));
	v695.Font = Enum.Font.GothamSemibold;
	v695.TextSize = 9 + 4;
	v695.TextStrokeTransparency = 0.5;
	v695.TextStrokeColor3 = Color3.fromRGB(0 + 0, 0 + 0, 0);
	v695.AutoButtonColor = false;
	local v706 = Instance.new("UIStroke");
	v706.Thickness = 2 - 0;
	v706.Color = Color3.fromRGB(69 + 11, 47 + 33, 90);
	v706.Transparency = 182.3 - (156 + 26);
	v706.Parent = v695;
	local v711 = Instance.new("UICorner");
	v711.CornerRadius = UDim.new(0 + 0, 8);
	v711.Parent = v695;
	local v714 = Color3.fromRGB(60, 93 - 33, 234 - (149 + 15));
	local v715 = false;
	v695.MouseEnter:Connect(function()
		if not v715 then
			local FlatIdent_17A1A = 0;
			local v1109;
			while true do
				if (FlatIdent_17A1A == 0) then
					v1109 = 0;
					while true do
						if (v1109 == 0) then
							v695.BackgroundColor3 = Color3.fromRGB(1030 - (890 + 70), 187 - (39 + 78), 80);
							v706.Color = Color3.fromRGB(90, 572 - (14 + 468), 219 - 119);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v695.MouseLeave:Connect(function()
		if not v715 then
			local FlatIdent_2B679 = 0;
			while true do
				if (FlatIdent_2B679 == 0) then
					v695.BackgroundColor3 = v714;
					v706.Color = Color3.fromRGB(80, 223 - 143, 47 + 43);
					break;
				end
			end
		end
	end);
	v695.MouseButton1Click:Connect(function()
		v715 = not v715;
		if v715 then
			local FlatIdent_8417D = 0;
			local v1112;
			local v1113;
			while true do
				if (FlatIdent_8417D == 1) then
					while true do
						if (v1112 == (1 + 1)) then
							if v1113 then
								v2:SetCore("SendNotification", {Title="XDG-HOB",Text="天空盒子bug脚本已加载",Duration=(2 + 1),Icon="rbxassetid://4483345998"});
							else
								local v1336 = 0;
								local v1337;
								while true do
									if (v1336 == (0 + 0)) then
										v1337 = 0;
										while true do
											if (v1337 == (0 - 0)) then
												v2:SetCore("SendNotification", {Title="错误",Text="加载天空盒子bug脚本失败",Duration=(5 + 0),Icon="rbxassetid://4483345998"});
												v715 = false;
												v1337 = 3 - 2;
											end
											if (v1337 == 2) then
												v695.Text = "天空盒子bug(只能在特定服务器使用)";
												break;
											end
											if (v1337 == 1) then
												local FlatIdent_6E445 = 0;
												while true do
													if (FlatIdent_6E445 == 1) then
														v1337 = 2;
														break;
													end
													if (FlatIdent_6E445 == 0) then
														v695.BackgroundColor3 = v714;
														v706.Color = Color3.fromRGB(80, 80, 3 + 87);
														FlatIdent_6E445 = 1;
													end
												end
											end
										end
										break;
									end
								end
							end
							break;
						end
						if (v1112 == 1) then
							v695.Text = "天空盒子bug(只能在特定服务器使用) ✓";
							v1113 = pcall(function()
								loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Skybox-Brookhaven-61921"))();
							end);
							v1112 = 53 - (12 + 39);
						end
						if (v1112 == (0 + 0)) then
							v695.BackgroundColor3 = Color3.fromRGB(247 - 167, 569 - 409, 76 + 179);
							v706.Color = Color3.fromRGB(120, 106 + 94, 255);
							v1112 = 1;
						end
					end
					break;
				end
				if (FlatIdent_8417D == 0) then
					v1112 = 0 + 0;
					v1113 = nil;
					FlatIdent_8417D = 1;
				end
			end
		else
			local FlatIdent_81A83 = 0;
			while true do
				if (FlatIdent_81A83 == 1) then
					v695.Text = "天空盒子bug(只能在特定服务器使用)";
					v2:SetCore("SendNotification", {Title="XDG-HOB",Text="天空盒子bug脚本已卸载",Duration=(1713 - (1596 + 114)),Icon="rbxassetid://4483345998"});
					break;
				end
				if (FlatIdent_81A83 == 0) then
					v695.BackgroundColor3 = v714;
					v706.Color = Color3.fromRGB(202 - 122, 54 + 26, 434 - 344);
					FlatIdent_81A83 = 1;
				end
			end
		end
	end);
	v695.Parent = v658;
	local v717 = Instance.new("TextButton");
	v717.Name = "StealBrainRed";
	v717.Size = UDim2.new(0.9 - 0, 713 - (164 + 549), 1438 - (1059 + 379), 49 - 9);
	v717.Text = "偷走脑红";
	v717.BackgroundColor3 = Color3.fromRGB(32 + 28, 11 + 49, 462 - (145 + 247));
	v717.TextColor3 = Color3.new(1, 1 + 0, 1 + 0);
	v717.Font = Enum.Font.GothamSemibold;
	v717.TextSize = 15;
	v717.TextStrokeTransparency = 0.5 - 0;
	v717.TextStrokeColor3 = Color3.fromRGB(0 + 0, 0 + 0, 0 - 0);
	v717.AutoButtonColor = false;
	local v728 = Instance.new("UIStroke");
	v728.Thickness = 2;
	v728.Color = Color3.fromRGB(800 - (254 + 466), 640 - (544 + 16), 286 - 196);
	v728.Transparency = 0.3;
	v728.Parent = v717;
	local v733 = Instance.new("UICorner");
	v733.CornerRadius = UDim.new(0, 636 - (294 + 334));
	v733.Parent = v717;
	local v736 = Color3.fromRGB(313 - (236 + 17), 26 + 34, 70);
	local v737 = false;
	v717.MouseEnter:Connect(function()
		if not v737 then
			local v1117 = 0;
			while true do
				if (v1117 == (0 + 0)) then
					v717.BackgroundColor3 = Color3.fromRGB(263 - 193, 70, 378 - 298);
					v728.Color = Color3.fromRGB(90, 47 + 43, 83 + 17);
					break;
				end
			end
		end
	end);
	v717.MouseLeave:Connect(function()
		if not v737 then
			v717.BackgroundColor3 = v736;
			v728.Color = Color3.fromRGB(874 - (413 + 381), 80, 90);
		end
	end);
	v717.MouseButton1Click:Connect(function()
		local v867 = 0;
		while true do
			if (v867 == 0) then
				v737 = not v737;
				if v737 then
					local FlatIdent_74083 = 0;
					local v1278;
					local v1279;
					while true do
						if (FlatIdent_74083 == 1) then
							while true do
								if (v1278 == (1 + 0)) then
									local FlatIdent_9195A = 0;
									while true do
										if (FlatIdent_9195A == 1) then
											v1278 = 2;
											break;
										end
										if (0 == FlatIdent_9195A) then
											v717.Text = "偷走脑红 ✓";
											v1279 = pcall(function()
												loadstring(game:HttpGet("https://pastefy.app/AZeSJL5d/raw"))();
											end);
											FlatIdent_9195A = 1;
										end
									end
								end
								if ((3 - 1) == v1278) then
									if v1279 then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text="偷走脑红脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
									else
										local FlatIdent_CCAB = 0;
										while true do
											if (FlatIdent_CCAB == 1) then
												v717.BackgroundColor3 = v736;
												v728.Color = Color3.fromRGB(2050 - (582 + 1388), 136 - 56, 90);
												FlatIdent_CCAB = 2;
											end
											if (FlatIdent_CCAB == 2) then
												v717.Text = "偷走脑红";
												break;
											end
											if (FlatIdent_CCAB == 0) then
												v2:SetCore("SendNotification", {Title="错误",Text="加载偷走脑红脚本失败",Duration=(12 - 7),Icon="rbxassetid://4483345998"});
												v737 = false;
												FlatIdent_CCAB = 1;
											end
										end
									end
									break;
								end
								if (0 == v1278) then
									local FlatIdent_73680 = 0;
									while true do
										if (FlatIdent_73680 == 1) then
											v1278 = 1 + 0;
											break;
										end
										if (FlatIdent_73680 == 0) then
											v717.BackgroundColor3 = Color3.fromRGB(80, 115 + 45, 619 - (326 + 38));
											v728.Color = Color3.fromRGB(354 - 234, 285 - 85, 875 - (47 + 573));
											FlatIdent_73680 = 1;
										end
									end
								end
							end
							break;
						end
						if (FlatIdent_74083 == 0) then
							v1278 = 0;
							v1279 = nil;
							FlatIdent_74083 = 1;
						end
					end
				else
					local FlatIdent_50385 = 0;
					while true do
						if (FlatIdent_50385 == 1) then
							v717.Text = "偷走脑红";
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="偷走脑红脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
							break;
						end
						if (0 == FlatIdent_50385) then
							v717.BackgroundColor3 = v736;
							v728.Color = Color3.fromRGB(80, 339 - 259, 146 - 56);
							FlatIdent_50385 = 1;
						end
					end
				end
				break;
			end
		end
	end);
	v717.Parent = v658;
	local v739 = Instance.new("TextButton");
	v739.Name = "BfChineseScript";
	v739.Size = UDim2.new(1664.9 - (1269 + 395), 492 - (76 + 416), 443 - (319 + 124), 40);
	v739.Text = "Bf汉化脚本";
	v739.BackgroundColor3 = Color3.fromRGB(137 - 77, 1067 - (564 + 443), 193 - 123);
	v739.TextColor3 = Color3.new(1, 459 - (337 + 121), 2 - 1);
	v739.Font = Enum.Font.GothamSemibold;
	v739.TextSize = 15;
	v739.TextStrokeTransparency = 0.5 - 0;
	v739.TextStrokeColor3 = Color3.fromRGB(1911 - (1261 + 650), 0, 0 + 0);
	v739.AutoButtonColor = false;
	local v750 = Instance.new("UIStroke");
	v750.Thickness = 2;
	v750.Color = Color3.fromRGB(127 - 47, 80, 1907 - (772 + 1045));
	v750.Transparency = 0.3;
	v750.Parent = v739;
	local v755 = Instance.new("UICorner");
	v755.CornerRadius = UDim.new(0 + 0, 152 - (102 + 42));
	v755.Parent = v739;
	local v758 = Color3.fromRGB(60, 1904 - (1524 + 320), 1340 - (1049 + 221));
	local v759 = false;
	v739.MouseEnter:Connect(function()
		if not v759 then
			local FlatIdent_40F18 = 0;
			local v1120;
			while true do
				if (FlatIdent_40F18 == 0) then
					v1120 = 156 - (18 + 138);
					while true do
						if (v1120 == 0) then
							v739.BackgroundColor3 = Color3.fromRGB(171 - 101, 70, 80);
							v750.Color = Color3.fromRGB(1192 - (67 + 1035), 438 - (136 + 212), 100);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v739.MouseLeave:Connect(function()
		if not v759 then
			local v1121 = 0 - 0;
			local v1122;
			while true do
				if (v1121 == (0 + 0)) then
					v1122 = 0 + 0;
					while true do
						if (v1122 == (1604 - (240 + 1364))) then
							v739.BackgroundColor3 = v758;
							v750.Color = Color3.fromRGB(1162 - (1050 + 32), 285 - 205, 54 + 36);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v739.MouseButton1Click:Connect(function()
		local v868 = 0;
		while true do
			if ((1055 - (331 + 724)) == v868) then
				v759 = not v759;
				if v759 then
					local FlatIdent_898E8 = 0;
					local v1285;
					local v1286;
					while true do
						if (FlatIdent_898E8 == 0) then
							v1285 = 0;
							v1286 = nil;
							FlatIdent_898E8 = 1;
						end
						if (FlatIdent_898E8 == 1) then
							while true do
								if (v1285 == 0) then
									local FlatIdent_68113 = 0;
									while true do
										if (FlatIdent_68113 == 1) then
											v1285 = 1 - 0;
											break;
										end
										if (FlatIdent_68113 == 0) then
											v739.BackgroundColor3 = Color3.fromRGB(7 + 73, 804 - (269 + 375), 980 - (267 + 458));
											v750.Color = Color3.fromRGB(120, 63 + 137, 255);
											FlatIdent_68113 = 1;
										end
									end
								end
								if (v1285 == (820 - (667 + 151))) then
									if v1286 then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text="Bf汉化脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
									else
										local FlatIdent_6C782 = 0;
										local v1441;
										local v1442;
										while true do
											if (FlatIdent_6C782 == 1) then
												while true do
													if (v1441 == (1497 - (1410 + 87))) then
														v1442 = 1897 - (1504 + 393);
														while true do
															if (v1442 == 1) then
																v739.BackgroundColor3 = v758;
																v750.Color = Color3.fromRGB(216 - 136, 207 - 127, 90);
																v1442 = 798 - (461 + 335);
															end
															if ((0 + 0) == v1442) then
																local FlatIdent_89142 = 0;
																while true do
																	if (FlatIdent_89142 == 1) then
																		v1442 = 1762 - (1730 + 31);
																		break;
																	end
																	if (FlatIdent_89142 == 0) then
																		v2:SetCore("SendNotification", {Title="错误",Text="加载Bf汉化脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
																		v759 = false;
																		FlatIdent_89142 = 1;
																	end
																end
															end
															if (v1442 == 2) then
																v739.Text = "Bf汉化脚本";
																break;
															end
														end
														break;
													end
												end
												break;
											end
											if (FlatIdent_6C782 == 0) then
												v1441 = 0;
												v1442 = nil;
												FlatIdent_6C782 = 1;
											end
										end
									end
									break;
								end
								if (v1285 == (1668 - (728 + 939))) then
									local FlatIdent_1AD87 = 0;
									while true do
										if (FlatIdent_1AD87 == 1) then
											v1285 = 6 - 4;
											break;
										end
										if (FlatIdent_1AD87 == 0) then
											v739.Text = "Bf汉化脚本 ✓";
											v1286 = pcall(function()
												loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))();
											end);
											FlatIdent_1AD87 = 1;
										end
									end
								end
							end
							break;
						end
					end
				else
					local FlatIdent_4BE15 = 0;
					local v1287;
					while true do
						if (FlatIdent_4BE15 == 0) then
							v1287 = 0;
							while true do
								if (v1287 == (0 - 0)) then
									v739.BackgroundColor3 = v758;
									v750.Color = Color3.fromRGB(183 - 103, 1148 - (138 + 930), 83 + 7);
									v1287 = 1 + 0;
								end
								if (v1287 == (1 + 0)) then
									v739.Text = "Bf汉化脚本";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="Bf汉化脚本已卸载",Duration=(12 - 9),Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	v739.Parent = v658;
	local v761 = Instance.new("TextButton");
	v761.Name = "BackdoorExecutor";
	v761.Size = UDim2.new(1766.9 - (459 + 1307), 0, 1870 - (474 + 1396), 69 - 29);
	v761.Text = "后门执行器";
	v761.BackgroundColor3 = Color3.fromRGB(57 + 3, 1 + 59, 70);
	v761.TextColor3 = Color3.new(2 - 1, 1 + 0, 3 - 2);
	v761.Font = Enum.Font.GothamSemibold;
	v761.TextSize = 65 - 50;
	v761.TextStrokeTransparency = 591.5 - (562 + 29);
	v761.TextStrokeColor3 = Color3.fromRGB(0 + 0, 1419 - (374 + 1045), 0 + 0);
	v761.AutoButtonColor = false;
	local v772 = Instance.new("UIStroke");
	v772.Thickness = 2;
	v772.Color = Color3.fromRGB(80, 248 - 168, 728 - (448 + 190));
	v772.Transparency = 0.3 + 0;
	v772.Parent = v761;
	local v777 = Instance.new("UICorner");
	v777.CornerRadius = UDim.new(0, 8);
	v777.Parent = v761;
	local v780 = Color3.fromRGB(28 + 32, 40 + 20, 269 - 199);
	local v781 = false;
	v761.MouseEnter:Connect(function()
		if not v781 then
			local v1123 = 0;
			while true do
				if (v1123 == (0 - 0)) then
					v761.BackgroundColor3 = Color3.fromRGB(1564 - (1307 + 187), 277 - 207, 187 - 107);
					v772.Color = Color3.fromRGB(275 - 185, 773 - (232 + 451), 96 + 4);
					break;
				end
			end
		end
	end);
	v761.MouseLeave:Connect(function()
		if not v781 then
			local FlatIdent_3B79 = 0;
			while true do
				if (FlatIdent_3B79 == 0) then
					v761.BackgroundColor3 = v780;
					v772.Color = Color3.fromRGB(71 + 9, 644 - (510 + 54), 181 - 91);
					break;
				end
			end
		end
	end);
	v761.MouseButton1Click:Connect(function()
		local FlatIdent_33966 = 0;
		local v869;
		while true do
			if (0 == FlatIdent_33966) then
				v869 = 0;
				while true do
					if (v869 == (36 - (13 + 23))) then
						v781 = not v781;
						if v781 then
							local FlatIdent_3FB17 = 0;
							local v1293;
							while true do
								if (FlatIdent_3FB17 == 0) then
									v761.BackgroundColor3 = Color3.fromRGB(80, 160, 496 - 241);
									v772.Color = Color3.fromRGB(120, 200, 365 - 110);
									FlatIdent_3FB17 = 1;
								end
								if (FlatIdent_3FB17 == 1) then
									v761.Text = "后门执行器 ✓";
									v1293 = pcall(function()
										loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v6x/source.lua"))();
									end);
									FlatIdent_3FB17 = 2;
								end
								if (FlatIdent_3FB17 == 2) then
									if v1293 then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text="后门执行器脚本已加载",Duration=(4 - 1),Icon="rbxassetid://4483345998"});
									else
										v2:SetCore("SendNotification", {Title="错误",Text="加载后门执行器脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
										v781 = false;
										v761.BackgroundColor3 = v780;
										v772.Color = Color3.fromRGB(80, 80, 1178 - (830 + 258));
										v761.Text = "后门执行器";
									end
									break;
								end
							end
						else
							local FlatIdent_7EB60 = 0;
							local v1294;
							while true do
								if (FlatIdent_7EB60 == 0) then
									v1294 = 0 - 0;
									while true do
										if (v1294 == (0 + 0)) then
											v761.BackgroundColor3 = v780;
											v772.Color = Color3.fromRGB(69 + 11, 1521 - (860 + 581), 331 - 241);
											v1294 = 1;
										end
										if (v1294 == 1) then
											v761.Text = "后门执行器";
											v2:SetCore("SendNotification", {Title="XDG-HOB",Text="后门执行器脚本已卸载",Duration=(3 + 0),Icon="rbxassetid://4483345998"});
											break;
										end
									end
									break;
								end
							end
						end
						break;
					end
				end
				break;
			end
		end
	end);
	v761.Parent = v658;
	local v783 = Instance.new("TextButton");
	v783.Name = "SkinScript";
	v783.Size = UDim2.new(0.9, 241 - (237 + 4), 0 - 0, 101 - 61);
	v783.Text = "皮脚本";
	v783.BackgroundColor3 = Color3.fromRGB(60, 113 - 53, 70);
	v783.TextColor3 = Color3.new(1 + 0, 1, 1 + 0);
	v783.Font = Enum.Font.GothamSemibold;
	v783.TextSize = 56 - 41;
	v783.TextStrokeTransparency = 0.5;
	v783.TextStrokeColor3 = Color3.fromRGB(0, 0 + 0, 0 + 0);
	v783.AutoButtonColor = false;
	local v794 = Instance.new("UIStroke");
	v794.Thickness = 1428 - (85 + 1341);
	v794.Color = Color3.fromRGB(136 - 56, 225 - 145, 90);
	v794.Transparency = 372.3 - (45 + 327);
	v794.Parent = v783;
	local v799 = Instance.new("UICorner");
	v799.CornerRadius = UDim.new(0 - 0, 510 - (444 + 58));
	v799.Parent = v783;
	local v802 = Color3.fromRGB(27 + 33, 11 + 49, 70);
	local v803 = false;
	v783.MouseEnter:Connect(function()
		if not v803 then
			local v1126 = 0 + 0;
			while true do
				if (v1126 == (0 - 0)) then
					v783.BackgroundColor3 = Color3.fromRGB(70, 1802 - (64 + 1668), 2053 - (1227 + 746));
					v794.Color = Color3.fromRGB(276 - 186, 90, 185 - 85);
					break;
				end
			end
		end
	end);
	v783.MouseLeave:Connect(function()
		if not v803 then
			local FlatIdent_2B80F = 0;
			local v1127;
			while true do
				if (FlatIdent_2B80F == 0) then
					v1127 = 0;
					while true do
						if (v1127 == (494 - (415 + 79))) then
							v783.BackgroundColor3 = v802;
							v794.Color = Color3.fromRGB(3 + 77, 80, 90);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v783.MouseButton1Click:Connect(function()
		local FlatIdent_62B5E = 0;
		local v870;
		local v871;
		while true do
			if (FlatIdent_62B5E == 1) then
				while true do
					if (v870 == 0) then
						v871 = 491 - (142 + 349);
						while true do
							if ((0 + 0) == v871) then
								v803 = not v803;
								if v803 then
									local FlatIdent_3B5FD = 0;
									local v1398;
									local v1399;
									while true do
										if (1 == FlatIdent_3B5FD) then
											while true do
												if (v1398 == (1 - 0)) then
													v783.Text = "皮脚本 ✓";
													v1399 = pcall(function()
														loadstring(game:HttpGet("https://raw.githubusercontent.com/xiao122231/xiao122231/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3"))();
													end);
													v1398 = 1 + 1;
												end
												if (v1398 == 2) then
													if v1399 then
														v2:SetCore("SendNotification", {Title="XDG-HOB",Text="皮脚本已加载",Duration=3,Icon="rbxassetid://4483345998"});
													else
														local FlatIdent_87256 = 0;
														while true do
															if (FlatIdent_87256 == 0) then
																v2:SetCore("SendNotification", {Title="错误",Text="加载皮脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
																v803 = false;
																FlatIdent_87256 = 1;
															end
															if (FlatIdent_87256 == 1) then
																v783.BackgroundColor3 = v802;
																v794.Color = Color3.fromRGB(80, 57 + 23, 245 - 155);
																FlatIdent_87256 = 2;
															end
															if (FlatIdent_87256 == 2) then
																v783.Text = "皮脚本";
																break;
															end
														end
													end
													break;
												end
												if (v1398 == 0) then
													local FlatIdent_7DA5D = 0;
													while true do
														if (FlatIdent_7DA5D == 0) then
															v783.BackgroundColor3 = Color3.fromRGB(1944 - (1710 + 154), 478 - (200 + 118), 102 + 153);
															v794.Color = Color3.fromRGB(209 - 89, 200, 255);
															FlatIdent_7DA5D = 1;
														end
														if (1 == FlatIdent_7DA5D) then
															v1398 = 1;
															break;
														end
													end
												end
											end
											break;
										end
										if (FlatIdent_3B5FD == 0) then
											v1398 = 0;
											v1399 = nil;
											FlatIdent_3B5FD = 1;
										end
									end
								else
									local FlatIdent_21D3 = 0;
									while true do
										if (FlatIdent_21D3 == 0) then
											v783.BackgroundColor3 = v802;
											v794.Color = Color3.fromRGB(118 - 38, 72 + 8, 90 + 0);
											FlatIdent_21D3 = 1;
										end
										if (FlatIdent_21D3 == 1) then
											v783.Text = "皮脚本";
											v2:SetCore("SendNotification", {Title="XDG-HOB",Text="皮脚本已卸载",Duration=3,Icon="rbxassetid://4483345998"});
											break;
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
			if (FlatIdent_62B5E == 0) then
				v870 = 0;
				v871 = nil;
				FlatIdent_62B5E = 1;
			end
		end
	end);
	v783.Parent = v658;
	return v652;
end
local function v159(v805, v806)
	local v807 = Instance.new("TextButton");
	v807.Name = v805;
	v807.Size = UDim2.new(0 + 0, 100, 0 + 0, 73 - 39);
	v807.Text = v805;
	v807.BackgroundColor3 = Color3.fromRGB(1300 - (363 + 887), 87 - 37, 285 - 225);
	v807.TextColor3 = Color3.new(1 + 0, 2 - 1, 1 + 0);
	v807.Font = Enum.Font.GothamSemibold;
	v807.TextSize = 1677 - (674 + 990);
	v807.TextStrokeTransparency = 0.5 + 0;
	v807.TextStrokeColor3 = Color3.fromRGB(0, 0 + 0, 0 - 0);
	v807.MouseButton1Click:Connect(function()
		local v872 = 1055 - (507 + 548);
		local v873;
		while true do
			if (v872 == (837 - (289 + 548))) then
				v873 = 0;
				while true do
					if (1 == v873) then
						v807.BackgroundColor3 = Color3.fromRGB(80, 160, 2073 - (821 + 997));
						v807.BorderSizePixel = 257 - (195 + 60);
						v873 = 1 + 1;
					end
					if (v873 == (1503 - (251 + 1250))) then
						v807.BorderColor3 = Color3.fromRGB(747 - 492, 176 + 79, 1287 - (809 + 223));
						for v1341, v1342 in ipairs(v135) do
							v1342.Visible = v1341 == v806;
						end
						break;
					end
					if (v873 == 0) then
						local FlatIdent_2444E = 0;
						while true do
							if (FlatIdent_2444E == 0) then
								v134 = v806;
								for v1344, v1345 in pairs(v122:GetChildren()) do
									if v1345:IsA("TextButton") then
										local v1417 = 0 - 0;
										while true do
											if (v1417 == 0) then
												v1345.BackgroundColor3 = Color3.fromRGB(150 - 100, 165 - 115, 45 + 15);
												v1345.BorderSizePixel = 0 + 0;
												break;
											end
										end
									end
								end
								FlatIdent_2444E = 1;
							end
							if (1 == FlatIdent_2444E) then
								v873 = 1;
								break;
							end
						end
					end
				end
				break;
			end
		end
	end);
	if (v806 == v134) then
		local v874 = 617 - (14 + 603);
		while true do
			if (v874 == 0) then
				v807.BackgroundColor3 = Color3.fromRGB(80, 160, 384 - (118 + 11));
				v807.BorderSizePixel = 1 + 1;
				v874 = 1 + 0;
			end
			if (v874 == (2 - 1)) then
				v807.BorderColor3 = Color3.fromRGB(1204 - (551 + 398), 162 + 93, 91 + 164);
				break;
			end
		end
	end
	local v818 = Instance.new("UIStroke");
	v818.Thickness = 1 + 0;
	v818.Color = Color3.fromRGB(70, 260 - 190, 184 - 104);
	v818.Transparency = 0.3 + 0;
	v818.Parent = v807;
	v807.MouseEnter:Connect(function()
		if (v807.BackgroundColor3 ~= Color3.fromRGB(317 - 237, 45 + 115, 255)) then
			v807.BackgroundColor3 = Color3.fromRGB(149 - (40 + 49), 228 - 168, 560 - (99 + 391));
		end
	end);
	v807.MouseLeave:Connect(function()
		if (v807.BackgroundColor3 ~= Color3.fromRGB(67 + 13, 160, 255)) then
			v807.BackgroundColor3 = Color3.fromRGB(50, 219 - 169, 148 - 88);
		end
	end);
	v807.Parent = v122;
end
for v824, v825 in ipairs(v133) do
	v159(v825, v824);
end
table.insert(v135, v155());
table.insert(v135, v156());
table.insert(v135, v157());
table.insert(v135, v158());
v13.Visible = true;
v74.Visible = true;
local v162 = true;
local v163 = false;
local v164;
local v165;
local v166 = false;
local v167;
local v168;
local function v169(v826)
	if v163 then
		local FlatIdent_347D3 = 0;
		local v875;
		local v876;
		local v877;
		local v878;
		local v879;
		local v880;
		while true do
			if (FlatIdent_347D3 == 2) then
				v879 = nil;
				v880 = nil;
				FlatIdent_347D3 = 3;
			end
			if (FlatIdent_347D3 == 3) then
				while true do
					if (v875 == (0 - 0)) then
						local v1158 = 1604 - (1032 + 572);
						while true do
							if ((418 - (203 + 214)) == v1158) then
								v875 = 1;
								break;
							end
							if (v1158 == 0) then
								local FlatIdent_24E4B = 0;
								while true do
									if (FlatIdent_24E4B == 0) then
										v876 = v826.Position - v164;
										v877 = workspace.CurrentCamera.ViewportSize;
										FlatIdent_24E4B = 1;
									end
									if (FlatIdent_24E4B == 1) then
										v1158 = 1;
										break;
									end
								end
							end
						end
					end
					if (v875 == (1819 - (568 + 1249))) then
						v880 = math.clamp(v165.Y + v876.Y, 0, v877.Y - v878.Y);
						v13.Position = UDim2.new(0 + 0, v879, 0, v880);
						break;
					end
					if (v875 == 1) then
						v878 = v13.AbsoluteSize;
						v879 = math.clamp(v165.X + v876.X, 0, v877.X - v878.X);
						v875 = 4 - 2;
					end
				end
				break;
			end
			if (FlatIdent_347D3 == 1) then
				v877 = nil;
				v878 = nil;
				FlatIdent_347D3 = 2;
			end
			if (FlatIdent_347D3 == 0) then
				v875 = 0 + 0;
				v876 = nil;
				FlatIdent_347D3 = 1;
			end
		end
	end
end
local function v170(v827)
	if v166 then
		local FlatIdent_72C32 = 0;
		local v881;
		local v882;
		local v883;
		local v884;
		local v885;
		local v886;
		while true do
			if (FlatIdent_72C32 == 3) then
				while true do
					if (v881 == (1306 - (913 + 393))) then
						local FlatIdent_3176A = 0;
						local v1161;
						while true do
							if (FlatIdent_3176A == 0) then
								v1161 = 0;
								while true do
									if (v1161 == 0) then
										local FlatIdent_5D3C0 = 0;
										while true do
											if (FlatIdent_5D3C0 == 0) then
												v882 = v827.Position - v167;
												v883 = workspace.CurrentCamera.ViewportSize;
												FlatIdent_5D3C0 = 1;
											end
											if (FlatIdent_5D3C0 == 1) then
												v1161 = 2 - 1;
												break;
											end
										end
									end
									if (v1161 == (1 - 0)) then
										v881 = 1;
										break;
									end
								end
								break;
							end
						end
					end
					if (v881 == (411 - (269 + 141))) then
						local FlatIdent_21608 = 0;
						while true do
							if (FlatIdent_21608 == 0) then
								v884 = v74.AbsoluteSize;
								v885 = math.clamp(v168.X + v882.X, 0 - 0, v883.X - v884.X);
								FlatIdent_21608 = 1;
							end
							if (FlatIdent_21608 == 1) then
								v881 = 1983 - (362 + 1619);
								break;
							end
						end
					end
					if (v881 == 2) then
						v886 = math.clamp(v168.Y + v882.Y, 0, v883.Y - v884.Y);
						v74.Position = UDim2.new(1625 - (950 + 675), v885, 0 + 0, v886);
						break;
					end
				end
				break;
			end
			if (FlatIdent_72C32 == 0) then
				v881 = 0 - 0;
				v882 = nil;
				FlatIdent_72C32 = 1;
			end
			if (FlatIdent_72C32 == 2) then
				v885 = nil;
				v886 = nil;
				FlatIdent_72C32 = 3;
			end
			if (FlatIdent_72C32 == 1) then
				v883 = nil;
				v884 = nil;
				FlatIdent_72C32 = 2;
			end
		end
	end
end
v48.InputBegan:Connect(function(v828)
	if ((v828.UserInputType == Enum.UserInputType.MouseButton1) or (v828.UserInputType == Enum.UserInputType.Touch)) then
		local FlatIdent_89852 = 0;
		local v887;
		while true do
			if (FlatIdent_89852 == 0) then
				v887 = 1179 - (216 + 963);
				while true do
					if (v887 == 1) then
						v165 = Vector2.new(v13.Position.X.Offset, v13.Position.Y.Offset);
						break;
					end
					if (v887 == 0) then
						local FlatIdent_96D1F = 0;
						while true do
							if (FlatIdent_96D1F == 0) then
								v163 = true;
								v164 = v828.Position;
								FlatIdent_96D1F = 1;
							end
							if (FlatIdent_96D1F == 1) then
								v887 = 1288 - (485 + 802);
								break;
							end
						end
					end
				end
				break;
			end
		end
	end
end);
v48.InputEnded:Connect(function(v829)
	if ((v829.UserInputType == Enum.UserInputType.MouseButton1) or (v829.UserInputType == Enum.UserInputType.Touch)) then
		v163 = false;
	end
end);
v74.InputBegan:Connect(function(v830)
	if ((v830.UserInputType == Enum.UserInputType.MouseButton1) or (v830.UserInputType == Enum.UserInputType.Touch)) then
		local FlatIdent_8D07A = 0;
		local v888;
		while true do
			if (FlatIdent_8D07A == 0) then
				v888 = 559 - (432 + 127);
				while true do
					if (v888 == 1) then
						v168 = Vector2.new(v74.Position.X.Offset, v74.Position.Y.Offset);
						break;
					end
					if (v888 == 0) then
						local FlatIdent_722D2 = 0;
						while true do
							if (FlatIdent_722D2 == 1) then
								v888 = 1074 - (1065 + 8);
								break;
							end
							if (FlatIdent_722D2 == 0) then
								v166 = true;
								v167 = v830.Position;
								FlatIdent_722D2 = 1;
							end
						end
					end
				end
				break;
			end
		end
	end
end);
v74.InputEnded:Connect(function(v831)
	if ((v831.UserInputType == Enum.UserInputType.MouseButton1) or (v831.UserInputType == Enum.UserInputType.Touch)) then
		local FlatIdent_11EF5 = 0;
		local v889;
		while true do
			if (FlatIdent_11EF5 == 0) then
				v889 = 0 + 0;
				while true do
					if (v889 == (1601 - (635 + 966))) then
						if v166 then
							local FlatIdent_F5A6 = 0;
							local v1315;
							local v1316;
							while true do
								if (FlatIdent_F5A6 == 1) then
									while true do
										if (v1315 == (0 + 0)) then
											v1316 = (v831.Position - v167).Magnitude;
											if (v1316 < (47 - (5 + 37))) then
												local FlatIdent_60372 = 0;
												local v1448;
												local v1449;
												while true do
													if (FlatIdent_60372 == 0) then
														v1448 = 0;
														v1449 = nil;
														FlatIdent_60372 = 1;
													end
													if (FlatIdent_60372 == 1) then
														while true do
															if (v1448 == (0 - 0)) then
																v1449 = 0;
																while true do
																	if (0 == v1449) then
																		v162 = not v162;
																		v13.Visible = v162;
																		break;
																	end
																end
																break;
															end
														end
														break;
													end
												end
											end
											break;
										end
									end
									break;
								end
								if (FlatIdent_F5A6 == 0) then
									v1315 = 0;
									v1316 = nil;
									FlatIdent_F5A6 = 1;
								end
							end
						end
						v166 = false;
						break;
					end
				end
				break;
			end
		end
	end
end);
v3.InputChanged:Connect(function(v832)
	if ((v832.UserInputType == Enum.UserInputType.MouseMovement) or (v832.UserInputType == Enum.UserInputType.Touch)) then
		if v163 then
			v169(v832);
		elseif v166 then
			v170(v832);
		end
	end
end);
v74.MouseEnter:Connect(function()
	v74.BackgroundColor3 = Color3.fromRGB(38 + 52, 269 - 99, 255);
end);
v74.MouseLeave:Connect(function()
	v74.BackgroundColor3 = Color3.fromRGB(33 + 37, 145, 529 - 274);
end);
local v171 = {Color3.fromRGB(255, 188 - 88, 100),Color3.fromRGB(184 + 71, 709 - (318 + 211), 492 - 392),Color3.fromRGB(1842 - (963 + 624), 109 + 146, 946 - (518 + 328)),Color3.fromRGB(419 - 239, 407 - 152, 417 - (301 + 16)),Color3.fromRGB(280 - 180, 574 - 354, 231 + 24),Color3.fromRGB(384 - 204, 61 + 39, 25 + 230),Color3.fromRGB(83 + 172, 1119 - (829 + 190), 220)};
local v172 = 1;
v4.RenderStepped:Connect(function(v835)
	local FlatIdent_2DF26 = 0;
	local v836;
	local v837;
	local v838;
	local v839;
	while true do
		if (FlatIdent_2DF26 == 2) then
			while true do
				if (v836 == 0) then
					local FlatIdent_73A64 = 0;
					while true do
						if (0 == FlatIdent_73A64) then
							v172 = (v172 + (v835 * (2 - 0))) % #v171;
							v837 = v171[math.floor(v172) + (1 - 0)];
							FlatIdent_73A64 = 1;
						end
						if (FlatIdent_73A64 == 1) then
							v836 = 1;
							break;
						end
					end
				end
				if (v836 == (4 - 2)) then
					v61.TextColor3 = v837:Lerp(v838, v839);
					break;
				end
				if (1 == v836) then
					local FlatIdent_1C72A = 0;
					while true do
						if (1 == FlatIdent_1C72A) then
							v836 = 5 - 3;
							break;
						end
						if (FlatIdent_1C72A == 0) then
							v838 = v171[((math.floor(v172) + 1) % #v171) + 1 + 0];
							v839 = v172 % (1 + 0);
							FlatIdent_1C72A = 1;
						end
					end
				end
			end
			break;
		end
		if (FlatIdent_2DF26 == 0) then
			v836 = 0 - 0;
			v837 = nil;
			FlatIdent_2DF26 = 1;
		end
		if (FlatIdent_2DF26 == 1) then
			v838 = nil;
			v839 = nil;
			FlatIdent_2DF26 = 2;
		end
	end
end);
print("XDG-HOB UI 创建完成");