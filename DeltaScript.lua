-- V12 ULTIMATE BABA by hahahsud15 - 2026 KRASSESTES UNIVERSAL SCRIPT
-- Watermark: hahahsud15_ULTIMATE_2026_BABA_V12
-- Features: Echte AN/AUS Buttons GRÜN/ROT, DE/EN, FPS/PING/MS, Universal Explorer BABA, Infinity Yield

if getgenv().V12_LOADED then getgenv().V12_LOADED:Destroy() end
getgenv().V12_WATERMARK = "hahahsud15_ULTIMATE_2026_BABA_V12"
print("V12 by "..getgenv().V12_WATERMARK.." GELADEN!")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local lp = Players.LocalPlayer

-- Anti-AFK IMMER AN - WATERMARK SAFE
local VirtualUser = game:GetService("VirtualUser")
lp.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "V12_ULTIMATE_BABA"
gui.ResetOnSpawn = false
gui.Parent = getgenv().gethui and gethui() or game.CoreGui
getgenv().V12_LOADED = gui

-- Kleiner OPEN Button 50x50
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,50,0,50)
openBtn.Position = UDim2.new(0,20,0.5,-25)
openBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
openBtn.Text = "V12"
openBtn.TextColor3 = Color3.fromRGB(0,255,150)
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextSize = 14
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,12)
local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = Color3.fromRGB(0,255,150)
openStroke.Thickness = 2

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,750,0,520)
main.Position = UDim2.new(0.5,-375,0.5,-260)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(0,255,150)
mainStroke.Thickness = 2

-- Title Bar
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.Text = "  V12 ULTIMATE BABA | by hahahsud15 | 2026 KRASSESTES SCRIPT"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", title).CornerRadius = UDim.new(0,16)

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(150,30,30)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)

-- FPS / PING Label OBEN
local perfLabel = Instance.new("TextLabel", main)
perfLabel.Size = UDim2.new(0,250,0,20)
perfLabel.Position = UDim2.new(0,10,0,45)
perfLabel.BackgroundTransparency = 1
perfLabel.Text = "FPS: 0 | PING: 0ms | WATERMARK: hahahsud15"
perfLabel.TextColor3 = Color3.fromRGB(0,255,150)
perfLabel.Font = Enum.Font.Code
perfLabel.TextSize = 11
perfLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Tab Buttons
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1,0,0,35)
tabFrame.Position = UDim2.new(0,0,0,65)
tabFrame.BackgroundTransparency = 1

local tabs = {"PLAYER","VISUAL","WELT","EXPLORER","SERVER","PERFORMANCE"}
local tabBtns = {}
local contentFrames = {}

for i,name in ipairs(tabs) do
    local b = Instance.new("TextButton", tabFrame)
    b.Size = UDim2.new(0,110,0,30)
    b.Position = UDim2.new(0,10 + (i-1)*120,0,0)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 11
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    tabBtns[name]=b
    
    local f = Instance.new("ScrollingFrame", main)
    f.Size = UDim2.new(1,-20,1,-110)
    f.Position = UDim2.new(0,10,0,105)
    f.BackgroundColor3 = Color3.fromRGB(20,20,20)
    f.Visible = (i==1)
    f.CanvasSize = UDim2.new(0,0,0,800)
    f.ScrollBarThickness = 4
    Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)
    local layout = Instance.new("UIListLayout", f)
    layout.Padding = UDim.new(0,8)
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

-- ECHTE TOGGLE FUNCTION GRÜN/ROT
local function makeToggle(parent, deName, enName, callback)
    local holder = Instance.new("Frame", parent)
    holder.Size = UDim2.new(1,-20,0,40)
    holder.BackgroundColor3 = Color3.fromRGB(30,30,30)
    holder.LayoutOrder = #parent:GetChildren()
    Instance.new("UICorner", holder).CornerRadius = UDim.new(0,8)
    
    local label = Instance.new("TextLabel", holder)
    label.Size = UDim2.new(0.6,0,1,0)
    label.Position = UDim2.new(0,10,0,0)
    label.BackgroundTransparency=1
    label.Text = deName.." / "..enName
    label.TextColor3=Color3.new(1,1,1)
    label.Font=Enum.Font.Gotham
    label.TextSize=12
    label.TextXAlignment=Enum.TextXAlignment.Left
    
    local btn = Instance.new("TextButton", holder)
    btn.Size = UDim2.new(0,110,0,28)
    btn.Position = UDim2.new(1,-120,0.5,-14)
    btn.Text = "❌ AUS / OFF"
    btn.BackgroundColor3 = Color3.fromRGB(150,30,30)
    btn.TextColor3=Color3.new(1,1,1)
    btn.Font=Enum.Font.GothamBold
    btn.TextSize=11
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
    
    local state=false
    btn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            btn.Text="✅ AN / ON"
            btn.BackgroundColor3=Color3.fromRGB(30,180,30)
        else
            btn.Text="❌ AUS / OFF"
            btn.BackgroundColor3=Color3.fromRGB(150,30,30)
        end
        pcall(callback, state)
    end)
    return btn
end

local function makeButton(parent, text, color, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-20,0,36)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3=Color3.new(1,1,1)
    b.Font=Enum.Font.GothamBold
    b.TextSize=12
    b.LayoutOrder = #parent:GetChildren()
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.MouseButton1Click:Connect(function() pcall(callback) end)
    return b
end

-- FPS + PING SYSTEM
local fps=0
local last=0
RunService.RenderStepped:Connect(function(dt)
    fps = math.floor(1/dt)
    local ping = "--"
    pcall(function()
        ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    perfLabel.Text = "FPS: "..fps.." | PING: "..ping.."ms | SERVER: "..#Players:GetPlayers().."/"..Players.MaxPlayers.." | "..getgenv().V12_WATERMARK
end)

-- PLAYER TAB
local pTab = contentFrames["PLAYER"]
makeToggle(pTab, "FLIEGEN", "FLY", function(on)
    if on then
        getgenv().V12FLY=true
        local char=lp.Character
        local hrp=char:FindFirstChild("HumanoidRootPart")
        local bv=Instance.new("BodyVelocity", hrp)
        bv.Name="V12Fly"
        bv.Velocity=Vector3.new(0,0,0)
        bv.MaxForce=Vector3.new(9e9,9e9,9e9)
        RunService.RenderStepped:Connect(function()
            if not getgenv().V12FLY then return end
            local cam=workspace.CurrentCamera
            local move=Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move+=cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move-=cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move-=cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move+=cam.CFrame.RightVector end
            bv.Velocity=move*60
        end)
    else
        getgenv().V12FLY=false
        local hrp=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if hrp and hrp:FindFirstChild("V12Fly") then hrp.V12Fly:Destroy() end
    end
end)

makeToggle(pTab, "NOCLIP", "NOCLIP", function(on)
    getgenv().V12NOCLIP=on
    if on then
        getgenv().NCConn=RunService.Stepped:Connect(function()
            if lp.Character then
                for _,v in pairs(lp.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end
        end)
    else
        if getgenv().NCConn then getgenv().NCConn:Disconnect() end
    end
end)

makeToggle(pTab, "UNENDLICH SPRINGEN", "INF JUMP", function(on)
    getgenv().V12IJ=on
    if on then
        getgenv().IJConn=UserInputService.JumpRequest:Connect(function()
            if getgenv().V12IJ then lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    else
        if getgenv().IJConn then getgenv().IJConn:Disconnect() end
    end
end)

makeButton(pTab, "SPEED 16 / 50 / 100", Color3.fromRGB(0,120,200), function()
    local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        if hum.WalkSpeed==16 then hum.WalkSpeed=50 elseif hum.WalkSpeed==50 then hum.WalkSpeed=100 else hum.WalkSpeed=16 end
    end
end)

makeButton(pTab, "GODMODE AN/AUS", Color3.fromRGB(200,50,50), function()
    local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.Health=hum.MaxHealth end
end)

-- VISUAL TAB
local vTab = contentFrames["VISUAL"]
makeToggle(vTab, "ESP", "ESP", function(on)
    getgenv().V12ESP=on
    if on then
        for _,pl in pairs(Players:GetPlayers()) do
            if pl~=lp then
                local h=Instance.new("Highlight")
                h.Name="V12ESP"
                h.FillTransparency=0.5
                h.OutlineColor=Color3.fromRGB(0,255,0)
                h.Parent=pl.Character
            end
        end
        Players.PlayerAdded:Connect(function(pl)
            pl.CharacterAdded:Connect(function(char)
                if getgenv().V12ESP then task.wait(1)
                    local h=Instance.new("Highlight")
                    h.Name="V12ESP"
                    h.Parent=char
                end
            end)
        end)
    else
        for _,pl in pairs(Players:GetPlayers()) do
            if pl.Character then
                for _,v in pairs(pl.Character:GetChildren()) do if v.Name=="V12ESP" then v:Destroy() end end
            end
        end
    end
end)

makeToggle(vTab, "FULLBRIGHT", "FULLBRIGHT", function(on)
    if on then
        Lighting.Brightness=2
        Lighting.ClockTime=14
        Lighting.FogEnd=100000
    else
        Lighting.Brightness=1
        Lighting.ClockTime=14
        Lighting.FogEnd=100000
    end
end)

makeToggle(vTab, "XRAY / DURCH WÄNDE SEHEN", "XRAY", function(on)
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChildOfClass("Humanoid") then
            if on then
                v.LocalTransparencyModifier=0.7
            else
                v.LocalTransparencyModifier=0
            end
        end
    end
end)

-- WELT TAB
local wTab = contentFrames["WELT"]
makeButton(wTab, "ANTI-LAG - LAG ENTFERNEN / REMOVE LAG", Color3.fromRGB(80,80,80), function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled=false
        end
    end
    Lighting.GlobalShadows=false
end)

makeToggle(wTab, "KEIN NEBEL", "NO FOG", function(on)
    Lighting.FogEnd = on and 100000 or 500
end)

makeToggle(wTab, "SCHWERKRAFT 0", "GRAVITY 0", function(on)
    workspace.Gravity = on and 0 or 196.2
end)

makeButton(wTab, "TAG / NACHT", Color3.fromRGB(100,100,0), function()
    Lighting.ClockTime = Lighting.ClockTime>12 and 0 or 14
end)

-- EXPLORER TAB - KRASSESTE UNIVERSAL
local eTab = contentFrames["EXPLORER"]
makeButton(eTab, "🔥 DARK DEX V4 - KRASSESTER EXPLORER", Color3.fromRGB(0,0,0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

makeButton(eTab, "🔍 SIMPLESPY - REMOTE SPY BABA", Color3.fromRGB(120,0,200), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuff/EXMAPI/main/SimpleSpyMobile.lua"))()
end)

makeButton(eTab, "♾️ INFINITY YIELD FE - BEST ADMIN", Color3.fromRGB(0,100,0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

makeButton(eTab, "🧪 HYDROXIDE REMOTE SPY - 2026 META", Color3.fromRGB(0,150,150), function()
    local owner = "Upbolt"
    local branch = "revision"
    local function webImport(file) return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/src/%s.lua"):format(owner, branch, file)), file..'.lua')() end
    webImport("init")
    webImport("ui/main")
end)

makeButton(eTab, "👁️ UNIVERSAL EXPLORER BABA - EIGENES BABA EXPLORER", Color3.fromRGB(200,100,0), function()
    if getgenv().BABA_EXPLORER then getgenv().BABA_EXPLORER:Destroy() end
    local expGui=Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
    getgenv().BABA_EXPLORER=expGui
    local f=Instance.new("Frame", expGui)
    f.Size=UDim2.new(0,400,0,400)
    f.Position=UDim2.new(0.5,-200,0.5,-200)
    f.BackgroundColor3=Color3.fromRGB(20,20,20)
    f.Active=true
    f.Draggable=true
    Instance.new("UICorner", f)
    local t=Instance.new("TextLabel", f)
    t.Size=UDim2.new(1,0,0,30)
    t.Text="BABA UNIVERSAL EXPLORER - hahahsud15"
    t.BackgroundColor3=Color3.fromRGB(30,30,30)
    t.TextColor3=Color3.new(1,1,1)
    Instance.new("UICorner", t)
    local scroll=Instance.new("ScrollingFrame", f)
    scroll.Size=UDim2.new(1,-10,1,-40)
    scroll.Position=UDim2.new(0,5,0,35)
    scroll.BackgroundColor3=Color3.fromRGB(15,15,15)
    scroll.CanvasSize=UDim2.new(0,0,0,2000)
    local layout=Instance.new("UIListLayout", scroll)
    layout.Padding=UDim.new(0,2)
    for _,obj in pairs(game:GetChildren()) do
        local b=Instance.new("TextButton", scroll)
        b.Size=UDim2.new(1,-10,0,25)
        b.Text="📁 "..obj.Name.." ["..obj.ClassName.."]"
        b.BackgroundColor3=Color3.fromRGB(40,40,40)
        b.TextColor3=Color3.new(1,1,1)
        b.Font=Enum.Font.Code
        b.TextSize=11
        b.TextXAlignment=Enum.TextXAlignment.Left
        Instance.new("UICorner", b).CornerRadius=UDim.new(0,4)
    end
    local close2=Instance.new("TextButton", f)
    close2.Size=UDim2.new(0,25,0,25)
    close2.Position=UDim2.new(1,-30,0,2)
    close2.Text="X"
    close2.BackgroundColor3=Color3.fromRGB(150,0,0)
    close2.TextColor3=Color3.new(1,1,1)
    Instance.new("UICorner", close2)
    close2.MouseButton1Click:Connect(function() expGui:Destroy() end)
end)

makeButton(eTab, "🔧 REMOTESPY++ NEU 2026", Color3.fromRGB(50,50,150), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))()
end)

-- SERVER TAB
local sTab = contentFrames["SERVER"]
makeButton(sTab, "📋 COPY JOBID / SERVER ID KOPIEREN", Color3.fromRGB(50,50,50), function()
    setclipboard(game.JobId)
    game.StarterGui:SetCore("SendNotification",{Title="V12 BABA",Text="JobId kopiert! "..game.JobId, Duration=3})
end)

makeButton(sTab, "🔄 REJOIN SERVER - NEU BEITRETEN", Color3.fromRGB(0,100,200), function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
end)

makeButton(sTab, "🌍 SERVER HOP - ANDERER SERVER", Color3.fromRGB(0,150,0), function()
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

makeButton(sTab, "👥 SPIELER LISTE / PLAYER LIST", Color3.fromRGB(80,0,80), function()
    for _,pl in pairs(Players:GetPlayers()) do print(pl.Name.." | "..pl.DisplayName) end
end)

-- PERFORMANCE TAB
local perfTab = contentFrames["PERFORMANCE"]
makeButton(perfTab, "🚀 FPS UNLOCK - 999 FPS FREISCHALTEN", Color3.fromRGB(0,200,0), function()
    pcall(function() setfpscap(999) end)
    game.StarterGui:SetCore("SendNotification",{Title="V12 BABA",Text="FPS auf 999 gesetzt! AN/AUS = GRÜN/ROT", Duration=3})
end)

makeToggle(perfTab, "LOW GRAPHICS - FÜR SCHLECHTEN PC", "LOW GFX", function(on)
    if on then
        for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic end end
        Lighting.GlobalShadows=false
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)

makeButton(perfTab, "🔋 PERFORMANCE BOOST +50 FPS", Color3.fromRGB(200,150,0), function()
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled=false end
    end
end)

makeButton(perfTab, "🗑️ CLEAR CACHE / CACHE LÖSCHEN", Color3.fromRGB(100,0,0), function()
    collectgarbage("collect")
end)

-- Open / Close Logic
openBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    TweenService:Create(openBtn, TweenInfo.new(0.2), {Rotation = main.Visible and 90 or 0}):Play()
end)
close.MouseButton1Click:Connect(function() main.Visible=false end)

-- Start sichtbar
main.Visible=true
game.StarterGui:SetCore("SendNotification",{
    Title="V12 ULTIMATE BABA GELADEN!",
    Text="by hahahsud15 | Echte AN/AUS Buttons | FPS/PING | Universal Explorer | 2026",
    Duration=6
})
