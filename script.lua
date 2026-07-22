-- V5.1 ULTRA LONG FIXED - ALLE BUTTONS GEHEN - hahahsud15
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local parent
pcall(function() parent = gethui() end)
if not parent then parent = game:GetService("CoreGui") end
if parent:FindFirstChild("V5_ULTRA") then parent.V5_ULTRA:Destroy() end

local gui = Instance.new("ScreenGui", parent)
gui.Name = "V5_ULTRA"
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.96,0,0.9,0)
main.Position = UDim2.new(0.02,0,0.05,0)
main.BackgroundColor3 = Color3.fromRGB(10,10,15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)
local mainStroke = Instance.new("UIStroke", main) mainStroke.Color = Color3.fromRGB(0,255,140) mainStroke.Thickness = 3

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,60)
top.BackgroundColor3 = Color3.fromRGB(0,255,140)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,16)
local topFix = Instance.new("Frame", top) topFix.Size = UDim2.new(1,0,0,14) topFix.Position = UDim2.new(0,0,1,-14) topFix.BackgroundColor3 = Color3.fromRGB(0,255,140) topFix.BorderSizePixel=0 topFix.Parent=top
local topTitle = Instance.new("TextLabel", top) topTitle.Size=UDim2.new(0.7,0,1,0) topTitle.Position=UDim2.new(0.03,0,0,0) topTitle.Text="V5.1 LONG FIXED - BUTTONS GEHEN" topTitle.BackgroundTransparency=1 topTitle.TextColor3=Color3.fromRGB(10,10,10) topTitle.TextScaled=true topTitle.Font=Enum.Font.GothamBlack topTitle.TextXAlignment=Enum.TextXAlignment.Left

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1,0,1,-65)
scroll.Position = UDim2.new(0,0,0,65)
scroll.BackgroundTransparency=1
scroll.CanvasSize = UDim2.new(0,0,0,3000)
scroll.ScrollBarThickness=6
scroll.ScrollBarImageColor3=Color3.fromRGB(0,255,140)
local layout = Instance.new("UIListLayout", scroll) layout.Padding=UDim.new(0,10) layout.SortOrder=Enum.SortOrder.LayoutOrder
local pad = Instance.new("UIPadding", scroll) pad.PaddingLeft=UDim.new(0,12) pad.PaddingRight=UDim.new(0,12) pad.PaddingTop=UDim.new(0,12)

local openBtn=Instance.new("TextButton", gui) openBtn.Size=UDim2.new(0,95,0,95) openBtn.Position=UDim2.new(0,10,0.42,0) openBtn.Text="V5\nFIXED" openBtn.BackgroundColor3=Color3.fromRGB(0,255,140) openBtn.TextColor3=Color3.fromRGB(0,0,0) openBtn.TextScaled=true openBtn.Font=Enum.Font.GothamBlack Instance.new("UICorner", openBtn).CornerRadius=UDim.new(1,0) openBtn.Active=true openBtn.Draggable=true openBtn.DisplayOrder=9999999
openBtn.Activated:Connect(function() main.Visible=not main.Visible end)

function makeSection(txt)
    local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,34) f.BackgroundColor3=Color3.fromRGB(30,30,38) Instance.new("UICorner", f).CornerRadius=UDim.new(0,10)
    local l=Instance.new("TextLabel", f) l.Size=UDim2.new(1,0,1,0) l.Text=" "..txt l.BackgroundTransparency=1 l.TextColor3=Color3.fromRGB(0,255,140) l.TextScaled=true l.Font=Enum.Font.GothamBlack l.TextXAlignment=Enum.TextXAlignment.Left
end

function makeBtn(txt, color, cb)
    local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,0,0,58) b.Text=txt b.BackgroundColor3=color b.TextColor3=Color3.new(1,1,1) b.TextScaled=true b.Font=Enum.Font.GothamBold b.BorderSizePixel=0 Instance.new("UICorner", b).CornerRadius=UDim.new(0,12)
    b.Activated:Connect(cb)
    return b
end

function makeToggle(name, color, cb)
    local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,60) f.BackgroundColor3=Color3.fromRGB(22,22,28) Instance.new("UICorner", f).CornerRadius=UDim.new(0,12)
    local l=Instance.new("TextLabel", f) l.Size=UDim2.new(0.55,0,1,0) l.Position=UDim2.new(0.04,0,0,0) l.Text=name l.BackgroundTransparency=1 l.TextColor3=Color3.new(1,1,1) l.TextScaled=true l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left
    local t=Instance.new("TextButton", f) t.Size=UDim2.new(0.33,0,0,42) t.Position=UDim2.new(0.63,0,0,9) t.Text="OFF" t.BackgroundColor3=Color3.fromRGB(60,60,70) t.TextColor3=Color3.new(1,1,1) t.TextScaled=true t.Font=Enum.Font.GothamBlack Instance.new("UICorner", t).CornerRadius=UDim.new(0,10)
    local on=false local deb=false
    t.Activated:Connect(function()
        if deb then return end
        deb=true
        on=not on
        t.Text=on and "ON" or "OFF"
        t.BackgroundColor3=on and color or Color3.fromRGB(60,60,70)
        cb(on)
        task.wait(0.2)
        deb=false
    end)
end

-- LOGIC
local flyOn=false local flyLV=nil local flyAtt=nil local flySpeed=75 local flyUp=false local flyDown=false
local noclipOn=false
local infHoldOn=false local infHoldConn=nil
local infTippOn=false
local espOn=false

function startFly()
    local char=LP.Character local hrp=char and char:FindFirstChild("HumanoidRootPart") if not hrp then return end
    if hrp:FindFirstChild("V4FlyAtt") then hrp.V4FlyAtt:Destroy() end if hrp:FindFirstChild("V4FlyLV") then hrp.V4FlyLV:Destroy() end
    flyAtt=Instance.new("Attachment", hrp) flyAtt.Name="V4FlyAtt"
    flyLV=Instance.new("LinearVelocity", hrp) flyLV.Name="V4FlyLV" flyLV.Attachment0=flyAtt flyLV.MaxForce=math.huge flyLV.VectorVelocity=Vector3.new(0,0,0)
    task.spawn(function() while flyOn and flyLV and flyLV.Parent do local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") local move=hum and hum.MoveDirection or Vector3.new(0,0,0) local cam=workspace.CurrentCamera.CFrame local worldMove=Vector3.new(0,0,0) if move.Magnitude>0 then worldMove=cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z)) worldMove=Vector3.new(worldMove.X,0,worldMove.Z) if worldMove.Magnitude>0 then worldMove=worldMove.Unit*move.Magnitude end end if flyUp then worldMove=worldMove+Vector3.new(0,1.4,0) end if flyDown then worldMove=worldMove+Vector3.new(0,-1.4,0) end flyLV.VectorVelocity=worldMove*flySpeed if worldMove.Magnitude<0.1 and not flyUp and not flyDown then flyLV.VectorVelocity=Vector3.new(0,0.1,0) end RS.Heartbeat:Wait() end end)
end

RS.Stepped:Connect(function() if noclipOn and LP.Character then for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end)
UIS.JumpRequest:Connect(function() if infTippOn and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end)

function setInfHold(on) infHoldOn=on if on then infHoldConn=RS.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then local hum=LP.Character.Humanoid if hum:GetState()==Enum.HumanoidStateType.Jumping or UIS:IsKeyDown(Enum.KeyCode.Space) or hum.Jump then hum:ChangeState(Enum.HumanoidStateType.Jumping) LP.Character.HumanoidRootPart.Velocity=Vector3.new(LP.Character.HumanoidRootPart.Velocity.X,78,LP.Character.HumanoidRootPart.Velocity.Z) end end end) else if infHoldConn then infHoldConn:Disconnect() end end end

function setESP(on) espOn=on if on then for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("V5ESP") then local hl=Instance.new("Highlight", p.Character) hl.Name="V5ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.OutlineColor=Color3.fromRGB(0,255,140) hl.FillTransparency=0.35 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end end else for _,p in pairs(Players:GetPlayers()) do if p.Character then for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V5ESP" then v:Destroy() end end end end end end

-- BUILD
makeSection("1. BEWEGUNG - ALLE BUTTONS GEHEN JETZT!")
makeToggle("FLY AN/AUS (Joystick bewegen!)", Color3.fromRGB(0,140,255), function(on) flyOn=on if on then startFly() else if flyLV then flyLV:Destroy() end if flyAtt then flyAtt:Destroy() end end end)
makeToggle("FLY HOCH HALTEN", Color3.fromRGB(0,100,255), function(on) flyUp=on end)
makeToggle("FLY RUNTER HALTEN", Color3.fromRGB(0,80,200), function(on) flyDown=on end)
makeToggle("NOCLIP DURCH WÄNDE", Color3.fromRGB(150,0,255), function(on) noclipOn=on end)
makeToggle("INF JUMP HOLD (HALTEN=HOCH FLIEGEN)", Color3.fromRGB(0,200,100), function(on) setInfHold(on) end)
makeToggle("INF JUMP TIPP (Immer springen)", Color3.fromRGB(0,180,80), function(on) infTippOn=on end)

makeSection("SPEED & JUMP")
makeBtn("SPEED 80", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=80 end end)
makeBtn("SPEED 120", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=120 end end)
makeBtn("SPEED 200 ULTRA", Color3.fromRGB(0,160,100), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=200 end end)
makeBtn("SPEED 500 GOD", Color3.fromRGB(255,0,80), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=500 end end)
makeBtn("HIGH JUMP 150", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,150,0) end end)
makeBtn("HIGH JUMP 250", Color3.fromRGB(255,100,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,250,0) end end)
makeBtn("LONG JUMP WEIT", Color3.fromRGB(255,80,0), function() if LP.Character then local cf=workspace.CurrentCamera.CFrame LP.Character.HumanoidRootPart.Velocity=Vector3.new(cf.LookVector.X*140,70,cf.LookVector.Z*140) end end)
makeBtn("JUMP POWER 100", Color3.fromRGB(255,180,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=100 end end)
makeBtn("JUMP POWER 200", Color3.fromRGB(255,160,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=200 end end)

makeSection("2. SEHEN - WALLHACK ESP")
makeToggle("ESP WALLHACK DURCH WÄNDE", Color3.fromRGB(255,0,80), function(on) setESP(on) end)
makeToggle("WALLHACK WÄNDE DURCHSICHTIG", Color3.fromRGB(150,0,255), function(on) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(LP.Character) and v.Size.Magnitude>5 then v.LocalTransparencyModifier=on and 0.6 or 0 end end end)
makeBtn("FULLBRIGHT TAG AN", Color3.fromRGB(255,240,0), function() Lighting.Brightness=4 Lighting.ClockTime=13 Lighting.FogEnd=100000 Lighting.GlobalShadows=false end)
makeBtn("FULLBRIGHT NACHT AUS", Color3.fromRGB(40,40,20), function() Lighting.Brightness=2 Lighting.ClockTime=0 Lighting.GlobalShadows=true end)
makeBtn("XRAY ALLES 50% SICHTBAR", Color3.fromRGB(100,100,100), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0.5 end end end)
makeBtn("XRAY AUS", Color3.fromRGB(50,50,50), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0 end end end)

makeSection("3. TROLL - KRASS")
makeBtn("BRING ALL ZU DIR", Color3.fromRGB(0,200,0), function() for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame+Vector3.new(math.random(-4,4),0,math.random(-4,4)) end end end)
makeBtn("FLING ALL", Color3.fromRGB(255,0,0), function() local old=LP.Character.HumanoidRootPart.CFrame for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame task.wait(0.15) local thrp=p.Character.HumanoidRootPart local bv=Instance.new("BodyVelocity", thrp) bv.Velocity=Vector3.new(0,99999,0) bv.MaxForce=Vector3.new(9e9,9e9) task.wait(0.35) bv:Destroy() end end LP.Character.HumanoidRootPart.CFrame=old end)
makeBtn("INVISIBLE AN/AUS", Color3.fromRGB(30,30,30), function() for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.Transparency=v.Transparency==0 and 1 or 0 end end end)

makeSection("4. CLIENT")
makeBtn("ANTI-AFK AN", Color3.fromRGB(0,150,60), function() local vu=game:GetService("VirtualUser") LP.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) task.wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end)
makeBtn("FPS BOOST ULTRA", Color3.fromRGB(70,70,70), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic end if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end end Lighting.GlobalShadows=false end)
makeBtn("GOD MODE", Color3.fromRGB(255,215,0), function() if LP.Character then LP.Character.Humanoid.MaxHealth=math.huge LP.Character.Humanoid.Health=math.huge end end)
makeBtn("ECHTES IY LADEN ORIGINAL", Color3.fromRGB(0,0,0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
makeBtn("UNLOAD V5", Color3.fromRGB(255,0,0), function() gui:Destroy() end)

print("✅ V5.1 FIXED - ALLE BUTTONS GEHEN - LANG + SCHÖN")
