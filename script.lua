-- V7.2 FIXED - GANZE REIHE = 1 BUTTON - OFF GEHT ZU ON - 100% HANDY - hahahsud15
local Players=game:GetService("Players")
local LP=Players.LocalPlayer
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local Lighting=game:GetService("Lighting")

local function getParent()
    local p=nil
    pcall(function() if gethui then p=gethui() end end)
    if not p then pcall(function() p=game.CoreGui end) end
    if not p then p=LP:WaitForChild("PlayerGui") end
    return p
end
local parent=getParent()
if parent:FindFirstChild("V7_BIG") then pcall(function() parent.V7_BIG:Destroy() end) task.wait(0.2) end

local gui=Instance.new("ScreenGui", parent)
gui.Name="V7_BIG"
gui.ResetOnSpawn=false
gui.DisplayOrder=9999999

local main=Instance.new("Frame", gui)
main.Size=UDim2.new(0.94,0,0.88,0)
main.Position=UDim2.new(0.03,0,0.06,0)
main.BackgroundColor3=Color3.fromRGB(14,14,20)
main.Active=true
main.Draggable=true
main.Visible=true
Instance.new("UICorner", main).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke", main).Color=Color3.fromRGB(0,255,140)

local top=Instance.new("Frame", main)
top.Size=UDim2.new(1,0,0,50)
top.BackgroundColor3=Color3.fromRGB(0,255,140)
Instance.new("UICorner", top).CornerRadius=UDim.new(0,14)
local fix=Instance.new("Frame", top) fix.Size=UDim2.new(1,0,0,12) fix.Position=UDim2.new(0,0,1,-12) fix.BackgroundColor3=Color3.fromRGB(0,255,140) fix.BorderSizePixel=0 fix.Parent=top
local title=Instance.new("TextLabel", top) title.Size=UDim2.new(0.7,0,1,0) title.Position=UDim2.new(0.03,0,0,0) title.Text="V7.2 FIXED - DRÜCK GANZE REIHE!" title.BackgroundTransparency=1 title.TextColor3=Color3.fromRGB(0,0,0) title.TextScaled=true title.Font=Enum.Font.GothamBlack title.TextXAlignment=Enum.TextXAlignment.Left
local close=Instance.new("TextButton", top) close.Size=UDim2.new(0,60,0,44) close.Position=UDim2.new(1,-65,0,3) close.Text="CLOSE" close.BackgroundColor3=Color3.fromRGB(20,20,20) close.TextColor3=Color3.new(1,1,1) close.TextScaled=true close.Font=Enum.Font.GothamBold Instance.new("UICorner", close).CornerRadius=UDim.new(0,10)

local scroll=Instance.new("ScrollingFrame", main)
scroll.Size=UDim2.new(1,0,1,-55)
scroll.Position=UDim2.new(0,0,0,55)
scroll.BackgroundTransparency=1
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
scroll.ScrollBarThickness=6
scroll.ScrollBarImageColor3=Color3.fromRGB(0,255,140)
local layout=Instance.new("UIListLayout", scroll) layout.Padding=UDim.new(0,10)
local pad=Instance.new("UIPadding", scroll) pad.PaddingLeft=UDim.new(0,10) pad.PaddingRight=UDim.new(0,10) pad.PaddingTop=UDim.new(0,10) pad.PaddingBottom=UDim.new(0,20)

local openBtn=Instance.new("TextButton", gui)
openBtn.Size=UDim2.new(0,150,0,150)
openBtn.Position=UDim2.new(0.5,-75,0.5,-75)
openBtn.Text="V7\nOPEN"
openBtn.BackgroundColor3=Color3.fromRGB(0,255,140)
openBtn.TextColor3=Color3.fromRGB(0,0,0)
openBtn.TextScaled=true
openBtn.Font=Enum.Font.GothamBlack
openBtn.Active=true
openBtn.Draggable=true
Instance.new("UICorner", openBtn).CornerRadius=UDim.new(0,30)

local function toggleMain()
    main.Visible=not main.Visible
    if main.Visible then
        openBtn.Size=UDim2.new(0,90,0,90)
        openBtn.Text="CLOSE"
        openBtn.Position=UDim2.new(0,10,0,10)
    else
        openBtn.Size=UDim2.new(0,150,0,150)
        openBtn.Text="V7\nOPEN"
        openBtn.Position=UDim2.new(0.5,-75,0.5,-75)
    end
end
openBtn.Activated:Connect(toggleMain)
close.Activated:Connect(function() main.Visible=false openBtn.Size=UDim2.new(0,150,0,150) openBtn.Text="V7\nOPEN" openBtn.Position=UDim2.new(0.5,-75,0.5,-75) end)

-- DAS IST DER FIX! 1 BUTTON = GANZE REIHE!
function makeToggle(name, color, cb)
    local btn=Instance.new("TextButton", scroll)
    btn.Size=UDim2.new(1,0,0,70) -- RIESIG!
    btn.BackgroundColor3=Color3.fromRGB(30,30,40)
    btn.TextColor3=Color3.new(1,1,1)
    btn.Text=name.." : OFF"
    btn.TextScaled=true
    btn.Font=Enum.Font.GothamBold
    btn.BorderSizePixel=0
    Instance.new("UICorner", btn).CornerRadius=UDim.new(0,12)
    
    local on=false
    btn.Activated:Connect(function() -- NUR Activated! Geht auf Handy + PC!
        on=not on
        if on then
            btn.Text=name.." : ON"
            btn.BackgroundColor3=color
            btn.TextColor3=Color3.fromRGB(0,0,0)
        else
            btn.Text=name.." : OFF"
            btn.BackgroundColor3=Color3.fromRGB(30,30,40)
            btn.TextColor3=Color3.new(1,1,1)
        end
        pcall(function() cb(on) end)
    end)
end

function makeBtn(txt, color, cb)
    local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,0,0,65) b.Text=txt b.BackgroundColor3=color b.TextColor3=Color3.new(1,1,1) b.TextScaled=true b.Font=Enum.Font.GothamBold b.BorderSizePixel=0 Instance.new("UICorner", b).CornerRadius=UDim.new(0,12)
    b.Activated:Connect(function() pcall(cb) end)
end

-- LOGIC
local flyOn=false local flyLV=nil local flyAtt=nil local flySpeed=70 local flyUp=false local flyDown=false
local noclipOn=false local infTippOn=false local infHoldConn=nil
local function startFly() pcall(function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") if not hrp then return end if hrp:FindFirstChild("V7FlyAtt") then hrp.V7FlyAtt:Destroy() end if hrp:FindFirstChild("V7FlyLV") then hrp.V7FlyLV:Destroy() end flyAtt=Instance.new("Attachment") flyAtt.Name="V7FlyAtt" flyAtt.Parent=hrp flyLV=Instance.new("LinearVelocity") flyLV.Name="V7FlyLV" flyLV.Attachment0=flyAtt flyLV.MaxForce=math.huge flyLV.VectorVelocity=Vector3.new(0,0,0) flyLV.Parent=hrp task.spawn(function() while flyOn and flyLV and flyLV.Parent do pcall(function() local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") local move=hum and hum.MoveDirection or Vector3.new(0,0,0) local cam=workspace.CurrentCamera.CFrame local dir=Vector3.new(0,0,0) if move.Magnitude>0 then dir=cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z)) dir=Vector3.new(dir.X,0,dir.Z) if dir.Magnitude>0 then dir=dir.Unit*move.Magnitude end end if flyUp then dir=dir+Vector3.new(0,1.3,0) end if flyDown then dir=dir+Vector3.new(0,-1.3,0) end flyLV.VectorVelocity=dir*flySpeed if dir.Magnitude<0.1 and not flyUp and not flyDown then flyLV.VectorVelocity=Vector3.new(0,0.1,0) end end) RS.Heartbeat:Wait() end end) end) end
RS.Stepped:Connect(function() pcall(function() if noclipOn and LP.Character then for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end) end)
UIS.JumpRequest:Connect(function() pcall(function() if infTippOn and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end) end)

makeToggle("FLY (Joystick bewegen!)", Color3.fromRGB(0,255,140), function(on) flyOn=on if on then startFly() else pcall(function() if flyLV then flyLV:Destroy() end if flyAtt then flyAtt:Destroy() end end) end end)
makeToggle("FLY HOCH", Color3.fromRGB(0,140,255), function(on) flyUp=on end)
makeToggle("FLY RUNTER", Color3.fromRGB(0,100,255), function(on) flyDown=on end)
makeToggle("NOCLIP", Color3.fromRGB(150,0,255), function(on) noclipOn=on end)
makeToggle("INF JUMP HOLD (HALTEN=HOCH)", Color3.fromRGB(0,255,100), function(on) if on then infHoldConn=RS.Heartbeat:Connect(function() pcall(function() if LP.Character then local h=LP.Character.Humanoid if h:GetState()==Enum.HumanoidStateType.Jumping or UIS:IsKeyDown(Enum.KeyCode.Space) or h.Jump then h:ChangeState(Enum.HumanoidStateType.Jumping) LP.Character.HumanoidRootPart.Velocity=Vector3.new(LP.Character.HumanoidRootPart.Velocity.X,75,LP.Character.HumanoidRootPart.Velocity.Z) end end end) end) else if infHoldConn then infHoldConn:Disconnect() end end end)
makeToggle("INF JUMP TIPP", Color3.fromRGB(0,200,80), function(on) infTippOn=on end)
makeToggle("ESP WALLHACK", Color3.fromRGB(255,0,80), function(on) if on then for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("V7ESP") then local hl=Instance.new("Highlight", p.Character) hl.Name="V7ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.OutlineColor=Color3.fromRGB(0,255,140) hl.FillTransparency=0.35 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end end else for _,p in pairs(Players:GetPlayers()) do if p.Character then for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V7ESP" then v:Destroy() end end end end end end)
makeToggle("WALLHACK DURCH", Color3.fromRGB(150,0,255), function(on) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(LP.Character) and v.Size.Magnitude>5 then v.LocalTransparencyModifier=on and 0.6 or 0 end end end)

makeBtn("SPEED 200", Color3.fromRGB(0,180,120), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=200 end end)
makeBtn("SPEED 16 NORMAL", Color3.fromRGB(80,80,80), function() if LP.Character then LP.Character.Humanoid.WalkSpeed=16 end end)
makeBtn("HIGH JUMP 200", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,200,0) end end)
makeBtn("FULLBRIGHT TAG", Color3.fromRGB(255,240,0), function() Lighting.Brightness=4 Lighting.ClockTime=13 Lighting.FogEnd=100000 Lighting.GlobalShadows=false end)
makeBtn("ANTI-AFK", Color3.fromRGB(0,150,60), function() local vu=game:GetService("VirtualUser") LP.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end)
makeBtn("ECHTES IY LADEN", Color3.fromRGB(0,0,0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)

print("✅ V7.2 FIXED - GANZE REIHE KLICKBAR - OFF GEHT ZU ON!")
