-- V4 ULTRA GOD 2026 - SCHÖN + ALLES GEHT - hahahsud15
-- Wie echte Cheats funktionieren - FIXED

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local parent
pcall(function() parent = gethui() end)
if not parent then parent = game:GetService("CoreGui") end
if parent:FindFirstChild("V4_GOD") then parent.V4_GOD:Destroy() end

local gui = Instance.new("ScreenGui", parent)
gui.Name = "V4_GOD"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- MAIN SCHÖN WIE IPHONE
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.94,0,0.88,0)
main.Position = UDim2.new(0.03,0,0.08,0)
main.BackgroundColor3 = Color3.fromRGB(14,14,20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)
local stroke = Instance.new("UIStroke", main) stroke.Color = Color3.fromRGB(0,255,140) stroke.Thickness = 2 stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,55)
top.BackgroundColor3 = Color3.fromRGB(0,255,140)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,16)
local fix = Instance.new("Frame", top) fix.Size = UDim2.new(1,0,0,12) fix.Position = UDim2.new(0,0,1,-12) fix.BackgroundColor3 = Color3.fromRGB(0,255,140) fix.BorderSizePixel=0 fix.Parent=top
local title = Instance.new("TextLabel", top) title.Size=UDim2.new(0.7,0,1,0) title.Position=UDim2.new(0.03,0,0,0) title.Text="V4 ULTRA GOD" title.BackgroundTransparency=1 title.TextColor3=Color3.fromRGB(10,10,10) title.TextScaled=true title.Font=Enum.Font.GothamBlack title.TextXAlignment=Enum.TextXAlignment.Left
local close = Instance.new("TextButton", top) close.Size=UDim2.new(0,40,0,40) close.Position=UDim2.new(1,-45,0,7) close.Text="X" close.BackgroundColor3=Color3.fromRGB(20,20,20) close.TextColor3=Color3.new(1,1,1) close.TextScaled=true close.Font=Enum.Font.GothamBold Instance.new("UICorner", close).CornerRadius=UDim.new(0,10) close.MouseButton1Click:Connect(function() main.Visible=false end)

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1,0,1,-60)
scroll.Position = UDim2.new(0,0,0,60)
scroll.BackgroundTransparency=1
scroll.CanvasSize = UDim2.new(0,0,0,1650)
scroll.ScrollBarThickness=0
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
local layout = Instance.new("UIListLayout", scroll) layout.Padding=UDim.new(0,8) layout.SortOrder=Enum.SortOrder.LayoutOrder
local pad = Instance.new("UIPadding", scroll) pad.PaddingLeft=UDim.new(0,12) pad.PaddingRight=UDim.new(0,12) pad.PaddingTop=UDim.new(0,10)

local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,80,0,80)
openBtn.Position = UDim2.new(0,12,0.45,0)
openBtn.Text = "V4"
openBtn.BackgroundColor3 = Color3.fromRGB(0,255,140)
openBtn.TextColor3=Color3.fromRGB(0,0,0)
openBtn.TextScaled=true
openBtn.Font=Enum.Font.GothamBlack
Instance.new("UICorner", openBtn).CornerRadius=UDim.new(1,0)
openBtn.Active=true
openBtn.Draggable=true
openBtn.MouseButton1Click:Connect(function() main.Visible=not main.Visible end)

function makeSection(txt)
    local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,30) f.BackgroundColor3=Color3.fromRGB(28,28,35) f.LayoutOrder=0
    Instance.new("UICorner", f).CornerRadius=UDim.new(0,8)
    local l=Instance.new("TextLabel", f) l.Size=UDim2.new(1,0,1,0) l.Text="  "..txt l.BackgroundTransparency=1 l.TextColor3=Color3.fromRGB(0,255,140) l.TextScaled=true l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left
    return f
end

function makeBtn(txt, color, cb)
    local b=Instance.new("TextButton", scroll) b.Size=UDim2.new(1,0,0,54) b.Text=txt b.BackgroundColor3=color b.TextColor3=Color3.new(1,1,1) b.TextScaled=true b.Font=Enum.Font.GothamBold b.BorderSizePixel=0 b.AutoButtonColor=true
    Instance.new("UICorner", b).CornerRadius=UDim.new(0,12)
    local stroke2 = Instance.new("UIStroke", b) stroke2.Color=Color3.fromRGB(255,255,255) stroke2.Transparency=0.8 stroke2.Thickness=1
    b.MouseButton1Click:Connect(cb)
    b.TouchTap:Connect(cb)
    return b
end

function makeToggleRow(name, color, cb)
    local f=Instance.new("Frame", scroll) f.Size=UDim2.new(1,0,0,54) f.BackgroundColor3=Color3.fromRGB(22,22,28) Instance.new("UICorner", f).CornerRadius=UDim.new(0,12)
    local l=Instance.new("TextLabel", f) l.Size=UDim2.new(0.6,0,1,0) l.Position=UDim2.new(0.04,0,0,0) l.Text=name l.BackgroundTransparency=1 l.TextColor3=Color3.new(1,1,1) l.TextScaled=true l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left
    local btn=Instance.new("TextButton", f) btn.Size=UDim2.new(0.32,0,0,38) btn.Position=UDim2.new(0.64,0,0,8) btn.Text="OFF" btn.BackgroundColor3=Color3.fromRGB(60,60,70) btn.TextColor3=Color3.new(1,1,1) btn.TextScaled=true btn.Font=Enum.Font.GothamBold Instance.new("UICorner", btn).CornerRadius=UDim.new(0,8)
    local on=false
    btn.MouseButton1Click:Connect(function() on=not on btn.Text=on and "ON" or "OFF" btn.BackgroundColor3=on and color or Color3.fromRGB(60,60,70) cb(on) end)
    btn.TouchTap:Connect(function() on=not on btn.Text=on and "ON" or "OFF" btn.BackgroundColor3=on and color or Color3.fromRGB(60,60,70) cb(on) end)
end

-- ============ FUNKTIONEN WIE ECHTE CHEATS FUNKTIONIEREN ============
-- FLY 2026: Mit LinearVelocity + Attachment + MoveDirection (Joystick!)
local flyOn=false local flyLV=nil local flyAtt=nil local flySpeed=70
local flyUp=false local flyDown=false

function startFly()
    local char=LP.Character local hrp=char and char:FindFirstChild("HumanoidRootPart") if not hrp then return end
    flyAtt=Instance.new("Attachment", hrp) flyAtt.Name="V4FlyAtt"
    flyLV=Instance.new("LinearVelocity", hrp) flyLV.Name="V4FlyLV" flyLV.Attachment0=flyAtt flyLV.MaxForce=math.huge flyLV.VectorVelocity=Vector3.new(0,0,0)
    spawn(function()
        while flyOn and flyLV and flyLV.Parent do
            local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            local move=hum and hum.MoveDirection or Vector3.new(0,0,0)
            local cam=workspace.CurrentCamera.CFrame
            -- WICHTIG: MoveDirection kommt vom Handy Joystick! Darum geht es auf Handy!
            local worldMove = Vector3.new(0,0,0)
            if move.Magnitude>0 then
                worldMove = cam:VectorToWorldSpace(Vector3.new(move.X,0,move.Z))
                worldMove = Vector3.new(worldMove.X,0,worldMove.Z)
                if worldMove.Magnitude>0 then worldMove = worldMove.Unit * move.Magnitude end
            end
            if flyUp then worldMove = worldMove + Vector3.new(0,1.3,0) end
            if flyDown then worldMove = worldMove + Vector3.new(0,-1.3,0) end
            flyLV.VectorVelocity = worldMove * flySpeed
            if worldMove.Magnitude<0.1 and not flyUp and not flyDown then flyLV.VectorVelocity = Vector3.new(0,0,0) end
            RS.Heartbeat:Wait()
        end
    end)
end

-- NOCLIP
local noclipOn=false
RS.Stepped:Connect(function() if noclipOn and LP.Character then for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end)

-- INF JUMP HOLD - WENN DU JUMP HÄLTST FLIEGST DU HOCH!
local infHoldOn=false local infHoldConn=nil
function setInfHold(on)
    infHoldOn=on
    if on then
        infHoldConn=RS.Heartbeat:Connect(function()
            if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
                -- Check ob Jump gedrückt (Handy + PC)
                local hum=LP.Character.Humanoid
                if hum:GetState()==Enum.HumanoidStateType.Jumping or UIS:IsKeyDown(Enum.KeyCode.Space) then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    LP.Character.HumanoidRootPart.Velocity = Vector3.new(LP.Character.HumanoidRootPart.Velocity.X, 75, LP.Character.HumanoidRootPart.Velocity.Z)
                end
            end
        end)
    else
        if infHoldConn then infHoldConn:Disconnect() end
    end
end

-- INF JUMP TIPP
local infTippOn=false
UIS.JumpRequest:Connect(function() if infTippOn and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end)

-- ESP
local espOn=false
function setESP(on)
    espOn=on
    if on then
        for _,p in pairs(Players:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("V4ESP") then
            local hl=Instance.new("Highlight", p.Character) hl.Name="V4ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.OutlineColor=Color3.fromRGB(0,255,140) hl.FillTransparency=0.35 hl.OutlineTransparency=0 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
            local bg=Instance.new("BillboardGui", p.Character) bg.Name="V4ESP2" bg.Size=UDim2.new(0,100,0,40) bg.StudsOffset=Vector3.new(0,3,0) bg.AlwaysOnTop=true bg.Adornee=p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")
            local tl=Instance.new("TextLabel", bg) tl.Size=UDim2.new(1,0,1,0) tl.BackgroundTransparency=1 tl.Text=p.Name tl.TextColor3=Color3.fromRGB(0,255,140) tl.TextScaled=true tl.Font=Enum.Font.GothamBold
        end end
        Players.PlayerAdded:Connect(function(pl) pl.CharacterAdded:Connect(function(char) wait(1) if espOn and not char:FindFirstChild("V4ESP") then local hl=Instance.new("Highlight", char) hl.Name="V4ESP" hl.FillColor=Color3.fromRGB(255,0,60) hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop hl.FillTransparency=0.35 end end) end)
    else
        for _,p in pairs(Players:GetPlayers()) do if p.Character then for _,v in pairs(p.Character:GetChildren()) do if v.Name=="V4ESP" or v.Name=="V4ESP2" then v:Destroy() end end end end
    end
end

-- ============ GUI BAUEN ============
makeSection("1. BEWEGUNG - ALLES GEHT")
makeToggleRow("FLY (Joystick bewegen!)", Color3.fromRGB(0,140,255), function(on) flyOn=on if on then startFly() else if flyLV then flyLV:Destroy() end if flyAtt then flyAtt:Destroy() end end end)
makeToggleRow("FLY HOCH HALTEN", Color3.fromRGB(0,100,255), function(on) flyUp=on end)
makeToggleRow("FLY RUNTER HALTEN", Color3.fromRGB(0,80,200), function(on) flyDown=on end)

local speedRow=Instance.new("Frame", scroll) speedRow.Size=UDim2.new(1,0,0,54) speedRow.BackgroundColor3=Color3.fromRGB(22,22,28) Instance.new("UICorner", speedRow).CornerRadius=UDim.new(0,12)
local sLabel=Instance.new("TextLabel", speedRow) sLabel.Size=UDim2.new(0.35,0,1,0) sLabel.Position=UDim2.new(0.04,0,0,0) sLabel.Text="SPEED" sLabel.BackgroundTransparency=1 sLabel.TextColor3=Color3.new(1,1,1) sLabel.TextScaled=true sLabel.Font=Enum.Font.GothamBold sLabel.TextXAlignment=Enum.TextXAlignment.Left
local sBox=Instance.new("TextBox", speedRow) sBox.Size=UDim2.new(0.28,0,0,38) sBox.Position=UDim2.new(0.32,0,0,8) sBox.Text="80" sBox.BackgroundColor3=Color3.fromRGB(40,40,50) sBox.TextColor3=Color3.new(1,1,1) sBox.TextScaled=true Instance.new("UICorner", sBox).CornerRadius=UDim.new(0,8)
local sBtn=Instance.new("TextButton", speedRow) sBtn.Size=UDim2.new(0.28,0,0,38) sBtn.Position=UDim2.new(0.68,0,0,8) sBtn.Text="SET" sBtn.BackgroundColor3=Color3.fromRGB(0,255,140) sBtn.TextColor3=Color3.fromRGB(0,0,0) sBtn.TextScaled=true sBtn.Font=Enum.Font.GothamBold Instance.new("UICorner", sBtn).CornerRadius=UDim.new(0,8)
sBtn.MouseButton1Click:Connect(function() local n=tonumber(sBox.Text) if n and LP.Character then LP.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=n end end)

makeToggleRow("NOCLIP DURCH WÄNDE", Color3.fromRGB(150,0,255), function(on) noclipOn=on end)
makeToggleRow("INF JUMP HOLD (HALTEN=HOCH FLIEGEN)", Color3.fromRGB(0,200,100), function(on) setInfHold(on) end)
makeToggleRow("INF JUMP TIPP (Immer springen)", Color3.fromRGB(0,180,80), function(on) infTippOn=on end)

makeBtn("HIGH JUMP 180", Color3.fromRGB(255,140,0), function() if LP.Character then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,180,0) end end)
makeBtn("LONG JUMP WEIT", Color3.fromRGB(255,100,0), function() if LP.Character then local cf=workspace.CurrentCamera.CFrame LP.Character.HumanoidRootPart.Velocity=Vector3.new(cf.LookVector.X*130,60,cf.LookVector.Z*130) end end)

makeSection("2. SEHEN - ESP WALLHACK")
makeToggleRow("ESP WALLHACK DURCH WÄNDE", Color3.fromRGB(255,0,80), function(on) setESP(on) end)

local whOn=false
makeToggleRow("WALLHACK WÄNDE DURCHSICHTIG", Color3.fromRGB(150,0,255), function(on) whOn=on for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and not v:IsDescendantOf(LP.Character) and v.Size.Magnitude>5 then v.LocalTransparencyModifier=on and 0.6 or 0 end end end)

makeBtn("FULLBRIGHT NACHT ZU TAG", Color3.fromRGB(255,240,0), function() Lighting.Brightness=4 Lighting.ClockTime=13 Lighting.FogEnd=100000 Lighting.GlobalShadows=false Lighting.OutdoorAmbient=Color3.fromRGB(255,255,255) end)
makeBtn("XRAY ALLES SICHTBAR", Color3.fromRGB(100,100,100), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier=0.5 end end end)

makeSection("3. CLIENT + SCHUTZ")
makeBtn("ANTI-AFK AN", Color3.fromRGB(0,150,60), function() local vu=game:GetService("VirtualUser") LP.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) game.StarterGui:SetCore("SendNotification",{Title="V4", Text="Anti-AFK AN", Duration=2}) end)
makeBtn("FPS BOOST + ANTI LAG", Color3.fromRGB(70,70,70), function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic v.Reflectance=0 end if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end if v:IsA("ParticleEmitter") then v.Enabled=false end end Lighting.GlobalShadows=false end)
makeBtn("GOD MODE", Color3.fromRGB(255,215,0), function() if LP.Character then LP.Character.Humanoid.MaxHealth=math.huge LP.Character.Humanoid.Health=math.huge end end)
makeBtn("INVISIBLE AN/AUS", Color3.fromRGB(30,30,30), function() for _,v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.Transparency=v.Transparency==0 and 1 or 0 end if v:IsA("Decal") then v.Transparency=v.Transparency==0 and 1 or 0 end end end)
makeBtn("ECHTES IY LADEN (ORIGINAL)", Color3.fromRGB(0,0,0), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)

local fpsLab=Instance.new("TextLabel", scroll) fpsLab.Size=UDim2.new(1,0,0,36) fpsLab.BackgroundColor3=Color3.fromRGB(18,18,24) fpsLab.TextColor3=Color3.fromRGB(0,255,140) fpsLab.TextScaled=true fpsLab.Font=Enum.Font.Code Instance.new("UICorner", fpsLab).CornerRadius=UDim.new(0,10)
spawn(function() while true do local f=math.floor(1/RS.RenderStepped:Wait()) fpsLab.Text="  V4 GOD | FPS: "..f.." | HANDY FIXED | BY hahahsud15" wait(0.4) end end)

print("✅ V4 ULTRA GOD GELADEN - ALLES FIXED - SCHÖN - HANDY READY")
