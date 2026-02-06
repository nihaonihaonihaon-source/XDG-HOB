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
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
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
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
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
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local v0 = game:GetService("Players");
local v1 = v0.LocalPlayer;
local v2 = game:GetService("StarterGui");
local v3 = game:GetService("UserInputService");
local v4 = game:GetService("RunService");
v2:SetCore("SendNotification", {Title="XDG-HOB",Text="欢迎使用XDG-HOB",Duration=(1 + 4 + 0)});
print("欢迎使用XDG-HOB");
task.wait(0.5 + 0 + (849 - (410 + 439)));
local function v5()
	local v167 = 0 - 0;
	local v168;
	local v169;
	while true do
		if (v167 == (1 + 0)) then
			while true do
				local v804 = 0 - 0;
				local v805;
				while true do
					if (v804 == (0 - 0)) then
						v805 = (2581 - (322 + 905)) - (243 + 1111);
						while true do
							if (v805 == (611 - (602 + 9))) then
								if (v168 == (1189 - (449 + 740))) then
									local v1185 = 872 - (826 + 46);
									while true do
										if (v1185 == (948 - (245 + 702))) then
											v168 = 3 - 2;
											break;
										end
										if (v1185 == (0 + 0)) then
											v169 = {["Synapse X"]=function()
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
											for v1280, v1281 in pairs(v169) do
												local v1282 = 1898 - (260 + 1638);
												local v1283;
												local v1284;
												local v1285;
												local v1286;
												while true do
													if (v1282 == (442 - (382 + 58))) then
														while true do
															if (v1283 == ((3 - 2) + 0 + 0)) then
																v1286 = nil;
																while true do
																	if (v1284 == ((326 - 168) - ((270 - 179) + (1272 - (902 + 303))))) then
																		v1285, v1286 = pcall(v1281);
																		if (v1285 and v1286) then
																			return v1280;
																		end
																		break;
																	end
																end
																break;
															end
															if (v1283 == (0 - 0)) then
																v1284 = (0 - 0) - 0;
																v1285 = nil;
																v1283 = 1 + 0 + (1690 - (1121 + 569));
															end
														end
														break;
													end
													if (v1282 == 0) then
														v1283 = 214 - (22 + 192);
														v1284 = nil;
														v1282 = 1;
													end
													if (v1282 == (684 - (483 + 200))) then
														v1285 = nil;
														v1286 = nil;
														v1282 = 2;
													end
												end
											end
											v1185 = 1464 - (1404 + 59);
										end
									end
								end
								if (v168 == (524 - ((1157 - 734) + (134 - 34)))) then
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
		if (v167 == 0) then
			v168 = (2362 - (468 + 297)) - (978 + (1181 - (334 + 228)));
			v169 = nil;
			v167 = 3 - 2;
		end
	end
end
local v6 = v5();
local function v7()
	local v170 = 0 - 0;
	local v171;
	local v172;
	local v173;
	local v174;
	local v175;
	while true do
		if (v170 == (0 - 0)) then
			v171 = 0 + 0 + (236 - (141 + 95));
			v172 = nil;
			v170 = 1;
		end
		if (v170 == 1) then
			v173 = nil;
			v174 = nil;
			v170 = 2 + 0;
		end
		if (v170 == (4 - 2)) then
			v175 = nil;
			while true do
				local v806 = 0 - 0;
				local v807;
				while true do
					if (v806 == (0 + 0)) then
						v807 = (0 - 0) - (0 + 0);
						while true do
							if ((0 + 0 + (0 - 0)) == v807) then
								local v1122 = 0 + 0;
								while true do
									if (v1122 == 0) then
										if (v171 == (165 - (92 + 71))) then
											return string.format("%04d年%02d月%02d日 %02d:%02d:%02d", v175.year, v175.month, v175.day, v175.hour, v175.min, v175.sec);
										end
										if (v171 == (1 + 0)) then
											local v1258 = (1295 - 524) - ((1091 - (574 + 191)) + 445);
											while true do
												if (v1258 == (0 - (0 + 0))) then
													local v1307 = 0 - 0;
													while true do
														if (v1307 == (1 + 0)) then
															v1258 = (851 - (254 + 595)) - (127 - (55 + 71));
															break;
														end
														if (0 == v1307) then
															v174 = os.time(v172) + v173;
															v175 = os.date("*t", v174);
															v1307 = 1 - 0;
														end
													end
												end
												if ((2 - (1791 - (573 + 1217))) == v1258) then
													v171 = 5 - 3;
													break;
												end
											end
										end
										v1122 = 1 + 0;
									end
									if (v1122 == (1 - 0)) then
										v807 = 712 - ((1469 - (714 + 225)) + (528 - 347));
										break;
									end
								end
							end
							if (v807 == (882 - ((855 - 241) + 29 + 238))) then
								if (((45 - 13) - ((825 - (118 + 688)) + (61 - (25 + 23)))) == v171) then
									local v1186 = 0 + 0;
									while true do
										if (v1186 == 0) then
											v172 = os.date("!*t");
											v173 = (12 - 4) * ((10275 - (927 + 959)) - (16143 - 11354));
											v1186 = 1;
										end
										if (v1186 == (733 - (16 + 716))) then
											v171 = (3 - 1) - (98 - (11 + 86));
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
			break;
		end
	end
end
local v8 = {};
do
	local v176 = game:GetService("Players").LocalPlayer;
	local v177 = v176.Character or v176.CharacterAdded:Wait();
	local v178 = v177:WaitForChild("Humanoid");
	local v179 = v178.WalkSpeed;
	local v180 = v179;
	local v181 = false;
	local v182;
	local function v183()
		return v180;
	end
	local function v184(v609)
		local v610 = 0 - 0;
		local v611;
		while true do
			if (v610 == (285 - (175 + 110))) then
				v611 = 0;
				while true do
					if (v611 == ((0 - 0) + (0 - 0))) then
						v180 = v609;
						if not v181 then
							local v1046 = (1796 - (503 + 1293)) - (0 - 0);
							local v1047;
							while true do
								if (v1046 == (0 - (0 + 0))) then
									v1047 = (2873 - (810 + 251)) - (898 + 395 + 160 + 359);
									while true do
										if (v1047 == 0) then
											v181 = true;
											task.spawn(function()
												local v1287 = (0 + 0) - (533 - (43 + 490));
												local v1288;
												while true do
													if (v1287 == (0 - (733 - (711 + 22)))) then
														local v1322 = (0 - 0) - (859 - (240 + 619));
														while true do
															if (v1322 == (1 + 0)) then
																v1287 = (5 - 1) - 3;
																break;
															end
															if (v1322 == ((0 + 0) - 0)) then
																local v1353 = 1744 - (1344 + 400);
																while true do
																	if (v1353 == 1) then
																		v1322 = 2 - (406 - (255 + 150));
																		break;
																	end
																	if (v1353 == (0 + 0)) then
																		v1288 = math.random(10, 16 + 8 + 6) / ((89 - 68) + (254 - 175));
																		task.wait(v1288);
																		v1353 = 1;
																	end
																end
															end
														end
													end
													if (v1287 == ((1740 - (404 + 1335)) + (406 - (183 + 223)))) then
														if (v178 and v178.Parent) then
															v178.WalkSpeed = v180;
														end
														v181 = false;
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
						break;
					end
				end
				break;
			end
		end
	end
	local function v185()
		if v182 then
			v182:Disconnect();
		end
		v182 = game:GetService("RunService").Heartbeat:Connect(function()
			if (v178 and v178.Parent) then
				local v808 = 0 - 0;
				local v809;
				local v810;
				while true do
					if (v808 == (1 + 0)) then
						if (math.abs(v809 - v810) > (0.1 + 0)) then
							local v1048 = (337 - (10 + 327)) + 0 + 0;
							local v1049;
							while true do
								if (((338 - (118 + 220)) + 0 + 0) == v1048) then
									v1049 = math.sign(v810 - v809) * math.min(math.abs(v810 - v809), 451 - (108 + 341));
									v178.WalkSpeed = v809 + v1049;
									break;
								end
							end
						end
						break;
					end
					if (v808 == 0) then
						local v1003 = 0 + 0;
						while true do
							if (v1003 == (0 - 0)) then
								v809 = v178.WalkSpeed;
								v810 = v183();
								v1003 = 1494 - (711 + 782);
							end
							if (v1003 == (1 - 0)) then
								v808 = 1;
								break;
							end
						end
					end
				end
			end
		end);
	end
	local function v186()
		local v612 = 469 - (270 + 199);
		local v613;
		local v614;
		local v615;
		while true do
			if (v612 == (1096 - (230 + 479 + (2206 - (580 + 1239))))) then
				local v811 = 0;
				local v812;
				while true do
					if (v811 == 0) then
						v812 = (5523 - 3665) - (644 + 29 + 43 + 1142);
						while true do
							if (v812 == (0 + 0)) then
								v613 = {__index=function(v1146, v1147)
									local v1148 = 0 - 0;
									local v1149;
									local v1150;
									while true do
										if (v1148 == (0 + 0)) then
											v1149 = 0;
											v1150 = nil;
											v1148 = 1;
										end
										if (v1148 == 1) then
											while true do
												if (v1149 == ((1167 - (645 + 522)) - (1790 - (1010 + 780)))) then
													v1150 = 0;
													while true do
														if (v1150 == (0 + 0)) then
															local v1332 = 0;
															while true do
																if (v1332 == (0 - 0)) then
																	if (v1147 == "WalkSpeed") then
																		return v183();
																	end
																	return v178[v1147];
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
								end,__newindex=function(v1151, v1152, v1153)
									if (v1152 == "WalkSpeed") then
										local v1233 = 0;
										while true do
											if (v1233 == 0) then
												local v1289 = 0 - 0;
												local v1290;
												while true do
													if (v1289 == (1836 - (1045 + 791))) then
														v1290 = (0 - 0) - (0 - 0);
														while true do
															if (v1290 == (505 - (351 + 154))) then
																local v1354 = 0;
																while true do
																	if (v1354 == (1574 - (1281 + 293))) then
																		v184(v1153);
																		return;
																	end
																end
															end
														end
														break;
													end
												end
											end
										end
									end
									v178[v1152] = v1153;
								end};
								v614 = setmetatable({}, v613);
								v812 = 1;
							end
							if (v812 == ((267 - (28 + 238)) - (0 - 0))) then
								v612 = 1 + 0;
								break;
							end
						end
						break;
					end
				end
			end
			if (v612 == (1 + (1559 - (1381 + 178)))) then
				v615 = v178.WalkSpeed;
				v178:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
					if (v178.WalkSpeed ~= v183()) then
						local v1004 = 0 - (0 + 0);
						local v1005;
						while true do
							if (v1004 == (0 + 0 + 0 + 0)) then
								v1005 = (0 - 0) - (0 + 0);
								while true do
									if (v1005 == ((470 - (381 + 89)) - (0 + 0))) then
										task.wait(math.random((1275 + 610) - ((763 - 317) + (2590 - (1074 + 82))), 15) / ((3030 - 1647) - ((2824 - (214 + 1570)) + 243)));
										v178.WalkSpeed = v183();
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
		end
	end
	v176.CharacterAdded:Connect(function(v616)
		local v617 = 0;
		local v618;
		while true do
			if (v617 == ((1455 - (990 + 465)) - (0 + 0))) then
				v618 = 1847 - (244 + 315 + 1288);
				while true do
					if (v618 == 2) then
						v185();
						v178.WalkSpeed = v183();
						break;
					end
					if (v618 == ((1878 + 53) - ((2396 - 1787) + 1322))) then
						local v1007 = 0;
						while true do
							if (0 == v1007) then
								task.wait(1726.5 - (1668 + 58));
								v177 = v616;
								v1007 = 1;
							end
							if ((627 - (512 + 114)) == v1007) then
								v618 = 455 - ((33 - 20) + (911 - 470));
								break;
							end
						end
					end
					if (v618 == (3 - 2)) then
						v178 = v177:WaitForChild("Humanoid");
						v186();
						v618 = 7 - 5;
					end
				end
				break;
			end
		end
	end);
	v186();
	v185();
	v8.GetRealSpeed = v183;
	v8.SetRealSpeed = v184;
end
local v9 = Instance.new("ScreenGui");
v9.Name = "XDGHOB_UI";
v9.ResetOnSpawn = false;
v9.Parent = v1:WaitForChild("PlayerGui");
local v13 = Instance.new("Frame");
v13.Name = "MainUI";
v13.Size = UDim2.new(0 - (0 + 0), 72 + 308, (0 + 0) - (0 - 0), 9 + 231);
local v16 = workspace.CurrentCamera.ViewportSize;
local v17 = v13.AbsoluteSize;
local v18 = (v16.X - v17.X) / (7 - 5);
local v19 = (v16.Y - v17.Y) / ((1995 - (109 + 1885)) + 1);
v13.Position = UDim2.new(0, v18, 0 + (1469 - (1269 + 200)), v19);
v13.BackgroundColor3 = Color3.fromRGB((158 - 75) - (870 - (98 + 717)), (842 - (802 + 24)) + (20 - 8), 64 - (35 - 6));
v13.BackgroundTransparency = 0.1;
v13.BorderSizePixel = 0 + 0 + 0;
v13.Active = true;
v13.Selectable = true;
v13.Parent = v9;
local v27 = Instance.new("UIStroke");
v27.Name = "OuterStroke";
v27.Thickness = 2 + 0 + 1;
v27.Color = Color3.fromRGB(9 + 42 + 5 + 14, (339 - 217) + (76 - 53), 255);
v27.Transparency = 0.1 + 0 + 0 + 0;
v27.Parent = v13;
local v33 = Instance.new("UIStroke");
v33.Name = "InnerStroke";
v33.Thickness = (358 + 76) - (112 + 41 + 131 + 149);
v33.Color = Color3.fromRGB((1779 - (797 + 636)) - (1097 - 871), 1819 - (1427 + 192), 255);
v33.Transparency = 0.3;
v33.Parent = v13;
local v39 = Instance.new("Frame");
v39.Name = "CornerGlow";
v39.Size = UDim2.new(1 + 0 + 0, 13 - 7, 1, 3 + 0 + 3);
v39.Position = UDim2.new(0 + 0, -(2 + (327 - (192 + 134))), 0 + (1276 - (316 + 960)), -(2 + 1 + 0 + 0));
v39.BackgroundColor3 = Color3.fromRGB(106 - (34 + 2), (344 - 254) + 55, (1473 - (83 + 468)) - ((1895 - (1202 + 604)) + (2698 - 2120)));
v39.BackgroundTransparency = (0.95 - 0) + 0;
v39.BorderSizePixel = 0 - 0;
v39.ZIndex = -((2907 - 1857) - ((897 - (45 + 280)) + 461 + 16));
v39.Parent = v13;
local v48 = Instance.new("Frame");
v48.Name = "TitleBar";
v48.Size = UDim2.new(1 + 0, 0 + 0 + 0 + 0, 0 + 0 + (0 - 0), 5 + (1946 - (340 + 1571)));
v48.Position = UDim2.new((34 + 52) - (84 + (1774 - (1733 + 39))), 0 - (0 - 0), (1034 - (125 + 909)) + (1948 - (1096 + 852)), 0);
v48.BackgroundColor3 = Color3.fromRGB(882 - (223 + 274 + (492 - 147)), 39 + 1, 560 - (409 + 103));
v48.BorderSizePixel = (236 - (46 + 190)) + 0;
v48.Active = true;
v48.Selectable = true;
v48.Parent = v13;
local v57 = Instance.new("UIGradient");
v57.Color = ColorSequence.new({ColorSequenceKeypoint.new(1333 - ((700 - (51 + 44)) + 206 + 522), Color3.fromRGB(1387 - (1114 + 203), (830 - (228 + 498)) + 9 + 32, (313 + 253) - (974 - (174 + 489)))),ColorSequenceKeypoint.new(1, Color3.fromRGB(120, (2570 - (830 + 1075)) - 485, 255))});
v57.Rotation = (606 - (303 + 221)) + (1277 - (231 + 1038));
v57.Parent = v48;
local v61 = Instance.new("TextLabel");
v61.Name = "RainbowTitle";
v61.Size = UDim2.new((2 + 0) - (1163 - (171 + 991)), 0 + (0 - 0), 2 - 1, 489 - ((1140 - 683) + 32));
v61.Position = UDim2.new(0 + 0 + (0 - 0), 0 - 0, (2259 - 857) - ((2571 - 1739) + (1818 - (111 + 1137))), (158 - (91 + 67)) + 0);
v61.BackgroundTransparency = 2 - 1;
v61.Text = "✨ XDG-HOB ✨";
v61.TextColor3 = Color3.new(1 + 0, (524 - (423 + 100)) + 0 + 0, 3 - (5 - 3));
v61.Font = Enum.Font.GothamBlack;
v61.TextSize = 6 + 4 + 10;
v61.TextStrokeTransparency = 796.7 - ((1359 - (326 + 445)) + (907 - 699));
v61.TextStrokeColor3 = Color3.fromRGB(0 - (0 - 0), 0, 0 - 0);
v61.Parent = v48;
local v74 = Instance.new("TextButton");
v74.Name = "ControlButton";
v74.Size = UDim2.new(0, 1900 - ((1595 - (530 + 181)) + 916), 881 - (614 + 267), (107 - (19 + 13)) - 39);
v74.Position = UDim2.new((0 - 0) + (0 - 0), 285 - 185, (170 + 483) - ((407 - 175) + (872 - 451)), (3801 - (1293 + 519)) - (1569 + 320));
v74.BackgroundColor3 = Color3.fromRGB(18 + (105 - 53), (72 - 44) + 117, 487 - 232);
v74.Text = "XDG-HOB";
v74.TextColor3 = Color3.new(4 - 3, (6 - 3) - (2 + 0), 1);
v74.Font = Enum.Font.GothamBlack;
v74.TextSize = 619 - (316 + 289);
v74.TextStrokeTransparency = 0.6 - 0;
v74.TextStrokeColor3 = Color3.fromRGB(0, 0 + 0 + (0 - 0), (336 + 1117) - (222 + 444 + 492 + 295));
v74.Active = true;
v74.Selectable = true;
v74.Parent = v9;
local v88 = Instance.new("UIStroke");
v88.Name = "BtnOuterStroke";
v88.Thickness = 2;
v88.Color = Color3.fromRGB((1721 - (709 + 387)) - ((2218 - (673 + 1185)) + 65), 220, (692 - 453) + (51 - 35));
v88.Transparency = (417.2 - 163) - (79 + 126 + 49);
v88.Parent = v74;
local v94 = Instance.new("UIStroke");
v94.Name = "BtnInnerStroke";
v94.Thickness = 1 + 0;
v94.Color = Color3.fromRGB((542 - 140) - (37 + 110), 255, (396 - 197) + (109 - 53));
v94.Transparency = 0.4 - (1880 - (446 + 1434));
v94.Parent = v74;
local v100 = Instance.new("Frame");
v100.Name = "BtnGlow";
v100.Size = UDim2.new((1284 - (1040 + 243)) - 0, 907 - (503 + 396), (543 - 361) - ((1939 - (559 + 1288)) + (2020 - (609 + 1322))), 8);
v100.Position = UDim2.new((454 - (13 + 441)) - 0, -((10 - 7) + (2 - 1)), 0, -((14 - 11) + 1 + 0));
v100.BackgroundColor3 = Color3.fromRGB(254 - 184, (202 + 365) - 422, 16 + 19 + (652 - 432));
v100.BackgroundTransparency = 0.9 + 0;
v100.BorderSizePixel = (0 - 0) - (0 + 0);
v100.ZIndex = -(1 + 0 + 0 + 0);
v100.Parent = v74;
local v109 = Instance.new("Frame");
v109.Name = "LeftPanel";
v109.Size = UDim2.new(0 + 0, 335 - 225, 1 + 0 + 0, -(61 - 21));
v109.Position = UDim2.new(1244 - (475 + 10 + (1192 - (153 + 280))), (0 - 0) - (0 + 0), 0 + 0, (644 + 585) - (402 + 40 + 542 + 205));
v109.BackgroundColor3 = Color3.fromRGB(53 - 18, 35, 42);
v109.BorderSizePixel = (702 + 433) - ((1499 - (89 + 578)) + 217 + 86);
v109.Parent = v13;
local v116 = Instance.new("UIStroke");
v116.Name = "LeftPanelStroke";
v116.Thickness = 1 - 0;
v116.Color = Color3.fromRGB(1006 - (88 + (1907 - (572 + 477))), 3 + 16 + 25 + 16, 58 + 12);
v116.Transparency = 0.5;
v116.Parent = v109;
local v122 = Instance.new("ScrollingFrame");
v122.Name = "CategoryScroll";
v122.Size = UDim2.new(1 + 0 + 0, 789 - ((852 - (84 + 2)) + (37 - 14)), 4 - (3 + 0), (842 - (497 + 345)) - (0 + 0));
v122.BackgroundTransparency = 1 + 0;
v122.ScrollBarThickness = (1348 - (605 + 728)) - 9;
v122.ScrollBarImageColor3 = Color3.fromRGB((242 + 97) - (530 - 291), (54 + 1119) - ((3830 - 2794) + 34 + 3), 304 - 194);
v122.CanvasSize = UDim2.new(0 + 0 + (489 - (457 + 32)), 0, (0 + 0) - (1402 - (832 + 570)), 151 + 9);
v122.Parent = v109;
local v130 = Instance.new("UIListLayout");
v130.Parent = v122;
v130.Padding = UDim.new(0 + 0, 28 - 20);
local v133 = {"实用区","功能区","信息区","其他脚本区"};
local v134 = (2714 - (884 + 916)) - (910 + (6 - 3));
local v135 = {};
local v136 = Instance.new("Frame");
v136.Name = "ContentFrame";
v136.Size = UDim2.new(1 + 0, -((933 - (232 + 421)) - 170), 1685 - ((3355 - (1569 + 320)) + 54 + 164), -(8 + 32));
v136.Position = UDim2.new(0 + 0, 370 - 260, 1148 - ((1161 - (316 + 289)) + (1549 - 957)), 40);
v136.BackgroundColor3 = Color3.fromRGB(1 + 11 + (1473 - (666 + 787)), 840 - ((754 - (360 + 65)) + 479), (836 + 58) - ((428 - (79 + 175)) + (1072 - 392)));
v136.BorderSizePixel = (0 + 0) - 0;
v136.Parent = v13;
local v143 = Instance.new("UIStroke");
v143.Name = "ContentFrameStroke";
v143.Thickness = 1 - (0 - 0);
v143.Color = Color3.fromRGB(115 - 55, (942 - (503 + 396)) + (198 - (92 + 89)), 70);
v143.Transparency = 0.5;
v143.Parent = v136;
local function v149()
	local v189 = Instance.new("Frame");
	v189.Name = "UtilityContainer";
	v189.Size = UDim2.new(1 - 0, (379 + 360) - (396 + 204 + 139), (3 - 2) + 0 + 0, (3367 - 1890) - (26 + 3 + 692 + 756));
	v189.BackgroundTransparency = (4233 - 2843) - (17 + 118 + (1911 - 657));
	v189.Visible = true;
	v189.Parent = v136;
	local v195 = Instance.new("ScrollingFrame");
	v195.Name = "UtilityScroll";
	v195.Size = UDim2.new(3 - 2, -(1264 - (485 + 759)), 4 - (6 - 3), -((1203 - (442 + 747)) + 6));
	v195.Position = UDim2.new((2662 - (832 + 303)) - ((1335 - (88 + 858)) + 347 + 791), (484 + 100) - (5 + 97 + (1261 - (766 + 23))), 0 - 0, 10 + 0);
	v195.BackgroundTransparency = 1 - 0;
	v195.ScrollBarThickness = 6;
	v195.ScrollBarImageColor3 = Color3.fromRGB((147 - 91) + (149 - 105), (1167 - (1036 + 37)) + 5 + 1, (3222 - 1567) - (252 + 68 + (2705 - (641 + 839))));
	v195.CanvasSize = UDim2.new(913 - (910 + 3), 0, 0 - (0 - 0), 2234 - (1466 + 218));
	v195.Parent = v189;
	local v204 = Instance.new("UIListLayout");
	v204.Parent = v195;
	v204.Padding = UDim.new(0 + 0 + 0, (2624 - (556 + 592)) - (56 + 101 + 1307));
	v204.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local v209 = Instance.new("TextButton");
	v209.Name = "AntiDetectFlight";
	v209.Size = UDim2.new((2667.9 - (329 + 479)) - (821 + (1892 - (174 + 680))), (0 - 0) - 0, 0 - 0, 4 + 1 + (774 - (396 + 343)));
	v209.Text = "防检测飞行";
	v209.BackgroundColor3 = Color3.fromRGB(60, 6 + 54, 1547 - (29 + 1448));
	v209.TextColor3 = Color3.new((1390 - (135 + 1254)) - 0, 1, 1);
	v209.Font = Enum.Font.GothamSemibold;
	v209.TextSize = 56 - 41;
	v209.TextStrokeTransparency = 0.5 + 0;
	v209.TextStrokeColor3 = Color3.fromRGB(0 - (0 - 0), 1026 - (556 + 278 + 192), 0);
	v209.AutoButtonColor = false;
	local v221 = Instance.new("UIStroke");
	v221.Thickness = (1528 - (389 + 1138)) + 1;
	v221.Color = Color3.fromRGB((595 - (102 + 472)) + 56 + 3, 2 + 0 + 73 + 5, 139 - (1594 - (320 + 1225)));
	v221.Transparency = 0.3;
	v221.Parent = v209;
	local v226 = Instance.new("UICorner");
	v226.CornerRadius = UDim.new((540 - 236) - (184 + 116 + (1468 - (157 + 1307))), (1862 - (821 + 1038)) + (12 - 7));
	v226.Parent = v209;
	local v229 = Color3.fromRGB((18 + 139) - 97, 422 - ((198 - 86) + 94 + 156), 70);
	local v230 = false;
	v209.MouseEnter:Connect(function()
		if not v230 then
			local v661 = 0 + 0;
			local v662;
			while true do
				if (v661 == (0 - 0)) then
					v662 = 1026 - (834 + 192);
					while true do
						if (v662 == 0) then
							v209.BackgroundColor3 = Color3.fromRGB(175 - 105, 5 + 65, 21 + 59);
							v221.Color = Color3.fromRGB(2 + 50 + (58 - 20), (351 - (300 + 4)) + 12 + 31, (196 - 121) + (387 - (112 + 250)));
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v209.MouseLeave:Connect(function()
		if not v230 then
			local v663 = 0 + 0;
			local v664;
			while true do
				if (v663 == (0 + (0 - 0))) then
					v664 = 0 + 0;
					while true do
						if (v664 == (0 + 0)) then
							v209.BackgroundColor3 = v229;
							v221.Color = Color3.fromRGB(45 + 15 + 10 + 10, 80, 67 + 23);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v209.MouseButton1Click:Connect(function()
		v230 = not v230;
		if v230 then
			local v665 = (2828 - (1001 + 413)) - (1001 + 413);
			local v666;
			local v667;
			while true do
				if (v665 == 0) then
					v209.BackgroundColor3 = Color3.fromRGB((396 - 218) - (980 - (244 + 638)), (1735 - (627 + 66)) - (244 + (1900 - 1262)), (1550 - (512 + 90)) - (627 + (1972 - (1665 + 241))));
					v221.Color = Color3.fromRGB((1074 - (373 + 344)) - (107 + 130), 53 + 147, (2260 - 1403) - ((865 - 353) + (1189 - (35 + 1064))));
					v665 = 1907 - (1212 + 453 + (515 - 274));
				end
				if (v665 == ((3 + 715) - ((1609 - (298 + 938)) + 344))) then
					v209.Text = "防检测飞行 ✓";
					v666, v667 = pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/nihaonihaonihaon-source/XDG-HOB/main/mbhivhjjb.lua"))();
					end);
					v665 = 2;
				end
				if (v665 == ((1260 - (233 + 1026)) + (1667 - (636 + 1030)))) then
					if v666 then
						local v1025 = 0 + 0 + 0;
						while true do
							if (v1025 == ((0 + 0) - 0)) then
								v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测飞行已启用",Duration=(4 - (1 + 0)),Icon="rbxassetid://4483345998"});
								print("防检测飞行脚本加载成功");
								break;
							end
						end
					else
						local v1026 = 0 + 0;
						local v1027;
						local v1028;
						while true do
							if (v1026 == (221 - (55 + 166))) then
								v1027 = 1099 - (7 + 28 + 107 + 957);
								v1028 = nil;
								v1026 = 1;
							end
							if (v1026 == (3 - 2)) then
								while true do
									if (v1027 == ((297 - (36 + 261)) + (0 - 0))) then
										v1028 = 0;
										while true do
											if (v1028 == (1370 - (34 + 1334))) then
												v221.Color = Color3.fromRGB((66 + 105) - (71 + 20), (1284 - (1035 + 248)) + (100 - (20 + 1)), (691 + 635) - ((617 - (134 + 185)) + 938));
												v209.Text = "防检测飞行";
												break;
											end
											if (v1028 == ((2393 - (549 + 584)) - ((918 - (314 + 371)) + (3522 - 2496)))) then
												v230 = false;
												v209.BackgroundColor3 = v229;
												v1028 = (2636 - (478 + 490)) - (337 + 299 + (2202 - (786 + 386)));
											end
											if (v1028 == ((0 - 0) + (1379 - (1055 + 324)))) then
												v2:SetCore("SendNotification", {Title="错误",Text="加载飞行脚本失败",Duration=(5 + 0),Icon="rbxassetid://4483345998"});
												warn("加载飞行脚本失败:", v667);
												v1028 = 1 + (1340 - (1093 + 247));
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
		else
			local v668 = 0;
			local v669;
			local v670;
			while true do
				if ((1 + 0) == v668) then
					while true do
						if (v669 == ((24 + 197) - ((218 - 163) + (563 - 397)))) then
							v670 = 0;
							while true do
								if (v670 == (0 + (0 - 0))) then
									local v1188 = 0 - 0;
									while true do
										if (v1188 == 1) then
											v670 = 298 - (13 + 23 + (1005 - 744));
											break;
										end
										if (v1188 == (0 - 0)) then
											v209.BackgroundColor3 = v229;
											v221.Color = Color3.fromRGB(61 + 19, (22 - 13) + (759 - (364 + 324)), (939 - 596) - (606 - 353));
											v1188 = 1;
										end
									end
								end
								if (v670 == (1 + 0)) then
									v209.Text = "防检测飞行";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测飞行已禁用",Duration=(4 - (4 - 3)),Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
					break;
				end
				if (v668 == (0 - 0)) then
					v669 = 0 + (0 - 0);
					v670 = nil;
					v668 = 1269 - (1249 + 19);
				end
			end
		end
	end);
	v209.Parent = v195;
	local v232 = Instance.new("TextButton");
	v232.Name = "AntiDetectWall";
	v232.Size = UDim2.new(0.9, (1235 + 133) - (34 + 1334), 0 + 0, (124 - 92) + (1094 - (686 + 400)));
	v232.Text = "防检测穿墙";
	v232.BackgroundColor3 = Color3.fromRGB((1054 + 289) - (1035 + (477 - (73 + 156))), 81 - (1 + 19 + (812 - (721 + 90))), 37 + 33);
	v232.TextColor3 = Color3.new((4 + 316) - ((434 - 300) + (655 - (224 + 246))), (1836 - 702) - ((1010 - 461) + 106 + 478), 1 + 0);
	v232.Font = Enum.Font.GothamSemibold;
	v232.TextSize = 12 + 3;
	v232.TextStrokeTransparency = 685.5 - (314 + (737 - 366));
	v232.TextStrokeColor3 = Color3.fromRGB(0, 0 - (0 - 0), 968 - (478 + 490));
	v232.AutoButtonColor = false;
	local v243 = Instance.new("UIStroke");
	v243.Thickness = (515 - (203 + 310)) + 0;
	v243.Color = Color3.fromRGB((3245 - (1238 + 755)) - (55 + 731 + (1920 - (709 + 825))), (476 - 217) - 179, 131 - 41);
	v243.Transparency = 1379.3 - (1055 + 324);
	v243.Parent = v232;
	local v248 = Instance.new("UICorner");
	v248.CornerRadius = UDim.new(1340 - ((1957 - (196 + 668)) + (975 - 728)), (16 - 8) + (833 - (171 + 662)));
	v248.Parent = v232;
	local v251 = Color3.fromRGB(153 - (4 + 89), (24 - 17) + 53, 70);
	local v252 = false;
	v232.MouseEnter:Connect(function()
		if not v252 then
			local v671 = (0 + 0) - (0 - 0);
			local v672;
			while true do
				if (v671 == (0 - (0 + 0))) then
					v672 = (1486 - (35 + 1451)) - (1453 - (28 + 1425));
					while true do
						if (v672 == ((1993 - (941 + 1052)) - (0 + 0))) then
							v232.BackgroundColor3 = Color3.fromRGB((1539 - (822 + 692)) + (63 - 18), 33 + 37, 377 - (45 + 252));
							v243.Color = Color3.fromRGB((343 + 3) - (89 + 167), 90, (836 - 492) - (677 - (114 + 319)));
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v232.MouseLeave:Connect(function()
		if not v252 then
			v232.BackgroundColor3 = v251;
			v243.Color = Color3.fromRGB(61 + (26 - 7), 102 - 22, (147 + 83) - 140);
		end
	end);
	v232.MouseButton1Click:Connect(function()
		v252 = not v252;
		if v252 then
			v232.BackgroundColor3 = Color3.fromRGB(119 - 39, 848 - ((762 - 398) + 324), 2218 - (556 + 1407));
			v243.Color = Color3.fromRGB(120, 1406 - (741 + 465), 698 - (908 - (170 + 295)));
			v232.Text = "防检测穿墙 ✓";
			local v678 = {Enabled=false,Connection=nil,Speed=(14 + 12),LastUpdate=((0 + 0) - 0),NoClipParts={},CharacterAddedConnection=nil};
			v678.Toggle = function(v814)
				local v815 = 0 - 0;
				local v816;
				local v817;
				while true do
					if (v815 == (1 + 0)) then
						while true do
							if (v816 == (0 + 0)) then
								v817 = 0 - 0;
								while true do
									local v1155 = 0;
									while true do
										if (v1155 == (0 + 0)) then
											if (v817 == ((1 + 0) - 0)) then
												return v814.Enabled;
											end
											if (v817 == ((1230 - (957 + 273)) - (0 + 0))) then
												local v1291 = 0 + 0;
												while true do
													if (v1291 == (0 - 0)) then
														v814.Enabled = not v814.Enabled;
														if v814.Enabled then
															v814:Start();
														else
															v814:Stop();
														end
														v1291 = 2 - 1;
													end
													if (v1291 == (2 - 1)) then
														v817 = (6283 - 5014) - ((3029 - (389 + 1391)) + 12 + 7);
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
						end
						break;
					end
					if (v815 == 0) then
						v816 = 0 + 0;
						v817 = nil;
						v815 = 1;
					end
				end
			end;
			v678.Start = function(v818)
				local v819 = 0;
				local v820;
				while true do
					if (2 == v819) then
						v818.Connection = game:GetService("RunService").Heartbeat:Connect(function(v1029)
							if (not v818.Enabled or ((tick() - v818.LastUpdate) < (0.05 - 0))) then
								return;
							end
							v818.LastUpdate = tick();
							local v1031 = v820.Character;
							if not v1031 then
								return;
							end
							local v1032 = v1031:FindFirstChild("HumanoidRootPart");
							if not v1032 then
								return;
							end
							local v1033 = game:GetService("UserInputService");
							local v1034 = Vector3.zero;
							local v1035 = v1032.CFrame;
							if v1033:IsKeyDown(Enum.KeyCode.W) then
								v1034 = v1034 + v1035.LookVector;
							end
							if v1033:IsKeyDown(Enum.KeyCode.S) then
								v1034 = v1034 - v1035.LookVector;
							end
							if v1033:IsKeyDown(Enum.KeyCode.A) then
								v1034 = v1034 - v1035.RightVector;
							end
							if v1033:IsKeyDown(Enum.KeyCode.D) then
								v1034 = v1034 + v1035.RightVector;
							end
							if v1033:IsKeyDown(Enum.KeyCode.Space) then
								v1034 = v1034 + Vector3.new((951 - (783 + 168)) + (0 - 0), 1 + 0, (311 - (309 + 2)) - (0 - 0));
							end
							if v1033:IsKeyDown(Enum.KeyCode.LeftControl) then
								v1034 = v1034 + Vector3.new(0, -((2299 - (1090 + 122)) - (686 + 130 + 270)), (0 - 0) + 0 + 0);
							end
							if (v1034.Magnitude > (229 - ((1191 - (628 + 490)) + 28 + 128))) then
								local v1124 = (0 - 0) + (0 - 0);
								local v1125;
								while true do
									if (v1124 == ((1586 - (431 + 343)) - ((1455 - 734) + (260 - 170)))) then
										v1032.CFrame = v1032.CFrame + (v1034 * v1125 * v1029);
										break;
									end
									if ((0 + 0) == v1124) then
										v1034 = v1034.Unit;
										v1125 = v818.Speed * (0.9 + 0 + (1695 - (556 + 1139)) + (math.random() * ((15.2 - (6 + 9)) - 0)));
										v1124 = 471 - (224 + 246);
									end
								end
							end
						end);
						break;
					end
					if (v819 == (0 + 0)) then
						local v1009 = 0;
						while true do
							if (v1009 == 0) then
								v820 = game:GetService("Players").LocalPlayer;
								v818.NoClipParts = {};
								v1009 = 1 + 0;
							end
							if (v1009 == (170 - (28 + 141))) then
								v819 = 1 - 0;
								break;
							end
						end
					end
					if (v819 == 1) then
						if v820.Character then
							v818:SetupCharacter(v820.Character);
						end
						v818.CharacterAddedConnection = v820.CharacterAdded:Connect(function(v1036)
							v818:SetupCharacter(v1036);
						end);
						v819 = (2 + 1) - (1 - 0);
					end
				end
			end;
			v678.SetupCharacter = function(v821, v822)
				task.wait(0.2 + 0 + (1317 - (486 + 831)));
				for v833, v834 in pairs(v822:GetDescendants()) do
					if v834:IsA("BasePart") then
						local v1011 = 0 - 0;
						local v1012;
						local v1013;
						while true do
							if (v1011 == (3 - 2)) then
								while true do
									if (v1012 == (0 + 0 + (0 - 0))) then
										v1013 = 1263 - (668 + 595);
										while true do
											if ((0 + 0) == v1013) then
												v834.CanCollide = false;
												table.insert(v821.NoClipParts, v834);
												break;
											end
										end
										break;
									end
								end
								break;
							end
							if (v1011 == 0) then
								v1012 = 0 + 0;
								v1013 = nil;
								v1011 = 2 - 1;
							end
						end
					end
				end
				v822.DescendantAdded:Connect(function(v835)
					if v835:IsA("BasePart") then
						task.wait(290.1 - (23 + 267));
						v835.CanCollide = false;
						table.insert(v821.NoClipParts, v835);
					end
				end);
				local v823 = v822:WaitForChild("Humanoid");
				v823.StateChanged:Connect(function(v836, v837)
					if (v837 == Enum.HumanoidStateType.Jumping) then
						local v1015 = 1944 - (1129 + 815);
						local v1016;
						while true do
							if (v1015 == (387 - (371 + 16))) then
								v1016 = 0 + (1750 - (1326 + 424));
								while true do
									if ((0 - 0) == v1016) then
										task.wait(0.05 - (0 - 0));
										for v1244, v1245 in pairs(v822:GetDescendants()) do
											if v1245:IsA("BasePart") then
												v1245.CanCollide = false;
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
			end;
			v678.Stop = function(v824)
				local v825 = 0 - 0;
				local v826;
				while true do
					if (v825 == (118 - (88 + 30))) then
						if v824.Connection then
							local v1056 = (1284 - (720 + 51)) - ((451 - 248) + (2086 - (421 + 1355)));
							local v1057;
							while true do
								if (v1056 == (1993 - ((2042 - 804) + 755))) then
									v1057 = 0 + 0 + (1083 - (286 + 797));
									while true do
										if (v1057 == (0 - 0)) then
											v824.Connection:Disconnect();
											v824.Connection = nil;
											break;
										end
									end
									break;
								end
							end
						end
						if v824.CharacterAddedConnection then
							local v1058 = 0 - 0;
							while true do
								if (v1058 == (439 - (397 + 42))) then
									v824.CharacterAddedConnection:Disconnect();
									v824.CharacterAddedConnection = nil;
									break;
								end
							end
						end
						v825 = 1;
					end
					if (v825 == 1) then
						v826 = game:GetService("Players").LocalPlayer;
						if v826.Character then
							for v1128, v1129 in pairs(v824.NoClipParts) do
								if (v1129 and v1129.Parent) then
									v1129.CanCollide = true;
								end
							end
						end
						v825 = 1 + 1;
					end
					if (2 == v825) then
						v824.NoClipParts = {};
						break;
					end
				end
			end;
			v678:Toggle();
			v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测穿墙已启用\nWASD移动 空格上升 Ctrl下降",Duration=((2339 - (24 + 776)) - ((1091 - 382) + (1610 - (222 + 563)))),Icon="rbxassetid://4483345998"});
			print("防检测穿墙启用成功");
		else
			local v683 = 0 - 0;
			local v684;
			local v685;
			while true do
				if ((0 + 0) == v683) then
					v684 = 0;
					v685 = nil;
					v683 = 1;
				end
				if (v683 == (191 - (23 + 167))) then
					while true do
						if (v684 == (0 - (1798 - (690 + 1108)))) then
							v685 = 0 + 0;
							while true do
								if (v685 == 2) then
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="防检测穿墙已禁用",Duration=((3 + 0) - (848 - (40 + 808))),Icon="rbxassetid://4483345998"});
									break;
								end
								if ((0 + 0) == v685) then
									local v1192 = 0;
									while true do
										if (v1192 == 0) then
											if WallWalkModule then
												WallWalkModule:Stop();
											end
											v232.BackgroundColor3 = v251;
											v1192 = 1;
										end
										if (v1192 == (3 - 2)) then
											v685 = 1 + 0;
											break;
										end
									end
								end
								if (v685 == (865 - (196 + 354 + 314))) then
									v243.Color = Color3.fromRGB(44 + 36, 315 - (806 - (47 + 524)), 186 - (63 + 33));
									v232.Text = "防检测穿墙";
									v685 = 835 - (171 + (1809 - 1147));
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
	v232.Parent = v195;
	local v254 = Instance.new("TextButton");
	v254.Name = "FlyCar";
	v254.Size = UDim2.new((138.9 - 45) - ((8 - 4) + 89), (1726 - (1165 + 561)) - (0 + 0), (0 - 0) + 0, (67 + 108) - (614 - (341 + 138)));
	v254.Text = "飞车";
	v254.BackgroundColor3 = Color3.fromRGB(60, 24 + 10 + 26, 144 - 74);
	v254.TextColor3 = Color3.new((1813 - (89 + 237)) - (35 + (4667 - 3216)), 1 - 0, (2335 - (581 + 300)) - ((1248 - (855 + 365)) + (3384 - 1959)));
	v254.Font = Enum.Font.GothamSemibold;
	v254.TextSize = 2008 - (308 + 633 + (2287 - (1030 + 205)));
	v254.TextStrokeTransparency = 0.5 + 0 + 0;
	v254.TextStrokeColor3 = Color3.fromRGB(0, (1409 + 105) - ((1108 - (156 + 130)) + 692), 0 - (0 - 0));
	v254.AutoButtonColor = false;
	local v265 = Instance.new("UIStroke");
	v265.Thickness = 2 - 0;
	v265.Color = Color3.fromRGB((77 - 39) + 12 + 30, (220 + 157) - (45 + 252), (159 - (10 + 59)) + 0);
	v265.Transparency = 0.3 + 0 + (0 - 0);
	v265.Parent = v254;
	local v270 = Instance.new("UICorner");
	v270.CornerRadius = UDim.new((1163 - (671 + 492)) - 0, (352 + 89) - (114 + (1534 - (369 + 846))));
	v270.Parent = v254;
	local v273 = Color3.fromRGB(86 - (7 + 19), 76 - (14 + 2), 45 + (1970 - (1036 + 909)));
	local v274 = false;
	v254.MouseEnter:Connect(function()
		if not v274 then
			local v686 = 0 - 0;
			local v687;
			while true do
				if (v686 == ((0 + 0) - 0)) then
					v687 = 1963 - ((933 - 377) + (1610 - (11 + 192)));
					while true do
						if (v687 == 0) then
							v254.BackgroundColor3 = Color3.fromRGB(70, (645 + 631) - (741 + (640 - (135 + 40))), (1320 - 775) - (103 + 67 + (649 - 354)));
							v265.Color = Color3.fromRGB((71 - 23) + (218 - (50 + 126)), (231 - 148) + 2 + 5, (1659 - (1233 + 180)) - (1115 - (522 + 447)));
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v254.MouseLeave:Connect(function()
		if not v274 then
			local v688 = 1421 - (107 + 1314);
			local v689;
			local v690;
			while true do
				if ((0 + 0) == v688) then
					v689 = (0 - 0) + 0 + 0;
					v690 = nil;
					v688 = 1 - 0;
				end
				if (v688 == (3 - 2)) then
					while true do
						if (v689 == ((1910 - (716 + 1194)) + 0 + 0)) then
							v690 = 0 + 0 + (503 - (74 + 429));
							while true do
								if (v690 == ((2372 - 1142) - (475 + 482 + (624 - 351)))) then
									v254.BackgroundColor3 = v273;
									v265.Color = Color3.fromRGB(80, 16 + 6 + (178 - 120), 222 - 132);
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
	v254.MouseButton1Click:Connect(function()
		local v619 = 433 - (279 + 154);
		while true do
			if (v619 == 0) then
				v274 = not v274;
				if v274 then
					local v864 = (778 - (454 + 324)) + 0 + 0;
					local v865;
					local v866;
					while true do
						if (v864 == ((24 - (12 + 5)) - 5)) then
							if v865 then
								local v1156 = 0 + 0;
								local v1157;
								while true do
									if (v1156 == (0 - 0)) then
										v1157 = (0 + 0) - (1093 - (277 + 816));
										while true do
											if (v1157 == ((0 - 0) - 0)) then
												v2:SetCore("SendNotification", {Title="XDG-HOB",Text="飞车脚本已加载",Duration=(14 - 11),Icon="rbxassetid://4483345998"});
												print("飞车脚本加载成功");
												break;
											end
										end
										break;
									end
								end
							else
								local v1158 = 1183 - (1058 + 125);
								local v1159;
								local v1160;
								while true do
									if (v1158 == (1 + 0)) then
										while true do
											if (v1159 == (975 - (815 + 160))) then
												v1160 = 0 - 0;
												while true do
													if (((2 - 1) + 0 + 0) == v1160) then
														v274 = false;
														v254.BackgroundColor3 = v273;
														v1160 = (2 - 1) + (1899 - (41 + 1857));
													end
													if (v1160 == (1893 - (1222 + 671))) then
														local v1334 = 0 - 0;
														while true do
															if (v1334 == 1) then
																v1160 = 1 - 0;
																break;
															end
															if (0 == v1334) then
																v2:SetCore("SendNotification", {Title="错误",Text="加载飞车脚本失败",Duration=5,Icon="rbxassetid://4483345998"});
																warn("加载飞车脚本失败:", v866);
																v1334 = 1183 - (229 + 953);
															end
														end
													end
													if (v1160 == (1776 - (1111 + 663))) then
														v265.Color = Color3.fromRGB((1761 - (874 + 705)) - (15 + 87), 80, 62 + 28);
														v254.Text = "飞车";
														break;
													end
												end
												break;
											end
										end
										break;
									end
									if (v1158 == (0 - 0)) then
										v1159 = 1780 - (11 + 378 + (2070 - (642 + 37)));
										v1160 = nil;
										v1158 = 1;
									end
								end
							end
							break;
						end
						if (((218 + 734) - (783 + 27 + 141)) == v864) then
							v254.Text = "飞车 ✓";
							v865, v866 = pcall(function()
								loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))();
							end);
							v864 = (14 - 8) - (458 - (233 + 221));
						end
						if (v864 == 0) then
							v254.BackgroundColor3 = Color3.fromRGB((182 - 103) + 1 + 0, 1701 - (718 + 823), (357 + 209) - (309 + (807 - (266 + 539))));
							v265.Color = Color3.fromRGB(368 - 248, (3997 - 2585) - ((2315 - (636 + 589)) + (289 - 167)), 83 + 172);
							v864 = 3 - (3 - 1);
						end
					end
				else
					local v867 = 0 + 0 + 0 + 0;
					while true do
						if (v867 == ((2134 - (657 + 358)) - (628 + (1297 - 807)))) then
							v254.Text = "飞车";
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="飞车脚本已卸载",Duration=((2 - 1) + 2),Icon="rbxassetid://4483345998"});
							break;
						end
						if (v867 == (0 - (1187 - (1151 + 36)))) then
							local v1065 = 0;
							while true do
								if (0 == v1065) then
									v254.BackgroundColor3 = v273;
									v265.Color = Color3.fromRGB(80, (353 + 12) - (75 + 210), (2580 - 1716) - (431 + 343));
									v1065 = 1833 - (1552 + 280);
								end
								if (v1065 == 1) then
									v867 = 835 - (64 + 770);
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
	v254.Parent = v195;
	local v276 = Instance.new("TextButton");
	v276.Name = "PlayerJoinNotification";
	v276.Size = UDim2.new(0.9 - (0 + 0), 0 - 0, 0 + 0, 115 - 75);
	v276.Text = "玩家进入提示";
	v276.BackgroundColor3 = Color3.fromRGB(60, (1291 - (157 + 1086)) + (23 - 11), (39 - 30) + 61);
	v276.TextColor3 = Color3.new(1696 - ((852 - 296) + (1553 - 414)), 1, (835 - (599 + 220)) - ((11 - 5) + (1940 - (1813 + 118))));
	v276.Font = Enum.Font.GothamSemibold;
	v276.TextSize = 11 + 4;
	v276.TextStrokeTransparency = (1217.5 - (841 + 376)) + (0 - 0);
	v276.TextStrokeColor3 = Color3.fromRGB(0 + 0 + 0, (461 - 292) - ((887 - (464 + 395)) + (361 - 220)), 0 + 0 + (837 - (467 + 370)));
	v276.AutoButtonColor = false;
	local v287 = Instance.new("UIStroke");
	v287.Thickness = 2;
	v287.Color = Color3.fromRGB(98 - (36 - 18), 59 + 21, (219 - 155) + 26);
	v287.Transparency = 0.3 + 0;
	v287.Parent = v276;
	local v292 = Instance.new("UICorner");
	v292.CornerRadius = UDim.new((3063 - 1746) - ((1006 - (150 + 370)) + 831), 1290 - (74 + 1208));
	v292.Parent = v276;
	local v295 = Color3.fromRGB((383 - 227) - 96, (1000 - 789) - (108 + 43), (404 - (14 + 376)) + (96 - 40));
	local v296 = false;
	v276.MouseEnter:Connect(function()
		if not v296 then
			local v691 = 0;
			local v692;
			while true do
				if (v691 == (0 - 0)) then
					v692 = (818 + 445) - (587 + 81 + 568 + 27);
					while true do
						if (v692 == 0) then
							v276.BackgroundColor3 = Color3.fromRGB((184 - 121) + 6 + 1, (93 - (23 + 55)) + (130 - 75), 218 - (93 + 45));
							v287.Color = Color3.fromRGB((342 + 38) - (23 + (413 - 146)), (640 + 1394) - ((2030 - (652 + 249)) + 815), (1303 - 816) - ((2239 - (708 + 1160)) + (43 - 27)));
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v276.MouseLeave:Connect(function()
		if not v296 then
			local v693 = 0 - 0;
			local v694;
			local v695;
			while true do
				if (v693 == (28 - (10 + 17))) then
					while true do
						if (v694 == ((0 + 0) - (1732 - (1400 + 332)))) then
							v695 = 0 - (0 - 0);
							while true do
								if (v695 == ((2026 - (242 + 1666)) - (38 + 50 + 30))) then
									v276.BackgroundColor3 = v295;
									v287.Color = Color3.fromRGB(80, 30 + 50, (734 + 127) - (720 + (991 - (850 + 90))));
									break;
								end
							end
							break;
						end
					end
					break;
				end
				if (v693 == (0 - 0)) then
					v694 = (3140 - (360 + 1030)) - (1326 + 376 + 48);
					v695 = nil;
					v693 = 2 - 1;
				end
			end
		end
	end);
	v276.MouseButton1Click:Connect(function()
		local v620 = (0 - 0) - (1661 - (909 + 752));
		while true do
			if (v620 == 0) then
				v296 = not v296;
				if v296 then
					local v868 = 1776 - ((1644 - (109 + 1114)) + (2480 - 1125));
					local v869;
					local v870;
					while true do
						if (v868 == (0 - 0)) then
							local v1068 = 0 + 0;
							while true do
								if (v1068 == 1) then
									v868 = 1 - 0;
									break;
								end
								if (v1068 == 0) then
									v276.BackgroundColor3 = Color3.fromRGB((282 - (6 + 236)) + 26 + 14, 160, 206 + 49);
									v287.Color = Color3.fromRGB(283 - 163, (2240 - 957) - (286 + 797), (2065 - (1076 + 57)) - (112 + 565));
									v1068 = 1;
								end
							end
						end
						if (v868 == (691 - (579 + 110))) then
							if v869 then
								local v1161 = 439 - (32 + 365 + 42);
								local v1162;
								while true do
									if (v1161 == (0 + 0 + 0)) then
										v1162 = 0;
										while true do
											if (v1162 == (800 - (13 + 11 + 776))) then
												v2:SetCore("SendNotification", {Title="XDG-HOB",Text="玩家进入提示脚本已加载",Duration=(4 - (408 - (174 + 233))),Icon="rbxassetid://4483345998"});
												print("玩家进入提示脚本加载成功");
												break;
											end
										end
										break;
									end
								end
							else
								local v1163 = 0 - 0;
								local v1164;
								local v1165;
								while true do
									if (v1163 == (1 - 0)) then
										while true do
											if (((0 + 0) - 0) == v1164) then
												v1165 = (1174 - (663 + 511)) + 0;
												while true do
													if (v1165 == (2 + 0)) then
														v287.Color = Color3.fromRGB((59 + 211) - ((70 - 47) + 102 + 65), 1878 - ((1624 - 934) + (2682 - 1574)), 33 + 28 + 29);
														v276.Text = "玩家进入提示";
														break;
													end
													if (v1165 == ((0 - 0) + 0 + 0)) then
														local v1339 = 0 + 0;
														while true do
															if (v1339 == (722 - (478 + 244))) then
																v2:SetCore("SendNotification", {Title="错误",Text="加载玩家进入提示脚本失败",Duration=((1370 - (440 + 77)) - (19 + 21 + 808)),Icon="rbxassetid://4483345998"});
																warn("加载玩家进入提示脚本失败:", v870);
																v1339 = 1;
															end
															if (v1339 == 1) then
																v1165 = (3 - 2) + (1556 - (655 + 901));
																break;
															end
														end
													end
													if (v1165 == (3 - (1 + 1))) then
														v296 = false;
														v276.BackgroundColor3 = v295;
														v1165 = 2 + 0 + 0 + 0;
													end
												end
												break;
											end
										end
										break;
									end
									if (v1163 == 0) then
										v1164 = (3162 - 2377) - (222 + 563);
										v1165 = nil;
										v1163 = 1446 - (695 + 750);
									end
								end
							end
							break;
						end
						if (((3 - 2) + (0 - 0)) == v868) then
							v276.Text = "玩家进入提示 ✓";
							v869, v870 = pcall(function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))();
							end);
							v868 = (7 - 5) + (351 - (285 + 66));
						end
					end
				else
					local v871 = 0;
					local v872;
					while true do
						if (v871 == 0) then
							v872 = 571 - ((108 - 61) + (1834 - (682 + 628)));
							while true do
								if (v872 == (1 + 0 + 0)) then
									v276.Text = "玩家进入提示";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="玩家进入提示脚本已卸载",Duration=(8 - (304 - (176 + 123))),Icon="rbxassetid://4483345998"});
									break;
								end
								if (v872 == ((0 + 0) - (0 + 0))) then
									local v1204 = 269 - (239 + 30);
									while true do
										if ((0 + 0) == v1204) then
											v276.BackgroundColor3 = v295;
											v287.Color = Color3.fromRGB((175 + 7) - (180 - 78), (5634 - 3828) - ((1480 - (306 + 9)) + 561), 3 + 87);
											v1204 = 1;
										end
										if ((3 - 2) == v1204) then
											v872 = 1 + 0;
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
	v276.Parent = v195;
	local v298 = Instance.new("TextButton");
	v298.Name = "FloatWalk";
	v298.Size = UDim2.new(0.9 - (0 + 0), 0 + 0 + (0 - 0), 1375 - (1140 + 235), (331 + 188) - (341 + 127 + 11));
	v298.Text = "踏空";
	v298.BackgroundColor3 = Color3.fromRGB(17 + 12 + 31, 60, (196 - (33 + 19)) - (27 + 47));
	v298.TextColor3 = Color3.new((980 - 653) - (89 + 105 + 132), 1 - 0, 1);
	v298.Font = Enum.Font.GothamSemibold;
	v298.TextSize = (46 + 2) - 33;
	v298.TextStrokeTransparency = 689.5 - (586 + 103);
	v298.TextStrokeColor3 = Color3.fromRGB(0, (0 + 0) - (0 - 0), 1488 - (1309 + 179));
	v298.AutoButtonColor = false;
	local v309 = Instance.new("UIStroke");
	v309.Thickness = (1593 - 710) - (253 + 328 + (805 - 505));
	v309.Color = Color3.fromRGB((982 + 318) - ((1816 - 961) + (727 - 362)), 190 - (719 - (295 + 314)), 30 + (147 - 87));
	v309.Transparency = (3197.3 - (1300 + 662)) - ((3234 - 2204) + (1960 - (1178 + 577)));
	v309.Parent = v298;
	local v314 = Instance.new("UICorner");
	v314.CornerRadius = UDim.new(0 + 0, 5 + 3 + (0 - 0));
	v314.Parent = v298;
	local v317 = Color3.fromRGB((1751 - (851 + 554)) - (138 + 18 + (360 - 230)), 130 - 70, 372 - (115 + 187));
	local v318 = false;
	v298.MouseEnter:Connect(function()
		if not v318 then
			local v696 = (0 + 0) - (0 + 0);
			while true do
				if (v696 == ((0 - 0) - 0)) then
					v298.BackgroundColor3 = Color3.fromRGB((1304 - (160 + 1001)) - (64 + 9), 14 + 5 + 51, (95 - 48) + 33);
					v309.Color = Color3.fromRGB((517 - (237 + 121)) - ((907 - (525 + 372)) + 59), 170 - 80, 29 + (233 - 162));
					break;
				end
			end
		end
	end);
	v298.MouseLeave:Connect(function()
		if not v318 then
			local v697 = 0;
			local v698;
			local v699;
			while true do
				if ((142 - (96 + 46)) == v697) then
					v698 = (777 - (643 + 134)) - (0 + 0);
					v699 = nil;
					v697 = 2 - 1;
				end
				if (v697 == (3 - 2)) then
					while true do
						if (v698 == ((1116 + 47) - ((1316 - 645) + (1005 - 513)))) then
							v699 = (719 - (316 + 403)) + 0 + 0;
							while true do
								if (v699 == (0 - 0)) then
									v298.BackgroundColor3 = v317;
									v309.Color = Color3.fromRGB((469 + 826) - ((929 - 560) + 600 + 246), 8 + 14 + 58, 311 - 221);
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
	v298.MouseButton1Click:Connect(function()
		local v621 = (0 - 0) + (0 - 0);
		while true do
			if (v621 == ((112 + 1833) - ((2039 - 1003) + 909))) then
				v318 = not v318;
				if v318 then
					local v875 = 0 + 0 + 0;
					local v876;
					local v877;
					local v878;
					while true do
						if (v875 == 1) then
							v878 = nil;
							while true do
								if (v876 == (1 - 0)) then
									v298.Text = "踏空 ✓";
									v877, v878 = pcall(function()
										loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))();
									end);
									v876 = 2;
								end
								if (v876 == 0) then
									local v1208 = 0 - 0;
									while true do
										if (v1208 == 1) then
											v876 = 18 - (12 + 5);
											break;
										end
										if (v1208 == (0 - 0)) then
											v298.BackgroundColor3 = Color3.fromRGB((603 - 320) - ((23 - 12) + 192), 81 + (195 - 116), 52 + 203);
											v309.Color = Color3.fromRGB((2268 - (1656 + 317)) - (121 + 14 + 40), (388 + 96) - (754 - 470), 1254 - 999);
											v1208 = 355 - (5 + 349);
										end
									end
								end
								if (v876 == ((9 - 7) + (1271 - (266 + 1005)))) then
									if v877 then
										local v1246 = 0 + 0;
										local v1247;
										local v1248;
										while true do
											if (v1246 == 0) then
												v1247 = (0 - 0) - (0 - 0);
												v1248 = nil;
												v1246 = 1;
											end
											if (v1246 == 1) then
												while true do
													if (v1247 == (1696 - (561 + 1135))) then
														v1248 = 0 - 0;
														while true do
															if (v1248 == 0) then
																v2:SetCore("SendNotification", {Title="XDG-HOB",Text="踏空脚本已加载",Duration=(4 - (3 - 2)),Icon="rbxassetid://4483345998"});
																print("踏空脚本加载成功");
																break;
															end
														end
														break;
													end
												end
												break;
											end
										end
									else
										local v1249 = (1242 - (507 + 559)) - ((125 - 75) + (389 - 263));
										local v1250;
										while true do
											if (v1249 == (0 - (388 - (212 + 176)))) then
												v1250 = 905 - (250 + 655);
												while true do
													if (v1250 == (1 + 1)) then
														v309.Color = Color3.fromRGB(1493 - (1233 + (490 - 310)), (1832 - 783) - ((816 - 294) + (2403 - (1869 + 87))), 312 - 222);
														v298.Text = "踏空";
														break;
													end
													if (v1250 == ((3323 - (484 + 1417)) - ((229 - 122) + (2201 - 887)))) then
														local v1343 = 773 - (48 + 725);
														while true do
															if (1 == v1343) then
																v1250 = 2;
																break;
															end
															if (0 == v1343) then
																v318 = false;
																v298.BackgroundColor3 = v317;
																v1343 = 1 - 0;
															end
														end
													end
													if (v1250 == (0 + (0 - 0))) then
														local v1344 = 0 + 0;
														while true do
															if (v1344 == (2 - 1)) then
																v1250 = 1 + 0;
																break;
															end
															if (v1344 == (0 + 0)) then
																v2:SetCore("SendNotification", {Title="错误",Text="加载踏空脚本失败",Duration=(858 - (152 + 701)),Icon="rbxassetid://4483345998"});
																warn("加载踏空脚本失败:", v878);
																v1344 = 1;
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
							break;
						end
						if (v875 == 0) then
							local v1070 = 1311 - (430 + 881);
							while true do
								if (0 == v1070) then
									v876 = 0 - (0 + 0);
									v877 = nil;
									v1070 = 1;
								end
								if (1 == v1070) then
									v875 = 1;
									break;
								end
							end
						end
					end
				else
					local v879 = 895 - (557 + 338);
					while true do
						if (v879 == (1 + 0)) then
							v298.Text = "踏空";
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="踏空脚本已卸载",Duration=(2 + (2 - 1)),Icon="rbxassetid://4483345998"});
							break;
						end
						if (v879 == ((0 - 0) - 0)) then
							v298.BackgroundColor3 = v317;
							v309.Color = Color3.fromRGB(80, (839 - 523) - (508 - 272), (2801 - (499 + 302)) - ((1582 - (39 + 827)) + 1194));
							v879 = 2 - 1;
						end
					end
				end
				break;
			end
		end
	end);
	v298.Parent = v195;
	local v320 = Instance.new("TextButton");
	v320.Name = "WallClimb";
	v320.Size = UDim2.new((0.9 - 0) + 0, (0 - 0) + (0 - 0), 0 + 0, 117 - 77);
	v320.Text = "爬墙";
	v320.BackgroundColor3 = Color3.fromRGB((91 + 472) - ((116 - 42) + (533 - (103 + 1))), (669 - (475 + 79)) - (118 - 63), (112 - 77) + 5 + 30);
	v320.TextColor3 = Color3.new(1 + 0, 2 - (1504 - (1395 + 108)), 1);
	v320.Font = Enum.Font.GothamSemibold;
	v320.TextSize = (31 - 20) + (1208 - (7 + 1197));
	v320.TextStrokeTransparency = 0.5 + 0;
	v320.TextStrokeColor3 = Color3.fromRGB((0 + 0) - 0, 0 - 0, 0);
	v320.AutoButtonColor = false;
	local v331 = Instance.new("UIStroke");
	v331.Thickness = (754 - (27 + 292)) - (279 + 154);
	v331.Color = Color3.fromRGB(858 - (454 + (949 - 625)), (79 - 16) + 17, 377 - 287);
	v331.Transparency = (33.3 - 16) - ((22 - 10) + (144 - (43 + 96)));
	v331.Parent = v320;
	local v336 = Instance.new("UICorner");
	v336.CornerRadius = UDim.new(0, 32 - 24);
	v336.Parent = v320;
	local v339 = Color3.fromRGB(135 - 75, 28 + 5 + 8 + 19, 70);
	local v340 = false;
	v320.MouseEnter:Connect(function()
		if not v340 then
			local v700 = 0 - (0 - 0);
			while true do
				if (v700 == (0 + 0 + (0 - 0))) then
					v320.BackgroundColor3 = Color3.fromRGB(70, 23 + 47, (87 + 1086) - ((2028 - (1414 + 337)) + 816));
					v331.Color = Color3.fromRGB(2030 - (1642 + 298), 90, 260 - 160);
					break;
				end
			end
		end
	end);
	v320.MouseLeave:Connect(function()
		if not v340 then
			local v701 = 0 - 0;
			local v702;
			while true do
				if (v701 == (0 - 0)) then
					v702 = (0 + 0) - (0 + 0);
					while true do
						if (v702 == ((2155 - (357 + 615)) - (1058 + 88 + 37))) then
							v320.BackgroundColor3 = v339;
							v331.Color = Color3.fromRGB(15 + (159 - 94), (904 + 151) - ((1746 - 931) + 160), 72 + 18);
							break;
						end
					end
					break;
				end
			end
		end
	end);
	v320.MouseButton1Click:Connect(function()
		local v622 = 0 - (0 + 0);
		while true do
			if (((0 + 0) - (1301 - (384 + 917))) == v622) then
				v340 = not v340;
				if v340 then
					local v882 = 0 + 0;
					local v883;
					local v884;
					while true do
						if (v882 == ((697 - (128 + 569)) - (1543 - (1407 + 136)))) then
							v320.BackgroundColor3 = Color3.fromRGB(1978 - ((1928 - (687 + 1200)) + (3567 - (556 + 1154))), (7222 - 5169) - (1222 + (766 - (9 + 86))), (1079 - (275 + 146)) - 403);
							v331.Color = Color3.fromRGB(20 + 100, (351 - (29 + 35)) - 87, 1437 - ((1014 - 785) + 953));
							v882 = (5301 - 3526) - (1111 + (2926 - 2263));
						end
						if (v882 == ((1030 + 551) - ((1886 - (53 + 959)) + 705))) then
							if v883 then
								local v1166 = 408 - (312 + 96);
								local v1167;
								local v1168;
								while true do
									if (v1166 == (0 - 0)) then
										v1167 = 0 + (285 - (147 + 138));
										v1168 = nil;
										v1166 = 900 - (813 + 86);
									end
									if (v1166 == 1) then
										while true do
											if ((0 + 0 + (0 - 0)) == v1167) then
												v1168 = 0;
												while true do
													if (v1168 == 0) then
														v2:SetCore("SendNotification", {Title="XDG-HOB",Text="爬墙脚本已加载",Duration=(495 - (18 + 474)),Icon="rbxassetid://4483345998"});
														print("爬墙脚本加载成功");
														break;
													end
												end
												break;
											end
										end
										break;
									end
								end
							else
								local v1169 = 0 + 0;
								local v1170;
								while true do
									if (v1169 == (0 - 0)) then
										v1170 = 0 - 0;
										while true do
											if (v1170 == (1088 - (860 + 226))) then
												v331.Color = Color3.fromRGB(3 + 77, 759 - (642 + (340 - (121 + 182))), 90);
												v320.Text = "爬墙";
												break;
											end
											if (v1170 == (0 + 0 + 0)) then
												v2:SetCore("SendNotification", {Title="错误",Text="加载爬墙脚本失败",Duration=((1241 - (988 + 252)) + 1 + 3),Icon="rbxassetid://4483345998"});
												warn("加载爬墙脚本失败:", v884);
												v1170 = 1 + 0;
											end
											if (v1170 == ((1972 - (49 + 1921)) - 1)) then
												v340 = false;
												v320.BackgroundColor3 = v339;
												v1170 = 892 - (223 + 667);
											end
										end
										break;
									end
								end
							end
							break;
						end
						if (v882 == (53 - (51 + 1))) then
							v320.Text = "爬墙 ✓";
							v883, v884 = pcall(function()
								loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))();
							end);
							v882 = (784 - 328) - (233 + (473 - 252));
						end
					end
				else
					local v885 = (1125 - (146 + 979)) - (0 + 0);
					while true do
						if ((0 + 0) == v885) then
							local v1079 = 0;
							while true do
								if (v1079 == (605 - (311 + 294))) then
									v320.BackgroundColor3 = v339;
									v331.Color = Color3.fromRGB(1621 - ((2002 - 1284) + 823), 22 + 29 + (1472 - (496 + 947)), 1448 - (1233 + 125));
									v1079 = 1 + 0;
								end
								if (v1079 == 1) then
									v885 = (724 + 82) - (51 + 215 + (2184 - (963 + 682)));
									break;
								end
							end
						end
						if (v885 == ((2 + 0) - (1505 - (504 + 1000)))) then
							v320.Text = "爬墙";
							v2:SetCore("SendNotification", {Title="XDG-HOB",Text="爬墙脚本已卸载",Duration=((827 + 401) - (580 + 56 + 56 + 533)),Icon="rbxassetid://4483345998"});
							break;
						end
					end
				end
				break;
			end
		end
	end);
	v320.Parent = v195;
	local v342 = Instance.new("TextButton");
	v342.Name = "IronFist";
	v342.Size = UDim2.new(0.9 - 0, 0, (0 + 0) - (0 + 0), 82 - (224 - (156 + 26)));
	v342.Text = "铁拳";
	v342.BackgroundColor3 = Color3.fromRGB(35 + 25, 48 + 12, (39 - 13) + (208 - (149 + 15)));
	v342.TextColor3 = Color3.new((1976 - (890 + 70)) - ((774 - (39 + 78)) + (840 - (14 + 468))), 2 - 1, (5 - 3) - 1);
	v342.Font = Enum.Font.GothamSemibold;
	v342.TextSize = 15;
	v342.TextStrokeTransparency = (0.5 + 0) - (0 + 0);
	v342.TextStrokeColor3 = Color3.fromRGB(1187 - (245 + 906 + 36), 0 + 0 + 0 + 0, (0 - 0) + 0 + 0);
	v342.AutoButtonColor = false;
	local v353 = Instance.new("UIStroke");
	v353.Thickness = (17 - 12) - (1 + 2);
	v353.Color = Color3.fromRGB((1963 - (12 + 39)) - (1444 + 108 + (866 - 586)), (3255 - 2341) - (64 + 229 + 541), 33 + 29 + 28);
	v353.Transparency = (0.3 - 0) - (0 + 0);
	v353.Parent = v342;
	local v358 = Instance.new("UICorner");
	v358.CornerRadius = UDim.new(0 - 0, 1718 - (1596 + 114));
	v358.Parent = v342;
	local v361 = Color3.fromRGB((28 - 17) + (762 - (164 + 549)), 1498 - (1059 + 379), 1313 - (157 + (1348 - 262)));
	local v362 = false;
	v342.MouseEnter:Connect(function()
		if not v362 then
			local v703 = (0 + 0) - 0;
			while true do
				if (v703 == 0) then
					v342.BackgroundColor3 = Color3.fromRGB(12 + 58, 70, 350 - 270);
					v353.Color = Color3.fromRGB(482 - (145 + 247), 74 + 16, 47 + 53);
					break;
				end
			end
		end
	end);
	v342.MouseLeave:Connect(function()
		if not v362 then
			local v704 = 0;
			while true do
				if (v704 == (0 - 0)) then
					v342.BackgroundColor3 = v361;
					v353.Color = Color3.fromRGB((24 + 98) - 42, (94 + 15) - (46 - 17), (1629 - (254 + 466)) - ((1159 - (544 + 16)) + (699 - 479)));
					break;
				end
			end
		end
	end);
	v342.MouseButton1Click:Connect(function()
		local v623 = 628 - (294 + 334);
		while true do
			if (((253 - (236 + 17)) - (0 + 0)) == v623) then
				v362 = not v362;
				if v362 then
					local v890 = (1504 + 427) - ((6827 - 5014) + 118);
					local v891;
					local v892;
					while true do
						if (v890 == ((0 - 0) + 0 + 0)) then
							local v1081 = 0 + 0;
							while true do
								if (v1081 == (795 - (413 + 381))) then
									v890 = (1 + 1) - (1 - 0);
									break;
								end
								if (v1081 == 0) then
									v342.BackgroundColor3 = Color3.fromRGB(80, (3576 - 2199) - ((2811 - (582 + 1388)) + (639 - 263)), 356 - 101);
									v353.Color = Color3.fromRGB(28 + 66 + 26, (909 - (326 + 38)) - (1020 - 675), (1589 - 475) - (464 + (1015 - (47 + 573))));
									v1081 = 1 + 0;
								end
							end
						end
						if (v890 == ((4 - 3) + (0 - 0))) then
							local v1082 = 1664 - (1269 + 395);
							while true do
								if (1 == v1082) then
									v890 = (1331 - (76 + 416)) - (467 + 370);
									break;
								end
								if (v1082 == (443 - (319 + 124))) then
									v342.Text = "铁拳 ✓";
									v891, v892 = pcall(function()
										loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))();
									end);
									v1082 = 2 - 1;
								end
							end
						end
						if ((1009 - (564 + 443)) == v890) then
							if v891 then
								local v1171 = 0 - 0;
								while true do
									if (v1171 == (458 - (337 + 121))) then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text="铁拳脚本已加载",Duration=((14 - 9) - 2),Icon="rbxassetid://4483345998"});
										print("铁拳脚本加载成功");
										break;
									end
								end
							else
								local v1172 = 0 + (0 - 0);
								while true do
									if (((1917 - (1261 + 650)) - 4) == v1172) then
										v353.Color = Color3.fromRGB(6 + 7 + 67, 186 - 106, 90);
										v342.Text = "铁拳";
										break;
									end
									if (v1172 == ((828 - 308) - ((1967 - (772 + 1045)) + 370))) then
										v2:SetCore("SendNotification", {Title="错误",Text="加载铁拳脚本失败",Duration=(1 + 4),Icon="rbxassetid://4483345998"});
										warn("加载铁拳脚本失败:", v892);
										v1172 = (1427 - (102 + 42)) - (74 + (3052 - (1524 + 320)));
									end
									if (v1172 == ((1272 - (1049 + 221)) - (157 - (18 + 138)))) then
										v362 = false;
										v342.BackgroundColor3 = v361;
										v1172 = 4 - 2;
									end
								end
							end
							break;
						end
					end
				else
					local v893 = 1102 - (67 + 1035);
					local v894;
					while true do
						if ((0 - 0) == v893) then
							v894 = 348 - (136 + 212);
							while true do
								if (v894 == ((4 - 3) + 0)) then
									v342.Text = "铁拳";
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text="铁拳脚本已卸载",Duration=(3 + 0),Icon="rbxassetid://4483345998"});
									break;
								end
								if (v894 == (390 - (13 + 1 + 376))) then
									v342.BackgroundColor3 = v361;
									v353.Color = Color3.fromRGB((1742 - (240 + 1364)) - (1140 - (1050 + 32)), 52 + (99 - 71), 54 + 36);
									v894 = 1056 - (331 + 724);
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
	v342.Parent = v195;
	return v189;
end
local function v150()
	local v364 = Instance.new("Frame");
	v364.Name = "FunctionContainer";
	v364.Size = UDim2.new(1 + 0 + (644 - (269 + 375)), 0 + (725 - (267 + 458)), (1 + 1) - (1 - 0), 0);
	v364.BackgroundTransparency = (819 - (667 + 151)) + (1497 - (1410 + 87));
	v364.Visible = false;
	v364.Parent = v136;
	local v370 = Instance.new("ScrollingFrame");
	v370.Name = "FunctionScroll";
	v370.Size = UDim2.new(1, -((1995 - (1504 + 393)) - ((62 - 39) + (142 - 87))), 1, -(47 - (823 - (461 + 335))));
	v370.Position = UDim2.new(0 + 0 + 0, 1771 - (1730 + 31), 0 + 0, 1677 - (728 + 939));
	v370.BackgroundTransparency = (3 - 2) - 0;
	v370.ScrollBarThickness = (3 - 1) + 4;
	v370.ScrollBarImageColor3 = Color3.fromRGB((2293 - 1292) - ((1720 - (138 + 930)) + 249), 92 + 8, 294 - (144 + 40));
	v370.CanvasSize = UDim2.new(1868 - (607 + 101 + 1160), (0 - 0) - (1766 - (459 + 1307)), 1870 - (474 + 1396), (1272 - 543) - 329);
	v370.Parent = v364;
	local v379 = Instance.new("UIListLayout");
	v379.Parent = v370;
	v379.Padding = UDim.new(0 + 0, 39 - (1 + 9 + (48 - 31)));
	v379.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	local v384 = Instance.new("Frame");
	v384.Name = "SpeedFrame";
	v384.Size = UDim2.new(0.9 + 0 + 0, 0 - 0, (7553 - 5821) - (1400 + (923 - (562 + 29))), (197 + 33) - (1529 - (374 + 1045)));
	v384.BackgroundColor3 = Color3.fromRGB((1558 + 410) - (242 + 1666), 186 - 126, (668 - (448 + 190)) + 13 + 27);
	v384.BackgroundTransparency = 0.1 + 0 + 0 + 0;
	local v389 = Instance.new("UICorner");
	v389.CornerRadius = UDim.new((0 - 0) + (0 - 0), 948 - ((2344 - (1307 + 187)) + 90));
	v389.Parent = v384;
	local v392 = Instance.new("UIStroke");
	v392.Thickness = (11 - 8) - (2 - 1);
	v392.Color = Color3.fromRGB((4507 - 3037) - ((1043 - (232 + 451)) + 984 + 46), 160, 200 + 26 + 29);
	v392.Transparency = 0.2 - (564 - (510 + 54));
	v392.Parent = v384;
	local v397 = Instance.new("ImageLabel");
	v397.Name = "SpeedIcon";
	v397.Size = UDim2.new((0 - 0) - 0, (1729 - (13 + 23)) - ((1771 - 862) + 752), 0, 32);
	v397.Position = UDim2.new(0, 10, 0 - 0, 1233 - ((197 - 88) + (2202 - (830 + 258))));
	v397.BackgroundTransparency = (3 - 2) - 0;
	v397.Image = "rbxassetid://3926305904";
	v397.ImageRectSize = Vector2.new(41 + 23, 55 + 9);
	v397.ImageRectOffset = Vector2.new((1441 - (860 + 581)) + 0, 128);
	v397.Parent = v384;
	local v406 = Instance.new("TextLabel");
	v406.Name = "SpeedTitle";
	v406.Size = UDim2.new(1, -50, (892 - 650) - (5 + 1 + (477 - (237 + 4))), 47 - 27);
	v406.Position = UDim2.new((0 - 0) + 0, (77 - 36) + 8 + 1, 0, 4 - 2);
	v406.BackgroundTransparency = (1 + 0) - (0 - 0);
	v406.Text = "防检测速度调整";
	v406.TextColor3 = Color3.fromRGB(180, (572 + 761) - (586 + 490 + (1483 - (85 + 1341))), 435 - 180);
	v406.Font = Enum.Font.GothamBold;
	v406.TextSize = 2 + (28 - 18);
	v406.TextXAlignment = Enum.TextXAlignment.Left;
	v406.Parent = v384;
	local v419 = Instance.new("TextBox");
	v419.Name = "SpeedInput";
	v419.Size = UDim2.new((1061.7 - (45 + 327)) - ((1092 - 513) + (612 - (444 + 58))), 0 + 0 + 0 + 0, 0 + 0, 30);
	v419.Position = UDim2.new((0.15 - 0) + (1732 - (64 + 1668)), 1973 - (1227 + 746), 0 + (0 - 0), 74 - 34);
	v419.BackgroundColor3 = Color3.fromRGB(539 - (415 + 79), (12 + 440) - ((665 - (142 + 349)) + 100 + 133), (209 - 56) - (49 + 49));
	v419.TextColor3 = Color3.fromRGB((272 + 114) - 166, 599 - 379, 103 + 127);
	v419.Font = Enum.Font.GothamSemibold;
	v419.TextSize = 1188 - ((2527 - (1710 + 154)) + (829 - (200 + 118)));
	v419.PlaceholderText = "输入速度 (16-400)";
	v419.Text = "16";
	v419.ClearTextOnFocus = false;
	local v431 = Instance.new("UICorner");
	v431.CornerRadius = UDim.new(0 + 0, (10 - 4) + (0 - 0));
	v431.Parent = v419;
	local v434 = Instance.new("UIStroke");
	v434.Thickness = 1;
	v434.Color = Color3.fromRGB(89 + 11, 22 + 0 + 78, 60 + 50);
	v434.Parent = v419;
	v419.FocusLost:Connect(function(v624)
		if v624 then
			local v705 = tonumber(v419.Text);
			if (v705 and (v705 >= (3 + 13)) and (v705 <= ((2670 - 1437) - 833))) then
				local v838 = (1250 - (363 + 887)) + (0 - 0);
				local v839;
				while true do
					if (v838 == ((0 - 0) - (0 + 0))) then
						v839 = (0 - 0) - 0;
						while true do
							if (v839 == (0 + 0 + 0)) then
								v8.SetRealSpeed(v705);
								v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("速度已设置为: " .. v705),Duration=3,Icon="rbxassetid://4483345998"});
								break;
							end
						end
						break;
					end
				end
			else
				local v840 = 0;
				local v841;
				while true do
					if (v840 == (1664 - (674 + 990))) then
						v841 = 0 - (0 + 0);
						while true do
							if (v841 == 0) then
								v419.Text = "16";
								v2:SetCore("SendNotification", {Title="错误",Text="请输入16-400之间的数字",Duration=(2 + 2 + (1 - 0)),Icon="rbxassetid://4483345998"});
								break;
							end
						end
						break;
					end
				end
			end
		end
	end);
	v419.Parent = v384;
	local v439 = Instance.new("TextButton");
	v439.Name = "ApplySpeedButton";
	v439.Size = UDim2.new((1055.5 - (507 + 548)) + (837 - (289 + 548)), (2540 - (821 + 997)) - ((733 - (195 + 60)) + 66 + 178), 517 - (440 + 77), (1515 - (251 + 1250)) + (46 - 30));
	v439.Position = UDim2.new((0.25 + 0) - 0, (2588 - (809 + 223)) - ((955 - 300) + (2705 - 1804)), 0 + (0 - 0), 59 + 21);
	v439.BackgroundColor3 = Color3.fromRGB(33 + 29 + (635 - (14 + 603)), (238 - (118 + 11)) + 9 + 42, (856 + 171) - (2249 - 1477));
	v439.Text = "应用速度";
	v439.TextColor3 = Color3.new(950 - (551 + 398), 1446 - (695 + 474 + 276), (2 + 1) - 2);
	v439.Font = Enum.Font.GothamSemibold;
	v439.TextSize = 14;
	v439.TextStrokeTransparency = (0.6 + 0) - 0;
	v439.TextStrokeColor3 = Color3.fromRGB(0 - (0 - 0), (808 - 457) - (93 + 192 + (262 - 196)), (0 + 0) - 0);
	local v450 = Instance.new("UICorner");
	v450.CornerRadius = UDim.new(1310 - ((771 - (40 + 49)) + 628), (3 - 2) + (495 - (99 + 391)));
	v450.Parent = v439;
	local v453 = Instance.new("UIStroke");
	v453.Thickness = (249 + 51) - (176 + (540 - 417));
	v453.Color = Color3.fromRGB(51 + (170 - 101), 143 + 3 + (141 - 87), 1859 - (1032 + 572));
	v453.Parent = v439;
	v439.MouseEnter:Connect(function()
		v439.BackgroundColor3 = Color3.fromRGB((786 - (203 + 214)) - ((2056 - (568 + 1249)) + 24 + 6), (117 - 68) + 131, (950 - 704) + (1315 - (913 + 393)));
	end);
	v439.MouseLeave:Connect(function()
		v439.BackgroundColor3 = Color3.fromRGB(141 - (172 - 111), 499 - 339, 359 - 104);
	end);
	v439.MouseButton1Click:Connect(function()
		local v627 = 315 - ((716 - (269 + 141)) + (19 - 10));
		local v628;
		while true do
			if (v627 == ((1981 - (362 + 1619)) - (1625 - (950 + 675)))) then
				v628 = tonumber(v419.Text);
				if (v628 and (v628 >= (2 + 1 + (1192 - (216 + 963)))) and (v628 <= ((1533 - (485 + 802)) + 154))) then
					local v895 = 559 - (432 + 127);
					local v896;
					while true do
						if (v895 == ((1073 - (1065 + 8)) + 0 + 0)) then
							v896 = 1601 - (635 + 966);
							while true do
								if (v896 == (0 - 0)) then
									v8.SetRealSpeed(v628);
									v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("速度已设置为: " .. v628),Duration=((991 + 387) - ((1182 - (5 + 37)) + (584 - 349))),Icon="rbxassetid://4483345998"});
									break;
								end
							end
							break;
						end
					end
				else
					local v897 = 0;
					local v898;
					while true do
						if ((0 + 0 + (0 - 0)) == v897) then
							v898 = 0 + 0 + 0;
							while true do
								if (v898 == (0 + 0)) then
									v419.Text = "16";
									v2:SetCore("SendNotification", {Title="错误",Text="请输入16-400之间的数字",Duration=((118 - 61) - (33 + (71 - 52))),Icon="rbxassetid://4483345998"});
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
	v439.Parent = v384;
	local v458 = Instance.new("TextLabel");
	v458.Name = "CurrentSpeedLabel";
	v458.Size = UDim2.new(1 - 0, (0 - 0) + 0 + 0, 529 - (318 + 211), (290 - 231) - (1626 - (963 + 624)));
	v458.Position = UDim2.new(0 + 0, (846 - (518 + 328)) + 0, 0 - (0 - 0), (172 - 64) + (324 - (301 + 16)));
	v458.BackgroundTransparency = (2022 - 1332) - (586 + (288 - 185));
	v458.TextColor3 = Color3.fromRGB(469 - 289, 18 + 1 + 103 + 78, (1675 - 890) - (319 + 211));
	v458.Font = Enum.Font.GothamSemibold;
	v458.TextSize = (143 + 1356) - ((4161 - 2852) + 179);
	v458.Text = "当前速度: 16";
	v458.Parent = v384;
	local function v468()
		v458.Text = "当前速度: " .. math.floor(v8.GetRealSpeed());
	end
	game:GetService("RunService").Heartbeat:Connect(function()
		v468();
	end);
	v384.Parent = v370;
	local v470 = {};
	do
		local v630 = (0 + 0) - (1019 - (829 + 190));
		local v631;
		local v632;
		local v633;
		local v634;
		local v635;
		local v636;
		while true do
			if (v630 == (1 + (3 - 2))) then
				local v827 = 0;
				while true do
					if (v827 == 1) then
						v634 = v631.CharacterAdded:Connect(function(v1037)
							local v1038 = 0 - 0;
							local v1039;
							local v1040;
							while true do
								if ((0 - 0) == v1038) then
									v1039 = (0 - 0) - 0;
									v1040 = nil;
									v1038 = 1 + 0;
								end
								if (v1038 == (1 + 0)) then
									while true do
										if (v1039 == ((2 - 1) + 0)) then
											if v1040 then
												local v1294 = (0 + 0) - (613 - (520 + 93));
												while true do
													if (v1294 == ((276 - (259 + 17)) - (0 + 0))) then
														v1040.JumpHeight = v632;
														v635();
														v1294 = (220 + 390) - ((998 - 703) + (905 - (396 + 195)));
													end
													if (v1294 == 1) then
														v1040.Died:Connect(function()
															local v1345 = (0 - 0) - (1761 - (440 + 1321));
															local v1346;
															while true do
																if (v1345 == 0) then
																	v1346 = (3791 - (1059 + 770)) - ((6011 - 4711) + (1207 - (424 + 121)));
																	while true do
																		if (v1346 == ((0 + 0) - (1347 - (641 + 706)))) then
																			task.wait(1758 - (467 + 711 + 577));
																			v635();
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
											end
											break;
										end
										if (v1039 == ((440 - (249 + 191)) + (0 - 0))) then
											local v1254 = 0 + 0;
											while true do
												if (1 == v1254) then
													v1039 = (3 - 2) + 0;
													break;
												end
												if (v1254 == 0) then
													task.wait(0.5 - (427 - (183 + 244)));
													v1040 = v1037:WaitForChild("Humanoid", 1410 - (42 + 809 + (1284 - (434 + 296))));
													v1254 = 2 - 1;
												end
											end
										end
									end
									break;
								end
							end
						end);
						v470.GetJumpHeight = function()
							return v632;
						end;
						v827 = 514 - (169 + 343);
					end
					if (v827 == (2 + 0)) then
						v630 = (13 - 5) - (14 - 9);
						break;
					end
					if (v827 == 0) then
						v636();
						if v634 then
							v634:Disconnect();
						end
						v827 = 1;
					end
				end
			end
			if (v630 == ((0 + 0) - (0 - 0))) then
				local v828 = 1123 - (651 + 472);
				while true do
					if (v828 == (0 + 0)) then
						v631 = game:GetService("Players").LocalPlayer;
						v632 = 7.2;
						v828 = 1 + 0;
					end
					if (v828 == (2 - 0)) then
						v630 = 484 - (397 + 86);
						break;
					end
					if ((877 - (423 + 453)) == v828) then
						v633 = nil;
						v634 = nil;
						v828 = 1 + 1;
					end
				end
			end
			if (v630 == 3) then
				v470.SetJumpHeight = function(v842)
					local v843 = 0 + 0;
					while true do
						if (v843 == 0) then
							if ((v842 >= ((270.2 + 39) - (92 + 23 + 168 + 19))) and (v842 <= (383 + (1307 - (50 + 1140))))) then
								local v1130 = 0 + 0;
								local v1131;
								while true do
									if ((0 + 0) == v1130) then
										v632 = v842;
										v635();
										v1130 = 1 + 0 + 0;
									end
									if (v1130 == (3 - (2 - 0))) then
										local v1237 = 0;
										local v1238;
										while true do
											if ((0 + 0) == v1237) then
												v1238 = 596 - (157 + 439);
												while true do
													if (v1238 == ((2020 - 858) - ((531 - 371) + (2960 - 1959)))) then
														v1130 = 2 + (918 - (782 + 136));
														break;
													end
													if (v1238 == 0) then
														v1131 = v631.Character;
														if v1131 then
															local v1348 = 855 - (112 + 743);
															local v1349;
															local v1350;
															while true do
																if (1 == v1348) then
																	while true do
																		if (v1349 == ((1171 - (1026 + 145)) - (0 + 0))) then
																			v1350 = v1131:FindFirstChild("Humanoid");
																			if v1350 then
																				v1350.JumpHeight = v632;
																			end
																			break;
																		end
																	end
																	break;
																end
																if (v1348 == (718 - (493 + 225))) then
																	v1349 = (0 - 0) + 0 + 0;
																	v1350 = nil;
																	v1348 = 2 - 1;
																end
															end
														end
														v1238 = 359 - (5 + 232 + (345 - 224));
													end
												end
												break;
											end
										end
									end
									if (v1130 == ((262 + 637) - ((876 - 351) + 372))) then
										return true;
									end
								end
							end
							return false;
						end
					end
				end;
				v470.Cleanup = function()
					local v844 = 0;
					local v845;
					while true do
						if (v844 == 0) then
							if v633 then
								local v1132 = 1595 - (210 + 1385);
								local v1133;
								local v1134;
								while true do
									if (v1132 == (1690 - (1201 + 488))) then
										while true do
											if (v1133 == (0 - (0 + 0))) then
												v1134 = 0 - (0 - 0);
												while true do
													if (v1134 == ((253 - 111) - ((681 - (352 + 233)) + (111 - 65)))) then
														v633:Disconnect();
														v633 = nil;
														break;
													end
												end
												break;
											end
										end
										break;
									end
									if (v1132 == (0 + 0)) then
										v1133 = 0;
										v1134 = nil;
										v1132 = 1;
									end
								end
							end
							if v634 then
								v634:Disconnect();
								v634 = nil;
							end
							v844 = 778 - ((1828 - 1185) + (708 - (489 + 85)));
						end
						if (v844 == (1 + (1501 - (277 + 1224)))) then
							v845 = v631.Character;
							if v845 then
								local v1135 = (1493 - (663 + 830)) - 0;
								local v1136;
								while true do
									if (v1135 == (0 + 0)) then
										v1136 = v845:FindFirstChild("Humanoid");
										if v1136 then
											v1136.JumpHeight = (61.2 - 36) - (893 - (461 + 414));
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
			if (v630 == (1 + 0 + 0)) then
				v635 = nil;
				function v635()
					local v846 = 0;
					local v847;
					local v848;
					while true do
						if (v846 == (1 + 0)) then
							while true do
								if (v847 == (0 - (0 + 0))) then
									v848 = (709 + 10) - ((566 - (172 + 78)) + (648 - 245));
									while true do
										if (v848 == 0) then
											if v633 then
												local v1295 = 0 + 0 + 0;
												while true do
													if (v1295 == ((0 - 0) - 0)) then
														v633:Disconnect();
														v633 = nil;
														break;
													end
												end
											end
											v633 = game:GetService("RunService").Heartbeat:Connect(function()
												local v1268 = 0 + 0;
												local v1269;
												local v1270;
												while true do
													if (v1268 == (0 + 0)) then
														v1269 = (0 - 0) + (0 - 0);
														v1270 = nil;
														v1268 = 1;
													end
													if (v1268 == (1 + 0)) then
														while true do
															if (v1269 == ((0 + 0) - 0)) then
																v1270 = v631.Character;
																if v1270 then
																	local v1356 = 0;
																	local v1357;
																	local v1358;
																	while true do
																		if (v1356 == 1) then
																			while true do
																				if (v1357 == (0 + 0 + (0 - 0))) then
																					v1358 = v1270:FindFirstChild("Humanoid");
																					if (v1358 and (v1358.JumpHeight ~= v632)) then
																						v1358.JumpHeight = v632;
																					end
																					break;
																				end
																			end
																			break;
																		end
																		if (v1356 == (0 - 0)) then
																			v1357 = 0 + 0 + 0;
																			v1358 = nil;
																			v1356 = 1;
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
							break;
						end
						if (v846 == (0 + 0)) then
							v847 = (447 - (133 + 314)) - (0 + 0);
							v848 = nil;
							v846 = 214 - (199 + 14);
						end
					end
				end
				v636 = nil;
				function v636()
					local v849 = (0 - 0) - 0;
					local v850;
					while true do
						if (v849 == (1549 - (647 + 902))) then
							v850 = v631.Character;
							if v850 then
								local v1137 = 0;
								local v1138;
								while true do
									if (v1137 == ((0 - 0) - (233 - (85 + 148)))) then
										local v1239 = 1289 - (426 + 863);
										while true do
											if (v1239 == (4 - 3)) then
												v1137 = (1655 - (873 + 781)) - (0 - 0);
												break;
											end
											if (v1239 == 0) then
												task.wait(0.5 - (0 - 0));
												v1138 = v850:WaitForChild("Humanoid", 1 + 0 + (14 - 10));
												v1239 = 1 - 0;
											end
										end
									end
									if (v1137 == (2 - 1)) then
										if v1138 then
											local v1271 = 0;
											while true do
												if (v1271 == 0) then
													v1138.JumpHeight = v632;
													v1138.Died:Connect(function()
														local v1326 = 0;
														while true do
															if (((1947 - (414 + 1533)) + 0 + 0) == v1326) then
																task.wait(558 - (443 + 112));
																v635();
																break;
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
							end
							break;
						end
					end
				end
				v630 = (1484 - (888 + 591)) - 3;
			end
		end
	end
	local v471 = Instance.new("Frame");
	v471.Name = "JumpPowerFrame";
	v471.Size = UDim2.new(17.9 - ((30 - 18) + 5), (0 + 0) - (0 - 0), (0 + 0) - 0, (124 + 131) - 135);
	v471.BackgroundColor3 = Color3.fromRGB(148 - (10 + 78), (24 - 11) + (86 - 39), (3721 - (136 + 1542)) - (1656 + (1039 - 722)));
	v471.BackgroundTransparency = 0.1;
	local v476 = Instance.new("UICorner");
	v476.CornerRadius = UDim.new(0 + 0 + 0, 7 + (1 - 0));
	v476.Parent = v471;
	local v479 = Instance.new("UIStroke");
	v479.Thickness = (3 + 1) - (488 - (68 + 418));
	v479.Color = Color3.fromRGB((1065 - 672) - (567 - 254), 160, (526 + 83) - ((1097 - (770 + 322)) + 21 + 328));
	v479.Transparency = (0.2 + 0) - (0 + 0);
	v479.Parent = v471;
	local v484 = Instance.new("ImageLabel");
	v484.Name = "JumpPowerIcon";
	v484.Size = UDim2.new(0 - 0, 1303 - ((515 - 249) + (2736 - 1731)), 0 - 0, 13 + 9 + (14 - 4));
	v484.Position = UDim2.new((0 + 0) - (0 + 0), 8 + 2, 0, 13 - 3);
	v484.BackgroundTransparency = 3 - 2;
	v484.Image = "rbxassetid://3926305904";
	v484.ImageRectSize = Vector2.new(88 - 24, (595 + 1165) - (561 + (5228 - 4093)));
	v484.ImageRectOffset = Vector2.new((0 - 0) - (0 + 0), 1900 - 1516);
	v484.Parent = v471;
	local v493 = Instance.new("TextLabel");
	v493.Name = "JumpPowerTitle";
	v493.Size = UDim2.new(3 - (833 - (762 + 69)), -((3613 - 2497) - (507 + 559)), (0 + 0) - (0 + 0), (147 - 86) - (13 + 28));
	v493.Position = UDim2.new((7 + 381) - ((825 - 613) + (333 - (8 + 149))), 1370 - (1199 + 121), (1531 - 626) - ((564 - 314) + 270 + 385), 6 - 4);
	v493.BackgroundTransparency = 1;
	v493.Text = "防检测跳跃高度";
	v493.TextColor3 = Color3.fromRGB((1137 - 647) - 310, 177 + 23, 445 - 190);
	v493.Font = Enum.Font.GothamBold;
	v493.TextSize = 1819 - (518 + 1289);
	v493.TextXAlignment = Enum.TextXAlignment.Left;
	v493.Parent = v471;
	local v504 = Instance.new("TextBox");
	v504.Name = "JumpPowerInput";
	v504.Size = UDim2.new((0.7 - 0) - 0, 0 + 0, (2856 - 900) - (1377 + 492 + (556 - (304 + 165))), (99 + 5) - (234 - (54 + 106)));
	v504.Position = UDim2.new(1901.15 - ((2453 - (1618 + 351)) + 1417), 0, 0 - (0 + 0), 67 - 27);
	v504.BackgroundColor3 = Color3.fromRGB((1834 - (10 + 1006)) - (13 + 35 + 725), 45, (13 + 76) - (110 - 76));
	v504.TextColor3 = Color3.fromRGB(590 - (1403 - (912 + 121)), 61 + 67 + (1381 - (1140 + 149)), (393 + 221) - 384);
	v504.Font = Enum.Font.GothamSemibold;
	v504.TextSize = 4 + 10;
	v504.PlaceholderText = "输入跳跃高度 (7.2-500)";
	v504.Text = "7.2";
	v504.ClearTextOnFocus = false;
	local v515 = Instance.new("UICorner");
	v515.CornerRadius = UDim.new((0 - 0) + 0, 859 - (29 + 123 + (2399 - 1698)));
	v515.Parent = v504;
	local v518 = Instance.new("UIStroke");
	v518.Thickness = 1;
	v518.Color = Color3.fromRGB(100, 1411 - ((806 - 376) + 152 + 729), 381 - 271);
	v518.Parent = v504;
	v504.FocusLost:Connect(function(v637)
		if v637 then
			local v706 = 186 - (165 + 21);
			local v707;
			local v708;
			while true do
				if (0 == v706) then
					v707 = 111 - (61 + 50);
					v708 = nil;
					v706 = 1 + 0;
				end
				if (v706 == 1) then
					while true do
						if (((0 - 0) + 0) == v707) then
							v708 = tonumber(v504.Text);
							if (v708 and (v708 >= (14.2 - 7)) and (v708 <= (197 + 303))) then
								local v1174 = 1460 - (1295 + 165);
								local v1175;
								while true do
									if (v1174 == ((205 + 690) - (224 + 333 + (1735 - (819 + 578))))) then
										v1175 = v470.SetJumpHeight(v708);
										if v1175 then
											v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("跳跃高度已设置为: " .. string.format("%.1f", v708)),Duration=(1 + 2),Icon="rbxassetid://4483345998"});
										end
										break;
									end
								end
							else
								local v1176 = 1402 - (331 + 1071);
								local v1177;
								while true do
									if (v1176 == (743 - (588 + 155))) then
										v1177 = (1282 - (546 + 736)) - 0;
										while true do
											if (((1937 - (1834 + 103)) - (0 + 0)) == v1177) then
												v504.Text = "7.2";
												v2:SetCore("SendNotification", {Title="错误",Text="请输入7.2-500之间的数字",Duration=5,Icon="rbxassetid://4483345998"});
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
	local v522 = Instance.new("TextButton");
	v522.Name = "ApplyJumpPowerButton";
	v522.Size = UDim2.new((0.5 - 0) - (1766 - (1536 + 230)), (491 - (128 + 363)) - 0, 801 - (107 + 392 + (751 - 449)), 8 + 22);
	v522.Position = UDim2.new((1434.25 - 568) - ((114 - 75) + (2008 - 1181)), 0 + 0, 1009 - (615 + 394), (199 + 21) - (134 + 6));
	v522.BackgroundColor3 = Color3.fromRGB((542 - 364) - (444 - 346), (1286 - (59 + 592)) - (1051 - 576), (719 - 328) - (96 + 40));
	v522.Text = "应用高度";
	v522.TextColor3 = Color3.new(172 - (70 + 101), 2 - 1, 1 + 0 + (0 - 0));
	v522.Font = Enum.Font.GothamSemibold;
	v522.TextSize = 14;
	v522.TextStrokeTransparency = (241.6 - (123 + 118)) - (0 + 0);
	v522.TextStrokeColor3 = Color3.fromRGB(0 + 0 + (1399 - (653 + 746)), 0, 0 - (0 - 0));
	local v533 = Instance.new("UICorner");
	v533.CornerRadius = UDim.new(0 - 0, 110 - ((275 - 172) + 1 + 0));
	v533.Parent = v522;
	local v536 = Instance.new("UIStroke");
	v536.Thickness = (356 + 199) - (475 + 69 + 10);
	v536.Color = Color3.fromRGB(259 - 139, 25 + 175, 40 + 215);
	v536.Parent = v522;
	v522.MouseEnter:Connect(function()
		v522.BackgroundColor3 = Color3.fromRGB((784 - 464) - 220, 172 + 8, 255);
	end);
	v522.MouseLeave:Connect(function()
		v522.BackgroundColor3 = Color3.fromRGB(147 - 67, (1255 - (885 + 349)) + 111 + 28, (613 - 388) + (87 - 57));
	end);
	v522.MouseButton1Click:Connect(function()
		local v640 = (2471 - (915 + 53)) - ((2196 - (768 + 33)) + (413 - 305));
		local v641;
		while true do
			if (v640 == (0 - 0)) then
				v641 = tonumber(v504.Text);
				if (v641 and (v641 >= 7.2) and (v641 <= 500)) then
					local v899 = 0;
					local v900;
					local v901;
					while true do
						if (v899 == (329 - (287 + 41))) then
							while true do
								if (v900 == (847 - (638 + 209))) then
									v901 = v470.SetJumpHeight(v641);
									if v901 then
										v2:SetCore("SendNotification", {Title="XDG-HOB",Text=("跳跃高度已设置为: " .. string.format("%.1f", v641)),Duration=((628 + 579) - ((1693 - (96 + 1590)) + (2869 - (741 + 931)))),Icon="rbxassetid://4483345998"});
									end
									break;
								end
							end
							break;
						end
						if (v899 == 0) then
							v900 = (0 + 0) - (0 - 0);
							v901 = nil;
							v899 = 1;
						end
					end
				else
					local v902 = 0 - 0;
					local v903;
					while true do
						if (v902 == (0 + 0)) then
							v903 = 0 + 0 + 0 + 0;
							while true do
								if (0 == v903) then
									v504.Text = "7.2";
									v2:SetCore("SendNotification", {Title="错误",Text="请输入7.2-500之间的数字",Duration=(2 + (11 - 8)),Icon="rbxassetid://4483345998"});
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
	local v540 = Instance.new("TextLabel");
	v540.Name = "CurrentJumpLabel";
	v540.Size = UDim2.new((104 + 216) - (14 + 13 + 292), 0 - (0 - 0), (0 + 0) - (494 - (64 + 430)), 83 - 63);
	v540.Position = UDim2.new((0 + 0) - (363 - (106 + 257)), (0 + 0) - (721 - (496 + 225)), 139 - ((87 - 44) + (467 - 371)), (2127 - (256 + 1402)) - 354);
	v540.BackgroundTransparency = 1 - (1899 - (30 + 1869));
	v540.TextColor3 = Color3.fromRGB((1519 - (213 + 1156)) + (218 - (96 + 92)), 10 + 47 + (1042 - (142 + 757)), (411 + 93) - 249);
	v540.Font = Enum.Font.GothamSemibold;
	v540.TextSize = 5 + 6;
	v540.Text = "当前高度: 7.2";
	v540.Parent = v471;
	game:GetService("RunService").Heartbeat:Connect(function()
		v540.Text = "当前高度: " .. string.format("%.1f", v470.GetJumpHeight());
	end);
	v522.Parent = v471;
	v504.Parent = v471;
	v471.Parent = v370;
	return v364;
end
local function v151()
	local v553 = 0 + 0;
	local v554;
	local v555;
	local v556;
	local v557;
	local v558;
	local v559;
	local v560;
	local v561;
	local v562;
	local v563;
	local v564;
	local v565;
	local v566;
	local v567;
	local v568;
	local v569;
	local v570;
	local v571;
	local v572;
	local v573;
	local v574;
	local v575;
	local v576;
	local v577;
	local v578;
	local v579;
	local v580;
	local v581;
	while true do
		if (((104 - (32 + 47)) - (1988 - (1053 + 924))) == v553) then
			local v709 = 0;
			while true do
				if (v709 == (4 + 0)) then
					v573.Size = UDim2.new((2 - 0) - (1649 - (685 + 963)), -(101 - 51), 1 + 0, 0 - 0);
					v553 = 12 + 3;
					break;
				end
				if (v709 == (1712 - (541 + 1168))) then
					v573 = Instance.new("TextLabel");
					v573.Name = "ExecutorName";
					v709 = 1601 - (645 + 952);
				end
				if (v709 == (838 - (669 + 169))) then
					v572.Position = UDim2.new(0 + (0 - 0), (1 - 0) + 9, 0.5 + 0, -(4 + 12));
					v572.BackgroundTransparency = 766 - (181 + 584);
					v709 = 1396 - (665 + 730);
				end
				if (v709 == 2) then
					v572.ImageRectOffset = Vector2.new((1441 - 941) - (627 - 319), (1718 - (540 + 810)) - 240);
					v572.Parent = v569;
					v709 = 3;
				end
				if (v709 == (3 - 2)) then
					v572.Image = "rbxassetid://3926305904";
					v572.ImageRectSize = Vector2.new((4990 - 3175) - (1126 + 288 + (540 - (166 + 37))), (3885 - (22 + 1859)) - ((3414 - (843 + 929)) + 298));
					v709 = 264 - (30 + 232);
				end
			end
		end
		if (v553 == ((2776 - 1804) - (357 + (1392 - (55 + 722))))) then
			v554 = Instance.new("Frame");
			v554.Name = "InfoContainer";
			v554.Size = UDim2.new(1 + (0 - 0), 0, (1677 - (78 + 1597)) - (1 + 0), 0 + 0 + 0);
			v554.BackgroundTransparency = (2 + 0) - (550 - (305 + 244));
			v554.Visible = false;
			v554.Parent = v136;
			v555 = Instance.new("ScrollingFrame");
			v555.Name = "InfoScroll";
			v555.Size = UDim2.new(1 + 0 + 0, -(2 + 18), 1 + (105 - (95 + 10)), -(1321 - (384 + 917)));
			v553 = (495 + 203) - ((405 - 277) + 569);
		end
		if (v553 == (16 - 4)) then
			local v717 = 762 - (592 + 170);
			while true do
				if (v717 == (6 - 4)) then
					v569.Size = UDim2.new(0.9 - 0, 0 + 0, (601 + 942) - ((3397 - 1990) + 136), 1937 - (112 + 575 + 1200));
					v569.BackgroundColor3 = Color3.fromRGB((3280 - 1510) - (556 + (1661 - (353 + 154))), 79 - 19, (335 - 89) - (122 + 54));
					v717 = 3 + 0;
				end
				if (v717 == 0) then
					v568.Parent = v563;
					v563.Parent = v555;
					v717 = 1 + 0;
				end
				if (v717 == (3 - 0)) then
					v569.BackgroundTransparency = 0.1 - 0;
					v570 = Instance.new("UICorner");
					v717 = 4;
				end
				if (v717 == (9 - 5)) then
					v570.CornerRadius = UDim.new(86 - (7 + 79), 8);
					v553 = 13;
					break;
				end
				if (v717 == (1 + 0)) then
					v569 = Instance.new("Frame");
					v569.Name = "ExecutorFrame";
					v717 = 2;
				end
			end
		end
		if (v553 == (116 - ((190 - (24 + 157)) + 86))) then
			local v718 = 0 - 0;
			local v719;
			while true do
				if (v718 == (0 - 0)) then
					v719 = (120 + 301) - ((740 - 465) + (526 - (262 + 118)));
					while true do
						if (v719 == (1087 - (1038 + 45))) then
							v580.Text = "系统状态";
							v553 = 22;
							break;
						end
						if (((1 - 0) + (232 - (19 + 211))) == v719) then
							v580.Position = UDim2.new(0, (227 - (88 + 25)) - (29 + (89 - 54)), (0 + 0) - (0 + 0), 5 - 3);
							v580.BackgroundTransparency = 4 - (1039 - (1007 + 29));
							v719 = 1 + 2 + (2 - 1);
						end
						if (v719 == (1014 - ((250 - 197) + 959))) then
							local v1086 = 0;
							while true do
								if (v1086 == (0 + 0)) then
									v580.Name = "StatusTitle";
									v580.Size = UDim2.new((1220 - (340 + 471)) - ((785 - 473) + 96), -((675 - (276 + 313)) - (87 - 51)), 285 - (136 + 11 + 138), 9 + 11);
									v1086 = 1 + 0;
								end
								if (v1086 == (1973 - (495 + 1477))) then
									v719 = (2700 - 1798) - (533 + 280 + (489 - (342 + 61)));
									break;
								end
							end
						end
						if (v719 == (0 + 0)) then
							local v1087 = 0 + 0;
							while true do
								if (v1087 == 1) then
									v719 = (166 - (4 + 161)) - (0 + 0);
									break;
								end
								if (v1087 == 0) then
									v579.TextXAlignment = Enum.TextXAlignment.Left;
									v579.TextYAlignment = Enum.TextYAlignment.Top;
									v1087 = 3 - 2;
								end
							end
						end
						if (v719 == ((1295 - 802) - ((515 - (322 + 175)) + (1037 - (173 + 390))))) then
							v579.Parent = v575;
							v580 = Instance.new("TextLabel");
							v719 = 1 + 1;
						end
					end
					break;
				end
			end
		end
		if (v553 == (3 + 5)) then
			v565 = Instance.new("UIStroke");
			v565.Thickness = (320 - (203 + 111)) - (1 + 3);
			v565.Color = Color3.fromRGB(1166 - (860 + 160 + 66), (1351 - 888) - (110 + 11 + (888 - (57 + 649))), 639 - (328 + 56));
			v565.Transparency = 0.2 + 0 + 0;
			v565.Parent = v563;
			v566 = Instance.new("ImageLabel");
			v566.Name = "PlayerIcon";
			v566.Size = UDim2.new(512 - (433 + 79), 3 + 29, 0, 32);
			v566.Position = UDim2.new(0 + 0, 33 - 23, (5863.5 - 4623) - (721 + 267 + 225 + 27), -((1038 - (562 + 474)) + 14));
			v553 = (6 - 3) + 6;
		end
		if (v553 == 10) then
			v567.BackgroundTransparency = 1971 - ((99 - 50) + 1921);
			v567.Text = v1.Name;
			v567.TextColor3 = Color3.fromRGB((2015 - (76 + 829)) - (223 + (2340 - (1506 + 167))), (510 - 238) - ((317 - (58 + 208)) + 1 + 0), (282 + 113) - 165);
			v567.Font = Enum.Font.GothamSemibold;
			v567.TextSize = 29 - (9 + 6);
			v567.TextStrokeTransparency = (4589.7 - 3464) - ((483 - (258 + 79)) + 125 + 854);
			v567.TextStrokeColor3 = Color3.fromRGB((0 - 0) + (1470 - (1219 + 251)), (2276 - (1231 + 440)) - ((369 - (34 + 24)) + 171 + 123), 0 - 0);
			v567.Parent = v563;
			v568 = Instance.new("TextLabel");
			v553 = (14 + 16) - (57 - 38);
		end
		if (v553 == (5 + (18 - 12))) then
			local v737 = 0 - 0;
			while true do
				if (v737 == (9 - 6)) then
					v568.Font = Enum.Font.GothamBold;
					v568.TextSize = 25 - 13;
					v737 = 1593 - (877 + 712);
				end
				if (v737 == 4) then
					v568.TextXAlignment = Enum.TextXAlignment.Left;
					v553 = 8 + 4;
					break;
				end
				if (v737 == 2) then
					v568.Text = "角色名称";
					v568.TextColor3 = Color3.fromRGB((905 - (242 + 512)) + (60 - 31), (2331 - (92 + 535)) - (397 + 107 + 1000), (354 - 182) + 83);
					v737 = 1 + 2;
				end
				if (v737 == (3 - 2)) then
					v568.Position = UDim2.new(0 + 0 + 0, 32 + 13 + 5, 0 + 0, (1 - 0) + (1 - 0));
					v568.BackgroundTransparency = (3431 - (1476 + 309)) - ((2247 - (299 + 985)) + 163 + 519);
					v737 = 6 - 4;
				end
				if (v737 == (93 - (86 + 7))) then
					v568.Name = "PlayerTitle";
					v568.Size = UDim2.new((5901 - 4457) - (48 + 448 + (1827 - (672 + 208))), -(1408 - (529 + 704 + (257 - (14 + 118)))), 445 - (339 + 106), 20);
					v737 = 1;
				end
			end
		end
		if (v553 == (4 + 0)) then
			v560.BackgroundTransparency = 1 + 0 + (1395 - (440 + 955));
			v560.Image = "rbxassetid://3926305904";
			v560.ImageRectSize = Vector2.new(64 + 0, 64);
			v560.ImageRectOffset = Vector2.new(0 + (0 - 0), 192 + 384);
			v560.Parent = v557;
			v561 = Instance.new("TextLabel");
			v561.Name = "BeijingTime";
			v561.Size = UDim2.new((2 - 1) - (0 + 0), -(43 + (360 - (260 + 93))), 1 + 0, (171 + 11) - (156 + 26));
			v561.Position = UDim2.new((0 - 0) + (0 - 0), 2024 - (1181 + 793), (0 + 0) - (307 - (105 + 202)), (132 + 32) - ((959 - (352 + 458)) + (60 - 45)));
			v553 = 12 - 7;
		end
		if (v553 == ((947 + 31) - (890 + 70))) then
			v576.CornerRadius = UDim.new(117 - (39 + 78), (1432 - 942) - (14 + (1417 - (438 + 511))));
			v576.Parent = v575;
			v577 = Instance.new("UIStroke");
			v577.Thickness = 1385 - (1262 + 121);
			v577.Color = Color3.fromRGB((1243 - (728 + 340)) - 95, (2237 - (816 + 974)) - 287, (404 - 272) + (442 - 319));
			v577.Transparency = 0.2 + (339 - (163 + 176));
			v577.Parent = v575;
			v578 = Instance.new("ImageLabel");
			v578.Name = "StatusIcon";
			v553 = (14 - 9) + (64 - 50);
		end
		if (v553 == (4 + 9)) then
			local v753 = 1810 - (1564 + 246);
			while true do
				if (v753 == 3) then
					v572 = Instance.new("ImageLabel");
					v572.Name = "ExecutorIcon";
					v753 = 4;
				end
				if (v753 == (347 - (124 + 221))) then
					v571.Transparency = 0.2 + 0 + 0;
					v571.Parent = v569;
					v753 = 454 - (115 + 336);
				end
				if (v753 == (0 - 0)) then
					v570.Parent = v569;
					v571 = Instance.new("UIStroke");
					v753 = 1 + 0;
				end
				if (4 == v753) then
					v572.Size = UDim2.new((46 - (45 + 1)) - (0 + 0), (1991 - (1282 + 708)) + (1243 - (583 + 629)), (9 + 42) - ((30 - 18) + 21 + 18), (1200 - (943 + 227)) + 2);
					v553 = 43 - (13 + 16);
					break;
				end
				if (v753 == (1632 - (1539 + 92))) then
					v571.Thickness = 1948 - (706 + 1240);
					v571.Color = Color3.fromRGB((295 - (81 + 177)) + 43, 42 + 118, (1378 - 890) - (490 - (212 + 45)));
					v753 = 6 - 4;
				end
			end
		end
		if (v553 == ((1999 - (708 + 1238)) - 38)) then
			local v754 = 0 + 0;
			local v755;
			while true do
				if ((0 + 0) == v754) then
					v755 = 0 + (1667 - (586 + 1081));
					while true do
						if (v755 == ((513 - (348 + 163)) + 1 + 0)) then
							local v1089 = 0;
							while true do
								if ((280 - (215 + 65)) == v1089) then
									v573.TextStrokeTransparency = (0.7 - 0) - (1859 - (1541 + 318));
									v573.TextStrokeColor3 = Color3.fromRGB(0 + 0 + 0, (0 + 0) - 0, 1710 - (1203 + 393 + (1864 - (1036 + 714))));
									v1089 = 1 + 0;
								end
								if (v1089 == (1 + 0)) then
									v755 = 1284 - (883 + 397);
									break;
								end
							end
						end
						if (((592 - (563 + 27)) - (3 - 2)) == v755) then
							v573.Text = v6;
							v573.TextColor3 = Color3.fromRGB((2919 - (1369 + 617)) - ((1651 - (85 + 1402)) + 549), (572 + 1086) - ((2733 - 1674) + (782 - (274 + 129))), (502 - (12 + 205)) - (51 + 4));
							v755 = 7 - 5;
						end
						if (v755 == (3 + 0 + (385 - (27 + 357)))) then
							v573.Parent = v569;
							v553 = 16;
							break;
						end
						if (((481 - (91 + 389)) + (298 - (90 + 207))) == v755) then
							local v1093 = 0 + 0;
							while true do
								if ((861 - (706 + 155)) == v1093) then
									v573.Font = Enum.Font.GothamSemibold;
									v573.TextSize = (2201 - (730 + 1065)) - (145 + (1810 - (1339 + 224)));
									v1093 = 1 + 0;
								end
								if ((1 + 0) == v1093) then
									v755 = (3 - 0) + (843 - (268 + 575));
									break;
								end
							end
						end
						if (v755 == ((1294 - (919 + 375)) + 0)) then
							v573.Position = UDim2.new(0 - 0, (1119 - (180 + 791)) - (1903 - (323 + 1482)), (1918 - (1177 + 741)) + 0 + 0, 0 - 0);
							v573.BackgroundTransparency = 1 + 0 + (0 - 0);
							v755 = 1;
						end
					end
					break;
				end
			end
		end
		if (v553 == ((4 + 32) - (122 - (96 + 13)))) then
			return v554;
		end
		if (v553 == (742 - (254 + 466))) then
			local v756 = 1921 - (962 + 959);
			while true do
				if (v756 == 1) then
					v580.TextSize = 640 - (294 + (833 - 499));
					v580.TextXAlignment = Enum.TextXAlignment.Left;
					v756 = 1 + 1;
				end
				if (v756 == 2) then
					v580.Parent = v575;
					v575.Parent = v555;
					v756 = 3;
				end
				if ((1354 - (461 + 890)) == v756) then
					v581 = nil;
					function v581()
						local v1021 = 0 + 0;
						local v1022;
						local v1023;
						while true do
							if (v1021 == (0 - 0)) then
								v1022 = 253 - ((479 - (19 + 224)) + 16 + 1);
								v1023 = nil;
								v1021 = 199 - (37 + 161);
							end
							if (v1021 == (1 + 0)) then
								while true do
									if (0 == v1022) then
										v1023 = 0 + 0 + 0;
										while true do
											if ((0 + 0 + (61 - (60 + 1))) == v1023) then
												local v1296 = 923 - (826 + 97);
												while true do
													if (v1296 == (0 + 0)) then
														v561.Text = v7();
														v567.Text = v1.Name;
														v1296 = 3 - 2;
													end
													if (v1296 == (1 - 0)) then
														v1023 = 3 - 2;
														break;
													end
												end
											end
											if (v1023 == ((689 - (375 + 310)) - 3)) then
												v573.Text = v6;
												v579.Text = string.format("脚本状态：正常运行\n游戏ID：%d\n玩家数量：%d", game.PlaceId, #v0:GetPlayers());
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
					v756 = 2003 - (1864 + 135);
				end
				if ((0 - 0) == v756) then
					v580.TextColor3 = Color3.fromRGB(180, (169 + 591) - (182 + 362 + (39 - 23)), (1941 - (314 + 817)) - (315 + 240));
					v580.Font = Enum.Font.GothamBold;
					v756 = 215 - (32 + 182);
				end
				if (v756 == (3 + 1)) then
					v4.RenderStepped:Connect(function()
						v581();
					end);
					v553 = (41 - 29) + (76 - (39 + 26));
					break;
				end
			end
		end
		if ((164 - (54 + 90)) == v553) then
			local v757 = 0 + (198 - (45 + 153));
			while true do
				if (v757 == ((482 + 312) - (413 + (933 - (457 + 95))))) then
					local v945 = 0;
					while true do
						if (v945 == (1 + 0)) then
							v757 = (1 - 0) - (0 - 0);
							break;
						end
						if (v945 == (0 - 0)) then
							v579.Size = UDim2.new(1 + 0 + (0 - 0), -(106 - (168 - 112)), 748 - (485 + 263), (862 - (575 + 132)) - (956 - (750 + 111)));
							v579.Position = UDim2.new((2980 - (445 + 565)) - (469 + 113 + 200 + 1188), 50, 0 - 0, 10);
							v945 = 1 + 0;
						end
					end
				end
				if (((311 - (189 + 121)) + 0) == v757) then
					v579.BackgroundTransparency = 1;
					v579.Text = "脚本状态：正常运行\n游戏ID：" .. game.PlaceId .. "\n玩家数量：" .. #v0:GetPlayers();
					v757 = (91 + 275) - ((1673 - (634 + 713)) + (576 - (493 + 45)));
				end
				if (v757 == ((979 - (493 + 475)) - (2 + 5))) then
					v579.TextStrokeColor3 = Color3.fromRGB(0 - (784 - (158 + 626)), 0, 620 - (23 + 24 + 573));
					v553 = 8 + 13;
					break;
				end
				if (v757 == (12 - 9)) then
					v579.TextSize = 19 - (11 - 4);
					v579.TextStrokeTransparency = 1664.7 - (283 + 986 + 395);
					v757 = (27 + 469) - ((1167 - (1035 + 56)) + 416);
				end
				if (v757 == 2) then
					local v951 = 0;
					while true do
						if ((960 - (114 + 845)) == v951) then
							v757 = 2 + 1;
							break;
						end
						if (v951 == (0 - 0)) then
							v579.TextColor3 = Color3.fromRGB(185 + 35, (1712 - (179 + 870)) - (319 + (173 - 49)), (1403 - (827 + 51)) - (779 - 484));
							v579.Font = Enum.Font.GothamSemibold;
							v951 = 1 + 0;
						end
					end
				end
			end
		end
		if (v553 == ((1485 - (95 + 378)) - (42 + 522 + (627 - 184)))) then
			local v758 = 0;
			while true do
				if (v758 == (1 + 0)) then
					v561.Font = Enum.Font.GothamSemibold;
					v561.TextSize = (1057 - (334 + 677)) - 32;
					v758 = 7 - 5;
				end
				if ((1060 - (1049 + 7)) == v758) then
					v562.Name = "TimeTitle";
					v553 = 26 - 20;
					break;
				end
				if ((5 - 2) == v758) then
					v561.Parent = v557;
					v562 = Instance.new("TextLabel");
					v758 = 4;
				end
				if ((0 + 0) == v758) then
					v561.BackgroundTransparency = (5 - 3) - (1 - 0);
					v561.TextColor3 = Color3.fromRGB((302 + 376) - ((1757 - (1004 + 416)) + 121), 2177 - (1621 + 336), (2612 - (337 + 1602)) - (1960 - (1014 + 503)));
					v758 = 1016 - (446 + 569);
				end
				if (v758 == 2) then
					v561.TextStrokeTransparency = 0.7 + 0;
					v561.TextStrokeColor3 = Color3.fromRGB((5606 - 3695) - (424 + 837 + 650), (0 - 0) + 0 + 0, 0 - (505 - (223 + 282)));
					v758 = 1 + 2;
				end
			end
		end
		if (v553 == ((2907 - 1081) - ((1125 - 353) + 1045))) then
			local v759 = 670 - (623 + 47);
			while true do
				if (2 == v759) then
					local v961 = 45 - (32 + 13);
					while true do
						if (v961 == 0) then
							v566.Parent = v563;
							v567 = Instance.new("TextLabel");
							v961 = 1;
						end
						if (v961 == 1) then
							v759 = 2 + 1;
							break;
						end
					end
				end
				if ((1 + 3 + 0) == v759) then
					v567.Position = UDim2.new(144 - ((1903 - (1070 + 731)) + 42), 1894 - (1457 + 67 + 320), (2674 - (1257 + 147)) - (416 + 633 + 221), 0 - 0);
					v553 = 10;
					break;
				end
				if (v759 == (133 - (98 + 35))) then
					v566.BackgroundTransparency = (66 + 91) - ((63 - 45) + (464 - 326));
					v566.Image = "rbxassetid://3926305904";
					v759 = 2 - (1 + 0);
				end
				if (v759 == 3) then
					local v965 = 0;
					while true do
						if (v965 == (0 + 0)) then
							v567.Name = "PlayerName";
							v567.Size = UDim2.new(1 + 0, -((1709 - (395 + 162)) - (67 + 911 + 124)), (2290 - (816 + 1125)) - ((193 - 57) + 212), 1148 - (701 + 447));
							v965 = 1 - 0;
						end
						if (v965 == (1 - 0)) then
							v759 = 4;
							break;
						end
					end
				end
				if (v759 == ((1345 - (391 + 950)) - (7 - 4))) then
					local v966 = 0 - 0;
					while true do
						if (1 == v966) then
							v759 = 2;
							break;
						end
						if (v966 == (0 - 0)) then
							v566.ImageRectSize = Vector2.new(37 + 15 + 7 + 5, (215 - 156) + 5);
							v566.ImageRectOffset = Vector2.new((3254 - (251 + 1271)) - (214 + 26 + (3651 - 2287)), 1338 - (1050 + 32));
							v966 = 1;
						end
					end
				end
			end
		end
		if (v553 == (17 - 10)) then
			v557.Parent = v555;
			v563 = Instance.new("Frame");
			v563.Name = "PlayerFrame";
			v563.Size = UDim2.new(0.9 - 0, (1259 - (1147 + 112)) - (0 + 0), (0 - 0) + 0 + 0, 1105 - ((1028 - (335 + 362)) + 679 + 45));
			v563.BackgroundColor3 = Color3.fromRGB(90 - 30, (13 - 8) + 55, 70);
			v563.BackgroundTransparency = 644.1 - (269 + (1393 - 1018));
			v564 = Instance.new("UICorner");
			v564.CornerRadius = UDim.new((3529 - 2804) - ((757 - 490) + (1024 - (237 + 329))), 3 + (17 - 12));
			v564.Parent = v563;
			v553 = 15 - (5 + 2);
		end
		if (v553 == (824 - (365 + 302 + 151))) then
			local v767 = 1124 - (408 + 716);
			local v768;
			while true do
				if (v767 == (0 - 0)) then
					v768 = 1497 - (1410 + 87);
					while true do
						if (v768 == (821 - (344 + 477))) then
							v562.Size = UDim2.new((324 + 1574) - (1504 + 393), -(1811 - (1188 + 573)), (0 - 0) - (0 + 0), 51 - (100 - 69));
							v562.Position = UDim2.new(0, (1307 - 461) - (461 + (828 - 493)), 0 + (1529 - (508 + 1021)), (1657 + 106) - ((2896 - (228 + 938)) + (716 - (332 + 353))));
							v768 = 1;
						end
						if (v768 == (3 - 0)) then
							v562.TextSize = 1679 - (728 + (2458 - 1519));
							v562.TextXAlignment = Enum.TextXAlignment.Left;
							v768 = 4;
						end
						if (v768 == ((3 + 0) - 2)) then
							local v1111 = 0;
							while true do
								if (v1111 == (0 + 0)) then
									v562.BackgroundTransparency = 1 - (0 - 0);
									v562.Text = "北京时间";
									v1111 = 1;
								end
								if (v1111 == 1) then
									v768 = 425 - (18 + 405);
									break;
								end
							end
						end
						if ((1 + 1) == v768) then
							v562.TextColor3 = Color3.fromRGB((209 + 203) - (353 - 121), 200, 255);
							v562.Font = Enum.Font.GothamBold;
							v768 = 1071 - ((1116 - (194 + 784)) + (2700 - (694 + 1076)));
						end
						if (v768 == ((1908 - (122 + 1782)) + 0 + 0)) then
							v562.Parent = v557;
							v553 = 6 + 1 + 0;
							break;
						end
					end
					break;
				end
			end
		end
		if (v553 == (14 + 2 + 0)) then
			local v769 = 0 + 0;
			while true do
				if (v769 == (11 - 7)) then
					v574.TextSize = 603 - (521 + 41 + 29);
					v553 = 1987 - (214 + 1756);
					break;
				end
				if ((9 - 7) == v769) then
					v574.BackgroundTransparency = 1 + 0 + 0;
					v574.Text = "注入器";
					v769 = 1 + 2;
				end
				if (v769 == 1) then
					v574.Size = UDim2.new((589 - (217 + 368)) - (8 - 5), -(1816 - (303 + 156 + 970 + 337)), (64 + 1806) - ((1363 - (844 + 45)) + (1680 - (242 + 42))), 34 - 14);
					v574.Position = UDim2.new((0 - 0) + (0 - 0), (1201 - (132 + 1068)) + (77 - 28), 1623 - (214 + 1409), (4 + 1) - 3);
					v769 = 1636 - (497 + 1137);
				end
				if (v769 == 3) then
					v574.TextColor3 = Color3.fromRGB((1540 - (9 + 931)) - (709 - (181 + 108)), 120 + 80, 1112 - (2113 - 1256));
					v574.Font = Enum.Font.GothamBold;
					v769 = 11 - 7;
				end
				if (v769 == (0 + 0)) then
					v574 = Instance.new("TextLabel");
					v574.Name = "ExecutorTitle";
					v769 = 1 + 0;
				end
			end
		end
		if (v553 == (479 - (296 + 180))) then
			v559 = Instance.new("UIStroke");
			v559.Thickness = 2;
			v559.Color = Color3.fromRGB((1472 - (1183 + 220)) + 11, 1579 - ((1639 - (1037 + 228)) + (1691 - 646)), (582 - 380) + 53);
			v559.Transparency = 0.2 - 0;
			v559.Parent = v557;
			v560 = Instance.new("ImageLabel");
			v560.Name = "TimeIcon";
			v560.Size = UDim2.new(0, (2289 - 1619) - ((1182 - (527 + 207)) + (717 - (187 + 340))), (1870 - (1298 + 572)) + (0 - 0), 202 - (144 + 26));
			v560.Position = UDim2.new(0, (12 - 7) + 5, 0.5 - 0, -(6 + 10));
			v553 = (8 - 5) + (2 - 1);
		end
		if (v553 == ((14 - 11) - (2 + 0))) then
			v555.Position = UDim2.new(0 - (0 - 0), 10 + 0, (560 + 934) - ((1509 - (5 + 197)) + (873 - (339 + 347))), 39 - (65 - 36));
			v555.BackgroundTransparency = 3 - 2;
			v555.ScrollBarThickness = (389 - (365 + 11)) - 7;
			v555.ScrollBarImageColor3 = Color3.fromRGB(95 + 5, (1176 - 870) - (483 - 277), 793 - (232 + 451));
			v555.CanvasSize = UDim2.new(0 + (924 - (837 + 87)), (0 - 0) + (1670 - (837 + 833)), (121 + 443) - ((1897 - (356 + 1031)) + 25 + 29), (2351 - (73 + 1573)) - 355);
			v555.Parent = v554;
			v556 = Instance.new("UIListLayout");
			v556.Parent = v555;
			v556.Padding = UDim.new((1424 - (1307 + 81)) - (13 + 23), 15);
			v553 = (237 - (7 + 227)) - (1 - 0);
		end
		if (v553 == (24 - (173 - (90 + 76)))) then
			local v785 = 0;
			while true do
				if (v785 == 0) then
					v574.TextXAlignment = Enum.TextXAlignment.Left;
					v574.Parent = v569;
					v785 = 3 - 2;
				end
				if (v785 == 4) then
					v576 = Instance.new("UICorner");
					v553 = (31 + 32) - (38 + 7);
					break;
				end
				if (v785 == (3 + 0)) then
					v575.BackgroundColor3 = Color3.fromRGB(235 - 175, 60, 330 - (197 + 63));
					v575.BackgroundTransparency = 0.1 + 0;
					v785 = 1 + 3;
				end
				if (v785 == (1 + 0)) then
					v569.Parent = v555;
					v575 = Instance.new("Frame");
					v785 = 1 + 1;
				end
				if (v785 == 2) then
					v575.Name = "StatusFrame";
					v575.Size = UDim2.new(0.9 - 0, 0 - 0, 1369 - (618 + 751), (874 + 294) - ((2740 - (206 + 1704)) + (434 - 176)));
					v785 = 3;
				end
			end
		end
		if (v553 == 2) then
			local v786 = 0;
			while true do
				if ((0 - 0) == v786) then
					v556.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					v557 = Instance.new("Frame");
					v786 = 1;
				end
				if (v786 == (2 + 1)) then
					v558 = Instance.new("UICorner");
					v558.CornerRadius = UDim.new((1516 - (155 + 1120)) - ((1743 - (396 + 1110)) + 4), 18 - (22 - 12));
					v786 = 2 + 2;
				end
				if (v786 == (4 + 0)) then
					v558.Parent = v557;
					v553 = (6 + 0) - 3;
					break;
				end
				if (v786 == (977 - (230 + 746))) then
					v557.Name = "TimeFrame";
					v557.Size = UDim2.new(601.9 - (473 + 128), (48 - (39 + 9)) + (266 - (38 + 228)), (0 - 0) + 0, (1964 - (106 + 367)) - (76 + 784 + 581));
					v786 = 1864 - (354 + 1508);
				end
				if (v786 == (6 - 4)) then
					v557.BackgroundColor3 = Color3.fromRGB((162 + 59) - 161, 36 + 24, 94 - 24);
					v557.BackgroundTransparency = (1244.1 - (334 + 910)) + (895 - (92 + 803));
					v786 = 2 + 1;
				end
			end
		end
		if (v553 == (1200 - (1035 + 146))) then
			v578.Size = UDim2.new((616 - (230 + 386)) - (0 + 0), 32, (1510 - (353 + 1157)) + 0, 1146 - (53 + 1061));
			v578.Position = UDim2.new((1635 - (1568 + 67)) + 0 + 0, (6 + 31) - (68 - 41), (0 - 0) + (0 - 0), 6 + 0 + (1216 - (615 + 597)));
			v578.BackgroundTransparency = 1 + 0;
			v578.Image = "rbxassetid://3926305904";
			v578.ImageRectSize = Vector2.new(95 - 31, (1226 + 264) - (2 + 83 + 738 + 603));
			v578.ImageRectOffset = Vector2.new(0 - (1899 - (1056 + 843)), 180 - (252 - 136));
			v578.Parent = v575;
			v579 = Instance.new("TextLabel");
			v579.Name = "StatusLabel";
			v553 = (651 - 259) - ((129 - 84) + 192 + 135);
		end
	end
end
local function v152()
	local v582 = 1976 - (286 + 1690);
	local v583;
	local v584;
	local v585;
	local v586;
	while true do
		if (v582 == (913 - (98 + 813))) then
			while true do
				if (v583 == (1 + 0)) then
					v586 = nil;
					while true do
						local v1024 = 0 - 0;
						while true do
							if (v1024 == 2) then
								if (v584 == 5) then
									return v585;
								end
								if (v584 == ((4 + 3) - (510 - (263 + 244)))) then
									local v1232 = (398 + 104) - ((2131 - (1502 + 185)) + 58);
									while true do
										if (v1232 == (1 + 0 + 0)) then
											v586.Parent = v585;
											v584 = 5;
											break;
										end
										if (v1232 == ((0 - 0) + (0 - 0))) then
											local v1273 = 1527 - (629 + 898);
											while true do
												if (v1273 == (2 - 1)) then
													v1232 = 2 - 1;
													break;
												end
												if (v1273 == (365 - (12 + 353))) then
													v586.Font = Enum.Font.Gotham;
													v586.TextSize = 8 + (1919 - (1680 + 231));
													v1273 = 1;
												end
											end
										end
									end
								end
								break;
							end
							if (v1024 == ((0 + 0) - (0 + 0))) then
								local v1139 = 0;
								while true do
									if (v1139 == (1149 - (212 + 937))) then
										if (v584 == (1735 - (43 + 21 + 1668))) then
											local v1274 = 1062 - (111 + 951);
											while true do
												if (v1274 == (0 + 0)) then
													v586.BackgroundTransparency = (2001 - (18 + 9)) - (1227 + 150 + 596);
													v586.Text = "其他脚本区内容";
													v1274 = 1;
												end
												if ((535 - (31 + 503)) == v1274) then
													v586.TextColor3 = Color3.fromRGB(1832 - (595 + 1037), (2058 - (189 + 1255)) - (153 + 261), (601 - 212) - (1458 - (1170 + 109)));
													v584 = (2315 - (348 + 1469)) - (415 + (1368 - (1115 + 174)));
													break;
												end
											end
										end
										if (v584 == ((2 - 1) + 0)) then
											v585.BackgroundTransparency = 492 - ((1156 - (85 + 929)) + 205 + 144);
											v585.Visible = false;
											v585.Parent = v136;
											v584 = 1869 - (1151 + 716);
										end
										v1139 = 1;
									end
									if (v1139 == 1) then
										v1024 = 1 + 0 + 0;
										break;
									end
								end
							end
							if (v1024 == ((1 + 0) - 0)) then
								local v1140 = 0;
								while true do
									if (v1140 == (1705 - (95 + 1609))) then
										v1024 = 6 - 4;
										break;
									end
									if ((758 - (364 + 394)) == v1140) then
										if (v584 == (0 + 0 + 0 + 0)) then
											local v1278 = 0 + 0 + 0 + 0;
											while true do
												if (v1278 == ((2 + 0) - (1 + 0))) then
													v585.Size = UDim2.new(1 + 0, 1864 - (1574 + 136 + 154), 319 - (200 + 118), 0 + 0);
													v584 = 1 + (956 - (719 + 237));
													break;
												end
												if (v1278 == (0 - (0 - 0))) then
													local v1316 = 0 + 0;
													while true do
														if (v1316 == (2 - 1)) then
															v1278 = (2 - 1) - (0 - 0);
															break;
														end
														if (v1316 == (1991 - (761 + 1230))) then
															v585 = Instance.new("Frame");
															v585.Name = "OtherScriptsContainer";
															v1316 = 194 - (80 + 113);
														end
													end
												end
											end
										end
										if (v584 == (2 + 0)) then
											local v1279 = 0 + 0;
											while true do
												if (v1279 == 1) then
													v586.Position = UDim2.new(0 + 0, 0 + 0 + 0, 0 - (0 - 0), 0);
													v584 = 1253 - (84 + 279 + 163 + 724);
													break;
												end
												if (v1279 == (1243 - (965 + 278))) then
													v586 = Instance.new("TextLabel");
													v586.Size = UDim2.new(1, 1729 - (1391 + 338), 1 + (0 - 0), 0 + 0);
													v1279 = 1 + 0;
												end
											end
										end
										v1140 = 1;
									end
								end
							end
						end
					end
					break;
				end
				if (v583 == ((0 - 0) - (0 + 0))) then
					v584 = 0 - (1408 - (496 + 912));
					v585 = nil;
					v583 = (3 - 2) + 0 + 0;
				end
			end
			break;
		end
		if (v582 == (1 - 0)) then
			v585 = nil;
			v586 = nil;
			v582 = 1332 - (1190 + 140);
		end
		if (v582 == (0 + 0)) then
			v583 = 718 - (317 + 401);
			v584 = nil;
			v582 = 950 - (303 + 646);
		end
	end
end
local function v153(v587, v588)
	local v589 = 0;
	local v590;
	local v591;
	while true do
		if (v589 == (13 - (24 - 17))) then
			v590.MouseLeave:Connect(function()
				if (v590.BackgroundColor3 ~= Color3.fromRGB(55 + (1757 - (1675 + 57)), 104 + 56, 666 - 411)) then
					v590.BackgroundColor3 = Color3.fromRGB((214 + 1500) - ((1651 - (338 + 639)) + (1369 - (320 + 59))), 8 + 7 + 35, 60);
				end
			end);
			v590.Parent = v122;
			break;
		end
		if (v589 == ((733 - (628 + 104)) + (0 - 0))) then
			local v796 = 1891 - (439 + 1452);
			while true do
				if (v796 == (1947 - (105 + 1842))) then
					v590.Text = v587;
					v590.BackgroundColor3 = Color3.fromRGB(79 - 29, (5055 - 3950) - ((1236 - 729) + (2637 - 2089)), (39 + 858) - (289 + 548));
					v796 = 1 - 0;
				end
				if (v796 == (1 + 0)) then
					v590.TextColor3 = Color3.new(1165 - (274 + 890), 1 + 0, (1530 + 289) - (821 + 279 + 718));
					v589 = 257 - (106 + 89 + 36 + 24);
					break;
				end
			end
		end
		if (v589 == ((2 - 0) + 3)) then
			local v797 = 0;
			while true do
				if (v797 == (820 - (731 + 88))) then
					v590.MouseEnter:Connect(function()
						if (v590.BackgroundColor3 ~= Color3.fromRGB((1265 + 316) - (251 + 767 + 483), 160, 55 + 200)) then
							v590.BackgroundColor3 = Color3.fromRGB((255 - 80) - (358 - 243), (122 - 80) + (37 - 19), 70);
						end
					end);
					v589 = (943 + 95) - (4 + 805 + 41 + 182);
					break;
				end
				if (v797 == (0 + 0)) then
					v591.Transparency = 158.3 - (139 + 19);
					v591.Parent = v590;
					v797 = 1 + 0;
				end
			end
		end
		if (v589 == (1993 - (1687 + 306))) then
			local v798 = 0 - 0;
			while true do
				if (v798 == (1155 - (1018 + 136))) then
					v590.Size = UDim2.new((0 + 0) - (0 - 0), (1115 - (117 + 698)) - (681 - (305 + 176)), 0 + 0, (84 + 28) - (135 - 57));
					v589 = 1 + 0 + (0 - 0);
					break;
				end
				if (v798 == 0) then
					v590 = Instance.new("TextButton");
					v590.Name = v587;
					v798 = 2 - 1;
				end
			end
		end
		if (v589 == (3 + (1 - 0))) then
			v591 = Instance.new("UIStroke");
			v591.Thickness = (878 - (159 + 101)) - (14 + 603);
			v591.Color = Color3.fromRGB(337 - 267, 242 - 172, (104 + 105) - ((375 - 257) + 11));
			v589 = (1 - 0) + 1 + 3;
		end
		if (v589 == ((268 - (112 + 154)) + (0 - 0))) then
			local v801 = 31 - (21 + 10);
			local v802;
			while true do
				if (v801 == 0) then
					v802 = (1719 - (531 + 1188)) - 0;
					while true do
						if (v802 == (0 + 0)) then
							v590.Font = Enum.Font.GothamSemibold;
							v590.TextSize = 962 - ((1214 - (96 + 567)) + 398);
							v802 = (1 - 0) + 0;
						end
						if (v802 == (1 + 0 + 0)) then
							v590.TextStrokeTransparency = (0.5 - 0) + (1695 - (867 + 828));
							v589 = (23 - 12) - (28 - 20);
							break;
						end
					end
					break;
				end
			end
		end
		if (v589 == 3) then
			v590.TextStrokeColor3 = Color3.fromRGB((0 - 0) - 0, (0 - 0) + 0 + 0, 0);
			v590.MouseButton1Click:Connect(function()
				local v831 = 0;
				local v832;
				while true do
					if (v831 == ((0 - 0) - (771 - (134 + 637)))) then
						v832 = 0 + 0 + 0;
						while true do
							if (v832 == (90 - ((1197 - (775 + 382)) + (69 - 20)))) then
								local v1141 = 607 - (45 + 562);
								while true do
									if ((862 - (545 + 317)) == v1141) then
										v590.BackgroundColor3 = Color3.fromRGB(118 - 38, 160, 255);
										v590.BorderSizePixel = 7 - 5;
										v1141 = 1027 - (763 + 263);
									end
									if (v1141 == 1) then
										v832 = 1 + 1;
										break;
									end
								end
							end
							if (v832 == ((2240 - (512 + 1238)) - ((1693 - (272 + 1322)) + (732 - 341)))) then
								v134 = v588;
								for v1178, v1179 in pairs(v122:GetChildren()) do
									if v1179:IsA("TextButton") then
										local v1242 = (1246 - (533 + 713)) + (28 - (14 + 14));
										local v1243;
										while true do
											if (v1242 == ((825 - (499 + 326)) - (0 - 0))) then
												v1243 = (424 - (104 + 320)) - (1997 - (1929 + 68));
												while true do
													if (v1243 == (0 + (1323 - (1206 + 117)))) then
														v1179.BackgroundColor3 = Color3.fromRGB(34 + 16, (1723 - (683 + 909)) - 81, (5103 - 3439) - (1032 + 572));
														v1179.BorderSizePixel = 0 - 0;
														break;
													end
												end
												break;
											end
										end
									end
								end
								v832 = 778 - (772 + 5);
							end
							if (((1846 - (19 + 1408)) - (203 + (502 - (134 + 154)))) == v832) then
								v590.BorderColor3 = Color3.fromRGB(420 - 165, 2072 - ((1761 - 1193) + 1249), 87 + 168);
								for v1180, v1181 in ipairs(v135) do
									v1181.Visible = v1180 == v588;
								end
								break;
							end
						end
						break;
					end
				end
			end);
			if (v588 == v134) then
				local v851 = 0 + 0;
				local v852;
				local v853;
				while true do
					if ((203 - (10 + 192)) == v851) then
						while true do
							if (v852 == (0 - (47 - (13 + 34)))) then
								v853 = 0 - (1289 - (342 + 947));
								while true do
									if (v853 == ((5387 - 4081) - ((2621 - (119 + 1589)) + (866 - 473)))) then
										v590.BackgroundColor3 = Color3.fromRGB(110 - 30, 451 - 291, 255);
										v590.BorderSizePixel = (554 - (545 + 7)) - (0 - 0);
										v853 = (170 + 241) - ((1972 - (494 + 1209)) + (376 - 235));
									end
									if (v853 == (2 - (999 - (197 + 801)))) then
										v590.BorderColor3 = Color3.fromRGB((4508 - 2272) - ((1750 - 1388) + 1619), (2834 - (919 + 35)) - (805 + 145 + (2723 - 2048)), (566 - (369 + 98)) + (1271 - (400 + 715)));
										break;
									end
								end
								break;
							end
						end
						break;
					end
					if (0 == v851) then
						v852 = 0 + 0 + 0;
						v853 = nil;
						v851 = 1 + 0;
					end
				end
			end
			v589 = (2508 - (744 + 581)) - (109 + 107 + (2585 - (653 + 969)));
		end
	end
end
for v592, v593 in ipairs(v133) do
	v153(v593, v592);
end
table.insert(v135, v149());
table.insert(v135, v150());
table.insert(v135, v151());
table.insert(v135, v152());
v13.Visible = true;
v74.Visible = true;
local v156 = true;
local v157 = false;
local v158;
local v159;
local v160 = false;
local v161;
local v162;
local function v163(v594)
	if v157 then
		local v643 = 0 - 0;
		local v644;
		local v645;
		local v646;
		local v647;
		local v648;
		while true do
			if ((1288 - ((2116 - (12 + 1619)) + (965 - (103 + 60)))) == v643) then
				local v854 = 0;
				while true do
					if (1 == v854) then
						v643 = (5298 - 4223) - ((4652 - 3587) + 8);
						break;
					end
					if (v854 == (0 - 0)) then
						v646 = v13.AbsoluteSize;
						v647 = math.clamp(v159.X + v644.X, (2221 - (710 + 952)) - ((2300 - (555 + 1313)) + 117 + 10), v645.X - v646.X);
						v854 = 1 + 0;
					end
				end
			end
			if (v643 == (0 + 0)) then
				local v855 = 1468 - (1261 + 207);
				local v856;
				while true do
					if (v855 == (252 - (245 + 7))) then
						v856 = (747 - (212 + 535)) + (0 - 0);
						while true do
							if (v856 == ((3078 - (905 + 571)) - ((2978 - 2343) + (1367 - 401)))) then
								v643 = 1;
								break;
							end
							if (v856 == (0 + (0 - 0))) then
								v644 = v594.Position - v158;
								v645 = workspace.CurrentCamera.ViewportSize;
								v856 = 1;
							end
						end
						break;
					end
				end
			end
			if (v643 == (1 + 1)) then
				v648 = math.clamp(v159.Y + v644.Y, (1505 - (522 + 941)) - (5 + (1548 - (292 + 1219))), v645.Y - v646.Y);
				v13.Position = UDim2.new(0 - (1112 - (787 + 325)), v647, 0 + (0 - 0), v648);
				break;
			end
		end
	end
end
local function v164(v595)
	if v160 then
		local v649 = (0 + 0) - (0 - 0);
		local v650;
		local v651;
		local v652;
		local v653;
		local v654;
		while true do
			if (v649 == 0) then
				v650 = v595.Position - v161;
				v651 = workspace.CurrentCamera.ViewportSize;
				v649 = 1 + (534 - (424 + 110));
			end
			if (((2 + 1) - (1 + 0)) == v649) then
				v654 = math.clamp(v162.Y + v650.Y, (0 + 0) - 0, v651.Y - v652.Y);
				v74.Position = UDim2.new(0 - (312 - (33 + 279)), v653, 0 - (0 + 0), v654);
				break;
			end
			if (v649 == (1 + 0)) then
				v652 = v74.AbsoluteSize;
				v653 = math.clamp(v162.X + v650.X, (1882 - (1338 + 15)) - ((1741 - (528 + 895)) + 101 + 110), v651.X - v652.X);
				v649 = 9 - 7;
			end
		end
	end
end
v48.InputBegan:Connect(function(v596)
	if ((v596.UserInputType == Enum.UserInputType.MouseButton1) or (v596.UserInputType == Enum.UserInputType.Touch)) then
		local v655 = 1924 - (1606 + 318);
		local v656;
		while true do
			if (v655 == (1819 - (298 + 1521))) then
				v656 = 0 - 0;
				while true do
					if (v656 == (310 - (154 + 156))) then
						local v1044 = 0 - 0;
						while true do
							if (v1044 == 0) then
								v157 = true;
								v158 = v596.Position;
								v1044 = 1 - 0;
							end
							if (v1044 == 1) then
								v656 = 1116 - (712 + 403);
								break;
							end
						end
					end
					if (v656 == (1588 - ((1413 - (168 + 282)) + 624))) then
						v159 = Vector2.new(v13.Position.X.Offset, v13.Position.Y.Offset);
						break;
					end
				end
				break;
			end
		end
	end
end);
v48.InputEnded:Connect(function(v597)
	if ((v597.UserInputType == Enum.UserInputType.MouseButton1) or (v597.UserInputType == Enum.UserInputType.Touch)) then
		v157 = false;
	end
end);
v74.InputBegan:Connect(function(v598)
	if ((v598.UserInputType == Enum.UserInputType.MouseButton1) or (v598.UserInputType == Enum.UserInputType.Touch)) then
		local v657 = 0 - 0;
		local v658;
		while true do
			if (v657 == (0 + 0)) then
				v658 = 0 + 0;
				while true do
					if (((2 - 1) + 0) == v658) then
						v162 = Vector2.new(v74.Position.X.Offset, v74.Position.Y.Offset);
						break;
					end
					if (v658 == (846 - ((1969 - (1242 + 209)) + 328))) then
						v160 = true;
						v161 = v598.Position;
						v658 = 2 - (680 - (20 + 659));
					end
				end
				break;
			end
		end
	end
end);
v74.InputEnded:Connect(function(v599)
	if ((v599.UserInputType == Enum.UserInputType.MouseButton1) or (v599.UserInputType == Enum.UserInputType.Touch)) then
		local v659 = 0 + 0;
		local v660;
		while true do
			if (v659 == 0) then
				v660 = (0 + 0) - (0 - 0);
				while true do
					if (v660 == ((649 - 332) - ((920 - (427 + 192)) + (35 - 19)))) then
						if v160 then
							local v1143 = 0;
							local v1144;
							local v1145;
							while true do
								if (v1143 == (0 + 0)) then
									v1144 = 1947 - (1427 + 520);
									v1145 = nil;
									v1143 = 1 + 0;
								end
								if (v1143 == 1) then
									while true do
										if (((0 - 0) - (0 + 0)) == v1144) then
											v1145 = (v599.Position - v161).Magnitude;
											if (v1145 < ((1245 - (712 + 520)) - (19 - 11))) then
												local v1319 = 1346 - (565 + 781);
												local v1320;
												local v1321;
												while true do
													if (v1319 == (565 - (35 + 530))) then
														v1320 = 0;
														v1321 = nil;
														v1319 = 1;
													end
													if (v1319 == (1 + 0)) then
														while true do
															if (v1320 == ((0 - 0) - (1378 - (1330 + 48)))) then
																v1321 = 0;
																while true do
																	if (v1321 == 0) then
																		v156 = not v156;
																		v13.Visible = v156;
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
							end
						end
						v160 = false;
						break;
					end
				end
				break;
			end
		end
	end
end);
v3.InputChanged:Connect(function(v600)
	if ((v600.UserInputType == Enum.UserInputType.MouseMovement) or (v600.UserInputType == Enum.UserInputType.Touch)) then
		if v157 then
			v163(v600);
		elseif v160 then
			v164(v600);
		end
	end
end);
v74.MouseEnter:Connect(function()
	v74.BackgroundColor3 = Color3.fromRGB(90, 109 + 45 + 3 + 13, 444 - 189);
end);
v74.MouseLeave:Connect(function()
	v74.BackgroundColor3 = Color3.fromRGB((175 - 135) + (1199 - (854 + 315)), 464 - 319, 77 + 178);
end);
local v165 = {Color3.fromRGB((198 - (31 + 13)) + (143 - 42), 100, 10 + (208 - 118)),Color3.fromRGB(83 + 172, (895 + 304) - ((1392 - (281 + 282)) + (532 - 342)), 51 + 49),Color3.fromRGB((2169 - (137 + 1710)) - 67, 352 - (269 - 172), (786 - (100 + 438)) - (1513 - (205 + 1160))),Color3.fromRGB(31 + 28 + (1426 - (535 + 770)), (51 + 722) - (285 + 233), 2094 - (211 + 1783)),Color3.fromRGB((1524 - (1236 + 193)) + 5, 220, (1778 - (793 + 117)) - ((2412 - (1607 + 285)) + (953 - (747 + 113)))),Color3.fromRGB(11 + 169, (173 - 137) + (112 - 48), (809 + 54) - (1432 - 824)),Color3.fromRGB(739 - (256 + 228), 1861 - ((1300 - 860) + 771 + 550), (624 + 1425) - ((2531 - 1472) + (1224 - (246 + 208))))};
local v166 = 1893 - (614 + 1278);
v4.RenderStepped:Connect(function(v603)
	local v604 = 0 + 0;
	local v605;
	local v606;
	local v607;
	local v608;
	while true do
		if (0 == v604) then
			v605 = (314 - (249 + 65)) - (0 - 0);
			v606 = nil;
			v604 = 1;
		end
		if (v604 == (1276 - (726 + 549))) then
			v607 = nil;
			v608 = nil;
			v604 = 2 + 0;
		end
		if (v604 == 2) then
			while true do
				if (v605 == ((1970 - (916 + 508)) - ((1427 - 1003) + 78 + 43))) then
					local v1000 = 323 - (140 + 183);
					while true do
						if (v1000 == (0 + 0)) then
							v607 = v165[((math.floor(v166) + (565 - (297 + 267))) % #v165) + 1 + 0];
							v608 = v166 % (1 + 0);
							v1000 = 343 - (37 + 305);
						end
						if (v1000 == (1267 - (323 + 943))) then
							v605 = 1349 - (256 + 385 + (923 - 217));
							break;
						end
					end
				end
				if (v605 == (0 + (1535 - (394 + 1141)))) then
					v166 = (v166 + (v603 * 2)) % #v165;
					v606 = v165[math.floor(v166) + ((276 + 165) - (71 + 178 + 191))];
					v605 = (1 + 3) - (3 - 0);
				end
				if (v605 == 2) then
					v61.TextColor3 = v606:Lerp(v607, v608);
					break;
				end
			end
			break;
		end
	end
end);
print("XDG-HOB UI 创建完成");