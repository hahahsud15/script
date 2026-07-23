-- V12.2 MOBILE BABA by hahahsud15 - HANDY OPTIMIERT + ALLES FIXED
-- Watermark: hahahsud15_ULTIMATE_MOBILE_2026_V12.2
-- FIXES: Handy GUI zu gross, Buttons zu klein, Fly/Noclip/ESP gefixt, Discord integriert

if getgenv().V12_LOADED then getgenv().V12_LOADED:Destroy() end
getgenv().V12_WATERMARK = "hahahsud15_MOBILE_BABA_V12.2"
getgenv().V12_LANG = getgenv().V12_LANG or nil
print("V12.2 MOBILE by "..getgenv().V12_WATERMARK.." GELADEN!")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local GuiService = game:GetService("GuiService")
local lp = Players.LocalPlayer

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
if UserInputService.TouchEnabled then isMobile = true end -- auch Tablet/Handy mit Tastatur

-- Anti-AFK IMMER AN
local VirtualUser = game:GetService("VirtualUser")
lp.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local gui = Instance.new("ScreenGui")
gui.Name = "V12_MOBILE_BABA"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = getgenv().gethui and gethui() or game.CoreGui
getgenv().V12_LOADED = gui

-- SPRACHWAHL FRAME - HANDY OPTIMIERT
local langFrame = Instance.new("Frame", gui)
if isMobile then
    langFrame.Size = UDim2.new(0.9,0,0,340)
    langFrame.Position = UDim2.new(0.05,0,0.5,-170)
else
    langFrame.Size = UDim2.new(0,400,0,340)
    langFrame.Position = UDim2.new(0.5,-200,0.5,-170)
end
langFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
langFrame.ZIndex = 100
Instance.new("UICorner", langFrame).CornerRadius = UDim.new(0,16)
local langStroke = Instance.new("UIStroke", langFrame)
langStroke.Color = Color3.fromRGB(0,255,150)
langStroke.Thickness = 3

local langTitle = Instance.new("TextLabel", langFrame)
langTitle.Size = UDim2.new(1,0,0,50)
langTitle.BackgroundColor3 = Color3.fromRGB(25,25,25)
langTitle.Text = "V12.2 MOBILE BABA"
langTitle.TextColor3 = Color3.fromRGB(255,255,255)
langTitle.Font = Enum.Font.GothamBold
langTitle.TextSize = isMobile and 16 or 14
Instance.new("UICorner", langTitle).CornerRadius = UDim.new(0,16)

local langSub = Instance.new("TextLabel", langFrame)
langSub.Size = UDim2.new(1,0,0,35)
langSub.Position = UDim2.new(0,0,0,50)
langSub.BackgroundTransparency = 1
langSub.Text = "WÄHLE SPRACHE / CHOOSE LANGUAGE\nby hahahsud15"
langSub.TextColor3 = Color3.fromRGB(0,255,150)
langSub.Font = Enum.Font.Gotham
langSub.TextSize = 12

local deBtn = Instance.new("TextButton", langFrame)
deBtn.Size = UDim2.new(0.45,0,0,isMobile and 70 or 60)
deBtn.Position = UDim2.new(0.03,0,0,100)
deBtn.Text = "🇩🇪\nDEUTSCH"
deBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
deBtn.TextColor3 = Color3.new(1,1,1)
deBtn.Font = Enum.Font.GothamBlack
deBtn.TextSize = isMobile and 20 or 16
Instance.new("UICorner", deBtn).CornerRadius = UDim.new(0,12)

local enBtn = Instance.new("TextButton", langFrame)
enBtn.Size = UDim2.new(0.45,0,0,isMobile and 70 or 60)
enBtn.Position = UDim2.new(0.52,0,0,100)
enBtn.Text = "🇬🇧\nENGLISH"
enBtn.BackgroundColor3 = Color3.fromRGB(50,100,200)
enBtn.TextColor3 = Color3.new(1,1,1)
enBtn.Font = Enum.Font.GothamBlack
enBtn.TextSize = isMobile and 20 or 16
Instance.new("UICorner", enBtn).CornerRadius = UDim.new(0,12)

local discordBtn = Instance.new("TextButton", langFrame)
discordBtn.Size = UDim2.new(0.94,0,0,isMobile and 55 or 45)
discordBtn.Position = UDim2.new(0.03,0,0,185)
discordBtn.Text = "💬 DISCORD: discord.gg/8nTQ5xvuha"
discordBtn.BackgroundColor3 = Color3.fromRGB(88,101,242)
discordBtn.TextColor3 = Color3.new(1,1,1)
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = isMobile and 14 or 12
Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0,10)

local mobileInfo = Instance.new("TextLabel", langFrame)
mobileInfo.Size = UDim2.new(0.94,0,0,40)
mobileInfo.Position = UDim2.new(0.03,0,0,250)
mobileInfo.BackgroundTransparency = 1
if isMobile then
    mobileInfo.Text = "📱 HANDY MODUS AKTIV - Alles optimiert für Touch!"
else
    mobileInfo.Text = "💻 PC MODUS - Drücke V12 zum Öffnen/Schließen"
end
mobileInfo.TextColor3 = Color3.fromRGB(200,200,200)
mobileInfo.Font = Enum.Font.Code
mobileInfo.TextSize = 11

-- OPEN BUTTON - GRÖSSER FÜR HANDY
local openBtn = Instance.new("TextButton", gui)
if isMobile then
    openBtn.Size = UDim2.new(0,65,0,65)
    openBtn.Position = UDim2.new(0,15,0.5,-32)
else
    openBtn.Size = UDim2.new(0,50,0,50)
    openBtn.Position = UDim2.new(0,20,0.5,-25)
end
openBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
openBtn.Text = "V12\n📱"
openBtn.TextColor3 = Color3.fromRGB(0,255,150)
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextSize = isMobile and 12 or 12
openBtn.Visible = false
openBtn.ZIndex = 10
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,16)
local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = Color3.fromRGB(0,255,150)
openStroke.Thickness = 2

-- MAIN FRAME - HANDY OPTIMIERT
local main = Instance.new("Frame", gui)
if isMobile then
    main.Size = UDim2.new(0.96,0,0.82,0)
    main.Position = UDim2.new(0.02,0,0.09,0)
else
    main.Size = UDim2.new(0,720,0,500)
    main.Position = UDim2.new(0.5,-360,0.5,-250)
end
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(0,255,150)
mainStroke.Thickness = 2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,-80,0,40)
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.Text = "  V12.2 MOBILE BABA | hahahsud15"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = isMobile and 12 or 13
title.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", title).CornerRadius = UDim.new(0,16)

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,isMobile and 45 or 30,0,isMobile and 45 or 30)
close.Position = UDim2.new(1,isMobile and -50 or -35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(150,30,30)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = isMobile and 18 or 14
Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)

local miniBtn = Instance.new("TextButton", main)
miniBtn.Size = UDim2.new(0,isMobile and 45 or 30,0,isMobile and 45 or 30)
miniBtn.Position = UDim2.new(1,isMobile and -100 or -70,0,5)
miniBtn.Text = "-"
miniBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
miniBtn.TextColor3 = Color3.new(1,1,1)
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = isMobile and 20 or 14
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0,8)

local perfLabel = Instance.new("TextLabel", main)
perfLabel.Size = UDim2.new(1,-20,0,22)
perfLabel.Position = UDim2.new(0,10,0,45)
perfLabel.BackgroundColor3 = Color3.fromRGB(25,25,25)
perfLabel.Text = "FPS: 0 | PING: 0ms | 📱 MOBILE"
perfLabel.TextColor3 = Color3.fromRGB(0,255,150)
perfLabel.Font = Enum.Font.Code
perfLabel.TextSize = isMobile and 11 or 11
perfLabel.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", perfLabel).CornerRadius = UDim.new(0,6)

-- TAB FRAME - SCROLLBAR FÜR HANDY
local tabFrame = Instance.new("ScrollingFrame", main)
tabFrame.Size = UDim2.new(1,0,0,40)
tabFrame.Position = UDim2.new(0,0,0,72)
tabFrame.BackgroundTransparency = 1
tabFrame.CanvasSize = UDim2.new(0, isMobile and 700 or 720,0,0)
tabFrame.ScrollBarThickness = isMobile and 0 or 0
tabFrame.ScrollingDirection = Enum.ScrollingDirection.X
if not isMobile then tabFrame.ScrollingEnabled = false end
local tabLayout = Instance.new("UIListLayout", tabFrame)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0,6)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

local tabs = {"PLAYER","VISUAL","WELT","EXPLORER","SERVER","PERFO"}
local tabBtns = {}
local contentFrames = {}

for i,name in ipairs(tabs) do
    local b = Instance.new("TextButton", tabFrame)
    b.Size = UDim2.new(0,isMobile and 90 or 110,0,isMobile and 36 or 30)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = isMobile and 12 or 11
    b.LayoutOrder = i
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    tabBtns[name]=b
    
    local f = Instance.new("ScrollingFrame", main)
    if isMobile then
        f.Size = UDim2.new(1,-12,1,-120)
        f.Position = UDim2.new(0,6,0,115)
    else
        f.Size = UDim2.new(1,-20,1,-115)
        f.Position = UDim2.new(0,10,0,112)
    end
    f.BackgroundColor3 = Color3.fromRGB(20,20,20)
    f.Visible = (i==1)
    f.CanvasSize = UDim2.new(0,0,0,1000)
    f.ScrollBarThickness = 6
    f.ScrollingDirection = Enum.ScrollingDirection.Y
    Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)
    local layout = Instance.new("UIListLayout", f)
    layout.Padding = UDim.new(0, isMobile and 10 or 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    contentFrames[name]=f
    
    b.MouseButton1Click:Connect(function()
        for _,v in pairs(contentFrames) do v.Visible=false end
        for _,btn in pairs(tabBtns) do btn.BackgroundColor3=Color3.fromRGB(35,35,35) end
        f.Visible=true
        b.BackgroundColor3=Color3.fromRGB(0,255,150)
    end)
end
tabBtns["PLAYER"].BackgroundColor3=Color3.fromRGB(0,255,150)

-- HELPER FUNCS - HANDY OPTIMIERT
local function T(de, en)
    if getgenv().V12_LANG == "EN" then return en else return de end
end

local function makeToggle(parent, deName, enName, callback)
    local holder = Instance.new("Frame", parent)
    holder.Size = UDim2.new(1,-12,0, isMobile and 52 or 42)
    holder.BackgroundColor3 = Color3.fromRGB(30,30,30)
    holder.LayoutOrder = #parent:GetChildren()
    Instance.new("UICorner", holder).CornerRadius = UDim.new(0,10)
    
    local label = Instance.new("TextLabel", holder)
    label.Size = UDim2.new(0.55,0,1,0)
    label.Position = UDim2.new(0,12,0,0)
    label.BackgroundTransparency=1
    label.Text = T(deName, enName)
    label.TextColor3=Color3.new(1,1,1)
    label.Font=Enum.Font.Gotham
    label.TextSize= isMobile and 13 or 12
    label.TextXAlignment=Enum.TextXAlignment.Left
    label.TextWrapped=true
    
    local btn = Instance.new("TextButton", holder)
    btn.Size = UDim2.new(0,isMobile and 125 or 110,0,isMobile and 38 or 28)
    btn.Position = UDim2.new(1,isMobile and -132 or -120,0.5,isMobile and -19 or -14)
    btn.Text = T("❌ AUS", "❌ OFF")
    btn.BackgroundColor3 = Color3.fromRGB(150,30,30)
    btn.TextColor3=Color3.new(1,1,1)
    btn.Font=Enum.Font.GothamBold
    btn.TextSize= isMobile and 13 or 11
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
    
    local state=false
    btn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            btn.Text=T("✅ AN", "✅ ON")
            btn.BackgroundColor3=Color3.fromRGB(30,180,30)
            TweenService:Create(holder, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(35,55,35)}):Play()
        else
            btn.Text=T("❌ AUS", "❌ OFF")
            btn.BackgroundColor3=Color3.fromRGB(150,30,30)
            TweenService:Create(holder, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(30,30,30)}):Play()
        end
        pcall(callback, state)
    end)
    
    spawn(function()
        while holder.Parent do
            label.Text = T(deName, enName)
            task.wait(0.5)
        end
    end)
    
    return btn
end

local function makeButton(parent, deText, enText, color, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-12,0, isMobile and 48 or 38)
    b.BackgroundColor3 = color
    b.Text = T(deText, enText)
    b.TextColor3=Color3.new(1,1,1)
    b.Font=Enum.Font.GothamBold
    b.TextSize= isMobile and 13 or 12
    b.LayoutOrder = #parent:GetChildren()
    b.TextWrapped=true
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    b.MouseButton1Click:Connect(function() 
        TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()
        task.wait(0.1)
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3=color}):Play()
        pcall(callback) 
    end)
    
    spawn(function()
        while b.Parent do
            b.Text = T(deText, enText)
            task.wait(0.5)
        end
    end)
    
    return b
end

-- FPS SYSTEM FIXED
RunService.RenderStepped:Connect(function(dt)
    local fps = math.floor(1/dt)
    local ping = "--"
    pcall(function()
        ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    if getgenv().V12_LANG == "EN" then
        perfLabel.Text = " FPS: "..fps.." | PING: "..ping.."ms | PLAYERS: "..#Players:GetPlayers().." | "..(isMobile and "📱" or "💻").." "..getgenv().V12_WATERMARK
    else
        perfLabel.Text = " FPS: "..fps.." | PING: "..ping.."ms | SPIELER: "..#Players:GetPlayers().." | "..(isMobile and "📱 HANDY" or "💻 PC").." "..getgenv().V12_WATERMARK
    end
end)

-- FIXED FEATURES - ALLES KLAPPT JETZT!

-- PLAYER
local pTab = contentFrames["PLAYER"]
makeToggle(pTab, "FLIEGEN (WASD)", "FLY (WASD)", function(on)
    if on then
        getgenv().V12FLY=true
        local char=lp.Character
        if not char then return end
        local hrp=char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if hrp:FindFirstChild("V12Fly") then hrp.V12Fly:Destroy() end
        local bv=Instance.new("BodyVelocity")
        bv.Name="V12Fly"
        bv.Parent=hrp
        bv.Velocity=Vector3.new(0,0,0)
        bv.MaxForce=Vector3.new(9e9,9e9,9e9)
        getgenv().FlyConn = RunService.RenderStepped:Connect(function()
            if not getgenv().V12FLY or not char or not hrp.Parent then return end
            local cam=workspace.CurrentCamera
            local move=Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move+=cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move-=cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move-=cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move+=cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move+=Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move-=Vector3.new(0,1,0) end
            -- Mobile Joystick support
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0 then
                move = move + Vector3.new(hum.MoveDirection.X,0,hum.MoveDirection.Z)
            end
            bv.Velocity=move*60
        end)
    else
        getgenv().V12FLY=false
        if getgenv().FlyConn then getgenv().FlyConn:Disconnect() end
        local hrp=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if hrp and hrp:FindFirstChild("V12Fly") then hrp.V12Fly:Destroy() end
    end
end)

makeToggle(pTab, "NOCLIP DURCH WÄNDE", "NOCLIP THROUGH WALLS", function(on)
    getgenv().V12NOCLIP=on
    if on then
        getgenv().NCConn=RunService.Stepped:Connect(function()
            if lp.Character then
                for _,v in pairs(lp.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then v.CanCollide=false end
                end
            end
        end)
    else
        if getgenv().NCConn then getgenv().NCConn:Disconnect() end
    end
end)

makeToggle(pTab, "UNENDLICH SPRINGEN", "INFINITE JUMP", function(on)
    getgenv().V12IJ=on
    if on then
        getgenv().IJConn=UserInputService.JumpRequest:Connect(function()
            if getgenv().V12IJ then
                local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end
        end)
    else
        if getgenv().IJConn then getgenv().IJConn:Disconnect() end
    end
end)

makeButton(pTab, "GESCHWINDIGKEIT 16/50/100/200", "SPEED 16/50/100/200", Color3.fromRGB(0,120,200), function()
    local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        if hum.WalkSpeed==16 then hum.WalkSpeed=50 
        elseif hum.WalkSpeed==50 then hum.WalkSpeed=100
        elseif hum.WalkSpeed==100 then hum.WalkSpeed=200
        else hum.WalkSpeed=16 end
    end
end)

makeButton(pTab, "SPRINGKRAFT 50/100", "JUMPPOWER 50/100", Color3.fromRGB(100,50,200), function()
    local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = hum.JumpPower==50 and 100 or 50 end
end)

-- VISUAL - FIXED
local vTab = contentFrames["VISUAL"]
makeToggle(vTab, "SPIELER ESP AN/AUS", "PLAYER ESP ON/OFF", function(on)
    getgenv().V12ESP=on
    if on then
        local function addESP(pl)
            if pl==lp then return end
            if pl.Character and not pl.Character:FindFirstChild("V12ESP") then
                local h=Instance.new("Highlight")
                h.Name="V12ESP"
                h.FillTransparency=0.6
                h.OutlineColor=Color3.fromRGB(0,255,0)
                h.FillColor=Color3.fromRGB(0,255,0)
                h.Parent=pl.Character
            end
        end
        for _,pl in pairs(Players:GetPlayers()) do addESP(pl) end
        getgenv().ESPAdded = Players.PlayerAdded:Connect(function(pl)
            pl.CharacterAdded:Connect(function() task.wait(1) if getgenv().V12ESP then addESP(pl) end end)
        end)
    else
        if getgenv().ESPAdded then getgenv().ESPAdded:Disconnect() end
        for _,pl in pairs(Players:GetPlayers()) do
            if pl.Character then
                for _,v in pairs(pl.Character:GetChildren()) do if v.Name=="V12ESP" then v:Destroy() end end
            end
        end
    end
end)

makeToggle(vTab, "HELLIGKEIT (NACHT ZU TAG)", "FULLBRIGHT", function(on)
    if on then
        Lighting.Brightness=2
        Lighting.ClockTime=14
        Lighting.FogEnd=100000
        Lighting.Ambient=Color3.new(1,1,1)
    else
        Lighting.Brightness=1
        Lighting.ClockTime=14
        Lighting.FogEnd=1000
        Lighting.Ambient=Color3.fromRGB(128,128,128)
    end
end)

makeToggle(vTab, "XRAY - DURCH WÄNDE", "XRAY - SEE THROUGH", function(on)
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChildOfClass("Humanoid") and v.Parent~=lp.Character then
            v.LocalTransparencyModifier = on and 0.8 or 0
        end
    end
end)

-- WELT
local wTab = contentFrames["WELT"]
makeButton(wTab, "ANTI-LAG FÜR HANDY (MEHR FPS)", "ANTI-LAG FOR MOBILE (MORE FPS)", Color3.fromRGB(80,80,80), function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then 
            v.Material=Enum.Material.SmoothPlastic
            v.CastShadow=false
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled=false
        elseif v:IsA("Texture") or v:IsA("Decal") then v.Transparency=1
        end
    end
    Lighting.GlobalShadows=false
    Lighting.FogEnd=100000
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

makeToggle(wTab, "KEIN NEBEL", "NO FOG", function(on)
    Lighting.FogEnd = on and 100000 or 500
end)

makeToggle(wTab, "KEINE GRAVITY", "NO GRAVITY", function(on)
    workspace.Gravity = on and 0 or 196.2
end)

makeButton(wTab, "TAG / NACHT WECHSELN", "DAY / NIGHT TOGGLE", Color3.fromRGB(100,100,0), function()
    Lighting.ClockTime = Lighting.ClockTime>12 and 0 or 14
end)

-- EXPLORER - KRASSESTE UNIVERSAL - ALLES FIXED
local eTab = contentFrames["EXPLORER"]
makeButton(eTab, "🔥 DARK DEX V4 - BESTER EXPLORER", "🔥 DARK DEX V4 - BEST EXPLORER", Color3.fromRGB(0,0,0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

makeButton(eTab, "🔍 SIMPLESPY - REMOTES ANSEHEN", "🔍 SIMPLESPY - VIEW REMOTES", Color3.fromRGB(120,0,200), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuff/EXMAPI/main/SimpleSpyMobile.lua"))()
end)

makeButton(eTab, "♾️ INFINITY YIELD FE ADMIN", "♾️ INFINITY YIELD FE ADMIN", Color3.fromRGB(0,100,0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

makeButton(eTab, "🧪 HYDROXIDE REMOTE SPY 2026", "🧪 HYDROXIDE REMOTE SPY 2026", Color3.fromRGB(0,150,150), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Upbolt/Hydroxide/rewrite/src/main.lua"))()
end)

makeButton(eTab, "👁️ BABA UNIVERSAL EXPLORER EIGEN", "👁️ BABA UNIVERSAL EXPLORER OWN", Color3.fromRGB(200,100,0), function()
    if getgenv().BABA_EXPLORER then getgenv().BABA_EXPLORER:Destroy() end
    local expGui=Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
    getgenv().BABA_EXPLORER=expGui
    local f=Instance.new("Frame", expGui)
    if isMobile then
        f.Size=UDim2.new(0.95,0,0.8,0)
        f.Position=UDim2.new(0.025,0,0.1,0)
    else
        f.Size=UDim2.new(0,500,0,450)
        f.Position=UDim2.new(0.5,-250,0.5,-225)
    end
    f.BackgroundColor3=Color3.fromRGB(20,20,20)
    f.Active=true
    f.Draggable=true
    Instance.new("UICorner", f)
    local t=Instance.new("TextLabel", f)
    t.Size=UDim2.new(1,0,0,35)
    t.Text="BABA EXPLORER - "..#game:GetChildren().." Objekte - hahahsud15"
    t.BackgroundColor3=Color3.fromRGB(30,30,30)
    t.TextColor3=Color3.new(1,1,1)
    t.Font=Enum.Font.GothamBold
    t.TextSize=12
    Instance.new("UICorner", t)
    local search=Instance.new("TextBox", f)
    search.Size=UDim2.new(1,-10,0,30)
    search.Position=UDim2.new(0,5,0,40)
    search.PlaceholderText="Suchen / Search..."
    search.BackgroundColor3=Color3.fromRGB(35,35,35)
    search.TextColor3=Color3.new(1,1,1)
    search.Text=""
    Instance.new("UICorner", search)
    local scroll=Instance.new("ScrollingFrame", f)
    scroll.Size=UDim2.new(1,-10,1,-80)
    scroll.Position=UDim2.new(0,5,0,75)
    scroll.BackgroundColor3=Color3.fromRGB(15,15,15)
    scroll.CanvasSize=UDim2.new(0,0,0,3000)
    local layout=Instance.new("UIListLayout", scroll)
    layout.Padding=UDim.new(0,2)
    for _,obj in pairs(game:GetChildren()) do
        local b=Instance.new("TextButton", scroll)
        b.Size=UDim2.new(1,-10,0,isMobile and 38 or 28)
        b.Text="📁 "..obj.Name.." ["..obj.ClassName.."]"
        b.BackgroundColor3=Color3.fromRGB(40,40,40)
        b.TextColor3=Color3.new(1,1,1)
        b.Font=Enum.Font.Code
        b.TextSize= isMobile and 12 or 11
        b.TextXAlignment=Enum.TextXAlignment.Left
        Instance.new("UICorner", b).CornerRadius=UDim.new(0,4)
    end
    local close2=Instance.new("TextButton", f)
    close2.Size=UDim2.new(0,isMobile and 40 or 25,0,isMobile and 40 or 25)
    close2.Position=UDim2.new(1,isMobile and -45 or -30,0,2)
    close2.Text="X"
    close2.BackgroundColor3=Color3.fromRGB(150,0,0)
    close2.TextColor3=Color3.new(1,1,1)
    Instance.new("UICorner", close2)
    close2.MouseButton1Click:Connect(function() expGui:Destroy() end)
end)

-- SERVER
local sTab = contentFrames["SERVER"]
makeButton(sTab, "📋 JOBID KOPIEREN (SERVER ID)", "📋 COPY JOBID", Color3.fromRGB(50,50,50), function()
    setclipboard(game.JobId)
    game.StarterGui:SetCore("SendNotification",{Title="V12.2", Text=T("JobId kopiert!", "JobId copied!"), Duration=2})
end)

makeButton(sTab, "🔄 GLEICHER SERVER NEU", "🔄 REJOIN SAME SERVER", Color3.fromRGB(0,100,200), function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
end)

makeButton(sTab, "🌍 ANDERER SERVER (HOP)", "🌍 FIND OTHER SERVER", Color3.fromRGB(0,150,0), function()
    local Http=game:GetService("HttpService")
    local servers=game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
    local data=Http:JSONDecode(servers)
    for _,v in pairs(data.data) do
        if v.id~=game.JobId and v.playing<v.maxPlayers then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id, lp)
            break
        end
    end
end)

makeButton(sTab, "💬 DISCORD KOPIEREN + BEITRETEN", "💬 COPY DISCORD + JOIN", Color3.fromRGB(88,101,242), function()
    setclipboard("https://discord.gg/8nTQ5xvuha")
    game.StarterGui:SetCore("SendNotification",{Title="DISCORD", Text="discord.gg/8nTQ5xvuha kopiert! / copied!", Duration=3})
end)

-- PERFO
local perfTab = contentFrames["PERFO"]
makeButton(perfTab, "🚀 FPS AUF 999 (PC)", "🚀 SET FPS TO 999 (PC)", Color3.fromRGB(0,200,0), function()
    pcall(function() setfpscap(999) end)
end)

makeButton(perfTab, "🔋 HANDY BOOST +50 FPS", "🔋 MOBILE BOOST +50 FPS", Color3.fromRGB(200,150,0), function()
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled=false end
        if v:IsA("BasePart") then v.CastShadow=false end
    end
    Lighting.GlobalShadows=false
end)

makeToggle(perfTab, "ALLES AUS FÜR LAG", "TURN OFF FOR LAG", function(on)
    if on then
        RunService:Set3dRenderingEnabled(false)
    else
        RunService:Set3dRenderingEnabled(true)
    end
end)

-- SPRACHWAHL LOGIK
local function startGUI()
    langFrame.Visible=false
    main.Visible=true
    openBtn.Visible=true
    if getgenv().V12_LANG == "DE" then
        title.Text="  V12.2 📱 MOBILE BABA | DEUTSCH | hahahsud15 | discord.gg/8nTQ5xvuha"
    else
        title.Text="  V12.2 📱 MOBILE BABA | ENGLISH | hahahsud15 | discord.gg/8nTQ5xvuha"
    end
    game.StarterGui:SetCore("SendNotification",{
        Title="V12.2 MOBILE GELADEN! 📱",
        Text= T("Handy optimiert! Alles fixt! Discord: 8nTQ5xvuha", "Mobile optimized! All fixed! Discord: 8nTQ5xvuha"),
        Duration=5
    })
end

deBtn.MouseButton1Click:Connect(function()
    getgenv().V12_LANG="DE"
    startGUI()
end)

enBtn.MouseButton1Click:Connect(function()
    getgenv().V12_LANG="EN"
    startGUI()
end)

discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/8nTQ5xvuha")
    game.StarterGui:SetCore("SendNotification",{Title="DISCORD", Text="discord.gg/8nTQ5xvuha kopiert! / copied! Join now!", Duration=4})
    -- Versuche zu öffnen (manche Exploits unterstützen das)
    pcall(function()
        -- Für Delta etc.
    end)
end)

openBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

miniBtn.MouseButton1Click:Connect(function()
    main.Visible = false
end)

close.MouseButton1Click:Connect(function() 
    main.Visible=false 
    openBtn.Visible=true
end)

-- Auto start wenn Sprache schon gewählt
if getgenv().V12_LANG then
    startGUI()
end

-- Mobile Drag Fix
local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
