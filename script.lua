-- V6 FINAL FIXED 2026 - ALLES GEHT - OPEN/CLOSE GEHT - hahahsud15
-- Wie echte 2026 Exploits funktionieren - MIT PCALL damit nix crasht

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- SAFE PARENT FINDEN - SO MACHEN ES 2026 EXPLOITS
local function getParent()
    local p = nil
    pcall(function() if gethui then p = gethui() end end)
    if not p then pcall(function() p = game:GetService("CoreGui") end) end
    if not p or not pcall(function() return p.ClassName end) then
        p = LP:WaitForChild("PlayerGui")
    end
    return p
end

local parent = getParent()
if parent:FindFirstChild("V6_FINAL") then 
    pcall(function() parent.V6_FINAL:Destroy() end) 
    wait(0.3)
end

local gui = Instance.new("ScreenGui")
gui.Name = "V6_FINAL"
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = parent
gui.IgnoreGuiInset = true

-- MAIN
local main = Instance.new("Frame", gui)
main.Name = "MainFrame"
main.Size = UDim2.new(0.92,0,0.85,0)
main.Position = UDim2.new(0.04,0,0.1,0)
main.BackgroundColor3 = Color3.fromRGB(12,12,18)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = true
local corner = Instance.new("UICorner", main) corner.CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke", main) stroke.Color = Color3.fromRGB(0,255,140) stroke.Thickness = 2

-- TOP
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,50)
top.BackgroundColor3 = Color3.fromRGB(0,255,140)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,14)
local fix = Instance.new("Frame", top) fix.Size = UDim2.new(1,0,0,12) fix.Position = UDim2.new(0,0,1,-12) fix.BackgroundColor3 = Color3.fromRGB(0,255,140) fix.BorderSizePixel=0 fix.Parent=top
local title = Instance.new("TextLabel", top) title.Size=UDim2.new(0.6,0,1,0) title.Position=UDim2.new(0.03,0,0,0) title.Text="V6 FINAL - ALLES GEHT" title.BackgroundTransparency=1 title.TextColor3=Color3.fromRGB(0,0,0) title.TextScaled=true title.Font=Enum.Font.GothamBlack title.TextXAlignment=Enum.TextXAlignment.Left

local close = Instance.new("TextButton", top)
close.Size=UDim2.new(0,40,0,40) close.Position=UDim2.new(1,-48,0,5) close.Text="X" close.BackgroundColor3=Color3.fromRGB(20,20,20) close.TextColor3=Color3.new(1,1,1) close.TextScaled=true close.Font=Enum.Font.GothamBold
Instance.new("UICorner", close).CornerRadius=UDim.new(0,10)

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1,0,1,-55)
scroll.Position = UDim2.new(0,0,0,55)
scroll.BackgroundTransparency=1
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness=6
scroll.ScrollBarImageColor3=Color3.fromRGB(0,255,140)
local layout = Instance.new("UIListLayout", scroll) layout.Padding=UDim.new(0,8) layout.SortOrder=Enum.SortOrder.LayoutOrder
local pad = Instance.new("UIPadding", scroll) pad.PaddingLeft=UDim.new(0,10) pad.PaddingRight=UDim.new(0,10) pad.PaddingTop=UDim.new(0,10) pad.PaddingBottom=UDim.new(0,20)

-- OPEN BUTTON - IMMER SICHTBAR - GEHT IMMER!
local openBtn = Instance.new("TextButton", gui)
openBtn.Name = "OpenBtn"
openBtn.Size = UDim2.new(0,85,0,85)
openBtn.Position = UDim2.new(0,10,0.4,0)
openBtn.Text = "V6"
openBtn.BackgroundColor3 = Color3.fromRGB(0,255,140)
openBtn.TextColor3=Color3.fromRGB(0,0,0)
openBtn.TextScaled=true
openBtn.Font=Enum.Font.GothamBlack
openBtn.Active=true
openBtn.Draggable=true
openBtn.ZIndex = 100
Instance.new("UICorner", openBtn).CornerRadius=UDim.new(1,0)

-- FIXED OPEN/CLOSE - WIE 2026 EXPLOITS
openBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
close.MouseButton1Click:Connect(function()
    main.Visible = false
end)
-- Auch Touch
openBtn.TouchTap:Connect(function()
    main.Visible = not main.Visible
end)
close.TouchTap:Connect(function()
    main.Visible = false
end)

function makeSection(txt)
    local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,32) f.BackgroundColor3=Color3.fromRGB(30,30,38) Instance.new("UICorner", f).CornerRadius=UDim.new(0,8)
    local l=Instance.new("TextLabel", f) l.Size=UDim2.new(1,0,1,0) l.Text="  "..txt l.BackgroundTransparency=1 l.TextColor3=Color3.fromRGB(0,255,140) l.TextScaled=true l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left
end

function makeBtn(txt, color, cb)
    local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,0,0,52) b.Text=txt b.BackgroundColor3=color b.TextColor3=Color3.new(1,1,1) b.TextScaled=true b.Font=Enum.Font.GothamBold b.BorderSizePixel=0 Instance.new("UICorner", b).CornerRadius=UDim.new(0,10)
    b.MouseButton1Click:Connect(function() pcall(cb) end)
    b.TouchTap:Connect(function() pcall(cb) end)
    return b
end

function makeToggle(name, color, cb)
    local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,56) f.BackgroundColor3=Color3.fromRGB(22,22,28) Instance.new("UICorner", f).CornerRadius=UDim.new(0,10)
    local l=Instance.new("TextLabel", f) l.Size=UDim2.new(0.55,0,1,0) l.Position=UDim2.new(0.03,0,0,0) l.Text=name l.BackgroundTransparency=1 l.TextColor3=Color3.new(1,1,1) l.TextScaled=true l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left
    local t=Instance.new("TextButton", f) t.Size=UDim2.new(0.32,0,0,38) t.Position=UDim2.new(0.64,0,0,9) t.Text="OFF" t.BackgroundColor3=Color3.fromRGB(65,65,75) t.TextColor3=Color3.new(1,1,1) t.TextScaled=true t.Font=Enum.Font.GothamBlack Instance.new("UICorner", t).CornerRadius=UDim.new(0,8)
    local on=false
    local function doToggle()
        on=not on
        t.Text=on and "ON" or "OFF"
        t.BackgroundColor3=on and color or Color3.fromRGB(65,65,75)
        pcall(function() cb(on) end)
    end
    t.MouseButton1Click:Connect(doToggle)
    t.TouchTap:Connect(doToggle)
end

-- ===== 2026 METHODEN - WIE ES WIRKLICH GEHT =====
local flyOn=false local flyLV=nil local flyAtt=nil local flySpeed=70 local flyUp=false local flyDown=false
local noclipOn=false
local infHoldConn=nil
local infTippOn=false

-- FLY 2026: LinearVelocity + MoveDirection (Joystick!) + pcall damit nix crasht
local function startFly()
    pcall(function()
        local char=LP.Character local hrp=char and char:FindFirstChild("HumanoidRootPart") if not hrp then return end
        if hrp:FindFirstChild("V6FlyAtt") then hrp.V6FlyAtt:Destroy() end
        if hrp:FindFirstChild("V6FlyLV") then hrp.V6FlyLV:Destroy() end
        flyAtt=Instance.new("Attachment") flyAtt.Name="V6FlyAtt" flyAtt.Parent=hrp
        flyLV=Instance.new("LinearVelocity") flyLV.Name="V6FlyLV" flyLV.Attachment0=flyAtt flyLV.MaxForce=math.huge flyLV.VectorVelocity=Vector3.new(0,0,0) flyLV.Parent=hrp
        task.spawn(function()
            while flyOn and flyLV and flyLV.Parent do
                pcall(function()
                    local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                    local move=hum and hum.MoveDirection or Vector3.new(0,0,0)
                    local cam=workspace.CurrentCamera.CFrame
                    local dir=Vector3.new(0,0,0)
                    if move.Magnitude>0 then
                        dir = cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z))
                        dir = Vector3.new(dir.X,0,dir.Z)
                        if dir.Magnitude>0 then dir = dir.Unit * move.Magnitude end
                    end
                    if flyUp then dir = dir + Vector3.new(0,1.2,0) end
                    if flyDown then dir = dir + Vector3.new(0,-1.2,0) end
                    flyLV.VectorVelocity = dir * flySpeed
                    if dir.Magnitude<0.1 and not flyUp and not flyDown then flyLV.VectorVelocity = Vector3.new(0,0.1,0) end
                end)
                RS.Heartbeat:Wait()
            end
        end)
    end)
end

RS.Stepped:Connect(function() pcall(function() if noclipOn and LP.Character then for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end) end)
UIS.JumpRequest:Connect(function() pcall(function() if infTippOn and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end) end)

-- ===== GUI BAUEN - ALLES MIT PCALL =====
makeSection("BEWEGUNG - 2026 METHODEN")
makeToggle("FLY - Joystick bewegen!", Color3.fromRGB(0,140,255), function(on)
    flyOn=on
    if on then startFly() else pcall(function() if flyLV then flyLV:Destroy() end if flyAtt then flyAtt:Destroy() end end) end
end)
makeToggle("FLY HOCH HALTEN", Color3.fromRGB(0,100,255), function(on) flyUp=on end)
makeToggle("FLY RUNTER HALTEN", Color3.fromRGB(0,80,200), function(on) flyDown=on end)
makeToggle("NOCLIP", Color3.fromRGB(150,0,255), function(on) noclipOn=on end)
makeToggle("INF JUMP HOLD - HALTEN=HOCH!", Color3.fromRGB(0,255,100), function(on)
    if on then
        infHoldConn=RS.Heartbeat:Connect(function() pcall(function() if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then local h=LP.Character.Humanoid if h:GetState()==Enum.HumanoidStateType.Jumping or UIS:IsKeyDown(Enum.KeyCode.Space) or h.Jump then h:ChangeState(Enum.HumanoidStateType.Jumping) LP.Character.HumanoidRootPart.Velocity=Vector3.new(LP.Character.HumanoidRootPart.Velocity.X,75,LP.Character.HumanoidRootPart.Velocity.Z) end end end) end)
    else
        if infHoldConn then infHoldConn:Disconnect() end
    end
end)
makeToggle("INF JUMP TIPP", Color3.fromRGB(0,200,80), function(on) infTippOn=on end)

makeBtn("SPEED 100", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=100 end end)
makeBtn("SPEED 200", Color3.fromRGB(0,160,100), function() if LP.Character then LP.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=200 end end)
makeBtn("SPEED 16 NORMAL", Color3.fromRGB(80,80,80), function() if LP.Character then LP.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=16 end end)
makeBtn("HIGH JUMP 180", Color3.fromRGB(255,140,0), function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,180,0) end end)
makeBtn("LONG JUMP", Color3.fromRGB(255,100,0), function() if LP.Character then local cf=workspace.CurrentCamera.CFrame LP.Character.HumanoidRootPart.Velocity=Vector3.new(cf.LookVector.X*130,60,cf.LookVector.Z*130) end end)

makeSection("SEHEN")
makeToggle("ESP DURCH WÄNDE", Color3.fromRGB(255,0,80), function(on)
    if on then
        for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("V6ESP") then local hl=Instance.new("Highlight", p.Character) hl.Name="V6ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.OutlineColor=Color3.fromRGB(0,255,140) hl.FillTransparency=0.35 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end end
    else
        for _,p in pairs(Players:GetPlayers()) do if p.Character then for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V6ESP" then v:Destroy() end end end end
    end
end)
makeToggle("WALLHACK WÄNDE DURCH", Color3.fromRGB(150,0,255), function(on) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(LP.Character) and v.Size.Magnitude>5 then v.LocalTransparencyModifier=on and 0.6 or 0 end end end)
makeBtn("FULLBRIGHT TAG", Color3.fromRGB(255,240,0), function() Lighting.Brightness=4 Lighting.ClockTime=13 Lighting.FogEnd=100000 Lighting.GlobalShadows=false end)
makeBtn("FULLBRIGHT AUS", Color3.fromRGB(60,60,20), function() Lighting.Brightness=2 Lighting.ClockTime=14 Lighting.FogEnd=100000 Lighting.GlobalShadows=true end)

makeSection("CLIENT")
makeBtn("ANTI-AFK AN", Color3.fromRGB(0,150,60), function() local vu=game:GetService("VirtualUser") LP.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end)
makeBtn("FPS BOOST", Color3.fromRGB(70,70,70), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic end if v:IsA("Decal") or v:IsA("Texture") then v.Transparency=1 end end Lighting.GlobalShadows=false end)
makeBtn("GOD MODE", Color3.fromRGB(255,215,0), function() if LP.Character then LP.Character.Humanoid.MaxHealth=math.huge LP.Character.Humanoid.Health=math.huge end end)
makeBtn("INVISIBLE", Color3.fromRGB(30,30,30), function() for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.Transparency=v.Transparency==0 and 1 or 0 end end end)
makeBtn("ECHTES IY LADEN", Color3.fromRGB(0,0,0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
makeBtn("REJOIN", Color3.fromRGB(0,100,200), function() game:GetService("TeleportService"):Teleport(game.PlaceId, LP) end)
makeBtn("GUI LÖSCHEN", Color3.fromRGB(255,0,0), function() gui:Destroy() end)

print("✅ V6 FINAL GELADEN - ALLES FIXED - OPEN GEHT IMMER")
