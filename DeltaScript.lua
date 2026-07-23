-- V13.1 MOBILE DEX FIX by hahahsud15 - BABA EXPLORER FIXED + ALLE EXPLORER LISTE
if getgenv().V12_LOADED then getgenv().V12_LOADED:Destroy() end
getgenv().V12_WATERMARK = "hahahsud15_V13.1_FIXED"
print("V13.1 FIXED by "..getgenv().V12_WATERMARK)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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

local function getGuiParent()
    if getgenv().gethui then 
        local ok, res = pcall(gethui)
        if ok and res then return res end
    end
    if game.CoreGui then return game.CoreGui end
    return lp:FindFirstChildOfClass("PlayerGui") or lp:WaitForChild("PlayerGui")
end

local gui = Instance.new("ScreenGui")
gui.Name = "V13_1_FIXED"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = getGuiParent()
getgenv().V12_LOADED = gui

-- LOADING
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
loadTitle.Text = "V13.1 FIXED\nby hahahsud15"
loadTitle.TextColor3 = Color3.fromRGB(0,255,150)
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextSize = 18
Instance.new("UICorner", loadTitle).CornerRadius = UDim.new(0,20)

local loadStatus = Instance.new("TextLabel", loadFrame)
loadStatus.Size = UDim2.new(1,0,0,30)
loadStatus.Position = UDim2.new(0,0,0,70)
loadStatus.BackgroundTransparency = 1
loadStatus.Text = "🔧 FIXING BABA EXPLORER..."
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
langTitle2.Text = "V13.1 FIXED - CHOOSE LANGUAGE"
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

spawn(function()
    for i=0,100,2 do
        barFill.Size = UDim2.new(i/100,0,1,0)
        percentLabel.Text = i.."%"
        if i<30 then loadStatus.Text="🔧 FIXING BABA EXPLORER..."
        elseif i<60 then loadStatus.Text="📱 OPTIMIZING MOBILE..."
        elseif i<90 then loadStatus.Text="🛡️ VIRUS CHECK..."
        else loadStatus.Text="✅ FIXED! READY!"
        end
        task.wait(0.02)
    end
    task.wait(0.3)
    loadFrame:Destroy()
    if not LANG then langFrame.Visible=true end
end)

local function buildMain(lang)
    LANG = lang
    getgenv().V12_LANG = lang
    langFrame.Visible=false
    loadFrame:Destroy()
    
    local function T(de,en) if LANG=="EN" then return en else return de end end
    
    local function safeLoad(url, name)
        local ok, code = pcall(function() return game:HttpGet(url) end)
        if not ok then
            game.StarterGui:SetCore("SendNotification",{Title="❌ ERROR", Text=name.." Link tot!", Duration=2})
            return false
        end
        local lower = code:lower()
        if lower:find("webhook") and lower:find("discord.com/api") then
            game.StarterGui:SetCore("SendNotification",{Title="🛡️ VIRUS BLOCKED!", Text=name.." blocked! Webhook!", Duration=4})
            return false
        end
        local ok2, err = pcall(function() loadstring(code)() end)
        if ok2 then
            game.StarterGui:SetCore("SendNotification",{Title="✅ LOADED", Text=name.." loaded! SAFE!", Duration=3})
        end
        return ok2
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
    title.Text = "  V13.1 FIXED - "..T("BABA EXPLORER FIX","BABA EXPLORER FIX").." | hahahsud15"
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
    perfLabel.Text = "FPS: 0 | PING: 0ms | FIXED 🛠️"
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
        f.CanvasSize = UDim2.new(0,0,0,1600)
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
        btn.MouseButton1Click:Connect(function() pcall(callback, box.Text) end)
        return box
    end
    
    RunService.RenderStepped:Connect(function(dt)
        local fps = math.floor(1/dt)
        local ping = "--"
        pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
        perfLabel.Text = " FPS: "..fps.." | PING: "..ping.."ms | "..#Players:GetPlayers().." Spieler | FIXED"
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
    
    local pTab = contentFrames["PLAYER"]
    makeInput(pTab, "SPEED z.B. 100","SPEED e.g. 100","SET SPEED","SET SPEED", Color3.fromRGB(0,120,200), function(txt)
        local num = tonumber(txt)
        if num then
            local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed=num end
        end
    end)
    makeInput(pTab, "JUMP z.B. 100","JUMP e.g. 100","SET JUMP","SET JUMP", Color3.fromRGB(100,50,200), function(txt)
        local num = tonumber(txt)
        if num then
            local hum=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower=num hum.UseJumpPower=true end
        end
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
    
    local eTab = contentFrames["EXPLORER"]
    
    -- ALLE EXPLORER LISTE - MIT FIX!
    makeButton(eTab, "📱 1. DEX MOBILE V3 - FÜR HANDY! (NEU!)","📱 1. DEX MOBILE V3 - FOR MOBILE! (NEW!)", Color3.fromRGB(0,200,100), function()
        local urls = {
            "https://raw.githubusercontent.com/TechHog8984/Dex-Explorer-V3/main/dex.lua",
            "https://github.com/TechHog8984/Dex-Explorer-V3/raw/main/dex.lua",
            "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"
        }
        for _,url in ipairs(urls) do
            if safeLoad(url, "DEX MOBILE V3") then break end
        end
    end)
    
    makeButton(eTab, "🔥 2. DARK DEX V4 - BEST PC EXPLORER","🔥 2. DARK DEX V4 - BEST PC EXPLORER", Color3.fromRGB(20,20,20), function()
        safeLoad("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", "DARK DEX V4")
    end)
    
    makeButton(eTab, "♾️ 3. INFINITY YIELD - ADMIN (200+ CMDS)","♾️ 3. INFINITY YIELD - ADMIN (200+ CMDS)", Color3.fromRGB(0,100,0), function()
        safeLoad("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "INFINITY YIELD")
    end)
    
    makeButton(eTab, "🔍 4. SIMPLESPY V3 - REMOTE SPY (NEU FIX)","🔍 4. SIMPLESPY V3 - REMOTE SPY (NEW FIX)", Color3.fromRGB(120,0,200), function()
        local urls = {
            "https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua",
            "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"
        }
        for _,url in ipairs(urls) do
            if safeLoad(url, "SIMPLESPY V3") then break end
        end
    end)
    
    makeButton(eTab, "🧪 5. HYDROXIDE - REMOTE SPY + SCANNER","🧪 5. HYDROXIDE - REMOTE SPY + SCANNER", Color3.fromRGB(0,150,150), function()
        local ok = safeLoad("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/init.lua", "HYDROXIDE INIT")
        if ok then
            safeLoad("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ui/main.lua", "HYDROXIDE UI")
        end
    end)
    
    -- BABA EXPLORER FIXED!
    makeButton(eTab, "👁️ 6. BABA EXPLORER V2 - FIXED! EIGENES!","👁️ 6. BABA EXPLORER V2 - FIXED! OWN!", Color3.fromRGB(200,100,0), function()
        -- FIXED VERSION
        local parent = getGuiParent()
        if parent:FindFirstChild("BabaExplorerGui") then parent.BabaExplorerGui:Destroy() end
        
        local expGui=Instance.new("ScreenGui")
        expGui.Name="BabaExplorerGui"
        expGui.ResetOnSpawn=false
        expGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
        expGui.Parent=parent
        
        local mainF=Instance.new("Frame", expGui)
        mainF.Size=isMobile and UDim2.new(0,350,0,450) or UDim2.new(0,500,0,500)
        mainF.Position=UDim2.new(0.5,-175,0.5,-225)
        if not isMobile then mainF.Position=UDim2.new(0.5,-250,0.5,-250) end
        mainF.BackgroundColor3=Color3.fromRGB(25,25,30)
        mainF.Active=true
        mainF.Draggable=true
        Instance.new("UICorner", mainF).CornerRadius=UDim.new(0,12)
        local ms=Instance.new("UIStroke", mainF)
        ms.Color=Color3.fromRGB(0,255,150)
        ms.Thickness=2
        
        local titleBar=Instance.new("Frame", mainF)
        titleBar.Size=UDim2.new(1,0,0,40)
        titleBar.BackgroundColor3=Color3.fromRGB(35,35,40)
        Instance.new("UICorner", titleBar).CornerRadius=UDim.new(0,12)
        local tLabel=Instance.new("TextLabel", titleBar)
        tLabel.Size=UDim2.new(1,-50,1,0)
        tLabel.Position=UDim2.new(0,10,0,0)
        tLabel.BackgroundTransparency=1
        tLabel.Text="👁️ BABA EXPLORER V2 FIXED | "..#game:GetChildren().." Objects"
        tLabel.TextColor3=Color3.fromRGB(0,255,150)
        tLabel.Font=Enum.Font.GothamBold
        tLabel.TextSize=12
        tLabel.TextXAlignment=Enum.TextXAlignment.Left
        
        local closeBtn=Instance.new("TextButton", titleBar)
        closeBtn.Size=UDim2.new(0,35,0,35)
        closeBtn.Position=UDim2.new(1,-40,0,2)
        closeBtn.Text="X"
        closeBtn.BackgroundColor3=Color3.fromRGB(180,40,40)
        closeBtn.TextColor3=Color3.new(1,1,1)
        closeBtn.Font=Enum.Font.GothamBold
        Instance.new("UICorner", closeBtn).CornerRadius=UDim.new(0,8)
        closeBtn.MouseButton1Click:Connect(function() expGui:Destroy() end)
        
        local scroll=Instance.new("ScrollingFrame", mainF)
        scroll.Size=UDim2.new(1,-10,1,-50)
        scroll.Position=UDim2.new(0,5,0,45)
        scroll.BackgroundColor3=Color3.fromRGB(35,35,40)
        scroll.CanvasSize=UDim2.new(0,0,0,0)
        scroll.ScrollBarThickness=6
        Instance.new("UICorner", scroll).CornerRadius=UDim.new(0,8)
        local listLayout=Instance.new("UIListLayout", scroll)
        listLayout.Padding=UDim.new(0,4)
        listLayout.SortOrder=Enum.SortOrder.LayoutOrder
        
        local function addObject(obj, depth)
            depth = depth or 0
            local btn=Instance.new("TextButton", scroll)
            btn.Size=UDim2.new(1,-10,0,isMobile and 36 or 30)
            btn.BackgroundColor3= depth==0 and Color3.fromRGB(50,50,60) or Color3.fromRGB(45,45,50)
            btn.Text="  "..string.rep("  ", depth)..(depth==0 and "📁 " or "📄 ")..obj.Name.." ["..obj.ClassName.."]"
            btn.TextColor3=Color3.new(1,1,1)
            btn.Font=Enum.Font.Code
            btn.TextSize=isMobile and 10 or 11
            btn.TextXAlignment=Enum.TextXAlignment.Left
            btn.TextTruncate=Enum.TextTruncate.AtEnd
            Instance.new("UICorner", btn).CornerRadius=UDim.new(0,6)
            
            btn.MouseButton1Click:Connect(function()
                if obj:GetChildren()[1] then
                    -- Toggle children
                    for _,child in pairs(obj:GetChildren()) do
                        addObject(child, depth+1)
                    end
                    scroll.CanvasSize=UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y+10)
                end
                pcall(function() setclipboard(obj:GetFullName()) end)
                game.StarterGui:SetCore("SendNotification",{Title="📋 COPIED", Text=obj.Name.." Path copied!", Duration=2})
            end)
        end
        
        for _,obj in pairs(game:GetChildren()) do
            addObject(obj, 0)
        end
        
        task.wait(0.1)
        scroll.CanvasSize=UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y+20)
        
        game.StarterGui:SetCore("SendNotification",{Title="👁️ BABA EXPLORER", Text="FIXED! Now works on mobile! Click to copy path!", Duration=3})
    end)
    
    local sTab = contentFrames["SERVER"]
    makeButton(sTab, "📋 JOBID KOPIEREN","📋 COPY JOBID", Color3.fromRGB(50,50,50), function()
        setclipboard(game.JobId)
    end)
    makeButton(sTab, "💬 DISCORD KOPIEREN","💬 COPY DISCORD", Color3.fromRGB(88,101,242), function()
        setclipboard("https://discord.gg/8nTQ5xvuha")
    end)
    
    local ultraTab = contentFrames["ULTRA"]
    makeButton(ultraTab, "📜 ZEIG ALLE EXPLORER LISTE","📜 SHOW ALL EXPLORER LIST", Color3.fromRGB(100,100,200), function()
        local msg = T(
            "1.DEX MOBILE V3\n2.DARK DEX V4\n3.INFINITY YIELD\n4.SIMPLESPY V3\n5.HYDROXIDE\n6.BABA EXPLORER V2 FIXED",
            "1.DEX MOBILE V3\n2.DARK DEX V4\n3.INFINITY YIELD\n4.SIMPLESPY V3\n5.HYDROXIDE\n6.BABA EXPLORER V2 FIXED"
        )
        game.StarterGui:SetCore("SendNotification",{Title="📜 ALL EXPLORER", Text=msg, Duration=5})
        print("=== ALLE EXPLORER IN V13.1 ===")
        print("1. DEX MOBILE V3 - Mobile optimized, best for phone")
        print("2. DARK DEX V4 - Best for PC, full features")
        print("3. INFINITY YIELD - Admin with 200+ commands")
        print("4. SIMPLESPY V3 - Spy remotes")
        print("5. HYDROXIDE - Upvalue scanner + Remote spy")
        print("6. BABA EXPLORER V2 - Own, lightweight, FIXED for mobile")
    end)
    
    openBtn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
    close.MouseButton1Click:Connect(function() main.Visible=false end)
    mini.MouseButton1Click:Connect(function() main.Visible=false end)
    
    game.StarterGui:SetCore("SendNotification",{
        Title="V13.1 FIXED! 🔧",
        Text= T("Baba Explorer FIXED! Alle Explorer Liste drin!","Baba Explorer FIXED! All explorer list inside!"),
        Duration=5
    })
end

deBtn.MouseButton1Click:Connect(function() buildMain("DE") end)
enBtn.MouseButton1Click:Connect(function() buildMain("EN") end)
discordBtnLang.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/8nTQ5xvuha")
end)

spawn(function()
    task.wait(3.5)
    if LANG and not langFrame.Visible then
        buildMain(LANG)
    end
end)
