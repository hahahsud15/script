-- V11 ULTIMATE UNIVERSAL by hahahsud15 - BEST UNIVERSAL 2026
-- WASSERZEICHEN: hahahsud15 IST DER GOAT - FREE FÜR ALLE
-- Features aus Google + YouTube + Infinite Yield + Dark Dex + Avocat Hub

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")

getgenv().V11_WATERMARK = "hahahsud15_ULTIMATE_2026_FREE"
getgenv().V11_CREATOR = "hahahsud15"

-- ANTI-AFK IMMER AN - AUTOMATISCH BEIM START - GEHT NIE AUS!
task.spawn(function()
    local vu = game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    print("✅ V11 ANTI-AFK IMMER AN by hahahsud15")
end)

local gui = Instance.new("ScreenGui")
gui.Name = "V11_ULTIMATE_by_hahahsud15"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- KLEINER OPEN BUTTON 50x50 - WIE DU WOLLTEST!
local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0,50,0,50)
openBtn.Position = UDim2.new(0,20,0.5,-25)
openBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
openBtn.Text = "V11"
openBtn.TextColor3 = Color3.fromRGB(0,255,255)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold
openBtn.Parent = gui
openBtn.Active = true
openBtn.Draggable = true
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1,0)
local stroke = Instance.new("UIStroke", openBtn)
stroke.Color = Color3.fromRGB(0,255,255)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 650, 0, 460)
mainFrame.Position = UDim2.new(0.5, -325, 0.5, -230)
mainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
mainFrame.Visible = false
mainFrame.Parent = gui
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0,10)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0,255,255)
mainStroke.Thickness = 2

-- TITEL MIT WASSERZEICHEN
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.Text = "  V11 ULTIMATE by hahahsud15 | BEST UNIVERSAL FREE"
title.TextColor3 = Color3.fromRGB(0,255,255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = mainFrame
Instance.new("UICorner", title)

-- TABS
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0,120,1,-40)
tabFrame.Position = UDim2.new(0,0,0,40)
tabFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
tabFrame.Parent = mainFrame

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1,-120,1,-40)
contentFrame.Position = UDim2.new(0,120,0,40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local function makeScroll(name)
    local sc = Instance.new("ScrollingFrame")
    sc.Name = name
    sc.Size = UDim2.new(1,0,1,0)
    sc.BackgroundTransparency = 1
    sc.ScrollBarThickness = 4
    sc.Visible = false
    sc.CanvasSize = UDim2.new(0,0,0,800)
    sc.Parent = contentFrame
    local list = Instance.new("UIListLayout", sc)
    list.Padding = UDim.new(0,6)
    list.SortOrder = Enum.SortOrder.LayoutOrder
    return sc
end

local playerTab = makeScroll("Player")
local visualTab = makeScroll("Visual")
local worldTab = makeScroll("World")
local utilTab = makeScroll("Util")
local explorerTab = makeScroll("Explorer")
playerTab.Visible = true

local function makeTabBtn(text, tab, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,0,40)
    b.Position = UDim2.new(0,0,0,y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(30,30,30)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.Parent = tabFrame
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _,v in pairs(contentFrame:GetChildren()) do v.Visible=false end
        tab.Visible=true
    end)
end

makeTabBtn("👤 PLAYER", playerTab, 0)
makeTabBtn("👁️ VISUAL", visualTab, 45)
makeTabBtn("🌍 WORLD", worldTab, 90)
makeTabBtn("🔧 UTIL", utilTab, 135)
makeTabBtn("🔍 EXPLORER", explorerTab, 180)

local function makeBtn(text, color, parent, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-10,0,36)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = parent
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- VARIABLES
local flyOn=false
local flySpeed=50
local flyLV, flyAtt
local noclipOn=false
local infJumpOn=false
local clickTPOn=false

-- FLY FUNCTION SMOOTH LINEARVELOCITY 2026
local function toggleFly()
    flyOn = not flyOn
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if flyOn then
        flyAtt = Instance.new("Attachment", hrp)
        flyLV = Instance.new("LinearVelocity")
        flyLV.Attachment0 = flyAtt
        flyLV.MaxForce = math.huge
        flyLV.VectorVelocity = Vector3.new(0,0,0)
        flyLV.Parent = hrp
        
        task.spawn(function()
            while flyOn and char and hrp.Parent do
                local moveDir = Vector3.new(0,0,0)
                if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir += workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir -= workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir -= workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir += workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir -= Vector3.new(0,1,0) end
                
                -- MOBILE JOYSTICK SUPPORT
                if LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    moveDir += workspace.CurrentCamera.CFrame:VectorToWorldSpace(LP.Character.Humanoid.MoveDirection)
                end
                
                if moveDir.Magnitude > 0 then
                    flyLV.VectorVelocity = moveDir.Unit * flySpeed
                else
                    flyLV.VectorVelocity = Vector3.new(0,0.1,0)
                end
                RS.Heartbeat:Wait()
            end
        end)
    else
        if flyLV then flyLV:Destroy() end
        if flyAtt then flyAtt:Destroy() end
    end
end

-- PLAYER TAB
makeBtn("✈️ FLY TOGGLE (SMOOTH)", Color3.fromRGB(0,170,255), playerTab, toggleFly)
makeBtn("⚡ SPEED 100", Color3.fromRGB(60,60,60), playerTab, function() LP.Character.Humanoid.WalkSpeed=100 end)
makeBtn("⚡ SPEED 250", Color3.fromRGB(60,60,60), playerTab, function() LP.Character.Humanoid.WalkSpeed=250 end)
makeBtn("⚡ SPEED 400 [MAX]", Color3.fromRGB(0,255,0), playerTab, function() LP.Character.Humanoid.WalkSpeed=400 end)
makeBtn("🦘 JUMPPOWER 100", Color3.fromRGB(60,60,60), playerTab, function() LP.Character.Humanoid.JumpPower=100 end)
makeBtn("🦘 JUMPPOWER 200", Color3.fromRGB(60,60,60), playerTab, function() LP.Character.Humanoid.JumpPower=200 end)
makeBtn("♾️ INF JUMP ON/OFF", Color3.fromRGB(255,165,0), playerTab, function()
    infJumpOn = not infJumpOn
    print("INF JUMP: "..tostring(infJumpOn))
end)
makeBtn("🚪 NOCLIP ON/OFF", Color3.fromRGB(150,0,150), playerTab, function() noclipOn = not noclipOn end)
makeBtn("🔄 RESET SPEED", Color3.fromRGB(100,0,0), playerTab, function() LP.Character.Humanoid.WalkSpeed=16 LP.Character.Humanoid.JumpPower=50 end)

-- INF JUMP + NOCLIP LOOPS
UIS.JumpRequest:Connect(function()
    if infJumpOn then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
RS.Stepped:Connect(function()
    if noclipOn and LP.Character then
        for _,v in pairs(LP.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then v.CanCollide=false end
        end
    end
end)

-- VISUAL TAB - BEST ESP
makeBtn("👁️ ESP ON (HIGHLIGHT)", Color3.fromRGB(255,0,0), visualTab, function()
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LP and p.Character and not p.Character:FindFirstChild("V11ESP") then
            local h = Instance.new("Highlight")
            h.Name="V11ESP"
            h.FillColor=Color3.fromRGB(255,0,0)
            h.OutlineColor=Color3.fromRGB(255,255,255)
            h.Parent=p.Character
        end
    end
end)
makeBtn("❌ ESP OFF", Color3.fromRGB(60,60,60), visualTab, function()
    for _,p in pairs(Players:GetPlayers()) do
        if p.Character then
            for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V11ESP" then v:Destroy() end end
        end
    end
end)
makeBtn("💡 FULLBRIGHT ON", Color3.fromRGB(255,255,0), visualTab, function()
    Lighting.Brightness=2
    Lighting.ClockTime=14
    Lighting.FogEnd=100000
    Lighting.GlobalShadows=false
end)
makeBtn("🌑 FULLBRIGHT OFF", Color3.fromRGB(60,60,60), visualTab, function()
    Lighting.Brightness=1
    Lighting.GlobalShadows=true
end)
makeBtn("👻 XRAY ON", Color3.fromRGB(0,255,255), visualTab, function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.LocalTransparencyModifier=0.7
        end
    end
end)
makeBtn("🧱 XRAY OFF", Color3.fromRGB(60,60,60), visualTab, function()
    for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0 end end
end)

-- WORLD TAB
makeBtn("⏰ TIME DAY", Color3.fromRGB(255,200,0), worldTab, function() Lighting.ClockTime=14 end)
makeBtn("🌙 TIME NIGHT", Color3.fromRGB(20,20,80), worldTab, function() Lighting.ClockTime=0 end)
makeBtn("🌫️ NO FOG", Color3.fromRGB(150,150,150), worldTab, function() Lighting.FogEnd=100000 end)
makeBtn("🌍 GRAVITY 0 (MOON)", Color3.fromRGB(100,100,255), worldTab, function() workspace.Gravity=0 end)
makeBtn("🌍 GRAVITY NORMAL", Color3.fromRGB(60,60,60), worldTab, function() workspace.Gravity=196.2 end)
makeBtn("🎯 CLICK TP (Klick Boden)", Color3.fromRGB(0,255,0), worldTab, function()
    local mouse = LP:GetMouse()
    mouse.Button1Down:Connect(function()
        if clickTPOn then
            LP.Character:MoveTo(mouse.Hit.p)
        end
    end)
    clickTPOn = not clickTPOn
    print("CLICK TP: "..tostring(clickTPOn))
end)

-- UTIL TAB - ANTI AFK IMMER AN
makeBtn("✅ ANTI-AFK IMMER AN (AUTO)", Color3.fromRGB(0,255,0), utilTab, function()
    game.StarterGui:SetCore("SendNotification", {Title="V11 by hahahsud15", Text="Anti-AFK ist IMMER an! Auto!", Duration=3})
end)
makeBtn("🔄 REJOIN", Color3.fromRGB(0,100,255), utilTab, function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
makeBtn("🎲 SERVER HOP", Color3.fromRGB(0,100,255), utilTab, function()
    local servers={}
    local req = game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100")
    local data = game:GetService("HttpService"):JSONDecode(req)
    for _,v in pairs(data.data) do if v.id~=game.JobId then table.insert(servers, v) end end
    if #servers>0 then TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1,#servers)].id, LP) end
end)
makeBtn("📋 COPY JOBID", Color3.fromRGB(60,60,60), utilTab, function() setclipboard(game.JobId) end)

-- EXPLORER TAB - BEST OF YOUTUBE GOOGLE
makeBtn("🔍 DARK DEX V4 (BESTER EXPLORER)", Color3.fromRGB(255,0,0), explorerTab, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_DEX/main/Dex.lua"))()
end)
makeBtn("👁️ SIMPLESPY (REMOTE SPY)", Color3.fromRGB(0,255,0), explorerTab, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
end)
makeBtn("♾️ INFINITE YIELD (500+ CMDS)", Color3.fromRGB(0,170,255), explorerTab, function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
makeBtn("🔧 HYDROXIDE (ADV SPY)", Color3.fromRGB(150,0,150), explorerTab, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/Hydroxide/main/init.lua"))()
end)
makeBtn("🗑️ GUI LÖSCHEN (ECHT)", Color3.fromRGB(255,0,0), explorerTab, function()
    if flyLV then flyLV:Destroy() end
    if flyAtt then flyAtt:Destroy() end
    gui:Destroy()
end)

-- OPEN CLOSE LOGIC
openBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- WASSERZEICHEN NOTIFICATION
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title="V11 ULTIMATE by hahahsud15",
    Text="BEST UNIVERSAL 2026 geladen! Anti-AFK immer an! Viel Spaß!",
    Duration=6
})

print("🔥 V11 ULTIMATE by hahahsud15 LOADED - FREE FOR ALL - BEST UNIVERSAL HANDY + PC")
print("💧 WASSERZEICHEN: hahahsud15 - NICHT LÖSCHEN!")
print("✅ ANTI-AFK AUTOMATISCH IMMER AN!")
print("✅ OPEN BUTTON 50x50 KLEIN!")
