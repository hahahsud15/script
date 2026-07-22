-- V10.1 ULTRA LONG - ALLES DRIN - SPRACHE DE/EN - KLEINER OPEN - FLY FIXED - hahahsud15 2026 FINAL
local Players=game:GetService("Players")
local LP=Players.LocalPlayer
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local Lighting=game:GetService("Lighting")
local Teleport=game:GetService("TeleportService")
local Debris=game:GetService("Debris")

local function getParent()
    local p=nil
    pcall(function() if gethui then p=gethui() end end)
    if not p then pcall(function() p=game.CoreGui end) end
    if not p then p=LP:WaitForChild("PlayerGui") end
    return p
end
local parent=getParent()
if parent:FindFirstChild("V10_FINAL") then pcall(function() parent.V10_FINAL:Destroy() end) task.wait(0.2) end

local gui=Instance.new("ScreenGui", parent)
gui.Name="V10_FINAL"
gui.ResetOnSpawn=false
gui.DisplayOrder=9999999
gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

local langFrame=Instance.new("Frame", gui)
langFrame.Size=UDim2.new(0.8,0,0.4,0)
langFrame.Position=UDim2.new(0.1,0,0.3,0)
langFrame.BackgroundColor3=Color3.fromRGB(14,14,20)
langFrame.BorderSizePixel=0
Instance.new("UICorner", langFrame).CornerRadius=UDim.new(0,16)
Instance.new("UIStroke", langFrame).Color=Color3.fromRGB(0,255,140)
local langTitle=Instance.new("TextLabel", langFrame) langTitle.Size=UDim2.new(1,0,0.35,0) langTitle.Text="Choose Language / Sprache wahlen" langTitle.BackgroundTransparency=1 langTitle.TextColor3=Color3.new(1,1,1) langTitle.TextScaled=true langTitle.Font=Enum.Font.GothamBlack
local btnEN=Instance.new("TextButton", langFrame) btnEN.Size=UDim2.new(0.8,0,0.25,0) btnEN.Position=UDim2.new(0.1,0,0.4,0) btnEN.Text="ENGLISH" btnEN.BackgroundColor3=Color3.fromRGB(0,120,255) btnEN.TextColor3=Color3.new(1,1,1) btnEN.TextScaled=true btnEN.Font=Enum.Font.GothamBold Instance.new("UICorner", btnEN).CornerRadius=UDim.new(0,12)
local btnDE=Instance.new("TextButton", langFrame) btnDE.Size=UDim2.new(0.8,0,0.25,0) btnDE.Position=UDim2.new(0.1,0,0.7,0) btnDE.Text="DEUTSCH" btnDE.BackgroundColor3=Color3.fromRGB(0,200,80) btnDE.TextColor3=Color3.new(1,1,1) btnDE.TextScaled=true btnDE.Font=Enum.Font.GothamBold Instance.new("UICorner", btnDE).CornerRadius=UDim.new(0,12)

local LANG="DE" local T={}
local function setLang(l)
    LANG=l
    if l=="DE" then
        T={title="V10.1 ULTRA LONG - DE - ALLES DRIN", fly="FLY Joystick!", flyUp="FLY HOCH", flyDown="FLY RUNTER", flyForward="FLY VORWARTS", noclip="NOCLIP", infHold="INF JUMP HOLD", infTipp="INF JUMP TIPP", esp="ESP", wallhack="WALLHACK", open="V10 OPEN"}
    else
        T={title="V10.1 ULTRA LONG - EN - ALL IN", fly="FLY Joystick!", flyUp="FLY UP", flyDown="FLY DOWN", flyForward="FLY FORWARD", noclip="NOCLIP", infHold="INF JUMP HOLD", infTipp="INF JUMP TIPP", esp="ESP", wallhack="WALLHACK", open="V10 OPEN"}
    end
end
setLang("DE")

local main=Instance.new("Frame", gui) main.Size=UDim2.new(0.94,0,0.90,0) main.Position=UDim2.new(0.03,0,0.05,0) main.BackgroundColor3=Color3.fromRGB(14,14,20) main.BorderSizePixel=0 main.Active=true main.Draggable=true main.Visible=false Instance.new("UICorner", main).CornerRadius=UDim.new(0,14) Instance.new("UIStroke", main).Color=Color3.fromRGB(0,255,140)
local top=Instance.new("Frame", main) top.Size=UDim2.new(1,0,0,50) top.BackgroundColor3=Color3.fromRGB(0,255,140) Instance.new("UICorner", top).CornerRadius=UDim.new(0,14)
local fix=Instance.new("Frame", top) fix.Size=UDim2.new(1,0,0,12) fix.Position=UDim2.new(0,0,1,-12) fix.BackgroundColor3=Color3.fromRGB(0,255,140) fix.BorderSizePixel=0 fix.Parent=top
local titleLabel=Instance.new("TextLabel", top) titleLabel.Size=UDim2.new(0.7,0,1,0) titleLabel.Position=UDim2.new(0.03,0,0,0) titleLabel.Text=T.title titleLabel.BackgroundTransparency=1 titleLabel.TextColor3=Color3.fromRGB(0,0,0) titleLabel.TextScaled=true titleLabel.Font=Enum.Font.GothamBlack titleLabel.TextXAlignment=Enum.TextXAlignment.Left
local close=Instance.new("TextButton", top) close.Size=UDim2.new(0,60,0,44) close.Position=UDim2.new(1,-65,0,3) close.Text="X" close.BackgroundColor3=Color3.fromRGB(20,20,20) close.TextColor3=Color3.new(1,1,1) close.TextScaled=true close.Font=Enum.Font.GothamBlack Instance.new("UICorner", close).CornerRadius=UDim.new(0,10)

local scroll=Instance.new("ScrollingFrame", main) scroll.Size=UDim2.new(1,0,1,-55) scroll.Position=UDim2.new(0,0,0,55) scroll.BackgroundTransparency=1 scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y scroll.ScrollBarThickness=6 scroll.ScrollBarImageColor3=Color3.fromRGB(0,255,140)
local layout=Instance.new("UIListLayout", scroll) layout.Padding=UDim.new(0,10)
local pad=Instance.new("UIPadding", scroll) pad.PaddingLeft=UDim.new(0,12) pad.PaddingRight=UDim.new(0,12) pad.PaddingTop=UDim.new(0,10) pad.PaddingBottom=UDim.new(0,30)

local openBtn=Instance.new("TextButton", gui) openBtn.Size=UDim2.new(0,100,0,100) openBtn.Position=UDim2.new(0.5,-50,0.5,-50) openBtn.Text=T.open openBtn.BackgroundColor3=Color3.fromRGB(0,255,140) openBtn.TextColor3=Color3.fromRGB(0,0,0) openBtn.TextScaled=true openBtn.Font=Enum.Font.GothamBlack openBtn.Visible=false openBtn.Active=true openBtn.ZIndex=100 Instance.new("UICorner", openBtn).CornerRadius=UDim.new(0,20) Instance.new("UIStroke", openBtn).Color=Color3.new(1,1,1)

local dragging=false local dragStart=nil local startPos=nil local dragMoved=false
openBtn.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=true dragStart=input.Position startPos=openBtn.Position dragMoved=false end end)
openBtn.InputChanged:Connect(function(input) if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then local delta=input.Position-dragStart if delta.Magnitude>10 then dragMoved=true end openBtn.Position=UDim2.new(startPos.X.Scale, startPos.X.Offset+delta.X, startPos.Y.Scale, startPos.Y.Offset+delta.Y) end end)
UIS.InputEnded:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then if dragging then dragging=false if not dragMoved then main.Visible=not main.Visible if main.Visible then openBtn.Size=UDim2.new(0,70,0,70) openBtn.Text="CLOSE" openBtn.Position=UDim2.new(0,10,0,10) else openBtn.Size=UDim2.new(0,100,0,100) openBtn.Text=T.open openBtn.Position=UDim2.new(0.5,-50,0.5,-50) end end end end end)
close.Activated:Connect(function() main.Visible=false openBtn.Size=UDim2.new(0,100,0,100) openBtn.Text=T.open openBtn.Position=UDim2.new(0.5,-50,0.5,-50) end)

function makeToggle(name, color, cb) local btn=Instance.new("TextButton", scroll) btn.Size=UDim2.new(1,0,0,68) btn.BackgroundColor3=Color3.fromRGB(26,26,32) btn.TextColor3=Color3.new(1,1,1) btn.Text=name.." : OFF" btn.TextScaled=true btn.Font=Enum.Font.GothamBold btn.BorderSizePixel=0 btn.AutoButtonColor=false Instance.new("UICorner", btn).CornerRadius=UDim.new(0,12) local on=false btn.Activated:Connect(function() on=not on if on then btn.Text=name.." : ON" btn.BackgroundColor3=color btn.TextColor3=Color3.fromRGB(0,0,0) else btn.Text=name.." : OFF" btn.BackgroundColor3=Color3.fromRGB(26,26,32) btn.TextColor3=Color3.new(1,1,1) end pcall(function() cb(on) end) end) end
function makeBtn(txt, color, cb) local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,0,0,62) b.Text=txt b.BackgroundColor3=color b.TextColor3=Color3.new(1,1,1) b.TextScaled=true b.Font=Enum.Font.GothamBold b.BorderSizePixel=0 Instance.new("UICorner", b).CornerRadius=UDim.new(0,12) b.AutoButtonColor=false b.Activated:Connect(function() pcall(cb) end) end
function makeSection(txt) local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,34) f.BackgroundColor3=Color3.fromRGB(30,30,38) Instance.new("UICorner", f).CornerRadius=UDim.new(0,10) local l=Instance.new("TextLabel", f) l.Size=UDim2.new(1,0,1,0) l.Text="  "..txt l.BackgroundTransparency=1 l.TextColor3=Color3.fromRGB(0,255,140) l.TextScaled=true l.Font=Enum.Font.GothamBlack l.TextXAlignment=Enum.TextXAlignment.Left end

local flyOn=false local flyLV=nil local flyAtt=nil local flySpeed=65 local flyUp=false local flyDown=false local flyForward=false
local noclipOn=false local infTippOn=false local infHoldConn=nil
local function startFly() pcall(function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") if not hrp then return end if hrp:FindFirstChild("V10FlyAtt") then hrp.V10FlyAtt:Destroy() end if hrp:FindFirstChild("V10FlyLV") then hrp.V10FlyLV:Destroy() end flyAtt=Instance.new("Attachment") flyAtt.Name="V10FlyAtt" flyAtt.Parent=hrp flyLV=Instance.new("LinearVelocity") flyLV.Name="V10FlyLV" flyLV.Attachment0=flyAtt flyLV.MaxForce=math.huge flyLV.VectorVelocity=Vector3.new(0,0,0) flyLV.Parent=hrp task.spawn(function() while flyOn and flyLV and flyLV.Parent do pcall(function() local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") local move=hum and hum.MoveDirection or Vector3.new(0,0,0) local cam=workspace.CurrentCamera.CFrame local dir=Vector3.new(0,0,0) if move.Magnitude>0 then dir=cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z)) dir=Vector3.new(dir.X,0,dir.Z) if dir.Magnitude>0 then dir=dir.Unit*move.Magnitude end end if flyForward then dir=dir+cam.LookVector end if flyUp then dir=dir+Vector3.new(0,1.2,0) end if flyDown then dir=dir+Vector3.new(0,-1.2,0) end if dir.Magnitude<0.1 then flyLV.VectorVelocity=Vector3.new(0,0.1,0) else flyLV.VectorVelocity=dir.Unit*flySpeed end end) RS.Heartbeat:Wait() end end) end) end
RS.Stepped:Connect(function() pcall(function() if noclipOn and LP.Character then for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end) end)
UIS.JumpRequest:Connect(function() pcall(function() if infTippOn and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end) end)

local function buildGUI()
    for _,v in pairs(scroll:GetChildren()) do if v:IsA("TextButton") or v:IsA("Frame") then v:Destroy() end end
    titleLabel.Text=T.title openBtn.Text=T.open
    makeSection(LANG=="DE" and "1. BEWEGUNG - FLY FIXED!" or "1. MOVEMENT - FLY FIXED!")
    makeToggle(T.fly, Color3.fromRGB(0,255,140), function(on) flyOn=on if on then startFly() else pcall(function() if flyLV then flyLV:Destroy() end if flyAtt then flyAtt:Destroy() end end) end end)
    makeToggle(T.flyForward, Color3.fromRGB(0,200,120), function(on) flyForward=on end)
    makeToggle(T.flyUp, Color3.fromRGB(0,140,255), function(on) flyUp=on end)
    makeToggle(T.flyDown, Color3.fromRGB(0,100,200), function(on) flyDown=on end)
    makeToggle(T.noclip, Color3.fromRGB(150,0,255), function(on) noclipOn=on end)
    makeToggle(T.infHold, Color3.fromRGB(0,255,100), function(on) if on then infHoldConn=RS.Heartbeat:Connect(function() pcall(function() if LP.Character then local h=LP.Character.Humanoid if h:GetState()==Enum.HumanoidStateType.Jumping or UIS:IsKeyDown(Enum.KeyCode.Space) or h.Jump then h:ChangeState(Enum.HumanoidStateType.Jumping) LP.Character.HumanoidRootPart.Velocity=Vector3.new(LP.Character.HumanoidRootPart.Velocity.X,75,LP.Character.HumanoidRootPart.Velocity.Z) end end end) end) else if infHoldConn then infHoldConn:Disconnect() end end end)
    makeToggle(T.infTipp, Color3.fromRGB(0,200,80), function(on) infTippOn=on end)
    makeSection("SPEED - ALLE GEHEN!")
    makeBtn("SPEED 50", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=50 end end)
    makeBtn("SPEED 80", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=80 end end)
    makeBtn("SPEED 100", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=100 end end)
    makeBtn("SPEED 120", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=120 end end)
    makeBtn("SPEED 200 ULTRA", Color3.fromRGB(0,160,100), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=200 end end)
    makeBtn("SPEED 400 GOD", Color3.fromRGB(255,0,80), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=400 end end)
    makeBtn("SPEED 600 ULTRA GOD", Color3.fromRGB(255,0,60), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=600 end end)
    makeBtn("SPEED 16 NORMAL", Color3.fromRGB(80,80,80), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=16 end end)
    makeSection("JUMP - ALLE GEHEN!")
    makeBtn("HIGH JUMP 100", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,100,0) end end)
    makeBtn("HIGH JUMP 150", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,150,0) end end)
    makeBtn("HIGH JUMP 200", Color3.fromRGB(255,120,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,200,0) end end)
    makeBtn("HIGH JUMP 300 GOD", Color3.fromRGB(255,80,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,300,0) end end)
    makeBtn("LONG JUMP WEIT", Color3.fromRGB(255,100,0), function() if LP.Character then local cf=workspace.CurrentCamera.CFrame LP.Character.HumanoidRootPart.Velocity=Vector3.new(cf.LookVector.X*130,60,cf.LookVector.Z*130) end end)
    makeBtn("LONG JUMP ULTRA", Color3.fromRGB(255,80,0), function() if LP.Character then local cf=workspace.CurrentCamera.CFrame LP.Character.HumanoidRootPart.Velocity=Vector3.new(cf.LookVector.X*200,80,cf.LookVector.Z*200) end end)
    makeBtn("JUMP POWER 50 NORMAL", Color3.fromRGB(80,80,80), function() if LP.Character then LP.Character.Humanoid.JumpPower=50 end end)
    makeBtn("JUMP POWER 100", Color3.fromRGB(255,180,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=100 end end)
    makeBtn("JUMP POWER 150", Color3.fromRGB(255,160,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=150 end end)
    makeBtn("JUMP POWER 200 GOD", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.Humanoid.JumpPower=200 end end)
    makeSection("2. SEHEN - ALLES GEHT!")
    makeToggle(T.esp, Color3.fromRGB(255,0,80), function(on) if on then for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("V10ESP") then local hl=Instance.new("Highlight", p.Character) hl.Name="V10ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.OutlineColor=Color3.fromRGB(0,255,140) hl.FillTransparency=0.35 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end end else for _,p in pairs(Players:GetPlayers()) do if p.Character then for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V10ESP" then v:Destroy() end end end end end end)
    makeToggle(T.wallhack, Color3.fromRGB(150,0,255), function(on) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(LP.Character) and v.Size.Magnitude>5 then v.LocalTransparencyModifier=on and 0.6 or 0 end end end)
    makeBtn("FULLBRIGHT TAG", Color3.fromRGB(255,240,0), function() Lighting.Brightness=4 Lighting.ClockTime=13 Lighting.FogEnd=100000 Lighting.GlobalShadows=false end)
    makeBtn("NACHT DUNKEL", Color3.fromRGB(40,40,20), function() Lighting.Brightness=2 Lighting.ClockTime=0 Lighting.FogEnd=500 Lighting.GlobalShadows=true end)
    makeBtn("NO FOG", Color3.fromRGB(200,200,200), function() Lighting.FogEnd=100000 end)
    makeBtn("XRAY 50%", Color3.fromRGB(100,100,100), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0.5 end end end)
    makeBtn("XRAY AUS", Color3.fromRGB(50,50,50), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0 end end end)
    makeSection("3. TROLL - ALLES GEHT!")
    makeBtn("BRING ALL", Color3.fromRGB(0,200,0), function() for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame+Vector3.new(math.random(-4,4),0,math.random(-4,4)) end end end)
    makeBtn("FLING ALL", Color3.fromRGB(255,0,0), function() local old=LP.Character.HumanoidRootPart.CFrame for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame task.wait(0.15) local thrp=p.Character.HumanoidRootPart local bv=Instance.new("BodyVelocity", thrp) bv.Velocity=Vector3.new(0,99999,0) bv.MaxForce=Vector3.new(9e9,9e9) task.wait(0.35) bv:Destroy() end end LP.Character.HumanoidRootPart.CFrame=old end)
    makeBtn("JAIL ALL", Color3.fromRGB(150,0,0), function() for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character then local prt=Instance.new("Part", workspace) prt.Size=Vector3.new(14,14,14) prt.CFrame=p.Character.HumanoidRootPart.CFrame prt.Anchored=true prt.Transparency=0.25 prt.Material=Enum.Material.ForceField prt.Color=Color3.fromRGB(255,0,0) Debris:AddItem(prt,30) end end end)
    makeBtn("LAG 200 PARTS", Color3.fromRGB(255,0,150), function() for i=1,200 do local pt=Instance.new("Part", workspace) pt.Size=Vector3.new(2,2,2) pt.Position=LP.Character.HumanoidRootPart.Position+Vector3.new(math.random(-80,80),40,math.random(-80,80)) pt.Anchored=false pt.Color=Color3.fromHSV(math.random(),1,1) end end)
    makeBtn("INVISIBLE", Color3.fromRGB(30,30,30), function() for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.Transparency=v.Transparency==0 and 1 or 0 end end end)
    makeSection("4. CLIENT - ALLES GEHT!")
    makeBtn("ANTI-AFK", Color3.fromRGB(0,150,60), function() local vu=game:GetService("VirtualUser") LP.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end)
    makeBtn("FPS BOOST", Color3.fromRGB(70,70,70), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic end if v:IsA("Decal") then v.Transparency=1 end if v:IsA("ParticleEmitter") then v.Enabled=false end end Lighting.GlobalShadows=false end)
    makeBtn("GOD MODE", Color3.fromRGB(255,215,0), function() if LP.Character then LP.Character.Humanoid.MaxHealth=math.huge LP.Character.Humanoid.Health=math.huge end end)
    makeBtn("SHADOWS AUS", Color3.fromRGB(50,50,50), function() Lighting.GlobalShadows=false end)
    makeBtn("SHADOWS AN", Color3.fromRGB(90,90,90), function() Lighting.GlobalShadows=true end)
    makeBtn("IY LADEN", Color3.fromRGB(0,0,0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
    makeBtn("REJOIN", Color3.fromRGB(0,100,200), function() Teleport:Teleport(game.PlaceId, LP) end)
    makeBtn("SERVER HOP", Color3.fromRGB(0,80,180), function() local Http=game:GetService("HttpService") local servers=game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100") local data=Http:JSONDecode(servers) for _,s in pairs(data.data) do if s.playing < s.maxPlayers and s.id ~= game.JobId then Teleport:TeleportToPlaceInstance(game.PlaceId, s.id, LP) break end end end)
    makeBtn("COPY PLACE ID", Color3.fromRGB(60,60,60), function() setclipboard(tostring(game.PlaceId)) end)
    makeBtn("COPY JOB ID", Color3.fromRGB(60,60,60), function() setclipboard(game.JobId) end)
    makeBtn("GUI LOSCHEN", Color3.fromRGB(255,0,0), function() gui:Destroy() end)
end

btnEN.Activated:Connect(function() setLang("EN") langFrame.Visible=false openBtn.Visible=true main.Visible=true buildGUI() end)
btnDE.Activated:Connect(function() setLang("DE") langFrame.Visible=false openBtn.Visible=true main.Visible=true buildGUI() end)

print("V10.1 ULTRA LONG GELADEN!")
