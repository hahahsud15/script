-- V1 HANDY EDITION - 2026 REAL MOBILE OPTIMIZED
-- Von hahahsud15 - Für Handy / Delta Mobile

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local parent
pcall(function() parent = gethui() end)
if not parent then parent = LP:WaitForChild("PlayerGui") end
if parent:FindFirstChild("V1_HANDY") then parent.V1_HANDY:Destroy() end

local gui = Instance.new("ScreenGui", parent)
gui.Name = "V1_HANDY"
gui.ResetOnSpawn = false

-- MAIN - HANDY GROSS
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.92, 0, 0.85, 0)
main.Position = UDim2.new(0.04, 0, 0.08, 0)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderColor3 = Color3.fromRGB(0,255,100)
main.BorderSizePixel = 3
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "V1 HANDY - hahahsud15"
title.BackgroundColor3 = Color3.fromRGB(0,200,80)
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1,0,1,-45)
scroll.Position = UDim2.new(0,0,0,45)
scroll.BackgroundColor3 = Color3.fromRGB(15,15,15)
scroll.CanvasSize = UDim2.new(0,0,0,900)
scroll.ScrollBarThickness = 10

-- OPEN / CLOSE BUTTON MEGA GROSS FÜR HANDY
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,120,0,55)
toggle.Position = UDim2.new(0,5,0,5)
toggle.Text = "V1\nOPEN"
toggle.BackgroundColor3 = Color3.fromRGB(0,255,100)
toggle.TextColor3 = Color3.new(0,0,0)
toggle.TextScaled = true
toggle.Font = Enum.Font.GothamBlack
toggle.Active = true
toggle.Draggable = true
toggle.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

function makeSection(text, y)
    local l = Instance.new("TextLabel", scroll)
    l.Size = UDim2.new(1,0,0,30)
    l.Position = UDim2.new(0,0,0,y)
    l.Text = text
    l.BackgroundColor3 = Color3.fromRGB(0,200,80)
    l.TextColor3 = Color3.new(1,1,1)
    l.TextScaled = true
    l.Font = Enum.Font.GothamBold
    return l
end

function makeBtn(txt, y, color, cb)
    local b = Instance.new("TextButton", scroll)
    b.Size = UDim2.new(0.46,0,0,48) -- HANDY GROSS!
    if y%2==0 then b.Position = UDim2.new(0.02,0,0,y) else b.Position = UDim2.new(0.52,0,0,y-52) end
    b.Text = txt
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1,1,1)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(cb)
    b.TouchTap:Connect(cb)
    return b
end

-- ================= 1. BEWEGUNG =================
makeSection("1. BEWEGUNG", 5)

-- FLY 2026 MIT LinearVelocity (killt nicht)
local flying = false
local flySpeed = 70
makeBtn("FLY ON/OFF", 40, Color3.fromRGB(0,120,255), function()
    flying = not flying
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if flying then
        local att = Instance.new("Attachment", hrp)
        att.Name = "FLY_ATT"
        local lv = Instance.new("LinearVelocity", hrp)
        lv.Name = "FLY_VEL"
        lv.Attachment0 = att
        lv.MaxForce = math.huge
        lv.VectorVelocity = Vector3.new(0,0,0)
        spawn(function()
            while flying and hrp:FindFirstChild("FLY_VEL") do
                local move = Vector3.new(0,0,0)
                local hum = LP.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    move = Vector3.new(hum.MoveDirection.X, 0, hum.MoveDirection.Z)
                    if UIS:IsKeyDown(Enum.KeyCode.Space) or hum.Jump then move = move + Vector3.new(0,1.2,0) end
                end
                -- Handy Joystick geht über MoveDirection!
                local cam = workspace.CurrentCamera.CFrame
                local final = (cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z)) + Vector3.new(0,move.Y,0)) * flySpeed
                if final.Magnitude < 2 then final = Vector3.new(0,0,0) end
                hrp.FLY_VEL.VectorVelocity = final
                RS.Heartbeat:Wait()
            end
        end)
    else
        if hrp:FindFirstChild("FLY_VEL") then hrp.FLY_VEL:Destroy() end
        if hrp:FindFirstChild("FLY_ATT") then hrp.FLY_ATT:Destroy() end
    end
end)

-- SPEED BOX FÜR HANDY
local speedBox = Instance.new("TextBox", scroll)
speedBox.Size = UDim2.new(0.46,0,0,48)
speedBox.Position = UDim2.new(0.02,0,0,145)
speedBox.Text = "80"
speedBox.PlaceholderText = "Speed"
speedBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.TextScaled = true
speedBox.Parent = scroll

makeBtn("SET SPEED", 145, Color3.fromRGB(0,150,150), function()
    local s = tonumber(speedBox.Text)
    if s and LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
        LP.Character.Humanoid.WalkSpeed = s
    end
end)

-- NOCLIP 2026
_G.noclip = false
RS.Stepped:Connect(function()
    if _G.noclip and LP.Character then
        for _,v in pairs(LP.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
        end
    end
end)
makeBtn("NOCLIP", 200, Color3.fromRGB(100,0,150), function()
    _G.noclip = not _G.noclip
end)

-- INFINITE JUMP
_G.infJump = false
UIS.JumpRequest:Connect(function()
    if _G.infJump and LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
        LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
makeBtn("INF JUMP", 200, Color3.fromRGB(0,180,0), function()
    _G.infJump = not _G.infJump
end)

-- HIGH JUMP
makeBtn("HIGH JUMP x2", 255, Color3.fromRGB(200,100,0), function()
    if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
        LP.Character.Humanoid.JumpPower = 150
        LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.5)
        LP.Character.Humanoid.JumpPower = 50
    end
end)

-- ================= 2. SEHEN =================
makeSection("2. SEHEN", 320)

makeBtn("ESP / WALLHACK", 355, Color3.fromRGB(200,0,100), function()
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and not p.Character:FindFirstChild("V1_ESP") then
            local hl = Instance.new("Highlight", p.Character)
            hl.Name = "V1_ESP"
            hl.FillColor = Color3.fromRGB(255,0,0)
            hl.OutlineColor = Color3.fromRGB(255,255,0)
            hl.FillTransparency = 0.4
            hl.OutlineTransparency = 0
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
    end
end)

makeBtn("ESP OFF", 355, Color3.fromRGB(80,0,40), function()
    for _,p in pairs(Players:GetPlayers()) do
        if p.Character then
            for _,v in pairs(p.Character:GetChildren()) do
                if v.Name == "V1_ESP" then v:Destroy() end
            end
        end
    end
end)

local fullbright = false
makeBtn("FULLBRIGHT", 410, Color3.fromRGB(255,255,0), function()
    fullbright = not fullbright
    if fullbright then
        Lighting.Brightness = 5
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
    else
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = true
    end
end)

-- ================= 3. CLIENT =================
makeSection("3. CLIENT", 475)

-- ANTI-AFK 2026
makeBtn("ANTI-AFK ON", 510, Color3.fromRGB(0,100,0), function()
    pcall(function()
        local vu = game:FindService("VirtualUser")
        LP.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end)
end)

-- FPS INFOS
local fpsLabel = Instance.new("TextLabel", scroll)
fpsLabel.Size = UDim2.new(0.96,0,0,50)
fpsLabel.Position = UDim2.new(0.02,0,0,570)
fpsLabel.BackgroundColor3 = Color3.fromRGB(30,30,30)
fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
fpsLabel.Text = "FPS: ... | PING: ..."
fpsLabel.TextScaled = true
fpsLabel.Font = Enum.Font.Code

spawn(function()
    while true do
        local fps = math.floor(1/RS.RenderStepped:Wait())
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        fpsLabel.Text = "FPS: "..fps.." | PING: "..math.floor(ping).." ms | V1 HANDY"
        wait(1)
    end
end)

makeBtn("FPS BOOST", 630, Color3.fromRGB(80,80,80), function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic v.Reflectance = 0 end
        if v:IsA("Decal") then v.Transparency = 1 end
    end
    Lighting.GlobalShadows = false
end)

print("✅ V1 HANDY LOADED - OPTIMIERT FÜR DELTA MOBILE")
