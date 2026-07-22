-- V7 BIG PANEL - RIESEN BUTTON - LANG - hahahsud15 2026 FINAL
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local function getParent()
    local p=nil
    pcall(function() if gethui then p=gethui() end end)
    if not p then pcall(function() p=game.CoreGui end) end
    if not p then p=LP:WaitForChild("PlayerGui") end
    return p
end
local parent=getParent()
if parent:FindFirstChild("V7_BIG") then pcall(function() parent.V7_BIG:Destroy() end) wait(0.3) end

local gui=Instance.new("ScreenGui", parent)
gui.Name="V7_BIG"
gui.ResetOnSpawn=false
gui.DisplayOrder=9999999
gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

-- MAIN RIESIG
local main=Instance.new("Frame", gui)
main.Name="MainFrame"
main.Size=UDim2.new(0.96,0,0.92,0)
main.Position=UDim2.new(0.02,0,0.04,0)
main.BackgroundColor3=Color3.fromRGB(12,12,18)
main.BorderSizePixel=0
main.Active=true
main.Draggable=true
main.Visible=true
Instance.new("UICorner", main).CornerRadius=UDim.new(0,16)
Instance.new("UIStroke", main).Color=Color3.fromRGB(0,255,140)

local top=Instance.new("Frame", main)
top.Size=UDim2.new(1,0,0,60)
top.BackgroundColor3=Color3.fromRGB(0,255,140)
top.BorderSizePixel=0
Instance.new("UICorner", top).CornerRadius=UDim.new(0,16)
local fix=Instance.new("Frame", top) fix.Size=UDim2.new(1,0,0,14) fix.Position=UDim2.new(0,0,1,-14) fix.BackgroundColor3=Color3.fromRGB(0,255,140) fix.BorderSizePixel=0 fix.Parent=top
local title=Instance.new("TextLabel", top) title.Size=UDim2.new(0.7,0,1,0) title.Position=UDim2.new(0.03,0,0,0) title.Text="V7 BIG - ALLES GEHT - RIESEN BUTTON" title.BackgroundTransparency=1 title.TextColor3=Color3.fromRGB(0,0,0) title.TextScaled=true title.Font=Enum.Font.GothamBlack title.TextXAlignment=Enum.TextXAlignment.Left
local close=Instance.new("TextButton", top) close.Size=UDim2.new(0,50,0,50) close.Position=UDim2.new(1,-55,0,5) close.Text="X" close.BackgroundColor3=Color3.fromRGB(20,20,20) close.TextColor3=Color3.new(1,1,1) close.TextScaled=true close.Font=Enum.Font.GothamBlack Instance.new("UICorner", close).CornerRadius=UDim.new(0,12)

local scroll=Instance.new("ScrollingFrame", main)
scroll.Size=UDim2.new(1,0,1,-65)
scroll.Position=UDim2.new(0,0,0,65)
scroll.BackgroundTransparency=1
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
scroll.CanvasSize=UDim2.new(0,0,0,0)
scroll.ScrollBarThickness=8
scroll.ScrollBarImageColor3=Color3.fromRGB(0,255,140)
local layout=Instance.new("UIListLayout", scroll) layout.Padding=UDim.new(0,10)
local pad=Instance.new("UIPadding", scroll) pad.PaddingLeft=UDim.new(0,12) pad.PaddingRight=UDim.new(0,12) pad.PaddingTop=UDim.new(0,10) pad.PaddingBottom=UDim.new(0,20)

-- RIESEN OPEN BUTTON - WIE EIN PADEL / PAD - EINFACH ZU DRÜCKEN!
local openBtn=Instance.new("TextButton", gui)
openBtn.Name="OpenBtn"
openBtn.Size=UDim2.new(0,160,0,160) -- RIESIG!
openBtn.Position=UDim2.new(0.5,-80,0.5,-80) -- MITTE BILDSCHIRM!
openBtn.Text="V7\nOPEN\n👆"
openBtn.BackgroundColor3=Color3.fromRGB(0,255,140)
openBtn.TextColor3=Color3.fromRGB(0,0,0)
openBtn.TextScaled=true
openBtn.Font=Enum.Font.GothamBlack
openBtn.Active=true
openBtn.Draggable=true
openBtn.ZIndex=100
Instance.new("UICorner", openBtn).CornerRadius=UDim.new(0,30)
local openStroke=Instance.new("UIStroke", openBtn) openStroke.Color=Color3.new(1,1,1) openStroke.Thickness=4
-- Schatten damit man ihn sieht
local shadow=Instance.new("Frame", gui) shadow.Size=UDim2.new(0,170,0,170) shadow.Position=UDim2.new(0.5,-85,0.5,-75) shadow.BackgroundColor3=Color3.fromRGB(0,0,0) shadow.BackgroundTransparency=0.5 shadow.ZIndex=99 Instance.new("UICorner", shadow).CornerRadius=UDim.new(0,35) shadow.Visible=true
-- Schatten folgt Button
openBtn:GetPropertyChangedSignal("Position"):Connect(function() shadow.Position=UDim2.new(0,openBtn.Position.X.Offset-5,0,openBtn.Position.Y.Offset+5) end)

-- DOPPELT EINFACH ZUM ÖFFNEN - 3 WEGE!
local function toggleMain()
    main.Visible = not main.Visible
    if main.Visible then
        openBtn.Size=UDim2.new(0,90,0,90)
        openBtn.Text="CLOSE"
        openBtn.Position=UDim2.new(0,10,0,10)
        shadow.Visible=false
    else
        openBtn.Size=UDim2.new(0,160,0,160)
        openBtn.Text="V7\nOPEN\n👆"
        openBtn.Position=UDim2.new(0.5,-80,0.5,-80)
        shadow.Visible=true
        shadow.Position=UDim2.new(0,openBtn.Position.X.Offset-5,0,openBtn.Position.Y.Offset+5)
    end
end

openBtn.MouseButton1Click:Connect(toggleMain)
openBtn.TouchTap:Connect(toggleMain)
close.MouseButton1Click:Connect(function() main.Visible=false openBtn.Size=UDim2.new(0,160,0,160) openBtn.Text="V7\nOPEN\n👆" openBtn.Position=UDim2.new(0.5,-80,0.5,-80) shadow.Visible=true end)
close.TouchTap:Connect(function() main.Visible=false openBtn.Size=UDim2.new(0,160,0,160) openBtn.Text="V7\nOPEN\n👆" openBtn.Position=UDim2.new(0.5,-80,0.5,-80) shadow.Visible=true end)

-- HELPER
function makeSection(txt) local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,36) f.BackgroundColor3=Color3.fromRGB(30,30,38) Instance.new("UICorner", f).CornerRadius=UDim.new(0,10) local l=Instance.new("TextLabel", f) l.Size=UDim2.new(1,0,1,0) l.Text="  "..txt l.BackgroundTransparency=1 l.TextColor3=Color3.fromRGB(0,255,140) l.TextScaled=true l.Font=Enum.Font.GothamBlack l.TextXAlignment=Enum.TextXAlignment.Left end
function makeBtn(txt, color, cb) local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,0,0,62) b.Text=txt b.BackgroundColor3=color b.TextColor3=Color3.new(1,1,1) b.TextScaled=true b.Font=Enum.Font.GothamBold b.BorderSizePixel=0 Instance.new("UICorner", b).CornerRadius=UDim.new(0,12) b.MouseButton1Click:Connect(function() pcall(cb) end) b.TouchTap:Connect(function() pcall(cb) end) return b end
function makeToggle(name, color, cb) local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,64) f.BackgroundColor3=Color3.fromRGB(22,22,28) Instance.new("UICorner", f).CornerRadius=UDim.new(0,12) local l=Instance.new("TextLabel", f) l.Size=UDim2.new(0.55,0,1,0) l.Position=UDim2.new(0.03,0,0,0) l.Text=name l.BackgroundTransparency=1 l.TextColor3=Color3.new(1,1,1) l.TextScaled=true l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left local t=Instance.new("TextButton", f) t.Size=UDim2.new(0.36,0,0,44) t.Position=UDim2.new(0.61,0,0,10) t.Text="OFF" t.BackgroundColor3=Color3.fromRGB(65,65,75) t.TextColor3=Color3.new(1,1,1) t.TextScaled=true t.Font=Enum.Font.GothamBlack Instance.new("UICorner", t).CornerRadius=UDim.new(0,10) local on=false t.MouseButton1Click:Connect(function() on=not on t.Text=on and "ON" or "OFF" t.BackgroundColor3=on and color or Color3.fromRGB(65,65,75) pcall(function() cb(on) end) end) t.TouchTap:Connect(function() on=not on t.Text=on and "ON" or "OFF" t.BackgroundColor3=on and color or Color3.fromRGB(65,65,75) pcall(function() cb(on) end) end) end

-- LOGIC
local flyOn=false local flyLV=nil local flyAtt=nil local flySpeed=75 local flyUp=false local flyDown=false
local noclipOn=false local infTippOn=false local infHoldConn=nil
local function startFly() pcall(function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") if not hrp then return end if hrp:FindFirstChild("V7FlyAtt") then hrp.V7FlyAtt:Destroy() end if hrp:FindFirstChild("V7FlyLV") then hrp.V7FlyLV:Destroy() end flyAtt=Instance.new("Attachment") flyAtt.Name="V7FlyAtt" flyAtt.Parent=hrp flyLV=Instance.new("LinearVelocity") flyLV.Name="V7FlyLV" flyLV.Attachment0=flyAtt flyLV.MaxForce=math.huge flyLV.VectorVelocity=Vector3.new(0,0,0) flyLV.Parent=hrp task.spawn(function() while flyOn and flyLV and flyLV.Parent do pcall(function() local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") local move=hum and hum.MoveDirection or Vector3.new(0,0,0) local cam=workspace.CurrentCamera.CFrame local dir=Vector3.new(0,0,0) if move.Magnitude>0 then dir=cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z)) dir=Vector3.new(dir.X,0,dir.Z) if dir.Magnitude>0 then dir=dir.Unit*move.Magnitude end end if flyUp then dir=dir+Vector3.new(0,1.3,0) end if flyDown then dir=dir+Vector3.new(0,-1.3,0) end flyLV.VectorVelocity=dir*flySpeed if dir.Magnitude<0.1 and not flyUp and not flyDown then flyLV.VectorVelocity=Vector3.new(0,0.1,0) end end) RS.Heartbeat:Wait() end end) end) end
RS.Stepped:Connect(function() pcall(function() if noclipOn and LP.Character then for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end) end)
UIS.JumpRequest:Connect(function() pcall(function() if infTippOn and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end) end)

-- GUI LANG!
makeSection("1. BEWEGUNG - HANDY JOYSTICK!")
makeToggle("✈️ FLY AN/AUS (Joystick!)", Color3.fromRGB(0,140,255), function(on) flyOn=on if on then startFly() else pcall(function() if flyLV then flyLV:Destroy() end if flyAtt then flyAtt:Destroy() end end) end end)
makeToggle("⬆️ FLY HOCH HALTEN", Color3.fromRGB(0,100,255), function(on) flyUp=on end)
makeToggle("⬇️ FLY RUNTER HALTEN", Color3.fromRGB(0,80,200), function(on) flyDown=on end)
makeToggle("👻 NOCLIP DURCH WÄNDE", Color3.fromRGB(150,0,255), function(on) noclipOn=on end)
makeToggle("♾️ INF JUMP HOLD (HALTEN=FLIEGT)", Color3.fromRGB(0,255,100), function(on) if on then infHoldConn=RS.Heartbeat:Connect(function() pcall(function() if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then local h=LP.Character.Humanoid if h:GetState()==Enum.HumanoidStateType.Jumping or UIS:IsKeyDown(Enum.KeyCode.Space) or h.Jump then h:ChangeState(Enum.HumanoidStateType.Jumping) LP.Character.HumanoidRootPart.Velocity=Vector3.new(LP.Character.HumanoidRootPart.Velocity.X,75,LP.Character.HumanoidRootPart.Velocity.Z) end end end) end) else if infHoldConn then infHoldConn:Disconnect() end end end)
makeToggle("🦘 INF JUMP TIPP", Color3.fromRGB(0,200,80), function(on) infTippOn=on end)

makeSection("SPEED - ALLE GEHEN")
makeBtn("⚡ SPEED 80", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=80 end end)
makeBtn("⚡ SPEED 120", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=120 end end)
makeBtn("⚡ SPEED 200 ULTRA", Color3.fromRGB(0,160,100), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=200 end end)
makeBtn("💀 SPEED 400 GOD", Color3.fromRGB(255,0,80), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=400 end end)
makeBtn("🐢 SPEED 16 NORMAL", Color3.fromRGB(80,80,80), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=16 end end)

makeSection("JUMP - ALLE GEHEN")
makeBtn("🚀 HIGH JUMP 150", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,150,0) end end)
makeBtn("🚀 HIGH JUMP 250 GOD", Color3.fromRGB(255,80,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,250,0) end end)
makeBtn("↗️ LONG JUMP WEIT", Color3.fromRGB(255,100,0), function() if LP.Character then local cf=workspace.CurrentCamera.CFrame LP.Character.HumanoidRootPart.Velocity=Vector3.new(cf.LookVector.X*130,60,cf.LookVector.Z*130) end end)
makeBtn("⬆️ JUMP POWER 100", Color3.fromRGB(255,180,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=100 end end)
makeBtn("⬆️ JUMP POWER 200", Color3.fromRGB(255,160,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=200 end end)
makeBtn("⬇️ JUMP POWER 50 NORMAL", Color3.fromRGB(80,80,80), function() if LP.Character then LP.Character.Humanoid.JumpPower=50 end end)

makeSection("2. SEHEN - ESP WALLHACK")
makeToggle("👁️ ESP DURCH WÄNDE", Color3.fromRGB(255,0,80), function(on) if on then for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("V7ESP") then local hl=Instance.new("Highlight", p.Character) hl.Name="V7ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.OutlineColor=Color3.fromRGB(0,255,140) hl.FillTransparency=0.35 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end end else for _,p in pairs(Players:GetPlayers()) do if p.Character then for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V7ESP" then v:Destroy() end end end end end end)
makeToggle("🧱 WALLHACK WÄNDE DURCH", Color3.fromRGB(150,0,255), function(on) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(LP.Character) and v.Size.Magnitude>5 then v.LocalTransparencyModifier=on and 0.6 or 0 end end end)
makeBtn("☀️ FULLBRIGHT TAG AN", Color3.fromRGB(255,240,0), function() Lighting.Brightness=4 Lighting.ClockTime=13 Lighting.FogEnd=100000 Lighting.GlobalShadows=false end)
makeBtn("🌙 FULLBRIGHT AUS", Color3.fromRGB(60,60,20), function() Lighting.Brightness=2 Lighting.ClockTime=14 Lighting.FogEnd=100000 Lighting.GlobalShadows=true end)
makeBtn("🔍 XRAY 50% ALLES", Color3.fromRGB(100,100,100), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0.5 end end end)
makeBtn("❌ XRAY AUS", Color3.fromRGB(50,50,50), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0 end end end)

makeSection("3. TROLL & SPASS")
makeBtn("🧲 BRING ALL ZU DIR", Color3.fromRGB(0,200,0), function() for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame+Vector3.new(math.random(-4,4),0,math.random(-4,4)) end end end)
makeBtn("💫 FLING ALL", Color3.fromRGB(255,0,0), function() local old=LP.Character.HumanoidRootPart.CFrame for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame task.wait(0.15) local thrp=p.Character.HumanoidRootPart local bv=Instance.new("BodyVelocity", thrp) bv.Velocity=Vector3.new(0,99999,0) bv.MaxForce=Vector3.new(9e9,9e9) task.wait(0.35) bv:Destroy() end end LP.Character.HumanoidRootPart.CFrame=old end)
makeBtn("👻 INVISIBLE AN/AUS", Color3.fromRGB(30,30,30), function() for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.Transparency=v.Transparency==0 and 1 or 0 end end end)

makeSection("4. CLIENT - ANTI BAN")
makeBtn("🛡️ ANTI-AFK AN - NIE KICK", Color3.fromRGB(0,150,60), function() local vu=game:GetService("VirtualUser") LP.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end)
makeBtn("🚀 FPS BOOST ULTRA", Color3.fromRGB(70,70,70), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic end if v:IsA("Decal") or v:IsA("Texture") then v.Transparency=1 end end Lighting.GlobalShadows=false end)
makeBtn("❤️ GOD MODE", Color3.fromRGB(255,215,0), function() if LP.Character then LP.Character.Humanoid.MaxHealth=math.huge LP.Character.Humanoid.Health=math.huge end end)
makeBtn("📜 ECHTES IY LADEN ORIGINAL", Color3.fromRGB(0,0,0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
makeBtn("🔄 REJOIN SERVER", Color3.fromRGB(0,100,200), function() game:GetService("TeleportService"):Teleport(game.PlaceId, LP) end)
makeBtn("🗑️ GUI LÖSCHEN", Color3.fromRGB(255,0,0), function() gui:Destroy() end)

print("✅ V7 BIG GELADEN - RIESEN BUTTON - ALLES GEHT - LEICHT ZU ÖFFNEN")
