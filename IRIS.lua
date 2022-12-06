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
        draw.Text(10, 40, "V1 Public Release [UNSTABLE]")
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

local function RGBRainbow(frequency)
    local curtime = globals.CurTime()
    local r, g, b
    r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return r, g, b
end

-- TriggerKey, then this button is pressed it will print out all the names and priority's (Idea by @xarq0n and few others)
local triggerKey = KEY_NUMLOCK

-- sendToPartyChat if set to true will send the message to party chat too
local sendToPartyChat = false

-- Prints out all the priorities when the local player respawns (when you respawn)
local onLocalPlayerRespawn = true

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
    "Cheater" -- Priority 10
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
    "FF1100" -- Priority 10
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
client.ChatPrintf("\x03[IRIS] \x01 Loaded Successfully! ")

local function onDeathPrint(event)
    if (event:GetName() == "localplayer_respawn") and onLocalPlayerRespawn == true then
        local players = entities.FindByClass("CTFPlayer")
        players[client.GetLocalPlayerIndex()] = nil

        -- if body is marked it will tell you, you can turn this off by setting it to true
        local isSomeone = false

        for i, player in pairs(players) do
            if player ~= entities.GetLocalPlayer() then
                local steamid = client.GetPlayerInfo(player:GetIndex()).SteamID
                local name = player:GetName()
                local priority = playerlist.GetPriority(steamid)

                if priority ~= 0 or priority ~= -1 then
                    if priorities[priority] ~= nil and priorityColors[priority] ~= nil then
                        if string.len(priorities[priority]) > 0 then
                            client.ChatPrintf(
                                '\x03[IRIS] \x01"' ..
                                    name .. '" Is \x07' .. priorityColors[priority] .. priorities[priority] .. "!"
                            )
                            isSomeone = true
                            if sendToPartyChat ~= false then
                                client.Command("say_party " .. name .. " is " .. priorities[priority] .. "!", true)
                            end
                        end
                    elseif priority == -1 then
                        client.ChatPrintf('\x03[IRIS] \x01"' .. name .. '" Is \x071eff00Friended!')
                        if sendToPartyChat ~= false then
                            client.Command("say_party " .. name .. " is " .. priorities[priority] .. "!", true)
                        end
                    else
                        print("[IRIS] " .. steamid .. " - " .. name .. " Is clean!")
                    end
                end
            end
        end

        if isSomeone ~= true then
            client.ChatPrintf("\x03[IRIS] \x01 Nobody is marked ")
        end
    end
end

callbacks.Register("FireGameEvent", "deathPrint", onDeathPrint)

local function printPlayerInfo(cmd)
    if ButtonPressed(triggerKey) then
        local players = entities.FindByClass("CTFPlayer")
        players[client.GetLocalPlayerIndex()] = nil

        -- if body is marked it will tell you, you can turn this off by setting it to true
        local isSomeone = false

        for i, player in pairs(players) do
            if player ~= entities.GetLocalPlayer() then
                local steamid = client.GetPlayerInfo(player:GetIndex()).SteamID
                local name = player:GetName()
                local priority = playerlist.GetPriority(steamid)

                if priority ~= 0 or priority ~= -1 then
                    if priorities[priority] ~= nil and priorityColors[priority] ~= nil then
                        if string.len(priorities[priority]) > 0 then
                            client.ChatPrintf(
                                '\x03[IRIS] \x01"' ..
                                    name .. '" Is \x07' .. priorityColors[priority] .. priorities[priority] .. "!"
                            )
                            isSomeone = true
                            if sendToPartyChat ~= false then
                                client.Command("say_party " .. name .. " is " .. priorities[priority] .. "!", true)
                            end
                        end
                    elseif priority == -1 then
                        client.ChatPrintf('\x03[IRIS] \x01"' .. name .. '" Is \x071eff00Friended!')
                        if sendToPartyChat ~= false then
                            client.Command("say_party " .. name .. " is " .. priorities[priority] .. "!", true)
                        end
                    end
                end
            end
        end

        if isSomeone ~= true then
            client.ChatPrintf("\x03[IRIS] \x01 Nobody is marked ")
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

--[[
author:pred#2448
For LMAOBOX.net
]]
local function get_class_entity(class_int, enemy_only)
    local class_ents = {}
    local players = entities.FindByClass("CTFPlayer")
    local localplayer = entities.GetLocalPlayer()
    for _, v in pairs(players) do
        local ent_classes = v:GetPropInt("m_iClass")
        local team_num = v:GetPropInt("m_iTeamNum")
        if enemy_only and team_num == localplayer:GetPropInt("m_iTeamNum") then
            goto continue
        end
        if ent_classes ~= class_int then
            goto continue
        end
        table.insert(class_ents, v)
        ::continue::
    end
    return class_ents
end

local screen_x, screen_y = draw.GetScreenSize()
local font_calibri = draw.CreateFont("calibri bold", 20, 40, 0x200)

local function paint_spy()
    local spies = get_class_entity(8, true)
    local localplayer = entities.GetLocalPlayer()
    for i, v in pairs(spies) do
        local spy_origin = v:GetAbsOrigin()
        local local_origin = localplayer:GetAbsOrigin()
        local distance = vector.Distance(spy_origin, local_origin)
        if distance > 350 then
            goto continue
        end
        draw.SetFont(font_calibri)
        local str = string.format("A spy is nearby! - %s[%s]", v:GetName(), math.floor(distance))
        local text_x, text_y = draw.GetTextSize(str)
        draw.Color(255, 0, 0, 255)
        draw.Text(screen_x / 2 - math.floor(text_x / 2), math.floor(700) + 16 * i, str)
        ::continue::
    end
end

local options = {
    X = 0.5,
    Y = 0.7,
    Size = 5,
    Colors = {
        Background = {45, 50, 55, 100},
        Recharge = {75, 120, 235, 255},
        Ready = {70, 190, 50, 255},
        Outline = {15, 15, 15, 255}
    }
}

local MAX_TICKS = 23

local function DT_Enabled()
    local dtMode = gui.GetValue("double tap (beta)")
    local dashKey = gui.GetValue("dash move key")

    return dtMode ~= "off" or dashKey ~= 0
end

local function OnDraw()
    if not DT_Enabled() then
        return
    end

    local pLocal = entities.GetLocalPlayer()
    if not pLocal or engine.IsGameUIVisible() then
        return
    end

    local pWeapon = pLocal:GetPropEntity("m_hActiveWeapon")
    if not pWeapon then
        return
    end

    local ratio = warp.GetChargedTicks() / MAX_TICKS
    local boxWidth = 24 * options.Size
    local boxHeight = math.floor(4 * options.Size)
    local barWidth = math.floor(boxWidth * ratio)

    local sWidth, sHeight = draw.GetScreenSize()
    local xPos = math.floor(sWidth * options.X - boxWidth * 0.5)
    local yPos = math.floor(sHeight * options.Y - boxHeight * 0.5)

    draw.Color(table.unpack(options.Colors.Background))
    draw.FilledRect(xPos, yPos, xPos + boxWidth, yPos + boxHeight)

    if warp.IsWarping() or warp.GetChargedTicks() < MAX_TICKS then
        draw.Color(table.unpack(options.Colors.Recharge))
    elseif warp.CanDoubleTap(pWeapon) then
        draw.Color(table.unpack(options.Colors.Ready))
    else
        draw.Color(205, 95, 50, 255)
    end

    draw.FilledRect(xPos, yPos, xPos + barWidth, yPos + boxHeight)

    draw.Color(table.unpack(options.Colors.Outline))
    draw.OutlinedRect(xPos, yPos, xPos + boxWidth, yPos + boxHeight)
end

-- type in console : ``lua vote = 1`` means auto vote yes, ``lua vote = 2`` means auto vote no
local t = {
    ["option yes"] = 1,
    ["option no"] = 2,
    ["off"] = nil
}

_G.vote = t[gui.GetValue("Auto Voting")] -- ONCE

if not _G.vote then
    printc(255, 0, 0, 255, "autovote.lua _G.vote is nil, consider reading src or enable Auto Voting and reload script")
end

local g_voteidx = nil

local options = {"Yes", "No"}

callbacks.Register(
    "FireGameEvent",
    "lboxfixwhen_1",
    function(event)
        if event:GetName() == "vote_options" then
            for i = 1, event:GetInt("count") do
                options[i] = event:GetString("option" .. i)
            end
        end

        if event:GetName() == "vote_cast" then
            local vote_option, team, entityid, voteidx
            vote_option = event:GetInt("vote_option") + 1 -- ??? consistency
            team = event:GetInt("team")
            entityid = event:GetInt("entityid")
            voteidx = event:GetInt("voteidx")
            g_voteidx = voteidx
        end
    end
)

callbacks.Register(
    "SendStringCmd",
    "lboxfixwhen_2",
    function(cmd)
        local input = cmd:Get()
        if input:find("vote option") then
            cmd:Set(input:gsub("vote", "%1 " .. g_voteidx))
        end
    end
)

callbacks.Register(
    "DispatchUserMessage",
    "lboxfixwhen_3",
    function(msg)
        if msg:GetID() == VoteStart then
            local team, voteidx, entidx, disp_str, details_str, target
            team = msg:ReadByte()
            voteidx = msg:ReadInt(32)
            entidx = msg:ReadByte()
            disp_str = msg:ReadString(64)
            details_str = msg:ReadString(64)
            target = msg:ReadByte() >> 1

            local ent0, ent1 = entities.GetByIndex(entidx), entities.GetByIndex(target)
            local me = entities.GetLocalPlayer()
            local voteint = _G.vote

            if ent0 ~= me and ent1 ~= me and type(voteint) == "number" then
                -- vote no if target is friend
                voteint = (function()
                    local playerinfo = client.GetPlayerInfo(target)
                    if steam.IsFriend(playerinfo.SteamID) == true then
                        return 2
                    end

                    local members = party.GetMembers()
                    for i, steamid in ipairs(members) do
                        if steamid == playerinfo.SteamID then
                            return 2
                        end
                    end

                    return voteint
                end)()

                client.ChatPrintf(
                    string.format('\x01Voted %s "vote option%d" (\x05%s\x01)', options[voteint], voteint, disp_str)
                )
                client.Command(string.format("vote %d option%d", voteidx, voteint), true)
            end
        end
    end
)

local weapon_name_cache = {}
local function get_weapon_name(any)
    if type(any) == "number" then
        return weapon_name_cache[any] or get_weapon_name(itemschema.GetItemDefinitionByID(any))
    end

    local meta = getmetatable(any)

    if meta["__name"] == "Entity" then
        if any:IsWeapon() then
            return get_weapon_name(any:GetPropInt("m_iItemDefinitionIndex"))
        end
        return "entity is not a weapon"
    end

    if meta["__name"] == "ItemDefinition" then
        if weapon_name_cache[any] then
            return weapon_name_cache[any]
        end
        local special = tostring(any):match("TF_WEAPON_[%a%A]*")
        if special then
            local i1 = client.Localize(special)
            if i1:len() ~= 0 then
                weapon_name_cache[any:GetID()] = i1
                return i1
            end
            weapon_name_cache[any:GetID()] = client.Localize(any:GetTypeName():gsub("_Type", ""))
            return weapon_name_cache[any:GetID()]
        end
        for attrDef, value in pairs(any:GetAttributes()) do
            local name = attrDef:GetName()
            if name == "paintkit_proto_def_index" or name == "limited quantity item" then
                weapon_name_cache[any:GetID()] = client.Localize(any:GetTypeName():gsub("_Type", ""))
                return weapon_name_cache[any:GetID()]
            end
        end
        weapon_name_cache[any:GetID()] = tostring(any:GetNameTranslated())
        return weapon_name_cache[any:GetID()]
    end
end

local function is_rapid_fire_weapon(wpn)
    -- todo: Ask bf to add GetWeaponData.m_bUseRapidFireCrits
    return wpn:GetLastRapidFireCritCheckTime() > 0 or wpn:GetClass() == "CTFMinigun"
end

local function get_crit_cap(wpn)
    local me_crit_multiplier = entities.GetLocalPlayer():GetCritMult()
    local chance = 0.02

    if wpn:IsMeleeWeapon() then
        chance = 0.15
    end
    local multiplier_crit_chance = wpn:AttributeHookFloat("mult_crit_chance", me_crit_multiplier * chance)

    if is_rapid_fire_weapon(wpn) then
        local total_crit_chance = math.max(math.min(0.02 * me_crit_multiplier, 0.01), 0.99)
        local crit_duration = 2.0
        local non_crit_duration = (crit_duration / total_crit_chance) - crit_duration
        local start_crit_chance = 1 / non_crit_duration
        multiplier_crit_chance = wpn:AttributeHookFloat("mult_crit_chance", start_crit_chance)
    end

    return multiplier_crit_chance
end

---

local indicator = draw.CreateFont("Verdana", 16, 700, FONTFLAG_CUSTOM | FONTFLAG_OUTLINE)
-- draw.CreateFont( 'Verdana', 24, 700, FONTFLAG_CUSTOM | FONTFLAG_ANTIALIAS )

callbacks.Register(
    "Draw",
    "IRISCritDebug",
    function()
        local width, height = draw.GetScreenSize()
        local width_center, height_center = width // 2, height // 1.15
        draw.SetFont(indicator)
        draw.Color(0, 0, 0, 255)
        local me = entities.GetLocalPlayer()

        if not me then
            return
        end

        local wpn = me:GetPropEntity("m_hActiveWeapon")

        if not wpn or not me:IsAlive() then
            return
        end

        local name = get_weapon_name(wpn)

        local rapidfire_history, rapidfire_check_time = wpn:GetRapidFireCritTime(), wpn:GetLastRapidFireCritCheckTime()

        local bucket_current, bucket_cap, bucket_bottom, bucket_start =
            wpn:GetCritTokenBucket(),
            client.GetConVar("tf_weapon_criticals_bucket_cap"),
            client.GetConVar("tf_weapon_criticals_bucket_bottom"),
            client.GetConVar("tf_weapon_criticals_bucket_default")

        local crit_check, crit_request = wpn:GetCritCheckCount(), wpn:GetCritSeedRequestCount()
        local observed_crit_chance = wpn:CalcObservedCritChance()
        local wpn_critchance = wpn:GetCritChance()
        local wpn_seed = wpn:GetCurrentCritSeed()
        local wpn_can_crit = wpn:CanRandomCrit()
        local damage_base = wpn:GetWeaponBaseDamage()
        local stats = wpn:GetWeaponDamageStats()
        local cost = wpn:GetCritCost(bucket_current, crit_request, crit_check)

        local server_allow_crit = false
        local can_criticals_melee = client.GetConVar("tf_weapon_criticals_melee")
        local can_weapon_criticals = client.GetConVar("tf_weapon_criticals")

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
        local startpos, txt_x, txt_y = 130, draw.GetTextSize(name)
        draw.Color(255, 255, 255, 255)
        -- draw.TextShadow( startpos + 10, startpos, name )
        local wpndebug = {
            variable = {
                "server_allow_crit",
                "rapidfire_history",
                "rapidfire_check_time",
                "bucket_current",
                "bucket_cap",
                "bucket_bottom",
                "bucket_start",
                "cost",
                "crit_check",
                "crit_request",
                "observed_crit_chance",
                "wpn_critchance",
                "wpn_seed",
                "damage_base",
                "total",
                "critical",
                "melee"
            },
            value = {
                server_allow_crit,
                rapidfire_history,
                rapidfire_check_time,
                bucket_current,
                bucket_cap,
                bucket_bottom,
                bucket_start,
                cost,
                crit_check,
                crit_request,
                observed_crit_chance,
                wpn_critchance,
                wpn_seed,
                damage_base,
                stats.total,
                stats.critical,
                stats.melee
            }
        }

        local i, j, space = 0, 0, 0
        for _, name in ipairs(wpndebug.variable) do
            local width, height = draw.GetTextSize(name)
            if width + startpos > space - 100 then
                space = width + startpos + 100
            end
            -- draw.Text( startpos + 10, startpos + math.floor( height * i ) + txt_y * 2, name )
            i = i + 1.3
        end
        draw.Color(36, 255, 122, 255)
        for _, value in ipairs(wpndebug.value) do
            if type(value) == "number" and math.floor(value) ~= value then
                value = string.format("%.6s", value)
            end
            local width, height = draw.GetTextSize(tostring(value))
            -- draw.Text( space - (width // 2), startpos + math.floor( height * j ) + txt_y * 2, tostring( value ) )
            j = j + 1.3
        end

        ---
        draw.Color(255, 255, 255, 255)
        local data, text = {}
        local cmpCritChance = wpn_critchance + 0.1

        if not server_allow_crit then
            data[#data + 1] = "server disabled crit"
        end

        if not wpn:CanRandomCrit() then
            data[#data + 1] = "no random crit"
        end

        --[[   for i = 1, bucket_cap // damage_base do
print( string.format('cost: %s, request: %d', wpn:GetCritCost( bucket_start, 1, i ), i) )
end
]]
        if cmpCritChance < wpn:CalcObservedCritChance() then
            local requiredTotalDamage = (stats.critical * (2.0 * cmpCritChance + 1.0)) / cmpCritChance / 3.0
            local requiredDamage = requiredTotalDamage - stats.total
            data[#data + 1] = "Crit banned: deal " .. math.floor(requiredDamage) .. " damage"
        end

        if bucket_current < math.floor(cost) then
            data[#data + 1] = "low bucket"
        end

        if bucket_current == bucket_cap then
            data[#data + 1] = "bucket reached cap"
        end

        if is_rapid_fire_weapon(wpn) then
            data[#data + 1] = "rapidfire-able"
        end

        if rapidfire_history - globals.CurTime() > 0 then
            data[#data + 1] = "rapid firing: " .. string.format("%.4s", rapidfire_history - globals.CurTime())
        end

        text = table.concat(data, " | ")
        txt_x, txt_y = draw.GetTextSize(text)
        if engine.IsGameUIVisible(true) then
        else
            draw.Text(width_center - math.floor(txt_x / 2), math.floor(height_center * 1.1), text)
        end
    end
)

-- mult_dmg : damage bonus / penalty (modifier)

local menuLoaded, MenuLib = pcall(require, "Menu") -- Load MenuLib
assert(menuLoaded, "MenuLib not found, please install it!") -- If not found, throw error
assert(MenuLib.Version >= 1.44, "MenuLib version is too old, please update it!") -- If version is too old, throw error

local m1 = {
    materials.Create(
        "AC_Fresnel",
        [["VertexLitGeneric"
{
$basetexture "vgui/white_additive"
$bumpmap "models/player/shared/shared_normal"
$envmap "skybox/sky_dustbowl_01"
$envmapfresnel "1"
$phong "1"
$phongfresnelranges "[0 1 1]"
$selfillum "1"
$selfillumfresnel "1"
$basemapalphaphongmask "1"
$selfillumfresnelminmaxexp "[0 0 0]"
$selfillumtint "[0 0 0]"
$envmaptint "[0.5 1 0]"
$additive "0"
$cloakPassEnabled "1"
$scrollanglevar "0"
}
]]
    ),
    materials.Create(
        "AC_Shaded",
        [["VertexLitGeneric"
{
$basetexture "vgui/white_additive"
$bumpmap "vgui/white_additive"
$selfillum "1"
$selfillumfresnel "1"
$selfillumfresnelminmaxexp "[-0.25 1 1]"
$additive "0"
$color "[1 1 1]"

"proxies"
{
   "sine"
   {
      sineperiod "0.8"
      sinemin "0"
      sinemax "0.8"
      resultvar "$color"
   }
}
}
]]
    ),
    materials.Create(
        "AC_Brick",
        [["VertexLitGeneric"
{
$basetexture "brick/brickwall031b"
$additive "1"
$phong "1"
$phongfresnelranges "[0 0.5 10]"
$envmap "cubemaps/cubemap_sheen001"
$envmapfresnel "1"
$selfillum "1"
$rimlight "1"
$rimlightboost "100"
$envmapfresnelminmaxexp "[0 1 2]"
$color2 "[1 1 1]"
$scrollanglevar "0"

"proxies"
{
   "sine"
   {
      resultvar "$scrollanglevar"
      sineperiod "50000"
      sinemin "0"
      sinemax "360"
   }
   "texturescroll"
   {
      texturescrollvar "$basetexturetransform"
      texturescrollrate "0.4"
      texturescrollangle "$scrollanglevar"
   }
}
}
]]
    ),
    materials.Create(
        "AC_Shiny",
        [["VertexLitGeneric"
{
$basetexture "vgui/white_additive"
$bumpmap "vgui/white_additive"
$envmap "cubemaps/cubemap_sheen001"
$selfillum "1"
$selfillumfresnel "1"
$selfillumfresnelminmaxexp "[-0.25 1 1]"
$additive "0"
$color2 "[1 1 1]"

}
]]
    ),
    materials.Create(
        "AC_Wireframe",
        [["VertexLitGeneric"
{
$basetexture "sprites/light_glow04"
$nodecal "1"
$model "1"
$additive "1"
$nocull "1"
$wireframe "1"
$envmaptint "[0.5 1 0]"

"proxies"
{
   "texturescroll"
   {
      texturescrollvar "$basetexturetransform"
      texturescrollrate "0.4"
      texturescrollangle "90"
   }
}
}
]]
    ),
    materials.Create(
        "AC_SUS",
        [["VertexLitGeneric"
{
$basetexture "brick/brickwall031b"
$bumpmap "models/player/shared/shared_normal"
$envmap "skybox/sky_dustbowl_01"
$envmapfresnel "1"
$phong "1"
$phongfresnelranges "[0 1 1]"
$selfillum "1"
$selfillumfresnel "1"
$basemapalphaphongmask "1"
$selfillumfresnelminmaxexp "[0 0 0]"
$selfillumtint "[0 0 0]"
$envmaptint "[0.5 1 0]"
$additive "0"

"proxies"
{
   "texturescroll"
   {
      "texturescrollvar" $basetexturetransform
      "texturescrollrate" 1
      "texturescrollangle" 120
   }
}
}
]]
    ),
    materials.Create(
        "AC_Pulse",
        [["VertexLitGeneric"
{
$basetexture "patterns/workshop/smissmas_2020/2265040710/2265040710_serenity"
$bumpmap "models/player/shared/shared_normal"
$envmap "skybox/sky_dustbowl_01"
$envmapfresnel "1"
$phong "1"
$phongfresnelranges "[0 1 1]"
$selfillum "1"
$selfillumfresnel "1"
$basemapalphaphongmask "1"
$selfillumfresnelminmaxexp "[0 0 0]"
$selfillumtint "[0 0 0]"
$envmaptint "[0.5 1 0]"
$additive "0"
$cloakPassEnabled "1"
$scrollanglevar "0"

"proxies"
{
   "sine"
   {
      resultvar "$scrollanglevar"
      sineperiod "600000"
      sinemin "0"
      sinemax "360"
   }
   "texturescroll"
   {
      texturescrollvar "$basetexturetransform"
      texturescrollrate "1"
      texturescrollangle "$scrollanglevar"
   }
}
}
]]
    ),
    materials.Create(
        "AC_Electric",
        [["VertexLitGeneric"
{
$basetexture "patterns/workshop/screamfortress_2018/1326382486/1326382486_electro_skulls_blu"
$bumpmap "models/player/shared/shared_normal"
$envmap "skybox/sky_dustbowl_01"
$envmapfresnel "1"
$phong "1"
$phongfresnelranges "[0 1 1]"
$selfillum "1"
$selfillumfresnel "1"
$basemapalphaphongmask "1"
$selfillumfresnelminmaxexp "[0 0 0]"
$selfillumtint "[0 0 0]"
$envmaptint "[0.5 1 0]"
$additive "0"
$cloakPassEnabled "1"
$scrollanglevar "0"

"proxies"
{
   "sine"
   {
      resultvar "$scrollanglevar"
      sineperiod "600000"
      sinemin "0"
      sinemax "360"
   }
   "texturescroll"
   {
      texturescrollvar "$basetexturetransform"
      texturescrollrate "0.5"
      texturescrollangle "$scrollanglevar"
   }
}
}
]]
    ),
    materials.Create(
        "AC_Serenity",
        [["VertexLitGeneric"
{
$basetexture "patterns/workshop/smissmas_2020/2265040710/2265040710_starlight2"
$bumpmap "models/player/shared/shared_normal"
$envmap "skybox/sky_dustbowl_01"
$envmapfresnel "1"
$phong "1"
$phongfresnelranges "[0 1 1]"
$selfillum "1"
$selfillumfresnel "1"
$basemapalphaphongmask "1"
$selfillumfresnelminmaxexp "[0 0 0]"
$selfillumtint "[0 0 0]"
$envmaptint "[0.5 1 0]"
$additive "0"
$cloakPassEnabled "1"
$scrollanglevar "0"

"proxies"
{
   "sine"
   {
      resultvar "$scrollanglevar"
      sineperiod "600000"
      sinemin "0"
      sinemax "360"
   }
   "texturescroll"
   {
      texturescrollvar "$basetexturetransform"
      texturescrollrate "0.5"
      texturescrollangle "$scrollanglevar"
   }
}
}
]]
    )
}

local Material1 = {
    "Fresnel",
    "Shaded",
    "Brick",
    "Shiny",
    "Wireframe",
    "SUS",
    "Pulse",
    "Pulse2",
    "Stars"
}
local Material2 = {
    "Fresnel",
    "Shaded",
    "Brick",
    "Shiny",
    "Wireframe",
    "SUS",
    "Pulse",
    "Pulse2",
    "Stars"
}
local Material3 = {
    "Fresnel",
    "Shaded",
    "Brick",
    "Shiny",
    "Wireframe",
    "SUS",
    "Pulse",
    "Pulse2",
    "Stars"
}

local menu = MenuLib.Create("Project IRIS Chams", MenuFlags.AutoSize)
menu.Style.TitleBg = {205, 95, 50, 255} -- Title Background Color (Flame Pea)
menu.Style.Outline = true

local Enemy = menu:AddComponent(MenuLib.Checkbox("Enable For Enemy", false))
local Mat1 = menu:AddComponent(MenuLib.Combo("Enemy Material", Material1, ItemFlags.FullWidth))
local Red1 = menu:AddComponent(MenuLib.Slider("Red", 1, 255, 1))
local Green1 = menu:AddComponent(MenuLib.Slider("Green", 1, 255, 1))
local Blue1 = menu:AddComponent(MenuLib.Slider("Blue", 1, 255, 1))
local Alpha1 = menu:AddComponent(MenuLib.Checkbox("Alpha", false))
local Extra1 = menu:AddComponent(MenuLib.Checkbox("Extra", false))
local Wire1 = menu:AddComponent(MenuLib.Checkbox("wire", false))
local Hands = menu:AddComponent(MenuLib.Checkbox("Enable Hands", false))
local Mat2 = menu:AddComponent(MenuLib.Combo("Hands Material", Material2, ItemFlags.FullWidth))
local Red2 = menu:AddComponent(MenuLib.Slider("Red", 1, 255, 1))
local Green2 = menu:AddComponent(MenuLib.Slider("Green", 1, 255, 1))
local Blue2 = menu:AddComponent(MenuLib.Slider("Blue", 1, 255, 1))
local Alpha2 = menu:AddComponent(MenuLib.Checkbox("Alpha", false))
local Extra2 = menu:AddComponent(MenuLib.Checkbox("Extra", false))
local Wire2 = menu:AddComponent(MenuLib.Checkbox("wire", false))
local LWeapon = menu:AddComponent(MenuLib.Checkbox("Enable Local Weapon", false))
local Mat3 = menu:AddComponent(MenuLib.Combo("Weapon Material", Material3, ItemFlags.FullWidth))
local Red3 = menu:AddComponent(MenuLib.Slider("Red", 1, 255, 1))
local Green3 = menu:AddComponent(MenuLib.Slider("Green", 1, 255, 1))
local Blue3 = menu:AddComponent(MenuLib.Slider("Blue", 1, 255, 1))
local Alpha3 = menu:AddComponent(MenuLib.Checkbox("Alpha", false))
local Extra3 = menu:AddComponent(MenuLib.Checkbox("Extra", false))
local Wire3 = menu:AddComponent(MenuLib.Checkbox("wire", false))

local TempOptions = {} -- Temp options

local function ResetTempOptions() -- Reset "TempOptions"
    for k, v in pairs(TempOptions) do -- Loop through all options in "TempOptions"
        TempOptions[k].WasUsed = false -- Set "WasUsed" to false for each option (so we can check if it was used)
    end
end

local function SetOptionTemp(option, value) -- Runs "SetOptionTemp" with the given cheat and setting
    local guiValue = gui.GetValue(option) -- Set "guiValue" to the current setting of the given cheat
    if guiValue ~= value then -- Check if "guiValue" is different from the "SetOptionTemp"'s setting
        gui.SetValue(option, value) -- Set the cheat to the given setting
        TempOptions[option] = {
            -- Create a new entry in "TempOptions" for the given cheat
            Value = guiValue, -- Set the entry's value to the current setting of the cheat
            WasUsed = true
        } -- Set the entry's "WasUsed" to true
    end

    if TempOptions[option] ~= nil then -- For each option in "TempOptions" (as long as one exists),
        TempOptions[option].WasUsed = true -- Set the entry's "WasUsed" to true
    end
end

local function CheckTempOptions() -- When CheckTempOptions is called,
    for k, v in pairs(TempOptions) do -- Loop through all options in "TempOptions"
        if not v.WasUsed then -- Check if the entry's "WasUsed" is false.
            gui.SetValue(k, v.Value) -- Set the cheat to the entry's value (the value it was set to before) and
            TempOptions[k] = nil -- Remove the entry from "TempOptions" (so it doesn't get checked again)
        end
    end
end

--MAIN CODE

local function onDrawModel(drawModelContext)
    local entity = drawModelContext:GetEntity()
    local model = drawModelContext:GetModelName()

    local me = entities.GetLocalPlayer()

    local RED1 = Red1:GetValue() / 255
    local GREEN1 = Green1:GetValue() / 255
    local BLUE1 = Blue1:GetValue() / 255

    local RED2 = Red2:GetValue() / 255
    local GREEN2 = Green2:GetValue() / 255
    local BLUE2 = Blue2:GetValue() / 255

    local RED3 = Red3:GetValue() / 255
    local GREEN3 = Green3:GetValue() / 255
    local BLUE3 = Blue3:GetValue() / 255
    --and entity:GetClass() == "CTFPlayer"

    if entity and entity:IsValid() then
        if Enemy:GetValue() then
            if
                entity:GetClass() == "CTFWearable" or entity:GetClass() == "CTFPlayer" or
                    (entity:IsWeapon() and entity:GetPropEntity("m_hOwner"))
             then
                if (entity:GetTeamNumber() ~= me:GetTeamNumber()) then
                    local chams = m1[Mat1:GetSelectedIndex()]
                    drawModelContext:ForcedMaterialOverride(chams)
                    chams:SetShaderParam("$envmaptint", Vector3(RED1, GREEN1, BLUE1, a))
                    chams:SetShaderParam("$color2", Vector3(RED1, GREEN1, BLUE1, a))
                    chams:SetMaterialVarFlag(MATERIAL_VAR_ADDITIVE, Alpha1:GetValue())
                    chams:SetMaterialVarFlag(MATERIAL_VAR_WIREFRAME, Wire1:GetValue())
                    if Extra1:GetValue() then
                        drawModelContext:DrawExtraPass()
                    end
                end
            end
        end
    end
    --end
    if (entity and entity:IsValid()) then
        if Hands:GetValue() then
            if entity:GetClass() == "CTFViewModel" then
                local chams1 = m1[Mat2:GetSelectedIndex()]
                drawModelContext:ForcedMaterialOverride(chams1)
                chams1:SetShaderParam("$envmaptint", Vector3(RED2, GREEN2, BLUE2))
                chams1:SetShaderParam("$color2", Vector3(RED2, GREEN2, BLUE2))
                chams1:SetMaterialVarFlag(MATERIAL_VAR_ADDITIVE, Alpha2:GetValue())
                chams1:SetMaterialVarFlag(MATERIAL_VAR_WIREFRAME, Wire2:GetValue())
                if Extra2:GetValue() then
                    drawModelContext:DrawExtraPass()
                end
            end
        end
    end

    --[[if not entity or entity:IsValid() ~= true then
if LWeapon:GetValue() then
if string.find( model, 'c_models' ) then
   local chams2 = m1[Mat3:GetSelectedIndex()]
   drawModelContext:ForcedMaterialOverride ( chams2 )
   chams2:SetShaderParam( "$envmaptint", Vector3(RED3, GREEN3, BLUE3) )
   chams2:SetShaderParam( "$color2", Vector3(RED3, GREEN3, BLUE3) )
   chams2:SetMaterialVarFlag(MATERIAL_VAR_ADDITIVE, Alpha3:GetValue())
end
end
end]]
    local me = entities.GetLocalPlayer()
    local entity = drawModelContext:GetEntity()
    if LWeapon:GetValue() then
        --if model:find( 'c_models', 1, true )  then
        if not me and not me:IsValid() then
            return
        end
        if not entity or entity:IsValid() ~= true then
            local model_name = drawModelContext:GetModelName()
            local chams2 = m1[Mat3:GetSelectedIndex()]
            -- print( model_name )
            if string.find(drawModelContext:GetModelName(), "c_models") then
                drawModelContext:ForcedMaterialOverride(chams2)
                chams2:SetShaderParam("$envmaptint", Vector3(RED3, GREEN3, BLUE3))
                chams2:SetShaderParam("$color2", Vector3(RED3, GREEN3, BLUE3))
                chams2:SetMaterialVarFlag(MATERIAL_VAR_ADDITIVE, Alpha3:GetValue())
                chams2:SetMaterialVarFlag(MATERIAL_VAR_WIREFRAME, Wire3:GetValue())
                if Extra3:GetValue() then
                    drawModelContext:DrawExtraPass()
                end
            end
        --return
        end
    end
end --[[     Misc Tools for Lmaobox     ]] --[[                                ]] --[[          --Authors--           ]] --[[     LNX (github.com/lnx00)     ]] --[[         SylveonBottle          ]] --[[                                ]]
--
--
--
--
--
--
--

--[[                                ]] local menuLoaded, MenuLib = pcall(require, "Menu") -- Load MenuLib
assert(menuLoaded, "MenuLib not found, please install it!") -- If not found, throw error
assert(MenuLib.Version >= 1.44, "MenuLib version is too old, please update it!") -- If version is too old, throw error
--

--[[ Menu Sub-categories ]] local ObserverMode = {
    -- Observer Mode
    None = 0, -- No observer mode
    Deathcam = 1, -- Deathcam
    FreezeCam = 2, -- FreezeCam (Frozen)
    Fixed = 3, -- Fixed Camera (fixed position)
    FirstPerson = 4, -- First Person (Watching your screen)
    ThirdPerson = 5, -- Third Person (Default)
    PointOfInterest = 6, -- Point of Interest Camera
    FreeRoaming = 7 -- Free Roaming Camera
}
local Removals = {
    -- May be removed in the future
    ["RTD Effects"] = false, -- Button to remove RTD effects
    ["HUD Texts"] = false -- Button to remove HUD Texts
}
local Callouts = {
    -- Callouts are not yet fully implemented
    ["Battle Cry Melee"] = false -- C2 when using melee and looking at enemy
    -- ["Medic!"] = false,           -- Call for medic when low on health (or spam it if there is no medic?)
    -- ["Yes"] = false,              -- Say "Yes" if someone nearby says No (lmao)
    -- ["No"] = false,               -- Say "No" at certain responses ("You are a spy", etc)
    -- ["Spy"] = false,              -- Callout Spies
    -- ["Teleporter Here"] = false,  -- If we respawn, but there's no teleporters nearby, request a teleporter
    -- ["Activate Charge"] = false,  -- If the medic ubering us has full charge, replace our "Medic!" callout with this
    -- ["Help!"] = false,            -- If there's no medic on our team, call for help at low health when there's a teammate nearby
    -- ["Positive"] = false,         -- When we do anything to get points (assists, sap buildings, etc)
    -- ["Negative"] = false,         -- idk bad things? enemy caps points, our medic dies, etc
    -- ["Nice Shot"] = false,        -- If a sniper nearby gets a headshot
    -- ["Good Job"] = false,         -- If a someone nearby gets a kill
}
--

--[[ Varibles used for looping ]] local LastExtenFreeze = 0 -- Spectator Mode
local prTimer = 0 -- Timer for Random Ping
local flTimer = 0 -- Timer for Fake Latency
local c2Timer = 0 -- Timer for Battle Cry Melee raytracing
local c2Timer2 = 0 -- Timer for ^ to prevent spamming
local mfTimer = 0 -- Timer for Medic Finder
--

--[[ Menu ]] local menu = MenuLib.Create("Project IRIS Misc Tools", MenuFlags.AutoSize)
menu.Style.TitleBg = {205, 95, 50, 255} -- Title Background Color (Flame Pea)
menu.Style.Outline = true -- Outline around the menu

local mCallouts = menu:AddComponent(MenuLib.MultiCombo("Auto Voicemenu WIP", Callouts, ItemFlags.FullWidth)) -- Callouts
local mLegJitter = menu:AddComponent(MenuLib.Checkbox("Leg Jitter", false)) -- Leg Jitter
local mFastStop = menu:AddComponent(MenuLib.Checkbox("FastStop (Debug!)", false)) -- FastStop (Doesn't work yet)
local mWFlip = menu:AddComponent(MenuLib.Checkbox("Auto Weapon Flip", false)) -- Auto Weapon Flip (Doesn't work yet)
local mRocketLines = menu:AddComponent(MenuLib.Checkbox("Rocket Lines", false)) -- Rocket Lines
menu:AddComponent(
    MenuLib.Button(
        "Disable Weapon Sway",
        function()
            -- Disable Weapon Sway (Executes commands)
            client.SetConVar("cl_wpn_sway_interp", 0) -- Set cl_wpn_sway_interp to 0
            client.SetConVar("cl_jiggle_bone_framerate_cutoff", 0) -- Set cl_jiggle_bone_framerate_cutoff to 0
            client.SetConVar("cl_bobcycle", 10000) -- Set cl_bobcycle to 10000
        end,
        ItemFlags.FullWidth
    )
)
local mRetryStunned = menu:AddComponent(MenuLib.Checkbox("Retry When Stunned", false)) -- Retry When Stunned
local mRetryLowHP = menu:AddComponent(MenuLib.Checkbox("Retry When Low HP", false)) -- Retry When Low HP
local mRetryLowHPValue = menu:AddComponent(MenuLib.Slider("Retry HP", 1, 299, 30)) -- Retry When Low HP Value
local mLegitSpec = menu:AddComponent(MenuLib.Checkbox("Legit when Spectated", false)) -- Legit when Spectated
local mLegitSpecFP = menu:AddComponent(MenuLib.Checkbox("^Firstperson Only", false)) -- Legit when Spectated (Firstperson Only Toggle)
local mAutoMelee = menu:AddComponent(MenuLib.Checkbox("Auto Melee Switch", false)) -- Auto Melee Switch
local mMeleeDist = menu:AddComponent(MenuLib.Slider("Melee Switch Distance", 100, 700, 200)) -- Auto Melee Switch Distance
local mAutoFL = menu:AddComponent(MenuLib.Checkbox("Auto Fake Latency", false)) -- Auto Fake Latency
local mAutoFLDist = menu:AddComponent(MenuLib.Slider("AFL Activation Distance", 100, 700, 530)) -- Auto Fake Latency Distance (530 is based on two players walking towards each other)
local mAutoFLFar = menu:AddComponent(MenuLib.Slider("AFL Far Value", 0, 1000, 0)) -- What value to use when not in range (to keep ping consistant and not jumping around)
local mAutoFLNear = menu:AddComponent(MenuLib.Slider("AFL Close Value", 0, 1000, 300)) -- Auto Fake Latency Near Value
local mRandPing = menu:AddComponent(MenuLib.Checkbox("Random Ping", false)) -- Random Ping
local mRandPingValue = menu:AddComponent(MenuLib.Slider("Ping Randomness", 1, 15, 8)) -- Random Ping Value
local mRandLag = menu:AddComponent(MenuLib.Checkbox("Random Fakelag", false)) -- Random Fakelag
local mRandLagValue = menu:AddComponent(MenuLib.Slider("Fakelag Randomness", 1, 200, 21)) -- Random Fakelag Value
local mRandLagMin = menu:AddComponent(MenuLib.Slider("Fakelag Min", 1, 314, 120)) -- Random Fakelag Minimum Value
local mRandLagMax = menu:AddComponent(MenuLib.Slider("Fakelag Max", 2, 315, 315)) -- Random Fakelag Maximum Value
local mChatNL = menu:AddComponent(MenuLib.Checkbox("Allow \\n in chat", false)) -- Allow \\n in chat
local mExtendFreeze = menu:AddComponent(MenuLib.Checkbox("Infinite Respawn Timer", false)) -- Infinite Respawn Timer
local mMedicFinder = menu:AddComponent(MenuLib.Checkbox("Medic Finder", false)) -- Medic Finder
-- local mUberWarning      = menu:AddComponent(MenuLib.Checkbox("Uber Warning",     false))                          -- Medic Uber Warning (currently no way to check)
-- local mRageSpecKill     = menu:AddComponent(MenuLib.Checkbox("Rage Spectator Killbind", false))                         -- fuck you "pizza pasta", stop spectating me
local mRemovals = menu:AddComponent(MenuLib.MultiCombo("Removals", Removals, ItemFlags.FullWidth)) -- Remove RTD and HUD Texts
--

--[[ Options management ]] local TempOptions = {} -- Temp options

local function ResetTempOptions() -- Reset "TempOptions"
    for k, v in pairs(TempOptions) do -- Loop through all options in "TempOptions"
        TempOptions[k].WasUsed = false -- Set "WasUsed" to false for each option (so we can check if it was used)
    end
end

local function SetOptionTemp(option, value) -- Runs "SetOptionTemp" with the given cheat and setting
    local guiValue = gui.GetValue(option) -- Set "guiValue" to the current setting of the given cheat
    if guiValue ~= value then -- Check if "guiValue" is different from the "SetOptionTemp"'s setting
        gui.SetValue(option, value) -- Set the cheat to the given setting
        TempOptions[option] = {
            -- Create a new entry in "TempOptions" for the given cheat
            Value = guiValue, -- Set the entry's value to the current setting of the cheat
            WasUsed = true
        } -- Set the entry's "WasUsed" to true
    end

    if TempOptions[option] ~= nil then -- For each option in "TempOptions" (as long as one exists),
        TempOptions[option].WasUsed = true -- Set the entry's "WasUsed" to true
    end
end

local function CheckTempOptions() -- When CheckTempOptions is called,
    for k, v in pairs(TempOptions) do -- Loop through all options in "TempOptions"
        if not v.WasUsed then -- Check if the entry's "WasUsed" is false.
            gui.SetValue(k, v.Value) -- Set the cheat to the entry's value (the value it was set to before) and
            TempOptions[k] = nil -- Remove the entry from "TempOptions" (so it doesn't get checked again)
        end
    end
end
--

--[[ Code needed to run 66 times a second ]] local function OnCreateMove(pCmd) -- Everything within this function will run 66 times a second
    ResetTempOptions() -- Immediately reset "TempOptions"
    local pLocal = entities.GetLocalPlayer() -- Immediately set "pLocal" to the local player (entities.GetLocalPlayer)
    if not pLocal then
        return
    end -- Immediately check if the local player exists. If it doesn't, return.
    local vVelocity = pLocal:EstimateAbsVelocity() -- Immediately set "vVelocity" to the local player's absolute velocity (this is used for any code that needs to know the local player's velocity)
    local cmdButtons = pCmd:GetButtons() -- Immediately set "cmdButtons" to the local player's buttons (this is used for any code that needs to know what buttons we are pressing)
    -- (Messes with certain idle animations. See scout with mad milk / spycrab for a good example)

    --[[ Leg Jitter ]] if mLegJitter:GetValue() == true then -- If Leg Jitter is enabled,
        if
            (pCmd.forwardmove == 0) and (pCmd.sidemove == 0) and -- Check if we are pressing WASD
                (vVelocity:Length2D() < 10)
         then -- Check if we not currently moving
            if pCmd.command_number % 2 == 0 then -- Check if the command number is even. (Potentially inconsistent, but it works).
                pCmd:SetSideMove(9) -- Cycle between moving left and right
            else
                pCmd:SetSideMove(-9)
            end
        end
    end
    -- (Tries to immediately stop the player's momentum when letting go of WASD)

    --[[ Fast Stop ]] if mFastStop:GetValue() == true then -- If Fast Stop is enabled
        if
            (pLocal:IsAlive()) and (pCmd.forwardmove == 0) and -- Check if we are alive and not moving
                (pCmd.sidemove == 0) and
                (vVelocity:Length2D() > 10)
         then -- Check if our velocity is greater than 10hu
            local fsx, fsy, fsz = vVelocity:Unpack() -- Set "fsx", "fsy" and "fsz" to the local player's absolute x, y and z velocity
            print(fsx, fsy, fsz) -- Print the local player's x, y and z velocity (for debugging)
            if (fsz < 0.01) then -- Check if the local player's z velocity is less than 0.01 (if they are not jumping or falling).
                pCmd:SetForwardMove(fsx) -- Set the forwardmove to the local player's absolute x velocity (needs to be translated to the local player's view)
                pCmd:SetSideMove(fsy) -- Set the sidemove to the local player's absolute y velocity (needs to be translated to the local player's view)
                print("Success! X:" .. fsx .. " Y:" .. fsy .. " Z:" .. fsz) -- Print the local player's absolute x, y and z velocity (for debugging)
            end
        end
    end
    -- (Rconnects when your hp is below "mRetryHP" (set in the menu) in order to prevent being killed))

    --[[ Retry when low hp ]] if mRetryLowHP:GetValue() == true then -- If Retry when low hp is enabled
        if
            (pLocal:IsAlive()) and
                (pLocal:GetHealth() > 0 and -- Check if we are alive and have health
                    (pLocal:GetHealth()) <= mRetryLowHPValue:GetValue())
         then -- Check if our health is less than "mRetryLowHPValue" (set in the menu)
            client.Command("retry", true) -- Reconnect to the server
        end
    end
    -- (Increases the respawn timer for yourself, allowing you to infinitely be stuck respawning)

    --[[ Infinite Respawn Timer ]] if mExtendFreeze:GetValue() == true then -- If Infinite Respawn Timer is enabled
        if (pLocal:IsAlive() == false) and (globals.RealTime() > (LastExtenFreeze + 2)) then -- Check if the player is dead and if it has been more than 2 seconds since the last extendfreeze executed.
            client.Command("extendfreeze", true) -- Extend the respawn timer
            LastExtenFreeze = globals.RealTime() -- Set LastExtenFreeze to the current time
        end
    end
    -- (Randomizes FakeLag's value. This can break some cheat's projectile aimbot)

    --[[ Random Fakelag ]] if mRandLag:GetValue() == true then -- If Random Fakelag is enabled
        flTimer = flTimer + 1 -- Increment the fakelag timer
        if (flTimer >= mRandLagValue:GetValue()) then -- Check if the fakelag timer is greater than "mRandLagValue" (set in the menu)
            flTimer = 0 -- Reset the fakelag timer
            local randValue = math.random(mRandLagMin:GetValue(), mRandLagMax:GetValue()) -- Set "randValue" to a random number between "mRandLagMin" and "mRandLagMax" (set in the menu)
            gui.SetValue("fake lag value", randValue) -- Set the fakelag value to "randValue"
        -- gui.SetValue("fake lag value", math.random(mRandLagMin:GetValue(), mRandLagMax:GetValue())) -- Untested, but should work.
        end
    end
    -- (Randomly enables Ping Reducer, preventing you from having a steady ping of 341 ping that never increases/descreases (suspicious))

    --[[ Random Ping ]] if mRandPing:GetValue() == true then -- If Random Ping is enabled
        prTimer = prTimer + 1 -- Increment the ping timer
        if (prTimer >= mRandPingValue:GetValue() * 66) then -- Check if the ping timer is greater than "mRandPingValue" (set in the menu).
            prTimer = 0 -- Reset the ping timer
            local prActive = gui.GetValue("ping reducer") -- Set "prActive" to the current value of ping reducer
            -- if (gui.GetValue("ping reducer") == 0) then   -- Untested. This might work better.
            if (prActive == 0) then -- Check if ping reducer is currently disabled
                gui.SetValue("ping reducer", 1) -- If it is disabled, enable it
            elseif (prActive == 1) then -- Check if ping reducer is currently enabled
                gui.SetValue("ping reducer", 0) -- If it is enabled, disable it
            end
        end
    end
    -- (Stops certain RTD effects. May be removed in the future)

    --[[ Anti RTD ]] if mRemovals:IsSelected("RTD Effects") then -- If RTD Effects is selected
        if CurrentRTD == "Cursed" then -- If the current RTD effect is "Cursed"
            pCmd:SetForwardMove(pCmd:GetForwardMove() * (-1)) -- Reverse the local player's W and S movement
            pCmd:SetSideMove(pCmd:GetSideMove() * (-1)) -- Reverse the local player's A and D movement
        elseif CurrentRTD == "Drugged" or CurrentRTD == "Bad Sauce" then -- If the current RTD effect is "Drugged" or "Bad Sauce"
        --SetOptionTemp("norecoil", 1)                                -- Activate NoRecoil (bannable in community servers)
        end
    end
    --

    --[[ Features that require access to the weapon ]] local pWeapon = pLocal:GetPropEntity("m_hActiveWeapon") -- Set "pWeapon" to the local player's active weapon
    local pWeaponDefIndex = pWeapon:GetPropInt("m_iItemDefinitionIndex") -- Set "pWeaponDefIndex" to the "pWeapon"'s item definition index
    local pWeaponDef = itemschema.GetItemDefinitionByID(pWeaponDefIndex) -- Set "pWeaponDef" to the local "pWeapon"'s item definition
    local pWeaponName = pWeaponDef:GetName() -- Set "pWeaponName" to the local "pWeapon"'s actual name
    if not pWeapon then
        return
    end -- If "pWeapon" is not set, break
    if (pWeapon == "CTFRocketLauncher") or (pWeaon == "CTFCannon") then -- If the local player's active weapon is a projectile weapon (this doesn't work for some reason????)
        pUsingProjectileWeapon = true -- Set "pUsingProjectileWeapon" to true
    else
        pUsingProjectileWeapon = false
    end -- Set "pUsingProjectileWeapon" to false
    -- (Automatically flips your rocket launcher to the left if it would travel farther)

    -- It turns out that LMAOBOX is not compatible with the client convar "cl_flipviewmodels". The client convar works in other cheats (such as Fedoraware) but not in LMAOBOX.
    -- The view models DO flip, however it's only visual. The rocket still fires out of the right side of the player..
    -- In Fedoraware, the rocket fires out of the left side of the player when the cl_viewmodels is set to 1.
    -- So this does not work in LMAOBOX.
    -- However, I am leaving this code here in case someone wants to see how it would have worked.
    -- I also don't want to ask for lbox to fix this in the telegram, because the last time I did that I got banned for 2 months.
    --[[ Auto weapon flip ]] if (mWFlip:GetValue() == true) then -- If Auto weapon flip is enabled
        if pUsingProjectileWeapon == true then -- If the local player is using a projectile weapon
            local source = pLocal:GetAbsOrigin() + pLocal:GetPropVector("localdata", "m_vecViewOffset[0]") -- Set "source" to the local player's view offset
            local destination = source + engine.GetViewAngles():Forward() * 1000 -- Find where the player is aiming
            local trace = engine.TraceLine(source, destination, MASK_SHOT_HULL) -- Trace a line from the player's view offset to where they are aiming (for debugging)
            local sourceRight = source + engine.GetViewAngles():Right() * 10 -- Right of the player
            local traceRight = engine.TraceLine(sourceRight, destination, MASK_SHOT_HULL) -- Trace a line from the right of the player to where they are aiming
            local sourceLeft = source + engine.GetViewAngles():Right() * -10 -- Left of the player
            local traceLeft = engine.TraceLine(sourceLeft, destination, MASK_SHOT_HULL) -- Trace a line from the left of the player to where they are aiming
            if (math.floor(traceLeft.fraction * 1000)) > (math.floor(traceRight.fraction * 1000)) then -- If the left trace is closer than the right trace
                client.SetConVar("cl_flipviewmodels", 1) -- Set the client convar to flip the viewmodels
            elseif (math.floor(traceLeft.fraction * 1000)) < (math.floor(traceRight.fraction * 1000)) then -- If the right trace is closer than the left trace
                client.SetConVar("cl_flipviewmodels", 0) -- Revert the client convar to not flip the viewmodels
            end
        end
    end

    --[[ Features that need to iterate through all players ]]
    local players = entities.FindByClass("CTFPlayer") -- Create a table of all players in the game
    for k, vPlayer in pairs(players) do -- For each player in the game
        if vPlayer:IsValid() == false then
            goto continue
        end -- Check if each player is valid
        local vWeapon = vPlayer:GetPropEntity("m_hActiveWeapon") -- Set "vWeapon" to the player's active weapon
        if vWeapon ~= nil then -- If "vWeapon" is not nil
            local vWeaponDefIndex = vWeapon:GetPropInt("m_iItemDefinitionIndex") -- Set "vWeaponDefIndex" to the "vWeapon"'s item definition index
        --local vWeaponDef      = itemschema.GetItemDefinitionByID(vWeaponDefIndex)  -- Set "vWeaponDef" to the local "vWeapon"'s item definition (doesn't work for some reason)
        --local vWeaponName     = vWeaponDef:GetName()                               -- Set "vWeaponName" to the local "vWeapon"'s actual name (doesn't work for some reason)
        end

        local sneakyboy = false -- Create a new variable for if we're invisible or not, set it to false
        if pLocal:InCond(4) or pLocal:InCond(2) or pLocal:InCond(13) or pLocal:InCond(9) then -- If we are in a condition that makes us invisible
            sneakyboy = true -- Set "sneakyboy" to true
        end
        -- (To prevent spectating players from seeing us acting suspiciously)

        --[[ Legit on spectated players ]] if mLegitSpec:GetValue() == true then -- If Smooth on spectated players is enabled
            local obsMode = pLocal:GetPropInt("m_iObserverMode") -- Set "obsMode" to the player's observer mode
            local obsTarget = pLocal:GetPropEntity("m_hObserverTarget") -- Set "obsTarget" to the player's observer target
            if obsMode and obsTarget then -- If "obsMode" and "obsTarget" are set
                if (obsMode == ObserverMode.ThirdPerson) and (mLegitSpecFP:GetValue() == true) then -- If the player is spectating in third person and Firstperson Only Toggle is enabled
                    return -- Stop the code from running
                elseif (obsTarget:GetIndex() == pLocal:GetIndex()) then -- If the observer's spectate target is the local player
                    if (pUsingProjectileWeapon == true) and (gui.GetValue("aim method") == "silent") then -- if we're using a projectile weapon, and aim method is set to silent, setOptionTemp aim fov to 10
                        SetOptionTemp("aim fov", 10)
                    else
                        SetOptionTemp("aim method", "assistance") -- Otherwise, if we're not using a projectile weapon, set aim method to assistance
                    end
                    if (gui.GetValue("auto backstab") ~= "off") then
                        SetOptionTemp("auto backstab", "legit") -- If autobackstab is enabled, set it to legit
                    end
                    if (gui.GetValue("auto sapper") ~= "off") then
                        SetOptionTemp("auto sapper", "legit") -- If autosapper is enabled, set it to legit
                    end
                    if (gui.GetValue("melee aimbot") ~= "off") then -- If melee aimbot is enabled, set it to legit
                        SetOptionTemp("melee aimbot", "legit")
                    end
                    if (gui.GetValue("auto detonate sticky") ~= "off") then -- If autodetonate sticky is enabled, set it to legit
                        SetOptionTemp("auto detonate sticky", "legit")
                    end
                    if (gui.GetValue("auto airblast") ~= "off") then -- If auto airblast is enabled, set it to legit
                        SetOptionTemp("auto airblast", "legit")
                    end
                -- if (gui.GetValue("sniper: shoot through teammates") ~= "off") then            -- I don't know the correct name for this
                --     SetOptionTemp("sniper: shoot through teammates", "off")
                -- end
                -- if (gui.GetValue("fake latency") ~= "0") then                                 -- for some reason this doesn't work
                --     SetOptionTemp("fake latency", "0")
                -- end
                -- if (gui.GetValue("fake lag") ~= "0") then
                --     SetOptionTemp("fake lag", "0")
                -- end
                -- if (gui.GetValue("ping reducer") ~= "0") then
                --     SetOptionTemp("ping reducer", "0")
                -- end
                end
            end
        end -- if mRageSpecKill:GetValue() == true then                           -- If Spectator Killbind is enabled --     local obsRTarget = pLocal:GetPropEntity("m_hObserverTarget")   -- Set "obsRTarget" to the player's observer target
        -- (I hate it when a random spy on my team decides to alway spectate me when I'm dead. I just to play the damn game, stop being suspicious of me.)

        --[[ Spectator Killbind (Rage) ]] --     if obsRMode and obsRTarget then                                -- If "obsRMode" and "obsRTarget" are set
        --         if (obsRTarget:GetIndex() == ??????                        -- if target has priority >= 1. gui.getpriority() doesn't exist yet :(
        --                 client.command("explode", true)                    -- kill ourselves. explode so they can't see our cosmetics, because fuck whoever this guy is.
        --         end
        --     end
        -- end

        if vPlayer:IsAlive() == false then
            goto continue
        end
        if vPlayer:GetIndex() == pLocal:GetIndex() then
            goto continue
        end -- Code below this line doesn't work if you're the only player in the game.

        local distVector = vPlayer:GetAbsOrigin() - pLocal:GetAbsOrigin() -- Set "distVector" to the distance between us and the player we are iterating through
        local distance = distVector:Length() -- Set "distance" to the length of "distVector"
        if pLocal:IsAlive() == false then
            goto continue
        end -- If we are not alive, skip the rest of this code

        if vPlayer:GetTeamNumber() == pLocal:GetTeamNumber() then
            goto continue
        end -- If we are on the same team as the player we are iterating through, skip the rest of this code
        -- (To prevent us from getting tauntkilled)

        --[[ Retry when stunned ]] if (mRetryStunned:GetValue() == true) then -- If Retry when stunned is enabled
            if (pLocal:InCond(15)) then -- If we are stunned (15 is TF_COND_STUNNED)
                client.command("retry", true) -- Reconnect to the server
            elseif
                (pLocal:InCond(7)) and (distance <= 200) and -- If we are laughing (7 is TF_COND_TAUNTING), and we're within 200hu of the player we are iterating through
                    (vWeaponName == "The Holiday Punch")
             then -- and the enemy is using The Holiday Punch (untested)
                client.command("retry", true) -- Reconnect to the server
            end
        end
        -- (Automatically switches to slot3 when an enemy is in range)

        -- local disguisedboy = false
        -- if pLocal:InCond(47) or pLocal:InCond(3)
        --                     or pLocal:InCond(2) then
        --     disguisedboy = true
        -- end

        --[[ Auto Melee Switch ]] if
            (mAutoMelee:GetValue() == true) and (distance <= mMeleeDist:GetValue()) and -- If Auto Melee is enabled, and we are within the melee distance
                (pWeapon:IsMeleeWeapon() == false) and -- and we are not using a melee weapon
                (sneakyboy == false)
         then -- and we are not invisible
            client.ChatPrintf(distance) -- Print the distance to the console (for debugging)
            client.Command("slot3", true) -- Execute the "slot3" command (We don't have access to pCmd.weaponselect :( )
        end
        -- (Automatically enables fake latency depending on certain conditions)

        --[[ Auto Fake Latency ]] if
            (mAutoFL:GetValue() == true) and (pWeapon:IsMeleeWeapon() == true) and -- If Auto Fake Latency is enabled, and we are using a melee weapon, and we are not invisible
                (sneakyboy == false)
         then
            if (distance <= mAutoFLDist:GetValue()) then -- Check if we are within "mAutoFLDist" (set in the menu) of the enemy
                if (gui.GetValue("fake latency") ~= 1) then -- If "fake latency" is not on, turn it on
                    gui.SetValue("fake latency", 1)
                end
                if (gui.GetValue("fake latency value") ~= mAutoFLNear:GetValue()) then -- if "fake latency value" is not "mAutoFLNear" (set in the menu), set it to "mAutoFLNear"
                    gui.SetValue("fake latency value", mAutoFLNear:GetValue())
                end
                return
            elseif (distance > mAutoFLDist:GetValue()) then -- If are away from the enemy, check if "mAutoFLFar" is set to 0.
                if (mAutoFLFar:GetValue() == 0) then -- If "mAutoFLFar" is set to 0, turn off fake latency.
                    if (gui.GetValue("fake latency") ~= 0) then
                        gui.SetValue("fake latency", 0)
                    end
                elseif (mAutoFLFar:GetValue() >= 1) then -- If "mAutoFLFar" is set to 1 or more, set "fake latency value" to "mAutoFLFar" and turn "fake latency" on (if it's not already on)
                    if (gui.GetValue("fake latency") ~= 1) then
                        gui.SetValue("fake latency", 1)
                    end
                    if (gui.GetValue("fake latency value") ~= mAutoFLFar:GetValue()) then
                        gui.SetValue("fake latency value", mAutoFLFar:GetValue())
                    end
                end
            end
        end
        -- (Automatically use "Battle Cry" when looking at an enemy with melee weapon (for special voicelines))

        --[[ Auto C2 ]] if
            mCallouts:IsSelected("Battle Cry Melee") and (pWeapon:IsMeleeWeapon() == true) and -- If we are using the Battle Cry Melee callout, and we are using a melee weapon
                (sneakyboy == false)
         then -- and we are not invisible
            c2Timer = c2Timer + 1 -- Add 1 to the c2Timer
            c2Timer2 = c2Timer2 + 1 -- Add 1 to the c2Timer2
            if (c2Timer >= 0.5 * 66) then -- If the c2Timer is greater than or equal to 0.5 seconds
                c2Timer = 0 -- Reset the c2Timer
                local mC2Source = pLocal:GetAbsOrigin() + pLocal:GetPropVector("localdata", "m_vecViewOffset[0]") -- Set "mC2Source" to the player's view offset
                local mC2Destination = mC2Source + engine.GetViewAngles():Forward() * 500 -- Set "mC2Destination" 500hu in front of the player's view angle
                local mC2Trace = engine.TraceLine(mC2Source, mC2Destination, MASK_SHOT_HULL) -- Trace a line from "mC2Source" to "mC2Destination"
                if
                    (mC2Trace.entity ~= nil) and (mC2Trace.entity:GetClass() == "CTFPlayer") and -- If the trace hit a player
                        (mC2Trace.entity:GetTeamNumber() ~= pLocal:GetTeamNumber()) and -- and the player is on a different team
                        (c2Timer2 >= 2 * 66)
                 then -- and the c2Timer2 is greater than to 2 seconds
                    client.Command("voicemenu 2 1", true) -- Execute "voicemenu 2 1" in the console
                --print("Successfully triggered C2")                                                                  -- Print to the console that we successfully triggered C2 (for debugging)
                end
            end
        end
        ::continue::
    end
    CheckTempOptions()
end

local myfont = draw.CreateFont("Verdana", 16, 800) -- Create a font for doDraw
--
--[[ Code called every frame ]] local function doDraw()
    if engine.Con_IsVisible() or engine.IsGameUIVisible() then
        return
    end
    -- (Shows trajectory of rockets (kinda bugged but works))

    --[[ Rocket Lines ]] if mRocketLines:GetValue() then -- If "Rocket Lines" is enabled
        local rockets = entities.FindByClass("CTFProjectile_Rocket") -- Find all rockets
        for i, rocket in pairs(rockets) do -- Loop through all rockets
            local rocketPos = rocket:GetAbsOrigin() -- Set "rocketPos" to the rocket's position
            local rocketScreenPos = client.WorldToScreen(rocketPos) -- Set "rocketScreenPos" to the x/z coordinates of the rocket's position based on the player's screen
            local rocketDest = vector.Add(rocketPos, rocket:EstimateAbsVelocity()) -- Set "rocketDest" to the rocket's estimated direction based on the rocket's estimated velocity (this should probably be replaced with the rocket's direction)
            local rocketTrace = engine.TraceLine(rocketPos, rocketDest, MASK_SHOT_HULL) -- Trace a line from the rocket's position to the rocket's estimated direction until it hits something
            local hitPosScreen = client.WorldToScreen(rocketTrace.endpos) -- Set "hitPosScreen" to the x/z coordinates of the trace's hit position based on the player's screen

            draw.Color(255, 0, 0, 255) -- Set the color to red
            -- if type(exp) == "table" then printLuaTable(exp) else print( table.concat( {exp}, '\n' ) )
            draw.Line(rocketScreenPos[1], rocketScreenPos[2], hitPosScreen[1], hitPosScreen[2]) --Draw a line from the rocket to the trace's hit position
            draw.Line(rocketScreenPos[1] + 1, rocketScreenPos[2] + 1, hitPosScreen[1] + 1, hitPosScreen[2]) --Used to make lines thicker (could probably be removed)
            draw.Line(rocketScreenPos[1] - 1, rocketScreenPos[2] - 1, hitPosScreen[1] - 1, hitPosScreen[2])
        end
    end

    local players = entities.FindByClass("CTFPlayer")
    -- (Draws a cross on over friendly medics when pressing E (my default keybind for +helpme))

    --[[ MEdic Finder ]] if mMedicFinder:GetValue() == true then
        if (mfTimer == 0) then -- debug (can be removed?)
        end
        if input.IsButtonDown(KEY_E) then -- If the E key is pressed
            mfTimer = 1 -- Activate Medic Finder
        end
        if (mfTimer >= 1) and (mfTimer < 12 * 66) then -- If the timer is >1/<12 seconds, show the cross
            mfTimer = mfTimer + 1
            if (mfTimer >= 3) then -- debug (can be removed?)
            end
            for i, p in ipairs(players) do
                if p:IsAlive() and p:GetTeamNumber() == entities.GetLocalPlayer():GetTeamNumber() then -- If the player is alive and on the same team as the local player
                    local pWeapon = p:GetPropEntity("m_hActiveWeapon") -- Set "pWeapon" to the player's active weapon
                    if pWeapon ~= nil then -- Validate "pWeapon"
                        pWeaponIs = pWeapon:GetClass() -- Set "pWeaponIs" to the player's active weapon's class
                        if
                            p:IsAlive() and not p:IsDormant() and
                                (p:GetTeamNumber() == entities.GetLocalPlayer():GetTeamNumber())
                         then -- If the player is alive and not dormant and on the same team as the local player
                            if
                                (pWeaponIs == "CTFCrossbow") or -- Check if the player's active weapon is a crossbow, bonesaw, syringe, or medigun. If so, they're a medic
                                    (pWeaponIs == "CTFBonesaw") or
                                    (pWeaponIs == "CTFSyringeGun") or
                                    (pWeaponIs == "CWeaponMedigun")
                             then -- For some reason this doesn't work with decorated weapons
                                local pPos = p:GetAbsOrigin() -- + (p:GetAbsOrigin() + p:GetPropVector("localdata", "m_vecViewOffset[0]") * 1  -- Set "pPos" to the medic's position
                                local pScreenPos2 = client.WorldToScreen(pPos) -- Find the co-ords of the medic's absolute position based on the player's screen
                                local pScreenPos =
                                    client.WorldToScreen(pPos + p:GetPropVector("localdata", "m_vecViewOffset[0]")) -- Find the co-ords of the medic's view offset
                                if (pScreenPos2 ~= nil) and (pScreenPos ~= nil) then -- Validate the co-ords
                                    local pScreenDistance = (pScreenPos2[2] - pScreenPos[2]) * 0.01 -- Find the distance between the medic's absolute position and view offset
                                    if pSCreenDistance == 0 then -- If the distance is 0, set it to 1
                                        pScreenDistance = 1
                                    end
                                    -- Change the color based on distance from entities.GetLocalPlayer()
                                    distance = vector.Distance(pPos, entities.GetLocalPlayer():GetAbsOrigin()) -- Find the distance between the medic and the local player
                                    distanceMax = 1000 -- Maximum range at which alpha is 100%/255
                                    distanceMin = 200 -- Minimum range at which alpha is 0%/0
                                    distanceMaxColor = 255 --Ranges for alpha
                                    distanceMinColor = 0 -- Set this to ~100 to make the cross always visible despite the distance
                                    distanceColor =
                                        math.floor(
                                        (distanceMaxColor) * (distance - distanceMin) / (distanceMax - distanceMin)
                                    ) -- Calculate the alpha based on the distance
                                    if distanceColor < 0 then -- If the alpha is less than 0, set it to 0
                                        distanceColor = 0
                                    elseif distanceColor > 255 then -- If the alpha is greater than 255, set it to 255
                                        distanceColor = 255
                                    end
                                    draw.Color(255, 0, 0, distanceColor) -- Set the color to red with the calculated alpha

                                    local def1 = 15 -- vvvvMath shit for the crossvvvv
                                    local def2 = 40
                                    local def3 = 50
                                    local def4 = 70
                                    local def5 = 110
                                    def1 = math.floor(def1 * pScreenDistance)
                                    def2 = math.floor(def2 * pScreenDistance)
                                    def3 = math.floor(def3 * pScreenDistance)
                                    def4 = math.floor(def4 * pScreenDistance)
                                    def5 = math.floor(def5 * pScreenDistance)
                                    draw.Line(
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2],
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2]
                                    ) -- vvv Draw the cross vvv
                                    draw.Line(
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2],
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2] - def2
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2] - def2,
                                        pScreenPos2[1] + def3,
                                        pScreenPos2[2] - def2
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def3,
                                        pScreenPos2[2] - def2,
                                        pScreenPos2[1] + def3,
                                        pScreenPos2[2] - def4
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def3,
                                        pScreenPos2[2] - def4,
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2] - def4
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2] - def4,
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2] - def5
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1,
                                        pScreenPos2[2] - def5,
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2] - def5
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2] - def5,
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2] - def4
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2] - def4,
                                        pScreenPos2[1] - def3,
                                        pScreenPos2[2] - def4
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def3,
                                        pScreenPos2[2] - def4,
                                        pScreenPos2[1] - def3,
                                        pScreenPos2[2] - def2
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def3,
                                        pScreenPos2[2] - def2,
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2] - def2
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2] - def2,
                                        pScreenPos2[1] - def1,
                                        pScreenPos2[2]
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] + 1,
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] + 1
                                    ) -- vvv Draw the cross again for extra width vvv
                                    draw.Line(
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] + 1,
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] - def2 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] - def2 + 1,
                                        pScreenPos2[1] + def3 + 1,
                                        pScreenPos2[2] - def2 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def3 + 1,
                                        pScreenPos2[2] - def2 + 1,
                                        pScreenPos2[1] + def3 + 1,
                                        pScreenPos2[2] - def4 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def3 + 1,
                                        pScreenPos2[2] - def4 + 1,
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] - def4 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] - def4 + 1,
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] - def5 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] + def1 + 1,
                                        pScreenPos2[2] - def5 + 1,
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] - def5 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] - def5 + 1,
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] - def4 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] - def4 + 1,
                                        pScreenPos2[1] - def3 + 1,
                                        pScreenPos2[2] - def4 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def3 + 1,
                                        pScreenPos2[2] - def4 + 1,
                                        pScreenPos2[1] - def3 + 1,
                                        pScreenPos2[2] - def2 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def3 + 1,
                                        pScreenPos2[2] - def2 + 1,
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] - def2 + 1
                                    )
                                    draw.Line(
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] - def2 + 1,
                                        pScreenPos2[1] - def1 + 1,
                                        pScreenPos2[2] + 1
                                    )
                                end
                            end
                        --else
                        -- todo: Color cross based on uber %, rainbow at 100% uber
                        -- todo: Display distance from player in the cross
                        -- todo: Warnings if no medics were found
                        end
                    end
                end
            end
        end
        if (mfTimer > 12 * 66) then -- Remove the cross after 12 seconds (isn't this fps-based? on 144hz monitors, 66 = 5.5 seconds. In that case, this may show longer than it should for others)
            mfTimer = 0
        end
    end
end
--

--[[ Executes upon stringCmd ]] local function OnStringCmd(stringCmd) -- Called when a string command is sent
    local cmd = stringCmd:Get() -- Set "cmd" to the string command
    local blockCmd = false -- Set "blockCmd" to false
    -- (This method is scuffed, but it works.)

    --[[ Allow \n in chat ]] if mChatNL:GetValue() == true then -- If Chat New Line is enabled
        cmd = cmd:gsub("\\n", "\n") -- Replace all instances of "\\n" with "\n"
        if cmd:find("say_team", 1, true) == 1 then -- If the command is "say_team"
            cmd = cmd:sub(11, -2) -- Remove the first 11 characters ("say_team ") and the last 2 characters (");")
            client.ChatTeamSay(cmd) -- Send the modified command to the server
            blockCmd = true -- Execute the "blockCmd" function
        elseif cmd:find("say", 1, true) == 1 then -- If the command is "say"
            cmd = cmd:sub(6, -2) -- Remove the first 6 characters ("say ") and the last 2 characters (");")
            client.ChatSay(cmd) -- Send the modified command to the server
            blockCmd = true -- Execute the "blockCmd" function
        end
    end
    --

    --[[ Block Commands ]] if blockCmd then -- If "blockCmd" is triggered
        stringCmd:Set("") -- Set the string command to "", disabling the command
    end
end
--

--[[ Executes upon receiving a message ]] local function OnUserMessage(userMsg) -- Called when a user message is received
    local blockMessage = false -- Set "blockMessage" to false (used to keep track of whether or not to block the message)
    -- (Attempt to negate bad RTD effects)

    --[[ Removals: RTD Effects ]] if mRemovals:IsSelected("RTD Effects") then -- If RTD Effects is enabled
        if userMsg:GetID() == Shake then
            blockMessage = true
        end -- If the message is "Shake", block the message
        if userMsg:GetID() == Fade then
            blockMessage = true
        end -- If the message is "Fade", block the message

        if userMsg:GetID() == TextMsg then -- If the message is "TextMsg"
            userMsg:Reset() -- Reset the message
            local msgDest = userMsg:ReadByte() -- Set "msgDest" to the message destination
            local msgName = userMsg:ReadString(256) -- Set "msgName" to the message name

            if string.find(msgName, "[RTD]") then -- If the message name contains "[RTD]"
                if
                    string.find(msgName, "Your perk has worn off") or
                        string.find(msgName, "You have died during your roll")
                 then -- If the message name contains "Your perk has worn off" or "You have died during your roll"
                    CurrentRTD = "" -- Reset the current RTD, so we can detect when it changes
                elseif string.find(msgName, "Cursed") then
                    CurrentRTD = "Cursed" -- If the message name contains "Cursed", set the current RTD to "Cursed"
                elseif string.find(msgName, "Drugged") then
                    CurrentRTD = "Drugged" -- If the message name contains "Drugged", set the current RTD to "Drugged"
                elseif string.find(msgName, "Bad Sauce") then
                    CurrentRTD = "Bad Sauce" -- If the message name contains "Bad Sauce", set the current RTD to "Bad Sauce"
                end
            end
        end
    else
        CurrentRTD = "" -- Reset the current RTD if RTD Effects is disabled
    end
    -- (Remove the hud text of bad RTD effects)

    --[[ Removals: Hud Text ]] if mRemovals:IsSelected("HUD Texts") then -- If HUD Texts is enabled
        if userMsg:GetID() == HudText or userMsg:GetID() == HudMsg then
            blockMessage = true
        end -- If the message is "HudText" or "HudMsg", block the message
    end
    --

    --[[ Block messages ]] if blockMessage then -- If "blockMessage" is triggered
        local msgLength = userMsg:GetDataBits() -- Set "msgLength" to the message length in bits
        userMsg:Reset() -- Reset the message
        for i = 1, msgLength do -- For each bit in the message, starting at 1
            userMsg:WriteBit(0) -- Write a 0, effectively removing the message
        end
    end
end
--

--[[ Remove the menu when unloaded ]] local function OnUnload() -- Called when the script is unloaded
    MenuLib.RemoveMenu(menu) -- Remove the menu
    client.Command('play "ui/buttonclickrelease"', true) -- Play the "buttonclickrelease" sound
end
--

--[[ Unregister previous callbacks ]] callbacks.Unregister("CreateMove", "MCT_CreateMove") -- Unregister the "CreateMove" callback
callbacks.Unregister("SendStringCmd", "MCT_StringCmd") -- Unregister the "SendStringCmd" callback
callbacks.Unregister("DispatchUserMessage", "MCT_UserMessage") -- Unregister the "DispatchUserMessage" callback
callbacks.Unregister("Unload", "MCT_Unload") -- Unregister the "Unload" callback
callbacks.Unregister("Draw", "MCT_Draw") -- Unregister the "Draw" callback
--

--[[ Register callbacks ]] callbacks.Register("CreateMove", "MCT_CreateMove", OnCreateMove) -- Register the "CreateMove" callback
callbacks.Register("SendStringCmd", "MCT_StringCmd", OnStringCmd) -- Register the "SendStringCmd" callback
callbacks.Register("DispatchUserMessage", "MCT_UserMessage", OnUserMessage) -- Register the "DispatchUserMessage" callback
callbacks.Register("Unload", "MCT_Unload", OnUnload) -- Register the "Unload" callback
callbacks.Register("Draw", "MCT_Draw", doDraw) -- Register the "Draw" callback
--

--[[ Play sound when loaded ]] client.Command('play "ui/buttonclick"', true) -- Play the "buttonclick" sound when the script is loaded

local function OnUnload() -- Called when the script is unloaded
    MenuLib.RemoveMenu(menu) -- Remove the menu
    client.Command('play "ui/buttonclickrelease"', true) -- Play the "buttonclickrelease" sound
end

-- If you see this error
-- 50: attempt to concatenate a nil value (field 'shots_left_till_bucket_full')
-- It's safe to ignore!
-- I was simply caching GetWeaponData() because CreateMove updates more often than Draw
local colors = {
    white = {255, 255, 255, 255},
    gray = {190, 190, 190, 255},
    red = {255, 0, 0, 255},
    green = {36, 255, 122, 255},
    blue = {30, 139, 195, 255}
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
local arr = {
    441,
    416,
    40,
    594,
    595,
    813,
    834,
    141,
    1004,
    142,
    232,
    61,
    1006,
    525,
    132,
    1082,
    266,
    482,
    327,
    307,
    357,
    404,
    812,
    833,
    237,
    265,
    155,
    230,
    460,
    1178,
    14,
    201,
    56,
    230,
    402,
    526,
    664,
    752,
    792,
    801,
    851,
    881,
    890,
    899,
    908,
    957,
    966,
    1005,
    1092,
    1098,
    15000,
    15007,
    15019,
    15023,
    15033,
    15059,
    15070,
    15071,
    15072,
    15111,
    15112,
    15135,
    15136,
    15154,
    30665,
    194,
    225,
    356,
    461,
    574,
    638,
    649,
    665,
    727,
    794,
    803,
    883,
    892,
    901,
    910,
    959,
    968,
    15062,
    15094,
    15095,
    15096,
    15118,
    15119,
    15143,
    15144,
    131,
    406,
    1099,
    1144,
    46,
    42,
    311,
    863,
    1002,
    159,
    433,
    1190,
    129,
    226,
    354,
    1001,
    1101,
    1179,
    642,
    133,
    444,
    405,
    608,
    57,
    231,
    29,
    211,
    35,
    411,
    663,
    796,
    805,
    885,
    894,
    903,
    912,
    961,
    970,
    998,
    15008,
    15010,
    15025,
    15039,
    15050,
    15078,
    15097,
    15121,
    15122,
    15123,
    15145,
    15146,
    30,
    212,
    59,
    60,
    297,
    947,
    735,
    736,
    810,
    831,
    933,
    1080,
    1102,
    140,
    1086,
    30668,
    25,
    737,
    26,
    28,
    222,
    1121,
    1180,
    58,
    1083,
    1105
}
for i = 1, #arr do
    hardcoded_weapon_ids[arr[i]] = true
end

local function CanFireCriticalShot(me, wpn)
    if me:GetPropInt("m_iClass") == TF2_Spy and wpn:IsMeleeWeapon() then
        return false
    end
    local className = wpn:GetClass()
    if className == "CTFSniperRifle" or className == "CTFBuffItem" or className == "CTFWeaponLunchBox" then
        return false
    end
    if hardcoded_weapon_ids[wpn:GetPropInt("m_iItemDefinitionIndex")] then
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

local fontid = draw.CreateFont("Verdana", 16, 700, FONTFLAG_CUSTOM | FONTFLAG_OUTLINE)
callbacks.Unregister("Draw", "Draw-F3drQ")
callbacks.Register(
    "Draw",
    "Draw-F3drQ",
    function()
        local me, wpn
        me = entities.GetLocalPlayer()
        if me and me:IsAlive() then
            wpn = me:GetPropEntity("m_hActiveWeapon")
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
            local tf_weapon_criticals_melee = client.GetConVar("tf_weapon_criticals_melee")
            sv_allow_crit = (sv_allow_crit and tf_weapon_criticals_melee == 1) or (tf_weapon_criticals_melee == 2)
        end

        local mult = 0
        local elements = {}
        elements[1] = {
            "Crit",
            (me:IsCritBoosted() or me:InCond(TFCond_CritCola)) and colors.blue or sv_allow_crit and colors.green or
                colors.gray
        }
        elements[2] = {
            weaponinfo.shots_left_till_bucket_full .. " attacks left until full bar",
            nil,
            weaponinfo.shots_left_till_bucket_full ~= 0
        }
        elements[3] = {weaponinfo.stored_crits .. " crits available"}
        elements[4] = {
            "deal " .. math.floor(other_weapon_info.requiredDamage) .. " damage",
            nil,
            (other_weapon_info.critChance + 0.1 < other_weapon_info.observedCritChance)
        }
        elements[5] = {"streaming crit", colors.red, wpn:GetRapidFireCritTime() > wpn:GetLastRapidFireCritCheckTime()}
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
    end
)

callbacks.Unregister("CreateMove", "CreateMove-N8bat")
callbacks.Register(
    "CreateMove",
    "CreateMove-N8bat",
    function()
        local me, wpn
        me = entities.GetLocalPlayer()
        if me and me:IsAlive() then
            wpn = me:GetPropEntity("m_hActiveWeapon")
            if not (wpn and wpn:IsWeapon() and CanFireCriticalShot(me, wpn)) then
                return
            end
        else
            return
        end

        local weaponinfo, needupdate = cache_weapon_info.get(wpn:GetCritCheckCount())
        if needupdate == nil or wpn:GetIndex() ~= weaponinfo.currentWeapon then
            -- printc(255, 0, 0, 255, 'updating weaponinfo...')
            weaponinfo =
                setmetatable(
                {},
                {
                    __index = wpn:GetWeaponData()
                }
            )
            -- LuaFormatter off
            weaponinfo.currentWeapon = wpn:GetIndex()
            weaponinfo.isRapidFire = weaponinfo.useRapidFireCrits or wpn:GetClass() == "CTFMinigun"
            weaponinfo.currentCritSeed = wpn:GetCurrentCritSeed()
            weaponinfo.bulletsPerShot = wpn:AttributeHookFloat("mult_bullets_per_shot", weaponinfo.bulletsPerShot)
            weaponinfo.added_per_shot = wpn:GetWeaponBaseDamage()
            weaponinfo.bucket = wpn:GetCritTokenBucket()
            weaponinfo.bucket_max = client.GetConVar("tf_weapon_criticals_bucket_cap")
            weaponinfo.bucket_min = client.GetConVar("tf_weapon_criticals_bucket_bottom")
            weaponinfo.bucket_start = client.GetConVar("tf_weapon_criticals_bucket_default")
            weaponinfo.critRequestCount = wpn:GetCritSeedRequestCount()
            weaponinfo.critCheckCount = wpn:GetCritCheckCount()
            weaponinfo.shots_to_fill_bucket = weaponinfo.bucket_max / weaponinfo.added_per_shot
            weaponinfo.costs = {}
            weaponinfo.stored_crits = 0
            weaponinfo.shots_left_till_bucket_full = 0
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
                    min =
                        min +
                        wpn:GetCritCost(
                            min,
                            weaponinfo.critRequestCount + weaponinfo.stored_crits,
                            weaponinfo.critCheckCount
                        )
                    if temp2 < weaponinfo.bucket_max then
                        temp2 = math.min(temp2 + weaponinfo.added_per_shot, weaponinfo.bucket_max)
                        weaponinfo.shots_left_till_bucket_full = weaponinfo.shots_left_till_bucket_full + 1
                    end
                    local temp3 =
                        min +
                        wpn:GetCritCost(
                            min,
                            weaponinfo.critRequestCount + weaponinfo.stored_crits + 1,
                            weaponinfo.critCheckCount
                        ) +
                        weaponinfo.added_per_shot -
                        weaponinfo.shots_to_fill_bucket
                    if temp3 > weaponinfo.bucket_max then
                        break
                    end
                end
            else
                for i = 0, weaponinfo.shots_to_fill_bucket + 1, 1 do
                    if temp < weaponinfo.bucket_max then
                        temp = math.min(temp + weaponinfo.added_per_shot, weaponinfo.bucket_max)
                        weaponinfo.costs[i] =
                            wpn:GetCritCost(temp, weaponinfo.critRequestCount + i, weaponinfo.critCheckCount)
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
        local requiredTotalDamage = (damageStats["critical"] * (2.0 * cmpCritChance + 1.0)) / cmpCritChance / 3.0
        other_weapon_info.requiredDamage = requiredTotalDamage - damageStats["total"]
        other_weapon_info.observedCritChance = wpn:CalcObservedCritChance()
        other_weapon_info.critChance = critChance
        other_weapon_info.damageStats = damageStats
    end
)

local Config = {
    -- HOME BUTTON UNLOADS LUA
    Speed = 0.5, -- go crazy -- Default 1
    Saturation = 1, -- between 0 and 1 -- Default 1
    Lightness = 0.6, -- between 0 and 1 -- Default 0.6
    Alpha = 255, -- transparency setting between 0 and 255 -- Default 255
    -- Set to true to rainbowize ;)
    Backtrack = true,
    BlueTeam = false,
    --BlueTeamInvis = true; -- NOT WORKING
    RedTeam = false,
    --RedTeamInvis = true; -- NOT WORKING
    Target = true,
    Gui = true,
    --AAIndicator = true; -- NOT WORKING
    NightMode = false
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
    local m = L - C / 2

    local RawR, RawG, RawB = 0, 0, 0

    if H >= 0 and H < 60 then
        RawR, RawG, RawB = C, X, 0
    end
    if H >= 60 and H < 120 then
        RawR, RawG, RawB = X, C, 0
    end
    if H >= 120 and H < 180 then
        RawR, RawG, RawB = 0, C, X
    end
    if H >= 180 and H < 240 then
        RawR, RawG, RawB = 0, X, C
    end
    if H >= 240 and H < 300 then
        RawR, RawG, RawB = X, 0, C
    end
    if H >= 300 and H < 360 then
        RawR, RawG, RawB = C, 0, X
    end

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
callbacks.Register(
    "Draw",
    "Draw",
    function()
        if input.IsButtonDown(KEY_HOME) then
            callbacks.Unregister("Draw", "Draw")
        end

        local temp, Hue = math.modf((globals.TickCount() * Config.Speed) / 360)
        local r, g, b = HSLtRGB(Hue * 360, Config.Saturation, Config.Lightness)
        local hex = RGBtHex(r, g, b, Config.Alpha)

        if Config.Backtrack then
            Set("backtrack ticks color", hex)
        end
        if Config.BlueTeam then
            Set("blue team color", hex)
        end
        --if Config.BlueTeamInvis then Set("blue team invisible", hex) end
        if Config.RedTeam then
            Set("red team color", hex)
        end
        --if Config.RedTeamInvis then Set("red team invisible", hex) end
        if Config.Target then
            Set("aimbot target color", hex)
        end
        if Config.Gui then
            Set("gui color", hex)
        end
        --if Config.AAIndicator then Set("anti aim indicator color", hex) end
        if Config.NightMode then
            Set("night mode color", hex)
        end
    end
)

--[[
   Major thanks to VirtIO for the creation of the DT Bar
   & also the little help of Haze :)
]]
local fontName = "Verdana"
local font = draw.CreateFont(fontName, 16, 150, FONTFLAG_CUSTOM | FONTFLAG_OUTLINE | FONTFLAG_DROPSHADOW)
draw.SetFont(font)
local fontHeight = select(2, draw.GetTextSize("a"))

local w, h = draw.GetScreenSize()
local x, y = w - 1080, h - 300
local bw, bh = w / 10, 16

-- 1: full and can dt
-- 2: full and can't dt
-- 3: < 24 ticks loaded
local textStates = {
    {"Ready", {0, 255, 0}},
    {"Wait", {234, 137, 46}},
    {"%s/24", {255, 0, 0}}
}

local function DT_Enabled()
    local dtMode = gui.GetValue("double tap (beta)")

    return dtMode ~= "off"
end

local function getTicks()
    local charged = warp.GetChargedTicks()
    if charged > 1 then
        charged = charged + 1
    end
    return charged
end

local function canDt()
    local lp = entities.GetLocalPlayer()
    if not lp then
        return false
    end
    local weapon = lp:GetPropEntity("m_hActiveWeapon")
    if not weapon or not weapon:IsValid() then
        return false
    end

    return warp.CanDoubleTap(weapon)
end

local function drawText()
    draw.SetFont(font)
    draw.Color(255, 255, 255, 255)
    draw.Text(x, y, "Charge")

    local state
    local charged, canDt = getTicks(), canDt()

    if charged < 24 then
        state = 3
    elseif charged == 24 and not canDt then
        state = 2
    else
        state = 1
    end

    local text = textStates[state][1]:format(charged)
    local r, g, b = table.unpack(textStates[state][2])
    local textWidth = draw.GetTextSize(text)

    draw.Color(r, g, b, 255)

    draw.Text(x + bw - textWidth, y, text)
end

local function drawBar()
    draw.Color(22, 22, 22, 220)
    draw.FilledRect(x, y + fontHeight, x + bw, y + fontHeight + bh)
    draw.Color(0, 137, 255, 255)
    local barWidth = (bw / 24) * getTicks()
    draw.FilledRect(x, y + fontHeight, x + barWidth, y + fontHeight + bh)
    draw.Color(102, 20, 18, 255)
    draw.OutlinedRect(x, y + fontHeight, x + bw, y + fontHeight + bh)
end

local function onDraw()
    local lp = entities.GetLocalPlayer()
    if not lp or not lp:IsAlive() then
        return
    end
    if not DT_Enabled() then
        return
    end
    if engine.IsGameUIVisible() then
        return
    end
    drawText()
    drawBar()
end

callbacks.Register("Draw", "rijindtbar", onDraw)

client.Command('play "ui/buttonclick"', true)

callbacks.Unregister("Unload", "MCT_Unload") -- Unregister the "Unload" callback
callbacks.Unregister("Draw", "MCT_Draw")

callbacks.Register("Unload", "MCT_Unload", OnUnload) -- Register the "Unload" callback
--callbacks.Register("Draw", "MCT_Draw", doDraw)
callbacks.Register("DrawModel", "hook12323", onDrawModel)

callbacks.Unregister("Draw", "IRIS_DT-Bar_Draw")
callbacks.Register("Draw", "IRIS_DT-Bar_Draw", OnDraw)
callbacks.Register("Draw", "paint_spy_draw", paint_spy)
callbacks.Register("Draw", "unique_draw_hook", draw_handler)
callbacks.Register("FireGameEvent", "unique_event_hook", event_hook)
callbacks.Register("Draw", "draw", secondary)
callbacks.Register("CreateMove", "printPlayer", printPlayerInfo)
callbacks.Register("Draw", IRISWatermark)
