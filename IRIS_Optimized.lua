--[[
IRIS [LMAOBOX]
A LMAOBOX Script Set
https://github.com/PhoenixAceVFX
This shit is 99% pasted LMAO
]]
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590, 0x200)
local tempest = draw.CreateFont("Electrolize", 15, 590, 0x200)
local font = draw.CreateFont("Consolas", 16, 200)
local dead = draw.CreateFont("Dead Stock", 16, 200)
local fps = 0

engine.Notification("IRIS Loaded!")

local cheatname = "LBOX"
local cheatname2 = "IRIS"
-- made these variables so you can change the name for the watermark, just note you gotta fix text pos too since im lazy lol.

local tf = draw.CreateFont("Tempest Apache Title", 30, 590, FONTFLAG_OUTLINE)
local tf2 = draw.CreateFont("Tempest Apache Title", 20, 590, FONTFLAG_OUTLINE)

-- Goofy aaah pasted code.
local function RGBRainbow(frequency)
   local curtime = globals.CurTime()
   local r, g, b
   r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
   g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
   b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

   return r, g, b
end
-- End of Goofy aaah pasted code.
-- Credits: https://github.com/DemonLoverHvH/

-- Draw text: Lmaobox | FPS: x | Ping: x | Time: x
local function IRISWatermark()
   local inGame = clientstate.GetClientSignonState()
   local me = entities.GetLocalPlayer()

   if inGame == 6 then
      ping = entities.GetPlayerResources():GetPropDataTableInt("m_iPing")[me:GetIndex()]
   else
      ping = "-"
   end

   if globals.FrameCount() % 15 == 0 then
      fps = math.floor(1 / globals.FrameTime())
   end

   local r, g, b = RGBRainbow(2.5)
   if engine.IsGameUIVisible(true) then
   else
      draw.Color(40, 40, 40, 150)
      draw.FilledRect(1500, 10, 1900, 40)
      draw.Color(0, 0, 0, 200)
      draw.OutlinedRect(1500, 10, 1900, 40)
      draw.Color(20, 20, 20, 255)
      draw.FilledRect(1505, 15, 1895, 35)
      draw.Color(0, 0, 0, 200)
      draw.OutlinedRect(1505, 15, 1895, 35)
      draw.Color(r, g, b, 255)
      draw.Line(1506, 16, 1894, 16)

      draw.Color(255, 255, 255, 255)
      draw.SetFont(dead)
      draw.Text(1510, 17, cheatname)
      draw.Color(r, g, b, 255)
      draw.Text(1550, 17, cheatname2)
      draw.Color(255, 255, 255, 255)
      draw.SetFont(font)
      draw.Text(1585, 17, "| fps: " .. fps)
      draw.Text(1670, 17, "| ping: " .. tostring(ping))
      draw.Text(1755, 17, "| time: " .. os.date("%I:%M %p"))
      local aimbot = gui.GetValue("aim bot")
      local aimbotMethod = gui.GetValue("aim method")
      local aimbotfov = gui.GetValue("aim fov")
      local dt = gui.GetValue("double tap (beta)")
      local aa = gui.GetValue("anti aim")
      local chams = gui.GetValue("colored players")
      local esp = gui.GetValue("players")
      local fakepingvalue = gui.GetValue("fake latency value (ms)")
      local fakeping = gui.GetValue("fake latency")
      local triggerbot = gui.GetValue("trigger shoot")
      local bhop = gui.GetValue("bunny hop")
      local antiobs = gui.GetValue("anti-obs")
      local nohands = gui.GetValue("no hands")
      local noscope = gui.GetValue("no scope")
      local customfov = gui.GetValue("enable custom fov")
      local fovvalue = gui.GetValue("custom fov value")
      local thirdperson = gui.GetValue("thirdperson")
      local triggerdel = gui.GetValue("trigger shoot delay (ms)")
      local r, g, b = RGBRainbow(1)

      local ping = clientstate.GetLatencyOut()

      draw.SetFont(tempest)
      draw.Color(r, g, b, 255)
      draw.Text(10, 465, "IRIS Indicators")
      draw.SetFont(tahoma)
      draw.Color(255, 255, 255, 255)
      if globals.FrameCount() % 50 == 0 then
         current_fps = math.floor(1 / globals.FrameTime())
         --   clientstate.GetLatencyOut = math.floor( 1 / globals.FrameTime())
      end
      draw.Color(235, 225, 52, 255)
      draw.Text(10, 480, "Triggerbot: " .. (triggerbot == 1 and "ON" or "OFF"))
      -- checks if ESP is enabled then renders text
      draw.Color(110, 235, 52, 255)
      draw.Text(10, 495, "ESP: " .. (esp == 1 and "ON" or "OFF"))
      -- checks if the aimbot is enabled then renders the aim fov
      if (aimbot == 1) then
         draw.Color(255, 255, 255, 255)
         draw.Text(10, 540, "AimFov: " .. aimbotfov .. "")
      else
         draw.Color(255, 255, 255, 255)
         draw.Text(10, 540, "Aimbot is DISABLED")
      end
      -- checks if BunnyHop is enabled then renders text
      draw.Color(229, 255, 0, 255)
      draw.Text(10, 510, "Bunnyhop: " .. (bhop == 1 and "ON" or "OFF"))
      -- checks if the aimbot is enabled then renders text
      draw.Color(255, 0, 0, 255)
      draw.Text(10, 525, "AimBot: " .. (aimbot == 1 and "ON" or "OFF"))
      draw.Text(10, 555, "AimMethod: " .. aimbotMethod .. "")
      -- checks if anti-aim is enabled then renders text
      if (aa == 1) then
         draw.Color(255, 0, 0, 255)
         draw.Text(10, 570, "AA: WARNING: ON")
         draw.Color(255, 255, 255, 255)
      else
         draw.Color(255, 255, 255, 255)
         draw.Text(10, 570, "AA: OFF")
      end
      draw.Color(171, 86, 232, 255)
      draw.Text(10, 585, "Anti-OBS: " .. (antiobs == 1 and "ON" or "OFF"))
      draw.Color(225, 232, 86, 255)
      draw.Text(10, 600, "NoScope: " .. (noscope == 1 and "ON" or "OFF"))
      draw.Color(171, 86, 232, 255)
      draw.Text(10, 615, "NoHands: " .. (nohands == 1 and "ON" or "OFF"))
      draw.Color(178, 232, 86, 255)
      draw.Text(10, 630, "FOVChanger: " .. (customfov == 1 and "ON" or "OFF"))
      if (customfov == 1) then
         draw.Color(178, 232, 86, 255)
         draw.Text(10, 645, "ViewFOV: " .. fovvalue .. "")
      else
         draw.Color(255, 255, 255, 255)
         draw.Text(10, 645, "FOVChanger is DISABLED")
      end
      draw.Color(225, 232, 86, 255)
      draw.Text(10, 660, "Fake Ping: " .. (fakeping == 1 and "ON" or "OFF"))
      if (fakeping == 1) then
         draw.Text(100, 660, "-Value: " .. fakepingvalue .. "")
      end
      draw.Color(225, 232, 86, 255)
      draw.Text(10, 675, "Trigger Del: " .. triggerdel)
      draw.Color(161, 86, 232, 255)
      draw.Text(10, 690, "Thirdp: " .. (thirdperson == 1 and "ON" or "OFF"))
   end

   draw.SetFont(tf)
   local r, g, b = RGBRainbow(.5)
   draw.Color(r, g, b, 255)
   if engine.IsGameUIVisible(true) then
      draw.Text(10, 10, "IRIS [LMAOBOX]")
      draw.SetFont(tf2)
      draw.Text(10, 40, "V1 Public Release")
   end
end

print("==========================================================")
printc(50, 255, 50, 100, "IRIS [LMAOBOX]")
printc(255, 255, 255, 100, "A LMAOBOX Script Set")
print("==========================================================")
engine.PlaySound("vo/items/wheatley_sapper/wheatley_sapper_attached14.mp3")
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590, 0x200)
local tempest = draw.CreateFont("Electrolize", 15, 590, 0x200)

-- TriggerKey, then this button is pressed it will print out all the names and priority's (Idea by @xarq0n and few others)
local triggerKey = KEY_NUMLOCK

-- sendToPartyChat if set to true will send the message to party chat too
local sendToPartyChat = false;

-- Prints out all the priorities when the local player respawns (when you respawn)
local onLocalPlayerRespawn = true;

-- Prints out all the available priorities that have been set (not added yet)
local availablePrioritiesKey = KEY_PAD_5

-- Priority's if you have them set as a diffrent priority
-- Skips empty strings! Ty lbox developer for explaining me how to do that
local priorities = {
   "Crybaby", -- Priority 1
   "Easily Annoyed", -- Priority 2
   "Streamer", -- Priority 3
   "Vote Caller", -- Priority 4
   "Annoying", -- Priority 5
   "Tryhard", -- Priority 6
   "Closet", -- Priority 7
   "Sus", -- Priority 8
   "Bot", -- Priority 9
   "Cheater", -- Priority 10
}
-- Colors for priorities (hex) (default is white)
-- Sample hex codes
-- ===============
-- Red FF0000
-- Purple FF00FF
-- Geen 00FF00
-- Yellow FFFF00
-- Blue 0000FF
-- Aqua 00FFFF
-- ===============
local priorityColors = {
   "4287f5", -- Priority 1
   "fa7720", -- Priority 2
   "00ff77", -- Priority 3
   "8a9868", -- Priority 4
   "FF8800", -- Priority 5
   "694200", -- Priority 6
   "0000FF", -- Priority 7
   "00FFFF", -- Priority 8
   "FF00FF", -- Priority 9
   "FF1100", -- Priority 10
}


-- Stuff copied from @lnx00 on lmaobox and github, way to dumb to make my own version of it so huge thanks to him
local lastButton = 0
local anyButtonDown = false
local function ButtonPressed(button) --
   if input.IsButtonDown(button) and button ~= lastButton then
      lastButton = button
      anyButtonDown = true
   end

   if input.IsButtonDown(button) == false and button == lastButton then
      lastButton = 0
      anyButtonDown = false
      return true
   end

   if anyButtonDown == false then
      lastButton = 0
   end
   return false
end

-- Intication that everything is working
client.ChatPrintf("\x03[IRIS] \x01 Loaded Successfully! ");


local function onDeathPrint( event )

   if (event:GetName() == 'localplayer_respawn' ) and onLocalPlayerRespawn == true then

      local players = entities.FindByClass("CTFPlayer");
      players[client.GetLocalPlayerIndex()] = nil;

      -- if body is marked it will tell you, you can turn this off by setting it to true
      local isSomeone = false;

      for i, player in pairs(players) do
         if player ~= entities.GetLocalPlayer() then

            local steamid = client.GetPlayerInfo(player:GetIndex()).SteamID;
            local name = player:GetName();
            local priority = playerlist.GetPriority(steamid);

            if priority ~= 0 or priority ~= -1 then
               if priorities[priority] ~= nil and priorityColors[priority] ~= nil then
                  if string.len(priorities[priority]) > 0 then
                     client.ChatPrintf("\x03[IRIS] \x01\"".. name.. "\" Is \x07".. priorityColors[priority].. priorities[priority].. "!");
                     isSomeone = true;
                     if sendToPartyChat ~= false then
                        client.Command( "say_party ".. name.." is ".. priorities[priority].. "!", true);
                     end
                  end
               elseif priority == -1 then
                  client.ChatPrintf("\x03[IRIS] \x01\"".. name.. "\" Is \x071eff00Friended!");
                  if sendToPartyChat ~= false then
                     client.Command( "say_party ".. name.." is ".. priorities[priority].. "!", true);
                  end
               else
                  print("[IRIS] ".. steamid.. " - ".. name.. " Is clean!");
               end
            end

         end
      end

      if isSomeone ~= true then
         client.ChatPrintf("\x03[IRIS] \x01 Nobody is marked ");
      end
   end
end

callbacks.Register("FireGameEvent", "deathPrint", onDeathPrint);

local function printPlayerInfo( cmd )
   if ButtonPressed(triggerKey) then

      local players = entities.FindByClass("CTFPlayer");
      players[client.GetLocalPlayerIndex()] = nil;

      -- if body is marked it will tell you, you can turn this off by setting it to true
      local isSomeone = false;

      for i, player in pairs(players) do
         if player ~= entities.GetLocalPlayer() then

            local steamid = client.GetPlayerInfo(player:GetIndex()).SteamID;
            local name = player:GetName();
            local priority = playerlist.GetPriority(steamid);

            if priority ~= 0 or priority ~= -1 then
               if priorities[priority] ~= nil and priorityColors[priority] ~= nil then
                  if string.len(priorities[priority]) > 0 then
                     client.ChatPrintf("\x03[IRIS] \x01\"".. name.. "\" Is \x07".. priorityColors[priority].. priorities[priority].. "!");
                     isSomeone = true;
                     if sendToPartyChat ~= false then
                        client.Command( "say_party ".. name.." is ".. priorities[priority].. "!", true);
                     end
                  end
               elseif priority == -1 then
                  client.ChatPrintf("\x03[IRIS] \x01\"".. name.. "\" Is \x071eff00Friended!");
                  if sendToPartyChat ~= false then
                     client.Command( "say_party ".. name.." is ".. priorities[priority].. "!", true);
                  end
               end
            end

         end
      end

      if isSomeone ~= true then
         client.ChatPrintf("\x03[IRIS] \x01 Nobody is marked ");
      end

   end
end

local function secondary()
   local r, g, b = RGBRainbow(1.5)
   draw.SetFont(tempest)
   draw.Color(r, g, b, 255)
   if engine.IsGameUIVisible(true) then
   else
      draw.Text(10, 300, "IRIS Priority IDs")
      draw.SetFont(tahoma)
      draw.Color(66, 135, 245, 255)
      draw.Text(10, 315, "1 - Crybaby")
      draw.Color(250, 119, 32, 255)
      draw.Text(10, 330, "2 - Easily Annoyed")
      draw.Color(0, 255, 119, 255)
      draw.Text(10, 345, "3 - Streamer")
      draw.Color(138, 152, 104, 255)
      draw.Text(10, 360, "4 - Vote Caller")
      draw.Color(105, 66, 0, 255)
      draw.Text(10, 375, "5 - Annoying")
      draw.Color(255, 136, 0, 255)
      draw.Text(10, 390, "6 - Tryhard")
      draw.Color(0, 0, 255, 255)
      draw.Text(10, 405, "7 - Closet")
      draw.Color(0, 255, 255, 255)
      draw.Text(10, 420, "8 - Sus")
      draw.Color(255, 0, 255, 255)
      draw.Text(10, 435, "9 - Bot")
      draw.Color(255, 17, 0, 255)
      draw.Text(10, 450, "10 - Cheater")
   end
end
--[[
animated hitlog recoded
remade animation
author: pred#2448
]]
local queue = {}
local floor = math.floor
local x, y = draw.GetScreenSize()
local font_calibri = draw.CreateFont("Calibri Bold", 18, 18, 0x200)

local function event_hook(ev)
   if ev:GetName() ~= "player_hurt" then
      return
   end -- only allows player_hurt event go through
   --declare variables
   --to get all structures of event: https://wiki.alliedmods.net/Team_Fortress_2_Events#player_hurt

   local victim_entity = entities.GetByUserID(ev:GetInt("userid"))
   local attacker = entities.GetByUserID(ev:GetInt("attacker"))
   local localplayer = entities.GetLocalPlayer()
   local damage = ev:GetInt("damageamount")
   local health = ev:GetInt("health")
   local ping = entities.GetPlayerResources():GetPropDataTableInt("m_iPing")[victim_entity:GetIndex()]

   if attacker ~= localplayer then
      return
   end
   --insert table
   table.insert(
   queue,
   {
      string = string.format(
      "[IRIS]Hit %s for %d damage (%d health remaining) [ping=%s]",
      victim_entity:GetName(),
      damage,
      health,
      ping
      ),
      delay = globals.RealTime() + 5.5,
      alpha = 0
   }
   )

   printc(
   100,
   255,
   100,
   255,
   string.format(
   "[IRIS] Hit %s for %d damage (%d health remaining) [ping=%s]",
   victim_entity:GetName(),
   damage,
   health,
   ping
   )
   )
end

local function paint_logs()
   draw.SetFont(font_calibri)
   for i, v in pairs(queue) do
      local alpha = floor(v.alpha)
      local text = v.string
      local y_pos = floor(685) + (i * 20)
      draw.Color(255, 255, 255, alpha)
      draw.Text(10, y_pos, text)
   end
end

local function anim()
   for i, v in pairs(queue) do
      if globals.RealTime() < v.delay then --checks if delay is over or not
         v.alpha = math.min(v.alpha + 1, 255) --fade in animation
      else
         v.string = string.sub(v.string, 1, string.len(v.string) - 1) --removes last character
         if 0 >= string.len(v.string) then
            table.remove(queue, i) --if theres no text left, remove the table
         end
      end
   end
end

local function draw_handler()
   paint_logs()
   anim()
end

_G.announce_party_chat = false

local vote_failed_e = {
   [0] = "VOTE_FAILED_GENERIC",
   [1] = "VOTE_FAILED_TRANSITIONING_PLAYERS",
   [2] = "VOTE_FAILED_RATE_EXCEEDED",
   [3] = "VOTE_FAILED_YES_MUST_EXCEED_NO",
   [4] = "VOTE_FAILED_QUORUM_FAILURE",
   [5] = "VOTE_FAILED_ISSUE_DISABLED",
   [6] = "VOTE_FAILED_MAP_NOT_FOUND",
   [7] = "VOTE_FAILED_MAP_NAME_REQUIRED",
   [8] = "VOTE_FAILED_ON_COOLDOWN",
   [9] = "VOTE_FAILED_TEAM_CANT_CALL",
   [10] = "VOTE_FAILED_WAITINGFORPLAYERS",
   [11] = "VOTE_FAILED_PLAYERNOTFOUND",
   [12] = "VOTE_FAILED_CANNOT_KICK_ADMIN",
   [13] = "VOTE_FAILED_SCRAMBLE_IN_PROGRESS",
   [14] = "VOTE_FAILED_SPECTATOR",
   [15] = "VOTE_FAILED_NEXTLEVEL_SET",
   [16] = "VOTE_FAILED_MAP_NOT_VALID",
   [17] = "VOTE_FAILED_CANNOT_KICK_FOR_TIME",
   [18] = "VOTE_FAILED_CANNOT_KICK_DURING_ROUND",
   [19] = "VOTE_FAILED_VOTE_IN_PROGRESS",
   [20] = "VOTE_FAILED_KICK_LIMIT_REACHED",
   [21] = "VOTE_FAILED_KICK_DENIED_BY_GC"
}

local vote_failed_t = {
   [0] = "#GameUI_vote_failed",
   [3] = "#GameUI_vote_failed_yesno",
   [4] = "#GameUI_vote_failed_quorum"
}

local call_vote_failed_t = {
   [1] = "#GameUI_vote_failed_transition_vote",
   [2] = function(time)
   local response = (time > 60) and "#GameUI_vote_failed_vote_spam_min" or "#GameUI_vote_failed_vote_spam_mins"
   return response
   end,
   [5] = "#GameUI_vote_failed_disabled_issue",
   [6] = "#GameUI_vote_failed_map_not_found",
   [7] = "#GameUI_vote_failed_map_name_required",
   [8] = function(time)
   local response = (time > 60) and "GameUI_vote_failed_recently_min" or "GameUI_vote_failed_recently_mins"
   return response
   end,
   [9] = "#GameUI_vote_failed_team_cant_call",
   [10] = "#GameUI_vote_failed_waitingforplayers",
   [11] = "VOTE_FAILED_PLAYERNOTFOUND", -- doesn't appear to work
   [12] = "#GameUI_vote_failed_cannot_kick_admin",
   [13] = "#GameUI_vote_failed_scramble_in_prog",
   [14] = "#GameUI_vote_failed_spectator",
   [15] = "#GameUI_vote_failed_nextlevel_set",
   [16] = "#GameUI_vote_failed_map_not_valid",
   [17] = function(time) -- VOTE_FAILED_ON_COOLDOWN
   local response = (time > 60) and "#GameUI_vote_failed_cannot_kick_min" or "#GameUI_vote_failed_cannot_kick_mins"
   return response
   end,
   [18] = "GameUI_vote_failed_round_active",
   [19] = "#GameUI_vote_failed_event_already_active"
}

local make_clean_string = function(original)
-- filter control characters
original = string.gsub(original, "%c", "")
-- escape magic characters
original = string.gsub(original, "%%", "%%%%")
return original -- modified
end

local teamName, teamColor = {}, {}
teamName[0] = "~"
teamName[1] = client.Localize("TF_Spectators")
teamName[2] = client.Localize("TF_RedTeam_Name")
teamName[3] = client.Localize("TF_BlueTeam_Name")
teamColor[0] = "F6D7A7ff"
teamColor[1] = "cfcfc4ff"
teamColor[2] = "ff6663ff"
teamColor[3] = "9EC1CFff"
local tempTeamColor = {}
tempTeamColor[0] = "rgba(246, 215, 167, 255)"
tempTeamColor[1] = "rgba(250, 250, 240, 255)"
tempTeamColor[2] = "rgba(255, 102, 99, 255)"
tempTeamColor[3] = "rgba(158, 193, 207, 255)" -- #9eb5cfff

-- what if we do full string color, unless :flushed:
local team_name = {
[0] = "~",
client.Localize("TF_Spectators") or "Spectators",
client.Localize("TF_RedTeam_Name") or "Red",
client.Localize("TF_BlueTeam_Name") or "Blu"
}
local function GetTeamName(teamidx)
return team_name[teamidx]
end

local team_color = {
[0] = "#F6D7A7ff",
"#cfcfc4ff",
"#ff6663ff",
"#9EC1CFff"
}
local function GetTeamColor(teamidx)
local objColor = {}
objColor.hex = team_color[teamidx]
function objColor:colorCode()
   local hex = team_color[teamidx]:gsub("#", "")
   local markup = #hex < 8 and "\x07" .. hex or "\x08" .. hex
   return markup
end
function objColor:rgbArray()
   local i = tonumber("0x" .. team_color[teamidx]:gsub("#", ""))
   local rgba = {i >> 24, i >> 16 & 0xFF, i >> 8 & 0xFF, i & 0xFF}
   if rgba[1] == 0 then
      table.remove(rgba, 1)
      rgba[#rgba + 1] = 255
   else
      rgba[1] = rgba[1] & 0xFF
   end
   return rgba
end
function objColor:printc(message)
   local r, g, b, a = table.unpack(objColor:rgbArray())
   return printc(r, g, b, a, message)
end
return objColor, objColor.hex
end

local function removeColorCode(message)
local tbl = {message:byte(1, #message)}
for i, val in ipairs(tbl) do
   if val > 0 and val <= 8 then
      table.remove(tbl, i)
   end
   if val == 7 or val == 8 then
      for i1 = 1, val, 1 do
         table.remove(tbl, i)
      end
   end
end
return string.char(table.unpack(tbl))
end

local function interp(message, tbl)
local s =
message:gsub(
"(%b{})",
function(w)
   return tbl[w:sub(2, -2)] or w
end
)
return s
end
-- getmetatable( '' ).__mod = interp

-- What if i start doing overengineer.

local function PartySay(message)
if announce_party_chat then
   client.Command(string.format("tf_party_chat %q", message:gsub('"', "'")), true)
end
end

local votesArr = {}
local meVotedOption  -- todo EXP
local buflogger = {}

local function vote_start(msg)
if msg:GetID() == VoteStart then
   local team, voteidx, entidx, disp_str, details_str, target
   team = msg:ReadByte()
   voteidx = msg:ReadInt(32)
   entidx = msg:ReadByte()
   disp_str = msg:ReadString(64)
   details_str = msg:ReadString(64)
   target = msg:ReadByte() >> 1

   local ent = entities.GetByIndex(entidx)
   if #details_str > 0 then
      details_str = GetTeamColor(ent:GetTeamNumber()):colorCode() .. details_str .. "\x01"
   end

   local loc, fmt, tfchat, tfparty, tfconsole
   loc = client.Localize(disp_str)
   loc = (loc ~= nil and #loc > 0) and utf8.char(loc:byte(1, #loc)) or disp_str
   tfconsole =
   loc:gsub(
   "%%s%d+",
   function(capture)
      if capture == "%s1" then
         return details_str
      end
      return "%" .. capture
   end
   ):gsub("\n", " ")
   fmt =
   string.format(
   "%d • [{TEAM}%s\x01] {ENT}%s\x01\n* \x05%s",
   voteidx,
   GetTeamName(team),
   client.GetPlayerNameByIndex(entidx) or "NULLNAME",
   tfconsole
   )
   tfchat =
   "\x01" ..
   interp(
   fmt,
   {
      ENT = GetTeamColor(ent:GetTeamNumber()):colorCode(),
      TEAM = GetTeamColor(team):colorCode()
   }
   )

   client.ChatPrintf(tfchat)
   tfconsole = removeColorCode(tfconsole)
   -- GetTeamColor( ent:GetTeamNumber() ):printc( tfconsole )
   PartySay(
   string.format(
   "Vote started by %s - %s",
   client.GetPlayerNameByIndex(entidx),
   client.GetPlayerInfo(entidx).SteamID
   )
   )
   PartySay(tfconsole .. " " .. client.GetPlayerInfo(target).SteamID or "")
   buflogger[#buflogger + 1] = tfconsole

   for idx, arr in pairs(votesArr) do
      if idx ~= voteidx then
         votesArr[idx] = undef
      end
   end
end
end

local function vote_pass(msg)
if msg:GetID() == VotePass then
   local team, voteidx, disp_str, details_str
   team = msg:ReadByte()
   voteidx = msg:ReadInt(32)
   disp_str = msg:ReadString(256)
   details_str = msg:ReadString(256)

   local loc, fmt, tfchat, tfparty, tfconsole
   loc = client.Localize(disp_str)
   loc = (loc ~= nil and #loc > 0) and utf8.char(loc:byte(1, #loc)) or disp_str
   tfconsole =
   loc:gsub(
   "%%s%d+",
   function(capture)
      if capture == "%s1" then
         return details_str
      end
      return "%" .. capture
   end
   ):gsub("\n", " ")
   fmt =
   string.format(
   "%d • [{TEAM}%s\x01] \x05%s\x01 %s",
   voteidx,
   GetTeamName(team),
   tfconsole,
   votesArr[voteidx] or ""
   )
   tfchat =
   "\x01" ..
   interp(
   fmt,
   {
      TEAM = GetTeamColor(team):colorCode()
   }
   )

   client.ChatPrintf(tfchat)
   tfconsole = removeColorCode(tfconsole)
   PartySay(tfconsole)
end
end

local function vote_failed(msg)
if msg:GetID() == VoteFailed then
   local team, voteidx, reason
   team = msg:ReadByte()
   voteidx = msg:ReadInt(32)
   reason = msg:ReadByte()

   local disp_str = vote_failed_t[reason]

   local loc, fmt, tfchat, tfparty, tfconsole
   loc = client.Localize(disp_str)
   loc = (loc ~= nil and #loc > 0) and utf8.char(loc:byte(1, #loc)) or disp_str
   tfconsole =
   loc:gsub(
   "%%s%d+",
   function(capture)
      if capture == "%s1" then
         return details_str
      end
      return "%" .. capture
   end
   ):gsub("\n", " ")
   fmt =
   string.format(
   "%d • [{TEAM}%s\x01] \x05%s\x01 %s",
   voteidx,
   GetTeamName(team),
   tfconsole,
   votesArr[voteidx] or ""
   )

   tfchat =
   "\x01" ..
   interp(
   fmt,
   {
      TEAM = GetTeamColor(team):colorCode()
   }
   )

   PartySay(tfconsole)
   client.ChatPrintf(tfchat)
   tfconsole = removeColorCode(tfconsole)
end
end

-- todo
local function call_vote_failed(msg)
if msg:GetID() == CallVoteFailed then
   local reason, time
   reason = msg:ReadByte()
   time = msg:ReadInt(16)

   local disp_str = vote_failed_e[reason]
   local message =
   "[\x03" ..
   client.Localize("#GameUI_vote_failed") ..
   "\x01] " .. disp_str .. "\n" .. time .. " seconds left to wait before casting another vote"
   local highlighted =
   "\x01" ..
   message:gsub(
   disp_str,
   function(s)
      return "\x05" .. s .. "\x01"
   end
   )

   client.ChatPrintf(highlighted)
   printc(157, 194, 80, 255, message)
end
end

local options = {"Yes", "No"}

local function on_vote(event)
if event:GetName() == "vote_options" then
   for i = 1, event:GetInt("count") do
      options[i] = event:GetString("option" .. i)
   end
end

if event:GetName() == "vote_changed" then
   local vote_option1, vote_option2, vote_option3, vote_option4, vote_option5, potentialVotes, voteidx
   local vote = {}
   local buf = {}
   for i = 1, 5 do
      vote[i] = event:GetInt("vote_option" .. i)
      if vote[i] > 0 then
         buf[i] = vote[i]
      end
   end
   potentialVotes = event:GetInt("potentialVotes")
   voteidx = event:GetInt("voteidx")
   votesArr[voteidx] = string.format("\x01[%s\x01]", table.concat(buf, "/"))
   -- print( votesArr[voteidx] )
end

if event:GetName() == "vote_cast" then
   local vote_option, team, entidx, voteidx
   vote_option = event:GetInt("vote_option") + 1 -- ??? volvo why.
   team = event:GetInt("team")
   entidx = event:GetInt("entityid")
   voteidx = event:GetInt("voteidx")

   local ent = entities.GetByIndex(entidx)
   if client.GetLocalPlayerIndex() == entidx then
      meVotedOption = voteidx << vote_option
   end

   local fmt, tfchat, tfparty, tfconsole
   fmt =
   string.format(
   "%d {DOT}•\x01 |\x05%s\x01 {ENT}%s\x01",
   voteidx,
   options[vote_option],
   client.GetPlayerNameByIndex(entidx)
   )

   tfchat =
   "\x01" ..
   interp(
   fmt,
   {
      ENT = GetTeamColor(ent:GetTeamNumber()):colorCode(),
      DOT = (function()
      if not meVotedOption or team ~= 0 and team ~= entities.GetLocalPlayer():GetTeamNumber() then
         return "\x01"
      end
      return meVotedOption & ~(voteidx << vote_option) == 0 and "\x089EE09EFF" or "\x08FF6663FF"
      end)()
   }
   )

   client.ChatPrintf(tfchat)
   PartySay(tfconsole)
end
end

-- region:
-- LuaFormatter off
local lua_callbacks = {
{"FireGameEvent", on_vote},
{"DispatchUserMessage", vote_start},
{"DispatchUserMessage", vote_pass},
{"DispatchUserMessage", vote_failed},
{"DispatchUserMessage", call_vote_failed}
}
function lua_callbacks:Register()
for i, o in ipairs(lua_callbacks) do
   callbacks.Register(o[1], GetScriptName() .. "_callback_" .. i, o[2])
end
end
function lua_callbacks:Unregister()
for i, o in ipairs(lua_callbacks) do
   callbacks.Unregister(o[1], GetScriptName() .. "_callback_" .. i, o[2])
end
end

callbacks.Register(
"Unload",
function()
lua_callbacks:Unregister()
end
)
lua_callbacks:Register()

callbacks.Register(
"Draw",
"uniqueddraw1",
function()
end
)
callbacks.Register(
"Draw",
"uniqueddraw2",
function()
end
)

local weapon_name_cache = {}
local function get_weapon_name( any )
if type( any ) == 'number' then
   return weapon_name_cache[any] or get_weapon_name( itemschema.GetItemDefinitionByID( any ) )
end

local meta = getmetatable( any )

if meta['__name'] == 'Entity' then
   if any:IsWeapon() then
      return get_weapon_name( any:GetPropInt( 'm_iItemDefinitionIndex' ) )
   end
   return 'entity is not a weapon'
end

if meta['__name'] == 'ItemDefinition' then
   if weapon_name_cache[any] then
      return weapon_name_cache[any]
   end
   local special = tostring( any ):match( 'TF_WEAPON_[%a%A]*' )
   if special then
      local i1 = client.Localize( special )
      if i1:len() ~= 0 then
         weapon_name_cache[any:GetID()] = i1
         return i1
      end
      weapon_name_cache[any:GetID()] = client.Localize( any:GetTypeName():gsub( '_Type', '' ) )
      return weapon_name_cache[any:GetID()]
   end
   for attrDef, value in pairs( any:GetAttributes() ) do
      local name = attrDef:GetName()
      if name == 'paintkit_proto_def_index' or name == 'limited quantity item' then
         weapon_name_cache[any:GetID()] = client.Localize( any:GetTypeName():gsub( '_Type', '' ) )
         return weapon_name_cache[any:GetID()]
      end
   end
   weapon_name_cache[any:GetID()] = tostring( any:GetNameTranslated() )
   return weapon_name_cache[any:GetID()]
end
end

local function is_rapid_fire_weapon( wpn )
-- todo: Ask bf to add GetWeaponData.m_bUseRapidFireCrits
return wpn:GetLastRapidFireCritCheckTime() > 0 or wpn:GetClass() == 'CTFMinigun'
end

local function get_crit_cap( wpn )
local me_crit_multiplier = entities.GetLocalPlayer():GetCritMult()
local chance = 0.02

if wpn:IsMeleeWeapon() then
   chance = 0.15
end
local multiplier_crit_chance = wpn:AttributeHookFloat( "mult_crit_chance", me_crit_multiplier * chance )

if is_rapid_fire_weapon( wpn ) then
   local total_crit_chance = math.max( math.min( 0.02 * me_crit_multiplier, 0.01 ), 0.99 )
   local crit_duration = 2.0
   local non_crit_duration = (crit_duration / total_crit_chance) - crit_duration
   local start_crit_chance = 1 / non_crit_duration
   multiplier_crit_chance = wpn:AttributeHookFloat( "mult_crit_chance", start_crit_chance )
end

return multiplier_crit_chance
end

---

local indicator = draw.CreateFont( 'Verdana', 16, 700, FONTFLAG_CUSTOM | FONTFLAG_OUTLINE )
-- draw.CreateFont( 'Verdana', 24, 700, FONTFLAG_CUSTOM | FONTFLAG_ANTIALIAS )

callbacks.Register( "Draw", function()
local width, height = draw.GetScreenSize()
local width_center, height_center = width // 2, height // 1.1
draw.SetFont( indicator )
draw.Color( 0, 0, 0, 255 )
local me = entities.GetLocalPlayer()

if not me then
return
end

local wpn = me:GetPropEntity( 'm_hActiveWeapon' )

if not wpn or not me:IsAlive() then
return
end

local name = get_weapon_name( wpn )

local rapidfire_history, rapidfire_check_time = wpn:GetRapidFireCritTime(), wpn:GetLastRapidFireCritCheckTime()

local bucket_current, bucket_cap, bucket_bottom, bucket_start = wpn:GetCritTokenBucket(), client.GetConVar(
'tf_weapon_criticals_bucket_cap' ), client.GetConVar( 'tf_weapon_criticals_bucket_bottom' ), client.GetConVar(
'tf_weapon_criticals_bucket_default' )

local crit_check, crit_request = wpn:GetCritCheckCount(), wpn:GetCritSeedRequestCount()
local observed_crit_chance = wpn:CalcObservedCritChance()
local wpn_critchance = wpn:GetCritChance()
local wpn_seed = wpn:GetCurrentCritSeed()
local wpn_can_crit = wpn:CanRandomCrit()
local damage_base = wpn:GetWeaponBaseDamage()
local stats = wpn:GetWeaponDamageStats()
local cost = wpn:GetCritCost( bucket_current, crit_request, crit_check )

local server_allow_crit = false
local can_criticals_melee = client.GetConVar( 'tf_weapon_criticals_melee' )
local can_weapon_criticals = client.GetConVar( 'tf_weapon_criticals' )

if wpn:IsMeleeWeapon() then
if can_criticals_melee == 2 or (can_weapon_criticals == 1 and can_criticals_melee == 1) then
   server_allow_crit = true
end
elseif wpn:IsShootingWeapon() then
if can_weapon_criticals == 1 then
   server_allow_crit = true
end
end

----
local startpos, txt_x, txt_y = 130, draw.GetTextSize( name )
--draw.FilledRect( startpos, startpos, startpos + txt_x, startpos + txt_y )
draw.Color( 255, 255, 255, 255 )
--draw.TextShadow( startpos, startpos, name )
local wpndebug = {
variable = { 'server_allow_crit', 'rapidfire_history', 'rapidfire_check_time', 'bucket_current', 'bucket_cap',
'bucket_bottom', 'bucket_start', 'cost', 'crit_check', 'crit_request', 'observed_crit_chance',
'wpn_critchance', 'wpn_seed', 'damage_base', 'total', 'critical', 'melee' },
value = { server_allow_crit, rapidfire_history, rapidfire_check_time, bucket_current, bucket_cap, bucket_bottom,
bucket_start, cost, crit_check, crit_request, observed_crit_chance, wpn_critchance, wpn_seed,
damage_base, stats.total, stats.critical, stats.melee }
}

local i, j, space = 0, 0, 0
for _, name in ipairs( wpndebug.variable ) do
local width, height = draw.GetTextSize( name )
if width + startpos > space - 100 then
   space = width + startpos + 100
end
--draw.Text( startpos, startpos + math.floor( height * i ) + txt_y * 2, name )
i = i + 1.3
end
draw.Color( 36, 255, 122, 255 )
for _, value in ipairs( wpndebug.value ) do
if type( value ) == 'number' and math.floor( value ) ~= value then
   value = string.format( "%.6s", value )
end
local width, height = draw.GetTextSize( tostring( value ) )
--draw.Text( space - (width // 2), startpos + math.floor( height * j ) + txt_y * 2, tostring( value ) )
j = j + 1.3
end

---
draw.Color( 255, 255, 255, 255 )
local data, text = {}
local cmpCritChance = wpn_critchance + 0.1

if not server_allow_crit then
data[#data + 1] = 'server disabled crit'
end

if not wpn:CanRandomCrit() then
data[#data + 1] = 'no random crit'
end

if cmpCritChance < wpn:CalcObservedCritChance() then
local requiredTotalDamage = (stats.critical * (2.0 * cmpCritChance + 1.0)) / cmpCritChance / 3.0
local requiredDamage = requiredTotalDamage - stats.total
data[#data + 1] = 'Crit Banned: deal ' .. math.floor( requiredDamage ) .. ' damage'
end

if bucket_current < math.floor( cost ) then
data[#data + 1] = 'low bucket'
end

if bucket_current == bucket_cap then
data[#data + 1] = 'bucket reached cap'
end

if is_rapid_fire_weapon( wpn ) then
data[#data + 1] = 'rapidfire-able'
end

if rapidfire_history - globals.CurTime() > 0 then
data[#data + 1] = 'rapid firing: ' .. string.format( "%.4s", rapidfire_history - globals.CurTime() )
end

text = table.concat( data, ' | ' )
txt_x, txt_y = draw.GetTextSize( text )
if engine.IsGameUIVisible(true) then
else
draw.Text( width_center - math.floor( txt_x / 2 ), math.floor( height_center * 1.05 ), text )
end

end )

--crit test

-- If you see this error
-- 50: attempt to concatenate a nil value (field 'shots_left_till_bucket_full')
-- It's safe to ignore!
-- I was simply caching GetWeaponData() because CreateMove updates more often than Draw
local colors = {
white = { 255, 255, 255, 255 },
gray = { 190, 190, 190, 255 },
red = { 255, 0, 0, 255 },
green = { 36, 255, 122, 255 },
blue = { 30, 139, 195, 255 }
}

local other_weapon_info = {
crit_chance = 0,
observedCritChance = 0,
damageStats = {}
}
local cache_weapon_info = {
[0] = {}
}
function cache_weapon_info.get(critCheckCount)
if cache_weapon_info[0].critCheckCount == critCheckCount then
   return cache_weapon_info[0], false
end
end
function cache_weapon_info.update(t)
for k, v in pairs(t) do
   cache_weapon_info[0][k] = v
end
end

local hardcoded_weapon_ids = {}
local arr = { 441, 416, 40, 594, 595, 813, 834, 141, 1004, 142, 232, 61, 1006, 525, 132, 1082, 266, 482, 327, 307, 357,
404, 812, 833, 237, 265, 155, 230, 460, 1178, 14, 201, 56, 230, 402, 526, 664, 752, 792, 801, 851, 881,
890, 899, 908, 957, 966, 1005, 1092, 1098, 15000, 15007, 15019, 15023, 15033, 15059, 15070, 15071, 15072,
15111, 15112, 15135, 15136, 15154, 30665, 194, 225, 356, 461, 574, 638, 649, 665, 727, 794, 803, 883, 892,
901, 910, 959, 968, 15062, 15094, 15095, 15096, 15118, 15119, 15143, 15144, 131, 406, 1099, 1144, 46, 42,
311, 863, 1002, 159, 433, 1190, 129, 226, 354, 1001, 1101, 1179, 642, 133, 444, 405, 608, 57, 231, 29,
211, 35, 411, 663, 796, 805, 885, 894, 903, 912, 961, 970, 998, 15008, 15010, 15025, 15039, 15050, 15078,
15097, 15121, 15122, 15123, 15145, 15146, 30, 212, 59, 60, 297, 947, 735, 736, 810, 831, 933, 1080, 1102,
140, 1086, 30668, 25, 737, 26, 28, 222, 1121, 1180, 58, 1083, 1105 }
for i = 1, #arr do
hardcoded_weapon_ids[arr[i]] = true
end

local function CanFireCriticalShot(me, wpn)
if me:GetPropInt('m_iClass') == TF2_Spy and wpn:IsMeleeWeapon() then
   return false
end
local className = wpn:GetClass()
if className == 'CTFSniperRifle' or className == 'CTFBuffItem' or className == 'CTFWeaponLunchBox' then
   return false
end
if hardcoded_weapon_ids[wpn:GetPropInt('m_iItemDefinitionIndex')] then
   return false
end
if wpn:GetCritChance() <= 0 then
   return false
end
if wpn:GetWeaponBaseDamage() <= 0 then
   return false
end
return true
end

local fontid = draw.CreateFont('Verdana', 16, 700, FONTFLAG_CUSTOM | FONTFLAG_OUTLINE)
callbacks.Unregister('Draw', 'Draw-F3drQ')
callbacks.Register('Draw', 'Draw-F3drQ', function()
local me, wpn
me = entities.GetLocalPlayer()
if me and me:IsAlive() then
wpn = me:GetPropEntity('m_hActiveWeapon')
if not (wpn and wpn:IsWeapon() and CanFireCriticalShot(me, wpn)) then
   return
end
else
return
end

local x, y = 600, 800
draw.SetFont(fontid)

local weaponinfo = cache_weapon_info[0]

local sv_allow_crit = wpn:CanRandomCrit()
if wpn:IsMeleeWeapon() then
local tf_weapon_criticals_melee = client.GetConVar('tf_weapon_criticals_melee')
sv_allow_crit = (sv_allow_crit and tf_weapon_criticals_melee == 1) or (tf_weapon_criticals_melee == 2)
end

local mult = 0
local elements = {}
elements[1] = { 'Crit',
(me:IsCritBoosted() or me:InCond(TFCond_CritCola)) and colors.blue or sv_allow_crit and colors.green or
colors.gray }
elements[2] = { weaponinfo.shots_left_till_bucket_full .. ' attacks left until full bar', nil,
weaponinfo.shots_left_till_bucket_full ~= 0 }
elements[3] = { weaponinfo.stored_crits .. ' crits available' }
elements[4] = { 'deal ' .. math.floor(other_weapon_info.requiredDamage) .. ' damage', nil,
(other_weapon_info.critChance + 0.1 < other_weapon_info.observedCritChance) }
elements[5] = { 'streaming crit', colors.red, wpn:GetRapidFireCritTime() > wpn:GetLastRapidFireCritCheckTime() }
for i = 1, #elements, 1 do
local text, color, visible = elements[i][1], elements[i][2] or colors.white, elements[i][3]
draw.Color(color[1], color[2], color[3], color[4])
if visible ~= false then
   if engine.IsGameUIVisible(true) then
   else
      draw.Text(x, y + mult, text)
   end
   mult = mult + 20
end
end
end)

callbacks.Unregister('CreateMove', 'CreateMove-N8bat')
callbacks.Register('CreateMove', 'CreateMove-N8bat', function()
local me, wpn
me = entities.GetLocalPlayer()
if me and me:IsAlive() then
wpn = me:GetPropEntity('m_hActiveWeapon')
if not (wpn and wpn:IsWeapon() and CanFireCriticalShot(me, wpn)) then
   return
end
else
return
end

local weaponinfo, needupdate = cache_weapon_info.get(wpn:GetCritCheckCount())
if needupdate == nil or wpn:GetIndex() ~= weaponinfo.currentWeapon then
-- printc(255, 0, 0, 255, 'updating weaponinfo...')
weaponinfo = setmetatable({}, {
   __index = wpn:GetWeaponData()
})
-- LuaFormatter off
weaponinfo.currentWeapon                  = wpn:GetIndex()
weaponinfo.isRapidFire                    = weaponinfo.useRapidFireCrits or wpn:GetClass() == 'CTFMinigun'
weaponinfo.currentCritSeed                = wpn:GetCurrentCritSeed()
weaponinfo.bulletsPerShot                 = wpn:AttributeHookFloat('mult_bullets_per_shot', weaponinfo.bulletsPerShot)
weaponinfo.added_per_shot                 = wpn:GetWeaponBaseDamage()
weaponinfo.bucket                         = wpn:GetCritTokenBucket()
weaponinfo.bucket_max                     = client.GetConVar('tf_weapon_criticals_bucket_cap')
weaponinfo.bucket_min                     = client.GetConVar('tf_weapon_criticals_bucket_bottom')
weaponinfo.bucket_start                   = client.GetConVar('tf_weapon_criticals_bucket_default')
weaponinfo.critRequestCount               = wpn:GetCritSeedRequestCount()
weaponinfo.critCheckCount                 = wpn:GetCritCheckCount()
weaponinfo.shots_to_fill_bucket           = weaponinfo.bucket_max / weaponinfo.added_per_shot
weaponinfo.costs                          = {}
weaponinfo.stored_crits                   = 0
weaponinfo.shots_left_till_bucket_full    = 0
-- LuaFormatter on

local temp, temp1, temp2
temp = weaponinfo.bucket_min
temp1 = weaponinfo.bucket
temp2 = weaponinfo.bucket

--- FIXME : random bullshit go
if wpn:IsMeleeWeapon() then
   local min = wpn:GetCritCost(temp, weaponinfo.critRequestCount, weaponinfo.critCheckCount)
   while temp1 > min do
      weaponinfo.stored_crits = weaponinfo.stored_crits + 1
      min = min +
      wpn:GetCritCost(min, weaponinfo.critRequestCount + weaponinfo.stored_crits,
      weaponinfo.critCheckCount)
      if temp2 < weaponinfo.bucket_max then
         temp2 = math.min(temp2 + weaponinfo.added_per_shot, weaponinfo.bucket_max)
         weaponinfo.shots_left_till_bucket_full = weaponinfo.shots_left_till_bucket_full + 1
      end
      local temp3 = min +
      wpn:GetCritCost(min, weaponinfo.critRequestCount + weaponinfo.stored_crits + 1,
      weaponinfo.critCheckCount) + weaponinfo.added_per_shot -
      weaponinfo.shots_to_fill_bucket
      if temp3 > weaponinfo.bucket_max then
         break
      end
   end
else
   for i = 0, weaponinfo.shots_to_fill_bucket + 1, 1 do
      if temp < weaponinfo.bucket_max then
         temp = math.min(temp + weaponinfo.added_per_shot, weaponinfo.bucket_max)
         weaponinfo.costs[i] = wpn:GetCritCost(temp, weaponinfo.critRequestCount + i,
         weaponinfo.critCheckCount)
      end
      if temp1 >= weaponinfo.costs[i] then
         temp1 = temp1 - weaponinfo.costs[i]
         weaponinfo.stored_crits = weaponinfo.stored_crits + 1
      end
      if temp2 < weaponinfo.bucket_max then
         temp2 = math.min(temp2 + weaponinfo.added_per_shot, weaponinfo.bucket_max)
         weaponinfo.shots_left_till_bucket_full = weaponinfo.shots_left_till_bucket_full + 1
      end
   end
end

cache_weapon_info.update(weaponinfo)
end

-- from bf : weapon state affects the crit rate and for some reason the non revved state doesnt have bIsRapidFire afaik
-- may cause inaccurate result on custom server / when reload script (due to hardcoded value)
local critChance = wpn:GetCritChance()
if weaponinfo.isRapidFire then
critChance = 0.0102
end

-- TODO : figure out why holding mouse 1 with heavy still allow you to crit despite cmpChance + 0.1 < observedCritChance
local damageStats = wpn:GetWeaponDamageStats()
local cmpCritChance = critChance + 0.1
local requiredTotalDamage = (damageStats['critical'] * (2.0 * cmpCritChance + 1.0)) / cmpCritChance / 3.0
other_weapon_info.requiredDamage = requiredTotalDamage - damageStats['total']
other_weapon_info.observedCritChance = wpn:CalcObservedCritChance()
other_weapon_info.critChance = critChance
other_weapon_info.damageStats = damageStats
end)

local Config = { -- HOME BUTTON UNLOADS LUA
Speed = 0.5; -- go crazy -- Default 1
Saturation = 1; -- between 0 and 1 -- Default 1
Lightness = 0.6; -- between 0 and 1 -- Default 0.6
Alpha = 255; -- transparency setting between 0 and 255 -- Default 255


-- Set to true to rainbowize ;)
Backtrack = true;
BlueTeam = false;
--BlueTeamInvis = true; -- NOT WORKING
RedTeam = false;
--RedTeamInvis = true; -- NOT WORKING
Target = true;
Gui = true;
--AAIndicator = true; -- NOT WORKING
NightMode = false;
-- Set to true to rainbowize
}



-- :)

local function Round(Value)
if Value - math.floor(Value) >= 0.5 then
   return math.ceil(Value)
else
   return math.floor(Value)
end
end

function HSLtRGB(H, S, L)
local C = (1 - math.abs(L * 2 - 1)) * S
local X = C * (1 - math.abs(math.fmod((H / 60), 2) - 1))
local m = L - C/2

local RawR, RawG, RawB = 0, 0, 0

if H >= 0 and H < 60 then RawR, RawG, RawB = C, X, 0 end
if H >= 60 and H < 120 then RawR, RawG, RawB = X, C, 0 end
if H >= 120 and H < 180 then RawR, RawG, RawB = 0, C, X end
if H >= 180 and H < 240 then RawR, RawG, RawB = 0, X, C end
if H >= 240 and H < 300 then RawR, RawG, RawB = X, 0, C end
if H >= 300 and H < 360 then RawR, RawG, RawB = C, 0, X end

local r, g, b = Round((RawR + m) * 255), Round((RawG + m) * 255), Round((RawB + m) * 255)

return r, g, b
end

function RGBtHex(R, G, B, A)
local RR = Round(R)
local RG = Round(G)
local RB = Round(B)
local RA = Round(A)
return tonumber("0x" .. string.format("%02x%02x%02x%02x", RR, RG, RB, RA))
end

local Set = gui.SetValue
callbacks.Register("Draw", "Draw", function()
if input.IsButtonDown(KEY_HOME) then callbacks.Unregister("Draw", "Draw") end

local temp, Hue = math.modf((globals.TickCount() * Config.Speed) / 360)
local r, g, b = HSLtRGB(Hue * 360, Config.Saturation, Config.Lightness)
local hex = RGBtHex(r, g, b, Config.Alpha)


if Config.Backtrack then Set("backtrack ticks color", hex) end
if Config.BlueTeam then Set("blue team color", hex) end
--if Config.BlueTeamInvis then Set("blue team invisible", hex) end
if Config.RedTeam then Set("red team color", hex) end
--if Config.RedTeamInvis then Set("red team invisible", hex) end
if Config.Target then Set("aimbot target color", hex) end
if Config.Gui then Set("gui color", hex) end
--if Config.AAIndicator then Set("anti aim indicator color", hex) end
if Config.NightMode then Set("night mode color", hex) end
end)

-- mult_dmg : damage bonus / penalty (modifier)

client.Command('play "ui/buttonclick"', true)

callbacks.Register("Draw", "unique_draw_hook", draw_handler)
callbacks.Register("FireGameEvent", "unique_event_hook", event_hook)
callbacks.Register("Draw", "draw", secondary)
callbacks.Register("CreateMove", "printPlayer", printPlayerInfo)
callbacks.Register("Draw", "IRISWatermark", IRISWatermark)
