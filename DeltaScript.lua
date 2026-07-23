-- V12.5 ULTRA KRASS by hahahsud15 - LOADING SCREEN + CUSTOM SPEED/JUMP INPUT + MEGA STUFF
-- NEU: Loading Screen Baba, Speed selber eingeben, Jump Power selber eingeben, mehr krasser Stuff!

if getgenv().V12_LOADED then getgenv().V12_LOADED:Destroy() end
getgenv().V12_WATERMARK = "hahahsud15_ULTRA_V12.5"
print("V12.5 ULTRA KRASS by "..getgenv().V12_WATERMARK)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local lp = Players.LocalPlayer

local isMobile = UserInputService.TouchEnabled
local LANG = getgenv().V12_LANG or nil

local VirtualUser = game:GetService("VirtualUser")
lp.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local gui = Instance.new("ScreenGui")
gui.Name = "V12_ULTRA_BABA"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = (getgenv().gethui and gethui()) or game.CoreGui
getgenv().V12_LOADED = gui

-- LOADING SCREEN - ÜBELS KRASS!
local loadFrame = Instance.new("Frame", gui)
loadFrame.Size = isMobile and UDim2.new(0,340,0,300) or UDim2.new(0,450,0,320)
loadFrame.Position = UDim2.new(0.5,-170,0.5,-150)
if not isMobile then loadFrame.Position = UDim2.new(0.5,-225,0.5,-160) end
loadFrame.BackgroundColor3 = Color3.fromRGB(20,20,25)
Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,20)
local loadStroke = Instance.new("UIStroke", loadFrame)
loadStroke.Color = Color3.fromRGB(0,255,150)
loadStroke.Thickness = 3

local loadTitle = Instance.new("TextLabel", loadFrame)
loadTitle.Size = UDim2.new(1,0,0,60)
loadTitle.BackgroundColor3 = Color3.fromRGB(30,30,35)
loadTitle.Text = "V12.5 ULTRA KRASS\nby hahahsud15"
loadTitle.TextColor3 = Color3.fromRGB(0,255,150)
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextSize = 18
Instance.new("UICorner", loadTitle).CornerRadius = UDim.new(0,20)

local loadStatus = Instance.new("TextLabel", loadFrame)
loadStatus.Size = UDim2.new(1,0,0,30)
loadStatus.Position = UDim2.new(0,0,0,70)
loadStatus.BackgroundTransparency = 1
loadStatus.Text = "🔥 LOADING BABA SCRIPTS..."
loadStatus.TextColor3 = Color3.new(1,1,1)
loadStatus.Font = Enum.Font.GothamBold
loadStatus.TextSize = 13

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
details.Size = UDim2.new(0.9,0,0,80)
details.Position = UDim2.new(0.05,0,0,165)
details.BackgroundTransparency = 1
details.Text = "✓ Anti-AFK Loaded\n✓ Mobile Optimized\n✓ Joystick Fly Ready\n✓ Explorer Pack Loaded"
details.TextColor3 = Color3.fromRGB(200,200,200)
details.Font = Enum.Font.Code
details.TextSize = 10
details.TextXAlignment = Enum.TextXAlignment.Left

local watermarkLoad = Instance.new("TextLabel", loadFrame)
watermarkLoad.Size = UDim2.new(1,0,0,20)
watermarkLoad.Position = UDim2.new(0,0,1,-25)
watermarkLoad.BackgroundTransparency = 1
watermarkLoad.Text = "discord.gg/8nTQ5xvuha | hahahsud15_ULTRA_2026"
watermarkLoad.TextColor3 = Color3.fromRGB(100,100,100)
watermarkLoad.Font = Enum.Font.Code
watermarkLoad.TextSize = 9

-- SPRACHWAHL (erst nach Loading)
local langFrame = Instance.new("Frame", gui)
langFrame.Size = isMobile and UDim2.new(0,320,0,260) or UDim2.new(0,380,0,240)
langFrame.Position = UDim2.new(0.5,-160,0.5,-130)
if not isMobile then langFrame.Position = UDim2.new(0.5,-190,0.5,-120) end
langFrame.BackgroundColor3 = Color3.fromRGB(30,30,35)
langFrame.Visible = false
Instance.new("UICorner", langFrame).CornerRadius = UDim.new(0,16)
local stroke = Instance.new("UIStroke", langFrame)
stroke.Color = Color3.fromRGB(0,255,150)
stroke.Thickness = 2

local langTitle2 = Instance.new("TextLabel", langFrame)
langTitle2.Size = UDim2.new(1,0,0,50)
langTitle2.BackgroundColor3 = Color3.fromRGB(40,40,45)
langTitle2.Text = "V12.5 ULTRA - CHOOSE LANGUAGE"
langTitle2.TextColor3 = Color3.new(1,1,1)
langTitle2.Font = Enum.Font.GothamBold
langTitle2.TextSize = 14
Instance.new("UICorner", langTitle2).CornerRadius = UDim.new(0,16)

local question = Instance.new("TextLabel", langFrame)
question.Size = UDim2.new(1,0,0,40)
question.Position = UDim2.new(0,0,0,55)
question.BackgroundTransparency = 1
question.Text = "WAHLE SPRACHE / CHOOSE LANGUAGE"
question.TextColor3 = Color3.fromRGB(0,255,150)
question.Font = Enum.Font.GothamBold
question.TextSize = 13

local deBtn = Instance.new("TextButton", langFrame)
deBtn.Size = UDim2.new(0.42,0,0,60)
deBtn.Position = UDim2.new(0.05,0,0,105)
deBtn.Text = "🇩🇪 DEUTSCH"
deBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
deBtn.TextColor3 = Color3.new(1,1,1)
deBtn.Font = Enum.Font.GothamBlack
deBtn.TextSize = 16
Instance.new("UICorner", deBtn).CornerRadius = UDim.new(0,12)

local enBtn = Instance.new("TextButton", langFrame)
enBtn.Size = UDim2.new(0.42,0,0,60)
enBtn.Position = UDim2.new(0.53,0,0,105)
enBtn.Text = "🇬🇧 ENGLISH"
enBtn.BackgroundColor3 = Color3.fromRGB(50,100,200)
enBtn.TextColor3 = Color3.new(1,1,1)
enBtn.Font = Enum.Font.GothamBlack
enBtn.TextSize = 16
Instance.new("UICorner", enBtn).CornerRadius = UDim.new(0,12)

local discordBtnLang = Instance.new("TextButton", langFrame)
discordBtnLang.Size = UDim2.new(0.9,0,0,35)
discordBtnLang.Position = UDim2.new(0.05,0,0,180)
discordBtnLang.Text = "💬 discord.gg/8nTQ5xvuha - COPY"
discordBtnLang.BackgroundColor3 = Color3.fromRGB(88,101,242)
discordBtnLang.TextColor3 = Color3.new(1,1,1)
discordBtnLang.Font = Enum.Font.GothamBold
discordBtnLang.TextSize = 11
Instance.new("UICorner", discordBtnLang).CornerRadius = UDim.new(0,8)

-- LOADING ANIMATION
spawn(function()
    for i=0,100,2 do
        barFill.Size = UDim2.new(i/100,0,1,0)
        percentLabel.Text = i.."%"
        if i<20 then loadStatus.Text="🔥 LOADING BABA SCRIPTS..."
        elseif i<40 then loadStatus.Text="📱 OPTIMIZING FOR MOBILE..."
        elseif i<60 then loadStatus.Text="🚀 LOADING JOYSTICK FLY..."
        elseif i<80 then loadStatus.Text="👁️ LOADING EXPLORERS..."
        elseif i<95 then loadStatus.Text="💬 CONNECTING DISCORD..."
        else loadStatus.Text="✅ READY! WELCOME BABA!"
        end
        task.wait(0.03)
    end
    task.wait(0.5)
    loadFrame:Destroy()
    if LANG then
        -- direkt main bauen wenn schon Sprache gewählt
    else
        langFrame.Visible=true
    end
end)

-- BUILD MAIN
local function buildMain(lang)
    LANG = lang
    getgenv().V12_LANG = lang
    langFrame.Visible=false
    loadFrame:Destroy()
    
    local function T(de,en) if LANG=="EN" then return en else return de end end
    
    local openBtn = Instance.new("TextButton", gui)
    openBtn.Size = isMobile and UDim2.new(0,60,0,60) or UDim2.new(0,55,0,55)
    openBtn.Position = UDim2.new(0,15,0.5,-30)
    openBtn.BackgroundColor3 = Color3.fromRGB(35,35,40)
    openBtn.Text = "V12\nOPEN"
    openBtn.TextColor3 = Color3.fromRGB(0,255,150)
    openBtn.Font = Enum.Font.GothamBlack
    openBtn.TextSize = 11
    Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,14)
    local oStroke = Instance.new("UIStroke", openBtn)
    oStroke.Color = Color3.fromRGB(0,255,150)
    oStroke.Thickness = 2
    
    local main = Instance.new("Frame", gui)
    main.Size = isMobile and UDim2.new(0,350,0,480) or UDim2.new(0,650,0,500)
    main.Position = UDim2.new(0.5,-175,0.5,-240)
    if not isMobile then main.Position = UDim2.new(0.5,-325,0.5,-250) end
    main.BackgroundColor3 = Color3.fromRGB(35,35,40)
    main.Active = true
    main.Draggable = true
    Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
    local mStroke = Instance.new("UIStroke", main)
    mStroke.Color = Color3.fromRGB(0,255,150)
    mStroke.Thickness = 2
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,-90,0,40)
    title.BackgroundColor3 = Color3.fromRGB(45,45,50)
    title.Text = "  "..T("V12.5 ULTRA - DEUTSCH 📱 CUSTOM SPEED","V12.5 ULTRA - ENGLISH 📱 CUSTOM SPEED").." | hahahsud15"
    title.TextColor3 = Color3.new(1,1,1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = isMobile and 10 or 11
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
    
    local perfLabel = Instance.new("TextLabel", main)
    perfLabel.Size = UDim2.new(1,-20,0,20)
    perfLabel.Position = UDim2.new(0,10,0,45)
    perfLabel.BackgroundColor3 = Color3.fromRGB(45,45,50)
    perfLabel.Text = "FPS: 0 | PING: 0ms"
    perfLabel.TextColor3 = Color3.fromRGB(0,255,150)
    perfLabel.Font = Enum.Font.Code
    perfLabel.TextSize = 11
    Instance.new("UICorner", perfLabel).CornerRadius = UDim.new(0,6)
    
    local tabFrame = Instance.new("Frame", main)
    tabFrame.Size = UDim2.new(1,-10,0,36)
    tabFrame.Position = UDim2.new(0,5,0,70)
    tabFrame.BackgroundTransparency = 1
    local tabLayout = Instance.new("UIListLayout", tabFrame)
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.Padding = UDim.new(0,4)
    
    local tabs = {"PLAYER","VISUAL","EXPLORER","SERVER","ULTRA"}
    local tabBtns = {}
    local contentFrames = {}
    
    for i,name in ipairs(tabs) do
        local b = Instance.new("TextButton", tabFrame)
        b.Size = UDim2.new(0,isMobile and 64 or 118,0,32)
        b.Text = name
        b.BackgroundColor3 = i==1 and Color3.fromRGB(0,255,150) or Color3.fromRGB(55,55,60)
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamBold
        b.TextSize = isMobile and 9 or 11
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
        tabBtns[name]=b
        
        local f = Instance.new("ScrollingFrame", main)
        f.Size = UDim2.new(1,-10,1,-115)
        f.Position = UDim2.new(0,5,0,110)
        f.BackgroundColor3 = Color3.fromRGB(40,40,45)
        f.Visible = (i==1)
        f.CanvasSize = UDim2.new(0,0,0,1300)
        f.ScrollBarThickness = 5
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)
        local layout = Instance.new("UIListLayout", f)
        layout.Padding = UDim.new(0,8)
        contentFrames[name]=f
        
        b.MouseButton1Click:Connect(function()
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
        label.TextSize=isMobile and 12 or 11
        label.TextXAlignment=Enum.TextXAlignment.Left
        label.TextWrapped=true
        local btn = Instance.new("TextButton", holder)
        btn.Size = UDim2.new(0,isMobile and 100 or 90,0,isMobile and 34 or 28)
        btn.Position = UDim2.new(1,isMobile and -108 or -98,0.5,isMobile and -17 or -14)
        btn.Text = T("❌ AUS","❌ OFF")
        btn.BackgroundColor3 = Color3.fromRGB(150,30,30)
        btn.TextColor3=Color3.new(1,1,1)
        btn.Font=Enum.Font.GothamBold
        btn.TextSize=11
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        local state=false
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.Text = state and T("✅ AN","✅ ON") or T("❌ AUS","❌ OFF")
            btn.BackgroundColor3 = state and Color3.fromRGB(30,180,30) or Color3.fromRGB(150,30,30)
            pcall(callback, state)
        end)
        return btn
    end
    
    local function makeButton(parent, deText, enText, color, callback)
        local b = Instance.new("TextButton", parent)
        b.Size = UDim2.new(1,-10,0,isMobile and 44 or 36)
        b.BackgroundColor3 = color
        b.Text = T(deText, enText)
        b.TextColor3=Color3.new(1,1,1)
        b.Font=Enum.Font.GothamBold
        b.TextSize=isMobile and 12 or 11
        b.TextWrapped=true
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
        b.MouseButton1Click:Connect(function() pcall(callback) end)
        return b
    end
    
    local function makeInput(parent, dePlaceholder, enPlaceholder, deBtnText, enBtnText, color, callback)
        local holder = Instance.new("Frame", parent)
        holder.Size = UDim2.new(1,-10,0,isMobile and 50 or 42)
        holder.BackgroundColor3 = Color3.fromRGB(50,50,55)
        Instance.new("UICorner", holder).CornerRadius = UDim.new(0,8)
        
        local box = Instance.new("TextBox", holder)
        box.Size = UDim2.new(0.55,0,1,0)
        box.Position = UDim2.new(0,0,0,0)
        box.PlaceholderText = T(dePlaceholder, enPlaceholder)
        box.Text = ""
        box.BackgroundColor3 = Color3.fromRGB(60,60,65)
        box.TextColor3 = Color3.new(1,1,1)
        box.Font = Enum.Font.Code
        box.TextSize = 12
        Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)
        
        local btn = Instance.new("TextButton", holder)
        btn.Size = UDim2.new(0.4,0,0.8,0)
        btn.Position = UDim2.new(0.58,0,0.1,0)
        btn.Text = T(deBtnText, enBtnText)
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 11
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        btn.MouseButton1Click:Connect(function()
            pcall(callback, box.Text)
        end)
        return box
    end
    
    RunService.RenderStepped:Connect(function(dt)
        local fps = math.floor(1/dt)
        local ping = "--"
        pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
        perfLabel.Text = " FPS: "..fps.." | PING: "..ping.."ms | "..#Players:GetPlayers().." "..T("Spieler","Players").." | "..(isMobile and "📱" or "💻")
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
    
    -- PLAYER - CUSTOM INPUT
    local pTab = contentFrames["PLAYER"]
    
    makeInput(pTab, "SPEED eingeben z.B. 100","Enter SPEED e.g. 100","SET SPEED","SET SPEED", Color3.fromRGB(0,120,200), function(txt)
        local num = tonumber(txt)
        if num then
            local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed=num
                game.StarterGui:SetCore("SendNotification",{Title="⚡ SPEED", Text=T("Speed auf ","Speed set to ")..num.." "..T("gesetzt! ÜBELS KRASS!","set! INSANELY CRAZY!"), Duration=3})
            end
        end
    end)
    
    makeInput(pTab, "JUMP POWER z.B. 100","Enter JUMP POWER e.g. 100","SET JUMP","SET JUMP", Color3.fromRGB(100,50,200), function(txt)
        local num = tonumber(txt)
        if num then
            local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower=num hum.UseJumpPower=true
                game.StarterGui:SetCore("SendNotification",{Title="🦘 JUMP", Text=T("Jump auf ","Jump set to ")..num.." "..T("gesetzt! KRASS!","set! CRAZY!"), Duration=3})
            end
        end
    end)
    
    makeInput(pTab, "GRAVITY z.B. 50","Enter GRAVITY e.g. 50","SET GRAVITY","SET GRAVITY", Color3.fromRGB(80,80,80), function(txt)
        local num = tonumber(txt)
        if num then workspace.Gravity=num
            game.StarterGui:SetCore("SendNotification",{Title="🌍 GRAVITY", Text=T("Gravity auf ","Gravity set to ")..num.."!", Duration=3})
        end
    end)
    
    makeInput(pTab, "FOV z.B. 120","Enter FOV e.g. 120","SET FOV","SET FOV", Color3.fromRGB(200,100,0), function(txt)
        local num = tonumber(txt)
        if num then workspace.CurrentCamera.FieldOfView=num end
    end)
    
    makeToggle(pTab, "FLIEGEN - JOYSTICK + WASD","FLY - JOYSTICK + WASD", function(on)
        if on then
            getgenv().V12FLY=true
            if isMobile then flyUpBtn.Visible=true flyDownBtn.Visible=true end
            local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            if hrp:FindFirstChild("V12Fly") then hrp.V12Fly:Destroy() end
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name="V12Fly"
            bv.MaxForce=Vector3.new(9e9,9e9,9e9)
            bv.Velocity=Vector3.new(0,0,0)
            local bg = Instance.new("BodyGyro", hrp)
            bg.Name="V12Gyro"
            bg.MaxTorque=Vector3.new(9e9,9e9,9e9)
            bg.CFrame=hrp.CFrame
            getgenv().FlyConn = RunService.RenderStepped:Connect(function()
                if not getgenv().V12FLY then return end
                local char = lp.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum then return end
                local cam = workspace.CurrentCamera
                local move = Vector3.new(0,0,0)
                if isMobile then
                    if hum.MoveDirection.Magnitude > 0 then
                        move = hum.MoveDirection * 60
                        move = Vector3.new(move.X,0,move.Z)
                    end
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
            getgenv().V12FLY=false
            flyUpBtn.Visible=false
            flyDownBtn.Visible=false
            if getgenv().FlyConn then getgenv().FlyConn:Disconnect() end
            local hrp=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                if hrp:FindFirstChild("V12Fly") then hrp.V12Fly:Destroy() end
                if hrp:FindFirstChild("V12Gyro") then hrp.V12Gyro:Destroy() end
            end
        end
    end)
    
    makeToggle(pTab, "NOCLIP DURCH WÄNDE","NOCLIP THROUGH WALLS", function(on)
        getgenv().V12NOCLIP=on
        if on then
            getgenv().NCConn=RunService.Stepped:Connect(function()
                if lp.Character then for _,v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
            end)
        else
            if getgenv().NCConn then getgenv().NCConn:Disconnect() end
        end
    end)
    
    makeToggle(pTab, "UNENDLICH SPRINGEN","INFINITE JUMP", function(on)
        getgenv().V12IJ=on
        if on then
            getgenv().IJConn=UserInputService.JumpRequest:Connect(function()
                local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        else
            if getgenv().IJConn then getgenv().IJConn:Disconnect() end
        end
    end)
    
    makeButton(pTab, "SPEED SCHNELL 16/50/100/200","SPEED QUICK 16/50/100/200", Color3.fromRGB(0,120,200), function()
        local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = hum.WalkSpeed==16 and 50 or hum.WalkSpeed==50 and 100 or hum.WalkSpeed==100 and 200 or 16 end
    end)
    
    -- VISUAL
    local vTab = contentFrames["VISUAL"]
    makeToggle(vTab, "ESP AN/AUS","ESP ON/OFF", function(on)
        if on then
            for _,pl in pairs(Players:GetPlayers()) do
                if pl~=lp and pl.Character and not pl.Character:FindFirstChild("V12ESP") then
                    local h=Instance.new("Highlight", pl.Character)
                    h.Name="V12ESP"
                    h.FillColor=Color3.fromRGB(0,255,0)
                end
            end
        else
            for _,pl in pairs(Players:GetPlayers()) do
                if pl.Character then for _,v in pairs(pl.Character:GetChildren()) do if v.Name=="V12ESP" then v:Destroy() end end end
            end
        end
    end)
    makeToggle(vTab, "FULLBRIGHT HELL","FULLBRIGHT BRIGHT", function(on)
        Lighting.Brightness = on and 2 or 1
        Lighting.ClockTime = 14
        Lighting.FogEnd = on and 100000 or 1000
    end)
    makeToggle(vTab, "XRAY DURCH WÄNDE","XRAY THROUGH WALLS", function(on)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChildOfClass("Humanoid") and v.Parent~=lp.Character then
                v.LocalTransparencyModifier = on and 0.8 or 0
            end
        end
    end)
    makeButton(vTab, "ANTI-LAG +50 FPS","ANTI-LAG +50 FPS", Color3.fromRGB(80,80,80), function()
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic v.CastShadow=false
            elseif v:IsA("ParticleEmitter") then v.Enabled=false end
        end
        Lighting.GlobalShadows=false
    end)
    
    -- EXPLORER
    local eTab = contentFrames["EXPLORER"]
    makeButton(eTab, "🔥 DARK DEX V4 - BESTER","🔥 DARK DEX V4 - BEST", Color3.fromRGB(20,20,20), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end)
    makeButton(eTab, "♾️ INFINITY YIELD ADMIN","♾️ INFINITY YIELD ADMIN", Color3.fromRGB(0,100,0), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    makeButton(eTab, "🔍 SIMPLESPY","🔍 SIMPLESPY", Color3.fromRGB(120,0,200), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuff/EXMAPI/main/SimpleSpyMobile.lua"))()
    end)
    makeButton(eTab, "🧪 HYDROXIDE 2026","🧪 HYDROXIDE 2026", Color3.fromRGB(0,150,150), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Upbolt/Hydroxide/rewrite/src/main.lua"))()
    end)
    makeButton(eTab, "👁️ BABA EXPLORER","👁️ BABA EXPLORER", Color3.fromRGB(200,100,0), function()
        local expGui=Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
        local f=Instance.new("Frame", expGui)
        f.Size=UDim2.new(0,400,0,400)
        f.Position=UDim2.new(0.5,-200,0.5,-200)
        f.BackgroundColor3=Color3.fromRGB(30,30,30)
        f.Active=true
        f.Draggable=true
        Instance.new("UICorner", f)
        local scroll=Instance.new("ScrollingFrame", f)
        scroll.Size=UDim2.new(1,-10,1,-40)
        scroll.Position=UDim2.new(0,5,0,35)
        scroll.CanvasSize=UDim2.new(0,0,0,3000)
        for _,obj in pairs(game:GetChildren()) do
            local b=Instance.new("TextButton", scroll)
            b.Size=UDim2.new(1,-10,0,28)
            b.Text="📁 "..obj.Name.." ["..obj.ClassName.."]"
            b.BackgroundColor3=Color3.fromRGB(50,50,50)
            b.TextColor3=Color3.new(1,1,1)
            b.Font=Enum.Font.Code
            b.TextSize=11
            b.TextXAlignment=Enum.TextXAlignment.Left
        end
        local c=Instance.new("TextButton", f)
        c.Size=UDim2.new(0,30,0,30)
        c.Position=UDim2.new(1,-35,0,2)
        c.Text="X"
        c.BackgroundColor3=Color3.fromRGB(150,0,0)
        c.MouseButton1Click:Connect(function() expGui:Destroy() end)
    end)
    
    -- SERVER
    local sTab = contentFrames["SERVER"]
    makeButton(sTab, "📋 JOBID KOPIEREN","📋 COPY JOBID", Color3.fromRGB(50,50,50), function()
        setclipboard(game.JobId)
        game.StarterGui:SetCore("SendNotification",{Title="📋 JOBID", Text=T("JobID kopiert! INSANELY!","JobID copied! INSANELY!"), Duration=2})
    end)
    makeButton(sTab, "🔄 REJOIN","🔄 REJOIN", Color3.fromRGB(0,100,200), function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
    end)
    makeButton(sTab, "🌍 SERVER HOP","🌍 SERVER HOP", Color3.fromRGB(0,150,0), function()
        local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for _,v in pairs(data.data) do if v.id~=game.JobId and v.playing<v.maxPlayers then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id, lp) break end end
    end)
    makeButton(sTab, "💬 DISCORD KOPIEREN","💬 COPY DISCORD", Color3.fromRGB(88,101,242), function()
        setclipboard("https://discord.gg/8nTQ5xvuha")
        if LANG=="DE" then
            game.StarterGui:SetCore("SendNotification",{Title="💬 DISCORD", Text="Link kopiert! discord.gg/8nTQ5xvuha - Jetzt beitreten! ÜBELS KRASS!", Duration=3})
        else
            game.StarterGui:SetCore("SendNotification",{Title="💬 DISCORD", Text="Link copied! discord.gg/8nTQ5xvuha - Join now! INSANELY CRAZY!", Duration=3})
        end
    end)
    
    -- ULTRA TAB - MEHR STUFF!
    local ultraTab = contentFrames["ULTRA"]
    makeButton(ultraTab, "🚀 FPS AUF 999","🚀 SET FPS 999", Color3.fromRGB(0,200,0), function()
        pcall(function() setfpscap(999) end)
        game.StarterGui:SetCore("SendNotification",{Title="🚀 FPS", Text=T("FPS auf 999! ULTRA KRASS!","FPS set to 999! ULTRA CRAZY!"), Duration=3})
    end)
    makeButton(ultraTab, "🔋 ULTRA BOOST +100 FPS","🔋 ULTRA BOOST +100 FPS", Color3.fromRGB(200,150,0), function()
        for _,v in pairs(game:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled=false end if v:IsA("BasePart") then v.CastShadow=false end end
        Lighting.GlobalShadows=false
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)
    makeButton(ultraTab, "👥 SPIELER LISTE - WER IST DA","👥 PLAYER LIST - WHO IS HERE", Color3.fromRGB(80,0,80), function()
        for _,pl in pairs(Players:GetPlayers()) do print(pl.Name.." | "..pl.DisplayName) end
        game.StarterGui:SetCore("SendNotification",{Title="👥 PLAYERS", Text=#Players:GetPlayers().." "..T("Spieler gefunden!","players found! Check console!"), Duration=3})
    end)
    makeButton(ultraTab, "🔄 RESET CHARACTER","🔄 RESET CHARACTER", Color3.fromRGB(150,50,50), function()
        lp.Character:BreakJoints()
    end)
    makeButton(ultraTab, "💡 VOLL HELL - TAG MACHEN","💡 FULL BRIGHT - MAKE DAY", Color3.fromRGB(200,200,0), function()
        Lighting.ClockTime=14
        Lighting.Brightness=2
        Lighting.FogEnd=100000
    end)
    makeButton(ultraTab, "🌙 NACHT MACHEN - GRUSELIG","🌙 MAKE NIGHT - SPOOKY", Color3.fromRGB(20,20,60), function()
        Lighting.ClockTime=0
        Lighting.Brightness=1
    end)
    makeButton(ultraTab, "🎮 ANTI-AFK AN - IMMER AN","🎮 ANTI-AFK ON - ALWAYS ON", Color3.fromRGB(0,100,100), function()
        game.StarterGui:SetCore("SendNotification",{Title="🎮 ANTI-AFK", Text=T("Anti-AFK ist immer an! Baba!","Anti-AFK always on! Baba!"), Duration=3})
    end)
    
    openBtn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
    close.MouseButton1Click:Connect(function() main.Visible=false end)
    mini.MouseButton1Click:Connect(function() main.Visible=false end)
    
    game.StarterGui:SetCore("SendNotification",{
        Title="V12.5 ULTRA LOADED! 🔥",
        Text= T("ÜBELS KRASS! Custom Speed/Jump! Loading Screen! LET'S GOOO!","INSANELY CRAZY! Custom Speed/Jump! Loading Screen! LET'S GOOO!"),
        Duration=5
    })
end

deBtn.MouseButton1Click:Connect(function() buildMain("DE") end)
enBtn.MouseButton1Click:Connect(function() buildMain("EN") end)
discordBtnLang.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/8nTQ5xvuha")
    local text = LANG==nil and "Link kopiert! / Link copied! discord.gg/8nTQ5xvuha" or (LANG=="DE" and "Link kopiert! discord.gg/8nTQ5xvuha - Jetzt beitreten! ÜBELS KRASS!" or "Link copied! discord.gg/8nTQ5xvuha - Join now! INSANELY CRAZY!")
    game.StarterGui:SetCore("SendNotification",{Title="💬 DISCORD", Text=text, Duration=3})
end)

-- Wenn schon Sprache gewählt und Loading fertig, direkt bauen
spawn(function()
    task.wait(3.5)
    if LANG and not langFrame.Visible then
        buildMain(LANG)
    end
end)
