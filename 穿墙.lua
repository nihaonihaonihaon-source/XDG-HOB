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
local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v24, v25)
	local v26 = {};
	for v41 = 1, #v24 do
		v6(v26, v0(v4(v1(v2(v24, v41, v41 + 1)), v1(v2(v25, 1 + (v41 % #v25), 1 + (v41 % #v25) + 1))) % 256));
	end
	return v5(v26);
end
local v8 = tonumber;
local v9 = string.byte;
local v10 = string.char;
local v11 = string.sub;
local v12 = string.gsub;
local v13 = string.rep;
local v14 = table.concat;
local v15 = table.insert;
local v16 = math.ldexp;
local v17 = getfenv or function()
	return _ENV;
end;
local v18 = setmetatable;
local v19 = pcall;
local v20 = select;
local v21 = unpack or table.unpack;
local v22 = tonumber;
local function v23(v27, v28, ...)
	local v29 = 1;
	local v30;
	v27 = v12(v11(v27, 5), v7("\139\237", "\171\165\195\183\177\134"), function(v42)
		if (v9(v42, 2) == 81) then
			local v94 = 0;
			while true do
				if (v94 == 0) then
					v30 = v8(v11(v42, 1, 1));
					return "";
				end
			end
		else
			local v95 = v10(v8(v42, 16));
			if v30 then
				local v104 = 0;
				local v105;
				while true do
					if (v104 == 1) then
						return v105;
					end
					if (v104 == 0) then
						v105 = v13(v95, v30);
						v30 = nil;
						v104 = 1;
					end
				end
			else
				return v95;
			end
		end
	end);
	local function v31(v43, v44, v45)
		if v45 then
			local v96 = 0;
			local v97;
			while true do
				if (0 == v96) then
					v97 = (v43 / ((5 - 3) ^ (v44 - (2 - 1)))) % (2 ^ (((v45 - (1 - 0)) - (v44 - 1)) + 1));
					return v97 - (v97 % 1);
				end
			end
		else
			local v98 = 0;
			local v99;
			while true do
				if (v98 == 0) then
					v99 = 2 ^ (v44 - 1);
					return (((v43 % (v99 + v99)) >= v99) and 1) or (0 - 0);
				end
			end
		end
	end
	local function v32()
		local v46 = 0;
		local v47;
		while true do
			if (v46 == 1) then
				return v47;
			end
			if (0 == v46) then
				v47 = v9(v27, v29, v29);
				v29 = v29 + 1;
				v46 = 1;
			end
		end
	end
	local function v33()
		local v48 = 0;
		local v49;
		local v50;
		while true do
			if (v48 == 0) then
				v49, v50 = v9(v27, v29, v29 + 2);
				v29 = v29 + 2;
				v48 = 1;
			end
			if (v48 == 1) then
				return (v50 * 256) + v49;
			end
		end
	end
	local function v34()
		local v51 = 0;
		local v52;
		local v53;
		local v54;
		local v55;
		while true do
			if (v51 == 1) then
				return (v55 * 16777216) + (v54 * 65536) + (v53 * 256) + v52;
			end
			if (v51 == 0) then
				v52, v53, v54, v55 = v9(v27, v29, v29 + 3);
				v29 = v29 + 4;
				v51 = 1;
			end
		end
	end
	local function v35()
		local v56 = 0;
		local v57;
		local v58;
		local v59;
		local v60;
		local v61;
		local v62;
		while true do
			if (v56 == 0) then
				v57 = v34();
				v58 = v34();
				v56 = 1;
			end
			if (v56 == 3) then
				if (v61 == 0) then
					if (v60 == 0) then
						return v62 * 0;
					else
						local v125 = 0;
						while true do
							if (0 == v125) then
								v61 = 1;
								v59 = 0;
								break;
							end
						end
					end
				elseif (v61 == 2047) then
					return ((v60 == 0) and (v62 * (1 / 0))) or (v62 * NaN);
				end
				return v16(v62, v61 - 1023) * (v59 + (v60 / (2 ^ 52)));
			end
			if (v56 == 2) then
				v61 = v31(v58, 21, 31);
				v62 = ((v31(v58, 32) == 1) and -1) or 1;
				v56 = 3;
			end
			if (v56 == 1) then
				v59 = 620 - (555 + 64);
				v60 = (v31(v58, 932 - (857 + 74), 20) * ((570 - (367 + 201)) ^ 32)) + v57;
				v56 = 2;
			end
		end
	end
	local function v36(v63)
		local v64 = 0;
		local v65;
		local v66;
		while true do
			if (v64 == 2) then
				v66 = {};
				for v106 = 1, #v65 do
					v66[v106] = v10(v9(v11(v65, v106, v106)));
				end
				v64 = 3;
			end
			if (3 == v64) then
				return v14(v66);
			end
			if (v64 == 0) then
				v65 = nil;
				if not v63 then
					local v120 = 0;
					while true do
						if (v120 == 0) then
							v63 = v34();
							if (v63 == 0) then
								return "";
							end
							break;
						end
					end
				end
				v64 = 1;
			end
			if (v64 == 1) then
				v65 = v11(v27, v29, (v29 + v63) - 1);
				v29 = v29 + v63;
				v64 = 2;
			end
		end
	end
	local v37 = v34;
	local function v38(...)
		return {...}, v20("#", ...);
	end
	local function v39()
		local v67 = 0;
		local v68;
		local v69;
		local v70;
		local v71;
		local v72;
		local v73;
		while true do
			if (v67 == 0) then
				v68 = {};
				v69 = {};
				v70 = {};
				v71 = {v68,v69,nil,v70};
				v67 = 1;
			end
			if (v67 == 1) then
				v72 = v34();
				v73 = {};
				for v108 = 1, v72 do
					local v109 = v32();
					local v110;
					if (v109 == 1) then
						v110 = v32() ~= 0;
					elseif (v109 == (929 - (214 + 713))) then
						v110 = v35();
					elseif (v109 == 3) then
						v110 = v36();
					end
					v73[v108] = v110;
				end
				v71[3] = v32();
				v67 = 2;
			end
			if (2 == v67) then
				for v112 = 1 + 0, v34() do
					local v113 = v32();
					if (v31(v113, 1, 1) == (0 + 0)) then
						local v121 = v31(v113, 2, 3);
						local v122 = v31(v113, 4, 6);
						local v123 = {v33(),v33(),nil,nil};
						if (v121 == 0) then
							v123[1640 - (1523 + 114)] = v33();
							v123[4 + 0] = v33();
						elseif (v121 == 1) then
							v123[3] = v34();
						elseif (v121 == 2) then
							v123[3] = v34() - ((2 - 0) ^ 16);
						elseif (v121 == 3) then
							v123[3] = v34() - (2 ^ 16);
							v123[4] = v33();
						end
						if (v31(v122, 1, 1) == 1) then
							v123[2] = v73[v123[2]];
						end
						if (v31(v122, 2, 1067 - (68 + 997)) == 1) then
							v123[3] = v73[v123[3]];
						end
						if (v31(v122, 3, 3) == (1271 - (226 + 1044))) then
							v123[4] = v73[v123[4]];
						end
						v68[v112] = v123;
					end
				end
				for v114 = 1, v34() do
					v69[v114 - 1] = v39();
				end
				return v71;
			end
		end
	end
	local function v40(v74, v75, v76)
		local v77 = v74[1];
		local v78 = v74[2];
		local v79 = v74[12 - 9];
		return function(...)
			local v80 = v77;
			local v81 = v78;
			local v82 = v79;
			local v83 = v38;
			local v84 = 1;
			local v85 = -1;
			local v86 = {};
			local v87 = {...};
			local v88 = v20("#", ...) - 1;
			local v89 = {};
			local v90 = {};
			for v100 = 0, v88 do
				if (v100 >= v82) then
					v86[v100 - v82] = v87[v100 + 1];
				else
					v90[v100] = v87[v100 + 1];
				end
			end
			local v91 = (v88 - v82) + 1;
			local v92;
			local v93;
			while true do
				v92 = v80[v84];
				v93 = v92[1 + 0];
				if (v93 <= 31) then
					if (v93 <= 15) then
						if (v93 <= 7) then
							if (v93 <= 3) then
								if (v93 <= (1 + 0)) then
									if (v93 == 0) then
										local v138 = 0;
										local v139;
										local v140;
										while true do
											if (1 == v138) then
												for v312 = v139 + 1, v85 do
													v15(v140, v90[v312]);
												end
												break;
											end
											if (v138 == 0) then
												v139 = v92[2];
												v140 = v90[v139];
												v138 = 1;
											end
										end
									else
										local v141 = v92[2];
										local v142 = v90[v141];
										local v143 = v90[v141 + 2];
										if (v143 > (957 - (892 + 65))) then
											if (v142 > v90[v141 + 1]) then
												v84 = v92[3];
											else
												v90[v141 + 3] = v142;
											end
										elseif (v142 < v90[v141 + 1]) then
											v84 = v92[3];
										else
											v90[v141 + 3] = v142;
										end
									end
								elseif (v93 > 2) then
									v90[v92[2]] = v90[v92[3]][v92[4]];
								else
									v84 = v92[3];
								end
							elseif (v93 <= 5) then
								if (v93 == 4) then
									local v147 = 0;
									local v148;
									while true do
										if (v147 == 0) then
											v148 = v92[2];
											v90[v148](v21(v90, v148 + 1, v85));
											break;
										end
									end
								else
									local v149 = 0;
									local v150;
									while true do
										if (v149 == 0) then
											v150 = v92[2];
											do
												return v21(v90, v150, v85);
											end
											break;
										end
									end
								end
							elseif (v93 == 6) then
								local v151 = 0;
								local v152;
								local v153;
								local v154;
								local v155;
								while true do
									if (0 == v151) then
										v152 = v92[2];
										v153, v154 = v83(v90[v152](v90[v152 + 1]));
										v151 = 1;
									end
									if (v151 == 2) then
										for v317 = v152, v85 do
											v155 = v155 + 1;
											v90[v317] = v153[v155];
										end
										break;
									end
									if (1 == v151) then
										v85 = (v154 + v152) - 1;
										v155 = 0;
										v151 = 2;
									end
								end
							else
								v90[v92[4 - 2]] = v90[v92[3]] % v90[v92[6 - 2]];
							end
						elseif (v93 <= 11) then
							if (v93 <= 9) then
								if (v93 == 8) then
									for v255 = v92[3 - 1], v92[3] do
										v90[v255] = nil;
									end
								else
									do
										return v90[v92[2]]();
									end
								end
							elseif (v93 == (360 - (87 + 263))) then
								local v157 = v92[2];
								local v158 = v90[v157];
								for v257 = v157 + 1, v85 do
									v15(v158, v90[v257]);
								end
							else
								v90[v92[2]] = {};
							end
						elseif (v93 <= 13) then
							if (v93 > 12) then
								local v160 = 0;
								local v161;
								local v162;
								local v163;
								while true do
									if (0 == v160) then
										v161 = v92[182 - (67 + 113)];
										v162 = v90[v161 + 2];
										v160 = 1;
									end
									if (v160 == 2) then
										if (v162 > 0) then
											if (v163 <= v90[v161 + 1]) then
												local v343 = 0;
												while true do
													if (v343 == 0) then
														v84 = v92[3];
														v90[v161 + 3] = v163;
														break;
													end
												end
											end
										elseif (v163 >= v90[v161 + 1]) then
											v84 = v92[3];
											v90[v161 + 3] = v163;
										end
										break;
									end
									if (v160 == 1) then
										v163 = v90[v161] + v162;
										v90[v161] = v163;
										v160 = 2;
									end
								end
							else
								v90[v92[2]] = v92[3] + v90[v92[3 + 1]];
							end
						elseif (v93 > 14) then
							local v165 = 0;
							local v166;
							while true do
								if (0 == v165) then
									v166 = v92[2];
									v90[v166] = v90[v166](v21(v90, v166 + 1, v92[3]));
									break;
								end
							end
						else
							local v167 = v92[2];
							local v168 = v90[v167];
							local v169 = v90[v167 + 2];
							if (v169 > 0) then
								if (v168 > v90[v167 + 1]) then
									v84 = v92[3];
								else
									v90[v167 + 3] = v168;
								end
							elseif (v168 < v90[v167 + 1]) then
								v84 = v92[3];
							else
								v90[v167 + 3] = v168;
							end
						end
					elseif (v93 <= 23) then
						if (v93 <= 19) then
							if (v93 <= 17) then
								if (v93 > 16) then
									v90[v92[2]] = v75[v92[3]];
								else
									local v172 = v92[2];
									do
										return v90[v172](v21(v90, v172 + 1, v92[3]));
									end
								end
							elseif (v93 > 18) then
								v90[v92[2]]();
							elseif (v90[v92[2]] == v92[4]) then
								v84 = v84 + 1;
							else
								v84 = v92[3];
							end
						elseif (v93 <= 21) then
							if (v93 > 20) then
								v90[v92[2]] = #v90[v92[3]];
							else
								v90[v92[4 - 2]] = v92[3];
							end
						elseif (v93 == 22) then
							local v176 = v92[2];
							local v177, v178 = v83(v90[v176](v21(v90, v176 + 1, v85)));
							v85 = (v178 + v176) - 1;
							local v179 = 0;
							for v258 = v176, v85 do
								local v259 = 0;
								while true do
									if (v259 == 0) then
										v179 = v179 + 1;
										v90[v258] = v177[v179];
										break;
									end
								end
							end
						else
							v90[v92[2 + 0]] = v90[v92[3]][v92[4]];
						end
					elseif (v93 <= 27) then
						if (v93 <= 25) then
							if (v93 > 24) then
								v90[v92[2]] = v92[3];
							else
								v90[v92[2]]();
							end
						elseif (v93 > (103 - 77)) then
							v90[v92[954 - (802 + 150)]] = #v90[v92[3]];
						else
							do
								return v90[v92[2]]();
							end
						end
					elseif (v93 <= 29) then
						if (v93 == 28) then
							v90[v92[2]] = v90[v92[3]];
						else
							v90[v92[2]] = v90[v92[3]];
						end
					elseif (v93 > (80 - 50)) then
						do
							return;
						end
					else
						v90[v92[2]] = v90[v92[3]] % v92[4];
					end
				elseif (v93 <= 47) then
					if (v93 <= 39) then
						if (v93 <= 35) then
							if (v93 <= 33) then
								if (v93 > 32) then
									do
										return;
									end
								else
									local v190 = 0;
									local v191;
									local v192;
									local v193;
									while true do
										if (v190 == 0) then
											v191 = v92[2];
											v192 = v90[v191 + 2];
											v190 = 1;
										end
										if (v190 == 2) then
											if (v192 > 0) then
												if (v193 <= v90[v191 + 1]) then
													v84 = v92[3];
													v90[v191 + 3] = v193;
												end
											elseif (v193 >= v90[v191 + (1 - 0)]) then
												local v348 = 0;
												while true do
													if (v348 == 0) then
														v84 = v92[3];
														v90[v191 + 3] = v193;
														break;
													end
												end
											end
											break;
										end
										if (v190 == 1) then
											v193 = v90[v191] + v192;
											v90[v191] = v193;
											v190 = 2;
										end
									end
								end
							elseif (v93 == 34) then
								local v194 = 0;
								local v195;
								while true do
									if (v194 == 0) then
										v195 = v92[2];
										do
											return v90[v195](v21(v90, v195 + 1, v92[3]));
										end
										break;
									end
								end
							else
								local v196 = v92[2];
								local v197, v198 = v83(v90[v196](v21(v90, v196 + 1, v92[3])));
								v85 = (v198 + v196) - 1;
								local v199 = 0;
								for v260 = v196, v85 do
									v199 = v199 + 1;
									v90[v260] = v197[v199];
								end
							end
						elseif (v93 <= 37) then
							if (v93 > 36) then
								local v200 = 0;
								local v201;
								local v202;
								local v203;
								local v204;
								while true do
									if (v200 == 1) then
										v85 = (v203 + v201) - 1;
										v204 = 0;
										v200 = 2;
									end
									if (v200 == 0) then
										v201 = v92[2];
										v202, v203 = v83(v90[v201](v21(v90, v201 + 1, v92[3])));
										v200 = 1;
									end
									if (v200 == 2) then
										for v326 = v201, v85 do
											local v327 = 0;
											while true do
												if (v327 == 0) then
													v204 = v204 + 1;
													v90[v326] = v202[v204];
													break;
												end
											end
										end
										break;
									end
								end
							elseif not v90[v92[2]] then
								v84 = v84 + 1;
							else
								v84 = v92[3 + 0];
							end
						elseif (v93 == 38) then
							v90[v92[2]] = {};
						elseif (v90[v92[2]] == v92[1001 - (915 + 82)]) then
							v84 = v84 + 1;
						else
							v84 = v92[3];
						end
					elseif (v93 <= 43) then
						if (v93 <= 41) then
							if (v93 == 40) then
								for v263 = v92[2], v92[3] do
									v90[v263] = nil;
								end
							else
								local v206 = v92[2];
								v90[v206] = v90[v206](v21(v90, v206 + 1, v85));
							end
						elseif (v93 > 42) then
							local v208 = 0;
							local v209;
							local v210;
							local v211;
							local v212;
							while true do
								if (v208 == 2) then
									for v328 = v209, v85 do
										v212 = v212 + 1;
										v90[v328] = v210[v212];
									end
									break;
								end
								if (0 == v208) then
									v209 = v92[2];
									v210, v211 = v83(v90[v209](v21(v90, v209 + 1, v85)));
									v208 = 1;
								end
								if (v208 == 1) then
									v85 = (v211 + v209) - (2 - 1);
									v212 = 0;
									v208 = 2;
								end
							end
						else
							local v213 = v92[2];
							local v214, v215 = v83(v90[v213](v90[v213 + 1]));
							v85 = (v215 + v213) - 1;
							local v216 = 0;
							for v265 = v213, v85 do
								v216 = v216 + 1 + 0;
								v90[v265] = v214[v216];
							end
						end
					elseif (v93 <= 45) then
						if (v93 > (57 - 13)) then
							if not v90[v92[2]] then
								v84 = v84 + 1;
							else
								v84 = v92[3];
							end
						else
							local v217 = v92[2];
							local v218 = v90[v92[3]];
							v90[v217 + 1] = v218;
							v90[v217] = v218[v92[4]];
						end
					elseif (v93 > (1233 - (1069 + 118))) then
						local v222 = 0;
						local v223;
						local v224;
						local v225;
						while true do
							if (1 == v222) then
								v225 = {};
								v224 = v18({}, {[v7("\8\231\215\26\92\50\192", "\56\87\184\190\116")]=function(v331, v332)
									local v333 = v225[v332];
									return v333[1][v333[2]];
								end,[v7("\3\14\7\190\14\226\47\49\57\41", "\85\92\81\105\219\121\139\65")]=function(v334, v335, v336)
									local v337 = v225[v335];
									v337[1][v337[2]] = v336;
								end});
								v222 = 2;
							end
							if (v222 == 2) then
								for v339 = 1, v92[4] do
									local v340 = 0;
									local v341;
									while true do
										if (v340 == 1) then
											if (v341[1] == 28) then
												v225[v339 - 1] = {v90,v341[3]};
											else
												v225[v339 - 1] = {v75,v341[6 - 3]};
											end
											v89[#v89 + 1] = v225;
											break;
										end
										if (v340 == 0) then
											v84 = v84 + 1;
											v341 = v80[v84];
											v340 = 1;
										end
									end
								end
								v90[v92[2]] = v40(v223, v224, v76);
								break;
							end
							if (v222 == 0) then
								v223 = v81[v92[3]];
								v224 = nil;
								v222 = 1;
							end
						end
					else
						local v226 = 0;
						local v227;
						while true do
							if (0 == v226) then
								v227 = v92[2];
								do
									return v21(v90, v227, v85);
								end
								break;
							end
						end
					end
				elseif (v93 <= 55) then
					if (v93 <= 51) then
						if (v93 <= 49) then
							if (v93 == (9 + 39)) then
								if v90[v92[2]] then
									v84 = v84 + 1;
								else
									v84 = v92[3];
								end
							else
								v90[v92[3 - 1]] = v90[v92[3]] + v92[4];
							end
						elseif (v93 > (50 + 0)) then
							local v229 = 0;
							local v230;
							while true do
								if (v229 == 0) then
									v230 = v92[2];
									v90[v230] = v90[v230](v21(v90, v230 + 1, v92[3]));
									break;
								end
							end
						else
							v90[v92[2]] = v76[v92[3]];
						end
					elseif (v93 <= (844 - (368 + 423))) then
						if (v93 == 52) then
							v90[v92[2]] = v76[v92[3]];
						else
							v90[v92[2]] = v90[v92[3]] + v92[4];
						end
					elseif (v93 == 54) then
						v84 = v92[3];
					else
						v90[v92[2]] = v75[v92[3]];
					end
				elseif (v93 <= 59) then
					if (v93 <= 57) then
						if (v93 > 56) then
							if v90[v92[2]] then
								v84 = v84 + 1;
							else
								v84 = v92[3];
							end
						else
							local v239 = 0;
							local v240;
							while true do
								if (0 == v239) then
									v240 = v92[2];
									v90[v240] = v90[v240](v21(v90, v240 + (3 - 2), v85));
									break;
								end
							end
						end
					elseif (v93 > 58) then
						local v241 = v92[2];
						local v242 = v90[v92[3]];
						v90[v241 + 1] = v242;
						v90[v241] = v242[v92[4]];
					else
						v90[v92[2]] = v90[v92[3]] % v92[4];
					end
				elseif (v93 <= 61) then
					if (v93 > (78 - (10 + 8))) then
						v90[v92[2]] = v90[v92[3]] % v90[v92[4]];
					else
						local v248 = v81[v92[3]];
						local v249;
						local v250 = {};
						v249 = v18({}, {[v7("\194\140\89\75\120\218\229", "\191\157\211\48\37\28")]=function(v268, v269)
							local v270 = 0;
							local v271;
							while true do
								if (v270 == 0) then
									v271 = v250[v269];
									return v271[1][v271[2]];
								end
							end
						end,[v7("\224\32\250\25\45\214\17\240\25\34", "\90\191\127\148\124")]=function(v272, v273, v274)
							local v275 = v250[v273];
							v275[1][v275[2]] = v274;
						end});
						for v277 = 1, v92[4] do
							v84 = v84 + 1;
							local v278 = v80[v84];
							if (v278[1] == (107 - 79)) then
								v250[v277 - (443 - (416 + 26))] = {v90,v278[3]};
							else
								v250[v277 - 1] = {v75,v278[3]};
							end
							v89[#v89 + 1 + 0] = v250;
						end
						v90[v92[2]] = v40(v248, v249, v76);
					end
				elseif (v93 == 62) then
					local v252 = 0;
					local v253;
					while true do
						if (0 == v252) then
							v253 = v92[2];
							v90[v253](v21(v90, v253 + 1, v85));
							break;
						end
					end
				else
					v90[v92[2]] = v92[3] + v90[v92[4]];
				end
				v84 = v84 + 1;
			end
		end;
	end
	return v40(v39(), {}, v28)(...);
end
return v23("LOL!0D3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E7365727403053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C00243Q0012343Q00013Q0020035Q0002001234000100013Q002003000100010003001234000200013Q002003000200020004001234000300053Q0006240003000A000100010004363Q000A0001001234000300063Q002003000400030007001234000500083Q002003000500050009001234000600083Q00200300060006000A00063C00073Q000100062Q001C3Q00064Q001C8Q001C3Q00044Q001C3Q00014Q001C3Q00024Q001C3Q00053Q001234000800013Q00200300080008000B0012340009000C3Q001234000A000D3Q00063C000B0001000100052Q001C3Q00074Q001C3Q00094Q001C3Q00084Q001C3Q000A4Q001C3Q000B4Q001D000C000B4Q0009000C00014Q0005000C6Q00213Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q000B00025Q001214000300014Q001B00045Q001214000500013Q0004010003002100012Q001100076Q001D000800024Q0011000900014Q0011000A00024Q0011000B00034Q0011000C00044Q001D000D6Q001D000E00063Q002035000F000600012Q0023000C000F4Q0029000B3Q00022Q0011000C00034Q0011000D00044Q001D000E00014Q001B000F00014Q003D000F0006000F00100C000F0001000F2Q001B001000014Q003D00100006001000100C0010000100100020350010001000012Q0023000D00104Q0016000C6Q0029000A3Q000200201E000A000A00022Q00060009000A4Q000400073Q000100040D0003000500012Q0011000300054Q001D000400024Q0022000300044Q000500036Q00213Q00017Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001C3Q00063C5Q000100012Q00378Q0011000100014Q0011000200024Q0011000300024Q000B00046Q0011000500034Q001D00066Q0008000700074Q0023000500074Q000A00043Q0001002003000400040001001214000500024Q000F000300050002001214000400034Q0023000200044Q002900013Q000200262700010018000100040004363Q001800012Q001D00016Q000B00026Q0022000100024Q000500015Q0004363Q001B00012Q0011000100044Q0009000100014Q000500016Q00213Q00013Q00013Q00063Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403483Q00D9D7CF35F5E18851C3C2CC6BE1B2D316C4C1CE36E3A9C411DFD7DE2BF2F5C411DC8CD52CEEBAC810D8CBDA2AE8B2CF1FDECD9636E9AED51DD48CE301C1F6EF31F38CD624EFB5884903083Q007EB1A3BB4586DBA7026Q00F03F010F3Q0006393Q000D00013Q0004363Q000D0001001234000100013Q001234000200023Q00203B0002000200032Q001100045Q001214000500043Q001214000600054Q0023000400064Q001600026Q002900013Q00022Q00130001000100010004363Q000E000100200300013Q00062Q00213Q00017Q00", v17(), ...);