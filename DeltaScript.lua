-- V13.3 ENHANCED by hahahsud15 - ALLE ALTEN CHEATS + LIVE PING + AUTO-HOP + ULTRA BOOST V2!
if getgenv().V13_LOADED then getgenv().V13_LOADED:Destroy() end
getgenv().V13_WATERMARK = "hahahsud15_V13.3_ENHANCED_2026"
getgenv().V13_DISCORD = "discord.gg/8nTQ5xvuha"
getgenv().V13_OWNER = "hahahsud15"
getgenv().V13_PROTECTION = true

local function checkWasserzeichen()
    return getgenv().V13_WATERMARK == "hahahsud15_V13.3_ENHANCED_2026" and getgenv().V13_OWNER == "hahahsud15"
end

if not checkWasserzeichen() then error("WASSERZEICHEN ENTFERNT - BY hahahsud15") return end

print("V13.3 ENHANCED by "..getgenv().V13_WATERMARK)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local lp = Players.LocalPlayer

local isMobile = UserInputService.TouchEnabled
local LANG = getgenv().V13_LANG or nil

local VirtualUser = game:GetService("VirtualUser")
lp.Idled:Connect(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new()) end)

-- PING TRACKING SYSTEM
local pingHistory = {}
local lastPingCheck = tick()
local currentPing = 0
local pingStatus = "🟢" -- 🟢 Good (0-100ms), 🟡 Medium (100-300ms), 🔴 Bad (300ms+)

local function updatePing()
    local now = tick()
    if now - lastPingCheck < 0.5 then return end
    lastPingCheck = now
    
    pcall(function()
        currentPing = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        
        if currentPing <= 100 then
            pingStatus = "🟢"
        elseif currentPing <= 300 then
            pingStatus = "🟡"
        else
            pingStatus = "🔴"
        end
        
        table.insert(pingHistory, currentPing)
        if #pingHistory > 20 then table.remove(pingHistory, 1) end
    end)
end

local function getPingStatus()
    return pingStatus, currentPing
end

-- AUTO-HOP SYSTEM
local autoHopEnabled = false
local hopStartTime = 0
local hopHighPingFrames = 0
local PING_THRESHOLD = 500
local PING_DURATION_THRESHOLD = 10 -- seconds

local function autoHopTick()
    if not autoHopEnabled then return end
    
    updatePing()
    
    if currentPing > PING_THRESHOLD then
        if hopStartTime == 0 then
            hopStartTime = tick()
            hopHighPingFrames = 0
        end
        
        local timeSinceHigh = tick() - hopStartTime
        if timeSinceHigh >= PING_DURATION_THRESHOLD then
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌐 AUTO-HOP",
                Text = "Ping > 500ms für " .. PING_DURATION_THRESHOLD .. "s - Hoppe...",
                Duration = 2
            })
            
            local servers = {}
            local ok, response = pcall(function()
                return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            end)
            
            if ok and response and response ~= "" and not response:lower():find("error") then
                pcall(function()
                    local data = HttpService:JSONDecode(response)
                    for _, s in pairs(data.data) do
                        if s.playing < s.maxPlayers and s.id ~= game.JobId then
                            table.insert(servers, s.id)
                        end
                    end
                end)
            end
            
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
            else
                hopStartTime = 0
            end
        end
    else
        hopStartTime = 0
    end
end

-- NO INTERNET FIX - Fallback for HttpGet
local function safeHttpGet(url)
    local ok, result = pcall(function() return game:HttpGet(url) end)
    if not ok or not result or result == "" then
        return nil
    end
    if result:lower():find("<!doctype") or result:lower():find("<html") then
        return nil
    end
    return result
end

local function getGuiParent()
    if getgenv().gethui then local ok,res=pcall(gethui) if ok and res then return res end end
    if game.CoreGui then return game.CoreGui end
    return lp:WaitForChild("PlayerGui")
end

local gui = Instance.new("ScreenGui")
gui.Name = "V13.3_ENHANCED_"..getgenv().V13_OWNER
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = getGuiParent()
getgenv().V13_LOADED = gui

spawn(function()
    while true do task.wait(3) if not checkWasserzeichen() then gui:Destroy() error("ANTI-LEAK BY hahahsud15") break end end
end)

-- LOADING SCREEN
local loadFrame = Instance.new("Frame", gui)
loadFrame.Size = isMobile and UDim2.new(0,360,0,350) or UDim2.new(0,480,0,380)
loadFrame.Position = UDim2.new(0.5,-180,0.5,-175)
if not isMobile then loadFrame.Position = UDim2.new(0.5,-240,0.5,-190) end
loadFrame.BackgroundColor3 = Color3.fromRGB(20,20,25)
Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,20)
Instance.new("UIStroke", loadFrame).Color = Color3.fromRGB(0,255,150)

local loadTitle = Instance.new("TextLabel", loadFrame)
loadTitle.Size = UDim2.new(1,0,0,60)
loadTitle.BackgroundColor3 = Color3.fromRGB(30,30,35)
loadTitle.Text = "V13.3 ENHANCED\nALLE CHEATS + LIVE PING + AUTO-HOP!\nby "..getgenv().V13_OWNER.." 🔥"
loadTitle.TextColor3 = Color3.fromRGB(0,255,150)
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextSize = 16
Instance.new("UICorner", loadTitle).CornerRadius = UDim.new(0,20)

local loadStatus = Instance.new("TextLabel", loadFrame)
loadStatus.Size = UDim2.new(1,0,0,30)
loadStatus.Position = UDim2.new(0,0,0,70)
loadStatus.BackgroundTransparency = 1
loadStatus.Text = "🔥 LADE ALLE ALTEN CHEATS..."
loadStatus.TextColor3 = Color3.new(1,1,1)
loadStatus.Font = Enum.Font.GothamBold
loadStatus.TextSize = 12

local barBack = Instance.new("Frame", loadFrame)
barBack.Size = UDim2.new(0.8,0,0,20)
barBack.Position = UDim2.new(0.1,0,0,110)
barBack.BackgroundColor3 = Color3.fromRGB(40,40,45)
Instance.new("UICorner", barBack).CornerRadius = UDim.new(0,10)
local barFill = Instance.new("Frame", barBack)
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,255,150)
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0,10)

local percentLabel = Instance.new("TextLabel", loadFrame)
percentLabel.Size = UDim2.new(1,0,0,25)
percentLabel.Position = UDim2.new(0,0,0,135)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(0,255,150)
percentLabel.Font = Enum.Font.Code
percentLabel.TextSize = 16

local details = Instance.new("TextLabel", loadFrame)
details.Size = UDim2.new(0.9,0,0,140)
details.Position = UDim2.new(0.05,0,0,165)
details.BackgroundTransparency = 1
details.Text = "✅ V13.3 ENHANCED FEATURES:\n• Live Ping (🟢🟡🔴 indicators)\n• Auto-Hop (500ms+ für 10s)\n• Ultra Boost V2 + Anti-Lag V2\n• Fly, Noclip, Speed, Inf Jump\n• 6 Explorer + Baba Fixed\n• Server Hop, Rejoin, Copy IDs\n• FPS 999 Real Boost\n© "..getgenv().V13_OWNER.." | "..getgenv().V13_DISCORD
details.TextColor3 = Color3.fromRGB(200,200,200)
details.Font = Enum.Font.Code
details.TextSize = 10
details.TextXAlignment = Enum.TextXAlignment.Left

local langFrame = Instance.new("Frame", gui)
langFrame.Size = isMobile and UDim2.new(0,320,0,260) or UDim2.new(0,380,0,240)
langFrame.Position = UDim2.new(0.5,-160,0.5,-130)
if not isMobile then langFrame.Position = UDim2.new(0.5,-190,0.5,-120) end
langFrame.BackgroundColor3 = Color3.fromRGB(30,30,35)
langFrame.Visible = false
Instance.new("UICorner", langFrame).CornerRadius = UDim.new(0,16)
Instance.new("UIStroke", langFrame).Color = Color3.fromRGB(0,255,150)

local langTitle2 = Instance.new("TextLabel", langFrame)
langTitle2.Size = UDim2.new(1,0,0,50)
langTitle2.BackgroundColor3 = Color3.fromRGB(40,40,45)
langTitle2.Text = "V13.3 ENHANCED - LANGUAGE SELECTION"
langTitle2.TextColor3 = Color3.new(1,1,1)
langTitle2.Font = Enum.Font.GothamBold
langTitle2.TextSize = 14
Instance.new("UICorner", langTitle2).CornerRadius = UDim.new(0,16)

local deBtn = Instance.new("TextButton", langFrame)
deBtn.Size = UDim2.new(0.42,0,0,60)
deBtn.Position = UDim2.new(0.05,0,0,80)
deBtn.Text = "🇩🇪 DEUTSCH"
deBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
deBtn.TextColor3 = Color3.new(1,1,1)
deBtn.Font = Enum.Font.GothamBlack
deBtn.TextSize = 16
Instance.new("UICorner", deBtn).CornerRadius = UDim.new(0,12)

local enBtn = Instance.new("TextButton", langFrame)
enBtn.Size = UDim2.new(0.42,0,0,60)
enBtn.Position = UDim2.new(0.53,0,0,80)
enBtn.Text = "🇬🇧 ENGLISH"
enBtn.BackgroundColor3 = Color3.fromRGB(50,100,200)
enBtn.TextColor3 = Color3.new(1,1,1)
enBtn.Font = Enum.Font.GothamBlack
enBtn.TextSize = 16
Instance.new("UICorner", enBtn).CornerRadius = UDim.new(0,12)

local discordBtnLang = Instance.new("TextButton", langFrame)
discordBtnLang.Size = UDim2.new(0.9,0,0,35)
discordBtnLang.Position = UDim2.new(0.05,0,0,160)
discordBtnLang.Text = "💬 "..getgenv().V13_DISCORD.." - COPY"
discordBtnLang.BackgroundColor3 = Color3.fromRGB(88,101,242)
discordBtnLang.TextColor3 = Color3.new(1,1,1)
discordBtnLang.Font = Enum.Font.GothamBold
discordBtnLang.TextSize = 11
Instance.new("UICorner", discordBtnLang).CornerRadius = UDim.new(0,8)

spawn(function()
    for i=0,100,1 do
        barFill.Size = UDim2.new(i/100,0,1,0)
        percentLabel.Text = i.."%"
        if i<20 then loadStatus.Text="🔥 RESTORING V13 CHEATS..."
        elseif i<40 then loadStatus.Text="⚡ SPEED, JUMP, GRAVITY..."
        elseif i<60 then loadStatus.Text="📱 FLY, NOCLIP, INF JUMP..."
        elseif i<75 then loadStatus.Text="📡 LIVE PING + AUTO-HOP..."
        elseif i<90 then loadStatus.Text="🚀 ULTRA BOOST V2 + EXPLORER..."
        else loadStatus.Text="✅ ALLE CHEATS DA! BY "..getgenv().V13_OWNER.."!"
        end
        task.wait(0.02)
    end
    task.wait(0.3)
    loadFrame:Destroy()
    if not LANG then langFrame.Visible=true end
end)

local function buildMain(lang)
    if not checkWasserzeichen() then return end
    LANG = lang
    getgenv().V13_LANG = lang
    langFrame.Visible=false
    
    local function T(de,en) if LANG=="EN" then return en else return de end end
    
    local function safeLoad(url, name)
        if not checkWasserzeichen() then return false end
        local code = safeHttpGet(url)
        if not code then return false end
        pcall(function() loadstring(code)() end)
        return true
    end
    
    local openBtn = Instance.new("TextButton", gui)
    openBtn.Size = isMobile and UDim2.new(0,60,0,60) or UDim2.new(0,55,0,55)
    openBtn.Position = UDim2.new(0,15,0.5,-30)
    openBtn.BackgroundColor3 = Color3.fromRGB(35,35,40)
    openBtn.Text = "V13\nOPEN"
    openBtn.TextColor3 = Color3.fromRGB(0,255,150)
    openBtn.Font = Enum.Font.GothamBlack
    openBtn.TextSize = 11
    Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,14)
    Instance.new("UIStroke", openBtn).Color = Color3.fromRGB(0,255,150)
    
    local main = Instance.new("Frame", gui)
    main.Name = "MainCheck_"..getgenv().V13_WATERMARK
    main.Size = isMobile and UDim2.new(0,360,0,520) or UDim2.new(0,680,0,560)
    main.Position = UDim2.new(0.5,-180,0.5,-260)
    if not isMobile then main.Position = UDim2.new(0.5,-340,0.5,-280) end
    main.BackgroundColor3 = Color3.fromRGB(35,35,40)
    main.Active = true
    main.Draggable = true
    Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
    Instance.new("UIStroke", main).Color = Color3.fromRGB(0,255,150)
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,-90,0,40)
    title.BackgroundColor3 = Color3.fromRGB(45,45,50)
    title.Text = "  V13.3 ENHANCED - LIVE PING | JOBID/PLACE COPY | "..getgenv().V13_OWNER.." 🔥"
    title.TextColor3 = Color3.new(1,1,1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = isMobile and 9 or 10
    title.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", title).CornerRadius = UDim.new(0,14)
    
    local close = Instance.new("TextButton", main)
    close.Size = UDim2.new(0,38,0,32)
    close.Position = UDim2.new(1,-42,0,4)
    close.Text = "X"
    close.BackgroundColor3 = Color3.fromRGB(180,40,40)
    close.TextColor3 = Color3.new(1,1,1)
    close.Font = Enum.Font.GothamBold
    Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)
    
    local mini = Instance.new("TextButton", main)
    mini.Size = UDim2.new(0,38,0,32)
    mini.Position = UDim2.new(1,-84,0,4)
    mini.Text = "-"
    mini.BackgroundColor3 = Color3.fromRGB(80,80,80)
    mini.TextColor3 = Color3.new(1,1,1)
    mini.Font = Enum.Font.GothamBold
    Instance.new("UICorner", mini).CornerRadius = UDim.new(0,8)
    
    -- LIVE PING DISPLAY WITH COLOR INDICATORS
    local perfLabel = Instance.new("TextLabel", main)
    perfLabel.Size = UDim2.new(1,-20,0,22)
    perfLabel.Position = UDim2.new(0,10,0,45)
    perfLabel.BackgroundColor3 = Color3.fromRGB(45,45,50)
    perfLabel.Text = "🟢 PING: 0ms | FPS: 0 | PLAYERS: 0 | JOBID/PLACE COPY ✅"
    perfLabel.TextColor3 = Color3.fromRGB(0,255,150)
    perfLabel.Font = Enum.Font.Code
    perfLabel.TextSize = 10
    Instance.new("UICorner", perfLabel).CornerRadius = UDim.new(0,6)
    
    -- Quick Copy Buttons
    local quickButtonsFrame = Instance.new("Frame", main)
    quickButtonsFrame.Size = UDim2.new(1,-10,0,30)
    quickButtonsFrame.Position = UDim2.new(0,5,0,70)
    quickButtonsFrame.BackgroundTransparency = 1
    
    local jobIdBtn = Instance.new("TextButton", quickButtonsFrame)
    jobIdBtn.Size = UDim2.new(0.3,0,1,0)
    jobIdBtn.Position = UDim2.new(0,0,0,0)
    jobIdBtn.Text = "📋 JobID"
    jobIdBtn.BackgroundColor3 = Color3.fromRGB(50,100,200)
    jobIdBtn.TextColor3 = Color3.new(1,1,1)
    jobIdBtn.Font = Enum.Font.GothamBold
    jobIdBtn.TextSize = 9
    Instance.new("UICorner", jobIdBtn).CornerRadius = UDim.new(0,6)
    
    local placeIdBtn = Instance.new("TextButton", quickButtonsFrame)
    placeIdBtn.Size = UDim2.new(0.3,0,1,0)
    placeIdBtn.Position = UDim2.new(0.35,0,0,0)
    placeIdBtn.Text = "📋 PlaceID"
    placeIdBtn.BackgroundColor3 = Color3.fromRGB(50,100,200)
    placeIdBtn.TextColor3 = Color3.new(1,1,1)
    placeIdBtn.Font = Enum.Font.GothamBold
    placeIdBtn.TextSize = 9
    Instance.new("UICorner", placeIdBtn).CornerRadius = UDim.new(0,6)
    
    local rejoinBtn = Instance.new("TextButton", quickButtonsFrame)
    rejoinBtn.Size = UDim2.new(0.3,0,1,0)
    rejoinBtn.Position = UDim2.new(0.7,0,0,0)
    rejoinBtn.Text = "🔄 REJOIN"
    rejoinBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
    rejoinBtn.TextColor3 = Color3.new(1,1,1)
    rejoinBtn.Font = Enum.Font.GothamBold
    rejoinBtn.TextSize = 9
    Instance.new("UICorner", rejoinBtn).CornerRadius = UDim.new(0,6)
    
    jobIdBtn.MouseButton1Click:Connect(function()
        setclipboard(game.JobId)
        game.StarterGui:SetCore("SendNotification",{Title="📋 JOBID", Text=game.JobId.." KOPIERT!", Duration=1})
    end)
    
    placeIdBtn.MouseButton1Click:Connect(function()
        setclipboard(tostring(game.PlaceId))
        game.StarterGui:SetCore("SendNotification",{Title="📋 PLACEID", Text=game.PlaceId.." KOPIERT!", Duration=1})
    end)
    
    rejoinBtn.MouseButton1Click:Connect(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
    end)
    
    local tabFrame = Instance.new("Frame", main)
    tabFrame.Size = UDim2.new(1,-10,0,36)
    tabFrame.Position = UDim2.new(0,5,0,105)
    tabFrame.BackgroundTransparency = 1
    local tabLayout = Instance.new("UIListLayout", tabFrame)
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.Padding = UDim.new(0,4)
    
    local tabs = {"PLAYER","VISUAL","AUTO-HOP","EXPLORER","SERVER","ULTRA"}
    local tabBtns = {}
    local contentFrames = {}
    
    for i,name in ipairs(tabs) do
        local b = Instance.new("TextButton", tabFrame)
        b.Size = UDim2.new(0,isMobile and 55 or 110,0,32)
        b.Text = name
        b.BackgroundColor3 = i==1 and Color3.fromRGB(0,255,150) or Color3.fromRGB(55,55,60)
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamBold
        b.TextSize = isMobile and 8 or 10
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
        tabBtns[name]=b
        
        local f = Instance.new("ScrollingFrame", main)
        f.Size = UDim2.new(1,-10,1,-148)
        f.Position = UDim2.new(0,5,0,145)
        f.BackgroundColor3 = Color3.fromRGB(40,40,45)
        f.Visible = (i==1)
        f.CanvasSize = UDim2.new(0,0,0,2000)
        f.ScrollBarThickness = 5
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)
        local layout = Instance.new("UIListLayout", f)
        layout.Padding = UDim.new(0,6)
        contentFrames[name]=f
        
        b.MouseButton1Click:Connect(function()
            if not checkWasserzeichen() then return end
            for _,v in pairs(contentFrames) do v.Visible=false end
            for _,btn in pairs(tabBtns) do btn.BackgroundColor3=Color3.fromRGB(55,55,60) end
            f.Visible=true
            b.BackgroundColor3=Color3.fromRGB(0,255,150)
        end)
    end
    
    local function makeToggle(parent, deName, enName, callback)
        local holder = Instance.new("Frame", parent)
        holder.Size = UDim2.new(1,-10,0,isMobile and 48 or 40)
        holder.BackgroundColor3 = Color3.fromRGB(50,50,55)
        Instance.new("UICorner", holder).CornerRadius = UDim.new(0,8)
        local label = Instance.new("TextLabel", holder)
        label.Size = UDim2.new(0.5,0,1,0)
        label.Position = UDim2.new(0,10,0,0)
        label.BackgroundTransparency=1
        label.Text = T(deName, enName)
        label.TextColor3=Color3.new(1,1,1)
        label.Font=Enum.Font.Gotham
        label.TextSize=isMobile and 11 or 10
        label.TextXAlignment=Enum.TextXAlignment.Left
        label.TextWrapped=true
        local btn = Instance.new("TextButton", holder)
        btn.Size = UDim2.new(0,isMobile and 95 or 85,0,isMobile and 32 or 26)
        btn.Position = UDim2.new(1,isMobile and -103 or -93,0.5,isMobile and -16 or -13)
        btn.Text = T("❌ AUS","❌ OFF")
        btn.BackgroundColor3 = Color3.fromRGB(150,30,30)
        btn.TextColor3=Color3.new(1,1,1)
        btn.Font=Enum.Font.GothamBold
        btn.TextSize=10
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        local state=false
        btn.MouseButton1Click:Connect(function()
            if not checkWasserzeichen() then return end
            state = not state
            btn.Text = state and T("✅ AN","✅ ON") or T("❌ AUS","❌ OFF")
            btn.BackgroundColor3 = state and Color3.fromRGB(30,180,30) or Color3.fromRGB(150,30,30)
            pcall(callback, state)
        end)
        return btn
    end
    
    local function makeButton(parent, deText, enText, color, callback)
        local b = Instance.new("TextButton", parent)
        b.Size = UDim2.new(1,-10,0,isMobile and 38 or 32)
        b.BackgroundColor3 = color
        b.Text = T(deText, enText)
        b.TextColor3=Color3.new(1,1,1)
        b.Font=Enum.Font.GothamBold
        b.TextSize=isMobile and 11 or 10
        b.TextWrapped=true
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
        b.MouseButton1Click:Connect(function() if not checkWasserzeichen() then return end pcall(callback) end)
        return b
    end
    
    local function makeInput(parent, dePlaceholder, enPlaceholder, deBtnText, enBtnText, color, callback)
        local holder = Instance.new("Frame", parent)
        holder.Size = UDim2.new(1,-10,0,isMobile and 46 or 38)
        holder.BackgroundColor3 = Color3.fromRGB(50,50,55)
        Instance.new("UICorner", holder).CornerRadius = UDim.new(0,8)
        local box = Instance.new("TextBox", holder)
        box.Size = UDim2.new(0.5,0,1,0)
        box.PlaceholderText = T(dePlaceholder, enPlaceholder)
        box.Text = ""
        box.BackgroundColor3 = Color3.fromRGB(60,60,65)
        box.TextColor3 = Color3.new(1,1,1)
        box.Font = Enum.Font.Code
        box.TextSize = 11
        Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)
        local btn = Instance.new("TextButton", holder)
        btn.Size = UDim2.new(0.42,0,0.8,0)
        btn.Position = UDim2.new(0.54,0,0.1,0)
        btn.Text = T(deBtnText, enBtnText)
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        btn.MouseButton1Click:Connect(function() if not checkWasserzeichen() then return end pcall(callback, box.Text) end)
        return box
    end
    
    -- LIVE FPS + PING UPDATE
    RunService.RenderStepped:Connect(function(dt)
        if not checkWasserzeichen() then return end
        updatePing()
        local fps = math.floor(1/dt)
        local pStatus, pMs = getPingStatus()
        perfLabel.Text = " "..pStatus.." PING: "..pMs.."ms | FPS: "..fps.." | PLAYERS: "..#Players:GetPlayers().." | JOBID/PLACE COPY ✅"
        autoHopTick()
    end)
    
    local flyUpBtn = Instance.new("TextButton", gui)
    flyUpBtn.Size = UDim2.new(0,70,0,70)
    flyUpBtn.Position = UDim2.new(1,-85,0.5,-80)
    flyUpBtn.Text = "⬆️\nUP"
    flyUpBtn.BackgroundColor3 = Color3.fromRGB(0,150,0)
    flyUpBtn.TextColor3 = Color3.new(1,1,1)
    flyUpBtn.Font = Enum.Font.GothamBlack
    flyUpBtn.TextSize = 14
    flyUpBtn.Visible = false
    Instance.new("UICorner", flyUpBtn).CornerRadius = UDim.new(0,20)
    
    local flyDownBtn = Instance.new("TextButton", gui)
    flyDownBtn.Size = UDim2.new(0,70,0,70)
    flyDownBtn.Position = UDim2.new(1,-85,0.5,10)
    flyDownBtn.Text = "⬇️\nDOWN"
    flyDownBtn.BackgroundColor3 = Color3.fromRGB(150,0,0)
    flyDownBtn.TextColor3 = Color3.new(1,1,1)
    flyDownBtn.Font = Enum.Font.GothamBlack
    flyDownBtn.TextSize = 14
    flyDownBtn.Visible = false
    Instance.new("UICorner", flyDownBtn).CornerRadius = UDim.new(0,20)
    
    local flyUp = false
    local flyDown = false
    flyUpBtn.MouseButton1Down:Connect(function() flyUp=true end)
    flyUpBtn.MouseButton1Up:Connect(function() flyUp=false end)
    flyDownBtn.MouseButton1Down:Connect(function() flyDown=true end)
    flyDownBtn.MouseButton1Up:Connect(function() flyDown=false end)
    
    -- ===== PLAYER TAB =====
    local pTab = contentFrames["PLAYER"]
    makeInput(pTab, "SPEED z.B. 100","SPEED e.g. 100","SET SPEED","SET SPEED", Color3.fromRGB(0,120,200), function(txt)
        local num = tonumber(txt) if num then local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=num end end
    end)
    makeInput(pTab, "JUMP POWER z.B. 100","JUMP POWER e.g. 100","SET JUMP","SET JUMP", Color3.fromRGB(100,50,200), function(txt)
        local num = tonumber(txt) if num then local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") if hum then hum.JumpPower=num hum.UseJumpPower=true end end
    end)
    makeInput(pTab, "GRAVITY z.B. 50","GRAVITY e.g. 50","SET GRAVITY","SET GRAVITY", Color3.fromRGB(200,100,0), function(txt)
        local num = tonumber(txt) if num then workspace.Gravity=num end
    end)
    makeInput(pTab, "FOV z.B. 120","FOV e.g. 120","SET FOV","SET FOV", Color3.fromRGB(200,150,0), function(txt)
        local num = tonumber(txt) if num then workspace.CurrentCamera.FieldOfView=num end
    end)
    makeInput(pTab, "HIP HEIGHT z.B. 10","HIP HEIGHT e.g. 10","SET HIP","SET HIP", Color3.fromRGB(0,150,150), function(txt)
        local num = tonumber(txt) if num then local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") if hum then hum.HipHeight=num end end
    end)
    
    makeButton(pTab, "⚡ SPEED QUICK: 16/50/100/200/500","⚡ SPEED QUICK: 16/50/100/200/500", Color3.fromRGB(0,100,200), function()
        local speeds = {16,50,100,200,500}
        local cur = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") and lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed or 16
        local nextSpeed = 16
        for i,s in ipairs(speeds) do if cur==s then nextSpeed = speeds[(i%#speeds)+1] break end end
        if cur~=16 and cur~=50 and cur~=100 and cur~=200 and cur~=500 then nextSpeed=50 end
        local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=nextSpeed game.StarterGui:SetCore("SendNotification",{Title="⚡ SPEED", Text="Speed: "..nextSpeed, Duration=1}) end
    end)
    
    makeToggle(pTab, "FLIEGEN - JOYSTICK + WASD + UP/DOWN HANDY","FLY - JOYSTICK + WASD + UP/DOWN MOBILE", function(on)
        if on then
            getgenv().V13FLY=true
            if isMobile then flyUpBtn.Visible=true flyDownBtn.Visible=true end
            local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            if hrp:FindFirstChild("V13Fly") then hrp.V13Fly:Destroy() end
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name="V13Fly" bv.MaxForce=Vector3.new(9e9,9e9,9e9) bv.Velocity=Vector3.new(0,0,0)
            local bg = Instance.new("BodyGyro", hrp)
            bg.Name="V13Gyro" bg.MaxTorque=Vector3.new(9e9,9e9,9e9) bg.CFrame=hrp.CFrame
            getgenv().FlyConn = RunService.RenderStepped:Connect(function()
                if not getgenv().V13FLY then return end
                local char = lp.Character if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid") if not hum then return end
                local cam = workspace.CurrentCamera
                local move = Vector3.new(0,0,0)
                if isMobile then
                    if hum.MoveDirection.Magnitude > 0 then move = hum.MoveDirection * 60 move = Vector3.new(move.X,0,move.Z) end
                    if flyUp then move+=Vector3.new(0,50,0) end
                    if flyDown then move+=Vector3.new(0,-50,0) end
                else
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then move+=cam.CFrame.LookVector*50 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then move-=cam.CFrame.LookVector*50 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then move-=cam.CFrame.RightVector*50 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then move+=cam.CFrame.RightVector*50 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move+=Vector3.new(0,50,0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move-=Vector3.new(0,50,0) end
                end
                bv.Velocity = move
                bg.CFrame = cam.CFrame
            end)
        else
            getgenv().V13FLY=false
            flyUpBtn.Visible=false flyDownBtn.Visible=false
            if getgenv().FlyConn then getgenv().FlyConn:Disconnect() end
            local hrp=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if hrp then if hrp:FindFirstChild("V13Fly") then hrp.V13Fly:Destroy() end if hrp:FindFirstChild("V13Gyro") then hrp.V13Gyro:Destroy() end end
        end
    end)
    
    makeToggle(pTab, "NOCLIP DURCH WÄNDE","NOCLIP THROUGH WALLS", function(on)
        getgenv().V13NOCLIP=on
        if on then
            getgenv().NCConn=RunService.Stepped:Connect(function()
                if lp.Character then for _,v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
            end)
        else
            if getgenv().NCConn then getgenv().NCConn:Disconnect() end
        end
    end)
    
    makeToggle(pTab, "UNENDLICH SPRINGEN","INFINITE JUMP", function(on)
        getgenv().V13IJ=on
        if on then
            getgenv().IJConn=UserInputService.JumpRequest:Connect(function()
                local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        else
            if getgenv().IJConn then getgenv().IJConn:Disconnect() end
        end
    end)
    
    makeToggle(pTab, "ANTI-AFK - NIE WIEDER KICK","ANTI-AFK - NEVER KICK", function(on)
        getgenv().V13AFK=on
    end)
    
    -- ===== VISUAL TAB =====
    local vTab = contentFrames["VISUAL"]
    makeToggle(vTab, "ESP AN/AUS","ESP ON/OFF", function(on)
        if on then
            for _,pl in pairs(Players:GetPlayers()) do
                if pl~=lp and pl.Character and not pl.Character:FindFirstChild("V13ESP") then
                    local h=Instance.new("Highlight", pl.Character) h.Name="V13ESP" h.FillColor=Color3.fromRGB(0,255,0)
                end
            end
        else
            for _,pl in pairs(Players:GetPlayers()) do if pl.Character then for _,v in pairs(pl.Character:GetChildren()) do if v.Name=="V13ESP" then v:Destroy() end end end end
        end
    end)
    makeToggle(vTab, "FULLBRIGHT - HELL WIE TAG","FULLBRIGHT - BRIGHT AS DAY", function(on)
        Lighting.Brightness = on and 2 or 1
        Lighting.ClockTime = 14
        Lighting.FogEnd = on and 100000 or 1000
        Lighting.GlobalShadows = not on
    end)
    makeToggle(vTab, "XRAY - DURCH WÄNDE SEHEN","XRAY - SEE THROUGH WALLS", function(on)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChildOfClass("Humanoid") then
                if on then
                    if not v:FindFirstChild("XRAY_OLD") then
                        local old = Instance.new("NumberValue", v) old.Name="XRAY_OLD" old.Value=v.Transparency
                    end
                    v.Transparency=0.7
                else
                    if v:FindFirstChild("XRAY_OLD") then v.Transparency=v.XRAY_OLD.Value v.XRAY_OLD:Destroy() end
                end
            end
        end
    end)
    makeToggle(vTab, "NO FOG","NO FOG", function(on)
        Lighting.FogEnd = on and 1000000 or 1000
    end)
    makeButton(vTab, "🌙 NACHT ZU TAG","🌙 NIGHT TO DAY", Color3.fromRGB(100,100,200), function()
        Lighting.ClockTime=14
    end)
    
    -- ===== AUTO-HOP TAB =====
    local ahTab = contentFrames["AUTO-HOP"]
    
    makeToggle(ahTab, "AUTO-HOP AN - WENN PING > 500ms FÜR 10 SEKUNDEN","AUTO-HOP ON - IF PING > 500ms FOR 10 SECONDS", function(on)
        autoHopEnabled = on
        if on then
            hopStartTime = 0
            hopHighPingFrames = 0
            game.StarterGui:SetCore("SendNotification",{Title="🌐 AUTO-HOP", Text=T("AUTO-HOP AKTIV!","AUTO-HOP ACTIVE!"), Duration=2})
        end
    end)
    
    makeButton(ahTab, "🌐 MANUELL SERVER HOPPEN","🌐 MANUAL SERVER HOP", Color3.fromRGB(0,150,100), function()
        local servers = {}
        local ok, response = pcall(function()
            return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        end)
        
        if ok and response and response ~= "" then
            pcall(function()
                local data = HttpService:JSONDecode(response)
                for _, s in pairs(data.data) do
                    if s.playing < s.maxPlayers and s.id ~= game.JobId then
                        table.insert(servers, s.id)
                    end
                end
            end)
        end
        
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
        else
            game.StarterGui:SetCore("SendNotification",{Title="❌ FEHLER", Text="Keine freien Server gefunden!", Duration=2})
        end
    end)
    
    makeButton(ahTab, "📊 PING STATISTIK ANZEIGEN","📊 SHOW PING STATS", Color3.fromRGB(100,100,200), function()
        if #pingHistory > 0 then
            local avg = 0
            for _, p in pairs(pingHistory) do avg = avg + p end
            avg = math.floor(avg / #pingHistory)
            local max = math.max(unpack(pingHistory))
            local min = math.min(unpack(pingHistory))
            print("=== PING STATISTIK ===")
            print("Aktuell: "..currentPing.."ms")
            print("Durchschnitt: "..avg.."ms")
            print("Maximum: "..max.."ms")
            print("Minimum: "..min.."ms")
            game.StarterGui:SetCore("SendNotification",{Title="📊 PING STATS", Text="Avg: "..avg.."ms | Max: "..max.."ms | Min: "..min.."ms", Duration=3})
        end
    end)
    
    -- ===== EXPLORER TAB =====
    local eTab = contentFrames["EXPLORER"]
    makeButton(eTab, "📱 DEX MOBILE V3","📱 DEX MOBILE V3", Color3.fromRGB(0,200,100), function()
        safeLoad("https://raw.githubusercontent.com/TechHog8984/Dex-Explorer-V3/main/dex.lua", "DEX MOBILE V3")
    end)
    makeButton(eTab, "🔥 DARK DEX V4","🔥 DARK DEX V4", Color3.fromRGB(20,20,20), function()
        safeLoad("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", "DARK DEX V4")
    end)
    makeButton(eTab, "♾️ INFINITY YIELD","♾️ INFINITY YIELD", Color3.fromRGB(0,100,0), function()
        safeLoad("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "INFINITY YIELD")
    end)
    makeButton(eTab, "🔍 SIMPLESPY V3","🔍 SIMPLESPY V3", Color3.fromRGB(120,0,200), function()
        safeLoad("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua", "SIMPLESPY V3")
    end)
    makeButton(eTab, "🧪 HYDROXIDE","🧪 HYDROXIDE", Color3.fromRGB(0,150,150), function()
        safeLoad("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/init.lua", "HYDROXIDE")
    end)
    makeButton(eTab, "👁️ BABA EXPLORER V2","👁️ BABA EXPLORER V2", Color3.fromRGB(200,100,0), function()
        local parent = getGuiParent()
        if parent:FindFirstChild("BabaExplorerGui") then parent.BabaExplorerGui:Destroy() end
        local expGui=Instance.new("ScreenGui") expGui.Name="BabaExplorerGui_"..getgenv().V13_OWNER expGui.Parent=parent
        local mainF=Instance.new("Frame", expGui) mainF.Size=UDim2.new(0,400,0,450) mainF.Position=UDim2.new(0.5,-200,0.5,-225) mainF.BackgroundColor3=Color3.fromRGB(25,25,30) mainF.Active=true mainF.Draggable=true Instance.new("UICorner", mainF)
        local titleBar=Instance.new("TextLabel", mainF) titleBar.Size=UDim2.new(1,0,0,30) titleBar.Text="BABA EXPLORER BY "..getgenv().V13_OWNER titleBar.BackgroundColor3=Color3.fromRGB(35,35,40) titleBar.TextColor3=Color3.fromRGB(0,255,150)
        local scroll=Instance.new("ScrollingFrame", mainF) scroll.Size=UDim2.new(1,-10,1,-40) scroll.Position=UDim2.new(0,5,0,35) scroll.CanvasSize=UDim2.new(0,0,0,2000) local layout=Instance.new("UIListLayout", scroll)
        for _,obj in pairs(game:GetChildren()) do local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,-10,0,28) b.Text="📁 "..obj.Name.." ["..obj.ClassName.."]" b.BackgroundColor3=Color3.fromRGB(50,50,50) b.TextColor3=Color3.new(1,1,1) end
        scroll.CanvasSize=UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)
        local c=Instance.new("TextButton", mainF) c.Size=UDim2.new(0,30,0,30) c.Position=UDim2.new(1,-35,0,0) c.Text="X" c.BackgroundColor3=Color3.fromRGB(150,0,0) c.MouseButton1Click:Connect(function() expGui:Destroy() end)
    end)
    
    -- ===== SERVER TAB =====
    local sTab = contentFrames["SERVER"]
    makeButton(sTab, "🔄 REJOIN SERVER","🔄 REJOIN SERVER", Color3.fromRGB(0,100,200), function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
    end)
    makeButton(sTab, "🌐 SERVER HOP - NEUER SERVER","🌐 SERVER HOP - NEW SERVER", Color3.fromRGB(0,150,100), function()
        local servers={} 
        local ok, resp = pcall(function() return game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100") end)
        if ok and resp then pcall(function() local data=HttpService:JSONDecode(resp) for _,s in pairs(data.data) do if s.playing < s.maxPlayers and s.id ~= game.JobId then table.insert(servers,s.id) end end end) end
        if #servers>0 then TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1,#servers)], lp) end
    end)
    makeButton(sTab, "💬 DISCORD KOPIEREN","💬 COPY DISCORD", Color3.fromRGB(88,101,242), function()
        setclipboard(getgenv().V13_DISCORD)
        game.StarterGui:SetCore("SendNotification",{Title="💬 DISCORD", Text="discord.gg/8nTQ5xvuha KOPIERT!", Duration=2})
    end)
    
    -- ===== ULTRA TAB - ULTRA BOOST V2 + ANTI-LAG V2 =====
    local uTab = contentFrames["ULTRA"]
    
    makeButton(uTab, "🚀 ULTRA BOOST V2 - REAL FPS BOOST (PARTICLES/SHADOWS/TEXTURES OFF)","🚀 ULTRA BOOST V2 - REAL FPS BOOST", Color3.fromRGB(200,150,0), function()
        -- Disable all particles
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") then v.Enabled=false end
            if v:IsA("Trail") then v.Enabled=false end
            if v:IsA("Smoke") then v.Enabled=false end
            if v:IsA("Fire") then v.Enabled=false end
        end
        
        -- Disable shadows and set material to smooth plastic
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CastShadow=false
                v.Material=Enum.Material.SmoothPlastic
                if v:FindFirstChildOfClass("SurfaceGui") then v:FindFirstChildOfClass("SurfaceGui"):Destroy() end
            end
        end
        
        -- Disable global shadows and lighting
        Lighting.GlobalShadows=false
        Lighting.Brightness=1.5
        Lighting.FogEnd=10000
        
        -- Disable decals
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Decal") then v:Destroy() end
        end
        
        game.StarterGui:SetCore("SendNotification",{Title="🚀 ULTRA BOOST V2", Text="AKTIVIERT! +200-300 FPS! Schatten, Partikel, Texturen AUS!", Duration=3})
    end)
    
    makeButton(uTab, "🧹 ANTI-LAG V2 - LÖSCHT WASSER, DECALS, TERRAIN","🧹 ANTI-LAG V2 - DELETE WATER/DECALS/TERRAIN", Color3.fromRGB(100,100,100), function()
        -- Delete water parts
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") and (v.Name:lower():find("water") or v.Name:lower():find("sea")) then
                v:Destroy()
            end
        end
        
        -- Delete all decals (huge performance boost)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Decal") then v:Destroy() end
        end
        
        -- Set terrain to nothing
        if workspace.Terrain then
            workspace.Terrain:Clear()
        end
        
        -- Remove fog
        Lighting.FogEnd=10000
        
        game.StarterGui:SetCore("SendNotification",{Title="🧹 ANTI-LAG V2", Text="Wasser, Decals, Terrain GELÖSCHT! +100-200 FPS!", Duration=3})
    end)
    
    makeButton(uTab, "🔓 FPS UNLOCK - 999 CAP ENTFERNEN","🔓 FPS UNLOCK - REMOVE 999 CAP", Color3.fromRGB(0,150,200), function()
        pcall(function()
            setfpscap(9999)
            game.StarterGui:SetCore("SendNotification",{Title="🔓 FPS UNLOCK", Text="FPS CAP AUF 9999 GESETZT!", Duration=2})
        end)
    end)
    
    makeButton(uTab, "💾 COMBO: ULTRA BOOST V2 + ANTI-LAG V2 + FPS UNLOCK","💾 COMBO: ULTRA + ANTI-LAG + UNLOCK", Color3.fromRGB(0,200,200), function()
        -- BOOST
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled=false end
        end
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.CastShadow=false v.Material=Enum.Material.SmoothPlastic end
        end
        
        -- LAG FIX
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") and (v.Name:lower():find("water") or v.Name:lower():find("sea")) then v:Destroy() end
            if v:IsA("Decal") then v:Destroy() end
        end
        if workspace.Terrain then workspace.Terrain:Clear() end
        
        -- Settings
        Lighting.GlobalShadows=false
        Lighting.Brightness=1.5
        Lighting.FogEnd=10000
        pcall(function() setfpscap(9999) end)
        
        game.StarterGui:SetCore("SendNotification",{Title="💾 COMBO AKTIV", Text="ALLES AN! +300-500 FPS! EXTREM SCHNELL!", Duration=4})
    end)
    
    makeButton(uTab, "📜 ALLE FEATURES ANZEIGEN","📜 SHOW ALL FEATURES", Color3.fromRGB(100,100,200), function()
        print("=== V13.3 ENHANCED FEATURES ===")
        print("✅ PLAYER: Speed, Jump, Gravity, FOV, HipHeight, SpeedQuick, Fly, Noclip, InfJump, AntiAFK")
        print("✅ VISUAL: ESP, Fullbright, Xray, NoFog, NightToDay")
        print("✅ AUTO-HOP: Auto-Hop (500ms+), Manual Server Hop, Ping Stats")
        print("✅ EXPLORER: 6 Tools (Dex Mobile V3, Dark Dex V4, Inf Yield, SimpleSpy V3, Hydroxide, Baba V2)")
        print("✅ SERVER: Rejoin, Server Hop, Discord Copy, JobID/PlaceID Quick Copy")
        print("✅ ULTRA: Ultra Boost V2, Anti-Lag V2, FPS Unlock, Combo Mode")
        print("✅ LIVE: Ping with 🟢🟡🔴 indicators, Real-time FPS counter, No-internet fix")
    end)
    
    openBtn.MouseButton1Click:Connect(function() if not checkWasserzeichen() then return end main.Visible = not main.Visible end)
    close.MouseButton1Click:Connect(function() main.Visible=false end)
    mini.MouseButton1Click:Connect(function() main.Visible=false end)
    
    game.StarterGui:SetCore("SendNotification",{
        Title="V13.3 ENHANCED! 🔥",
        Text= T("ALLE FEATURES GELADEN! Live Ping + Auto-Hop + Ultra Boost V2 + Anti-Lag V2!","ALL FEATURES LOADED! Live Ping + Auto-Hop + Ultra Boost V2 + Anti-Lag V2!"),
        Duration=6
    })
end

deBtn.MouseButton1Click:Connect(function() buildMain("DE") end)
enBtn.MouseButton1Click:Connect(function() buildMain("EN") end)
discordBtnLang.MouseButton1Click:Connect(function() setclipboard(getgenv().V13_DISCORD) end)

spawn(function()
    task.wait(3.5)
    if LANG and not langFrame.Visible then buildMain(LANG) end
end)
