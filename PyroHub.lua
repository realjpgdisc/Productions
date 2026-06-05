local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function CreateDiscordUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PyroDiscord"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")

    local Overlay = Instance.new("Frame")
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Overlay.BackgroundTransparency = 0.4
    Overlay.BorderSizePixel = 0
    Overlay.ZIndex = 1
    Overlay.Parent = ScreenGui

    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 380, 0, 220)
    Card.Position = UDim2.new(0.5, -190, 1.5, 0)
    Card.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
    Card.BorderSizePixel = 0
    Card.ZIndex = 2
    Card.Parent = ScreenGui

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 16)
    CardCorner.Parent = Card

    local Border = Instance.new("UIStroke")
    Border.Color = Color3.fromRGB(34, 197, 94)
    Border.Thickness = 1.5
    Border.Transparency = 0.3
    Border.Parent = Card

    local AccentBar = Instance.new("Frame")
    AccentBar.Size = UDim2.new(1, 0, 0, 3)
    AccentBar.Position = UDim2.new(0, 0, 0, 0)
    AccentBar.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    AccentBar.BorderSizePixel = 0
    AccentBar.ZIndex = 3
    AccentBar.Parent = Card

    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(0, 16)
    AccentCorner.Parent = AccentBar

    local FireLabel = Instance.new("TextLabel")
    FireLabel.Size = UDim2.new(1, 0, 0, 45)
    FireLabel.Position = UDim2.new(0, 0, 0, 15)
    FireLabel.BackgroundTransparency = 1
    FireLabel.Text = "PYRO HUB"
    FireLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
    FireLabel.TextSize = 22
    FireLabel.Font = Enum.Font.GothamBold
    FireLabel.ZIndex = 3
    FireLabel.Parent = Card

    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(1, 0, 0, 25)
    SubLabel.Position = UDim2.new(0, 0, 0, 58)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "Join our Discord to get your key"
    SubLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
    SubLabel.TextSize = 13
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.ZIndex = 3
    SubLabel.Parent = Card

    local LinkBox = Instance.new("Frame")
    LinkBox.Size = UDim2.new(0, 320, 0, 38)
    LinkBox.Position = UDim2.new(0.5, -160, 0, 95)
    LinkBox.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    LinkBox.BorderSizePixel = 0
    LinkBox.ZIndex = 3
    LinkBox.Parent = Card

    local LinkBoxCorner = Instance.new("UICorner")
    LinkBoxCorner.CornerRadius = UDim.new(0, 8)
    LinkBoxCorner.Parent = LinkBox

    local LinkStroke = Instance.new("UIStroke")
    LinkStroke.Color = Color3.fromRGB(40, 40, 55)
    LinkStroke.Thickness = 1
    LinkStroke.Parent = LinkBox

    local LinkText = Instance.new("TextLabel")
    LinkText.Size = UDim2.new(1, -10, 1, 0)
    LinkText.Position = UDim2.new(0, 10, 0, 0)
    LinkText.BackgroundTransparency = 1
    LinkText.Text = "discord.gg/EjEd3gmwma"
    LinkText.TextColor3 = Color3.fromRGB(100, 180, 255)
    LinkText.TextSize = 13
    LinkText.Font = Enum.Font.Code
    LinkText.TextXAlignment = Enum.TextXAlignment.Left
    LinkText.ZIndex = 4
    LinkText.Parent = LinkBox

    local CopyBtn = Instance.new("TextButton")
    CopyBtn.Size = UDim2.new(0, 320, 0, 40)
    CopyBtn.Position = UDim2.new(0.5, -160, 0, 145)
    CopyBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    CopyBtn.BorderSizePixel = 0
    CopyBtn.Text = "Copy Discord Link"
    CopyBtn.TextColor3 = Color3.fromRGB(5, 5, 8)
    CopyBtn.TextSize = 14
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.ZIndex = 3
    CopyBtn.Parent = Card

    local CopyCorner = Instance.new("UICorner")
    CopyCorner.CornerRadius = UDim.new(0, 10)
    CopyCorner.Parent = CopyBtn

    local CopiedLabel = Instance.new("TextLabel")
    CopiedLabel.Size = UDim2.new(1, 0, 0, 20)
    CopiedLabel.Position = UDim2.new(0, 0, 0, 192)
    CopiedLabel.BackgroundTransparency = 1
    CopiedLabel.Text = ""
    CopiedLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
    CopiedLabel.TextSize = 12
    CopiedLabel.Font = Enum.Font.Gotham
    CopiedLabel.ZIndex = 3
    CopiedLabel.Parent = Card

    TweenService:Create(Card, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -190, 0.5, -110)
    }):Play()

    CopyBtn.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/EjEd3gmwma")
        CopiedLabel.Text = "Copied! Paste in your browser."
        CopyBtn.Text = "Copied!"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(20, 150, 60)
        task.wait(1.5)
        TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -190, -1, 0)
        }):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.4), {
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.5)
        ScreenGui:Destroy()
    end)
end

CreateDiscordUI()

local BASIC_KEY = "prisoninmylife"
local PREMIUM_KEY = "lifeisagame"
local isPremium = false
local isAuthorized = false

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "PyroKeySystem"
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = game:GetService("CoreGui")

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 400, 0, 260)
KeyFrame.Position = UDim2.new(0.5, -200, 1.5, 0)
KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = KeyGui

local KFCorner = Instance.new("UICorner")
KFCorner.CornerRadius = UDim.new(0, 16)
KFCorner.Parent = KeyFrame

local KFStroke = Instance.new("UIStroke")
KFStroke.Color = Color3.fromRGB(34, 197, 94)
KFStroke.Thickness = 1.5
KFStroke.Transparency = 0.3
KFStroke.Parent = KeyFrame

local KFAccent = Instance.new("Frame")
KFAccent.Size = UDim2.new(1, 0, 0, 3)
KFAccent.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
KFAccent.BorderSizePixel = 0
KFAccent.Parent = KeyFrame

local KFAccentCorner = Instance.new("UICorner")
KFAccentCorner.CornerRadius = UDim.new(0, 16)
KFAccentCorner.Parent = KFAccent

local KFTitle = Instance.new("TextLabel")
KFTitle.Size = UDim2.new(1, 0, 0, 45)
KFTitle.Position = UDim2.new(0, 0, 0, 15)
KFTitle.BackgroundTransparency = 1
KFTitle.Text = "PYRO HUB - KEY SYSTEM"
KFTitle.TextColor3 = Color3.fromRGB(34, 197, 94)
KFTitle.TextSize = 18
KFTitle.Font = Enum.Font.GothamBold
KFTitle.Parent = KeyFrame

local KFSub = Instance.new("TextLabel")
KFSub.Size = UDim2.new(1, 0, 0, 25)
KFSub.Position = UDim2.new(0, 0, 0, 58)
KFSub.BackgroundTransparency = 1
KFSub.Text = "Enter your key to continue"
KFSub.TextColor3 = Color3.fromRGB(130, 130, 150)
KFSub.TextSize = 13
KFSub.Font = Enum.Font.Gotham
KFSub.Parent = KeyFrame

local KFInputBox = Instance.new("Frame")
KFInputBox.Size = UDim2.new(0, 350, 0, 42)
KFInputBox.Position = UDim2.new(0.5, -175, 0, 95)
KFInputBox.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
KFInputBox.BorderSizePixel = 0
KFInputBox.Parent = KeyFrame

local KFIBCorner = Instance.new("UICorner")
KFIBCorner.CornerRadius = UDim.new(0, 10)
KFIBCorner.Parent = KFInputBox

local KFIBStroke = Instance.new("UIStroke")
KFIBStroke.Color = Color3.fromRGB(40, 40, 60)
KFIBStroke.Thickness = 1
KFIBStroke.Parent = KFInputBox

local KFInput = Instance.new("TextBox")
KFInput.Size = UDim2.new(1, -20, 1, 0)
KFInput.Position = UDim2.new(0, 10, 0, 0)
KFInput.BackgroundTransparency = 1
KFInput.PlaceholderText = "Enter key here..."
KFInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 100)
KFInput.Text = ""
KFInput.TextColor3 = Color3.fromRGB(220, 220, 240)
KFInput.TextSize = 14
KFInput.Font = Enum.Font.Code
KFInput.TextXAlignment = Enum.TextXAlignment.Left
KFInput.ClearTextOnFocus = false
KFInput.Parent = KFInputBox

local KFSubmit = Instance.new("TextButton")
KFSubmit.Size = UDim2.new(0, 350, 0, 42)
KFSubmit.Position = UDim2.new(0.5, -175, 0, 150)
KFSubmit.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
KFSubmit.BorderSizePixel = 0
KFSubmit.Text = "Submit Key"
KFSubmit.TextColor3 = Color3.fromRGB(5, 5, 8)
KFSubmit.TextSize = 14
KFSubmit.Font = Enum.Font.GothamBold
KFSubmit.Parent = KeyFrame

local KFSCorner = Instance.new("UICorner")
KFSCorner.CornerRadius = UDim.new(0, 10)
KFSCorner.Parent = KFSubmit

local KFStatus = Instance.new("TextLabel")
KFStatus.Size = UDim2.new(1, 0, 0, 25)
KFStatus.Position = UDim2.new(0, 0, 0, 205)
KFStatus.BackgroundTransparency = 1
KFStatus.Text = ""
KFStatus.TextSize = 12
KFStatus.Font = Enum.Font.Gotham
KFStatus.Parent = KeyFrame

TweenService:Create(KeyFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -200, 0.5, -130)
}):Play()

local function LoadHub()
    local Settings = {
        SilentAim = false,
        FOVSize = 120,
        ShootThroughWalls = false,
        SpeedHack = false,
        SpeedValue = 24,
        Noclip = false,
        InfiniteJump = false,
        BasicESP = false,
        Fly = false,
        FlySpeed = 50,
        HeadLock = false,
        AntiArrest = false,
        AutoEatFood = false,
        FakeArrest = false,
        GodMode = false,
        PremiumESP = false,
        TeamChanger = "Criminals",
    }

    local Window = Rayfield:CreateWindow({
        Name = "Pyro Hub  |  Prison Life",
        LoadingTitle = "Pyro Hub",
        LoadingSubtitle = isPremium and "Premium Edition" or "Basic Edition",
        Theme = "Serenity",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,
        ConfigurationSaving = {
            Enabled = false,
        },
        Discord = {
            Enabled = false,
        },
        KeySystem = false,
    })

    task.wait(0.5)
    if isPremium then
        Rayfield:Notify({
            Title = "Pyro Hub",
            Content = "Premium Unlocked! All features available.",
            Duration = 5,
            Image = "rbxassetid://4483345998",
        })
    else
        Rayfield:Notify({
            Title = "Pyro Hub",
            Content = "Basic loaded. Upgrade for Premium features!",
            Duration = 5,
            Image = "rbxassetid://4483345998",
        })
    end

    local CombatTab = Window:CreateTab("Combat", nil)

    CombatTab:CreateSection("Silent Aim")

    CombatTab:CreateToggle({
        Name = "Silent Aim",
        CurrentValue = false,
        Flag = "SilentAim",
        Callback = function(v)
            Settings.SilentAim = v
        end,
    })

    CombatTab:CreateSlider({
        Name = "FOV Circle Size",
        Range = {50, 300},
        Increment = 10,
        Suffix = "px",
        CurrentValue = 120,
        Flag = "FOVSize",
        Callback = function(v)
            Settings.FOVSize = v
            if FOVCircle then
                FOVCircle.Radius = v
            end
        end,
    })

    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Thickness = 1.5
    FOVCircle.Color = Color3.fromRGB(34, 197, 94)
    FOVCircle.Filled = false
    FOVCircle.Transparency = 1
    FOVCircle.Radius = Settings.FOVSize
    FOVCircle.Visible = false
    FOVCircle.NumSides = 64

    RunService.RenderStepped:Connect(function()
        if Settings.SilentAim then
            FOVCircle.Visible = true
            FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y)
            FOVCircle.Radius = Settings.FOVSize
        else
            FOVCircle.Visible = false
        end
    end)

    local nearestEnemy = nil

    task.spawn(function()
        while true do
            task.wait(0.5)
            if not Settings.SilentAim and not Settings.HeadLock then continue end
            local closestDist = math.huge
            local closest = nil
            local mousePos = Vector2.new(Mouse.X, Mouse.Y)
            for _, plr in pairs(Players:GetPlayers()) do
                if plr == LocalPlayer then continue end
                if plr.TeamColor == LocalPlayer.TeamColor then continue end
                local char = plr.Character
                if not char then continue end
                local head = char:FindFirstChild("Head")
                if not head then continue end
                local hum = char:FindFirstChild("Humanoid")
                if not hum or hum.Health <= 0 then continue end
                local screenPos, onScreen = Camera:WorldToScreenPoint(head.Position)
                if not onScreen then continue end
                local screenVec = Vector2.new(screenPos.X, screenPos.Y)
                local dist = (mousePos - screenVec).Magnitude
                if dist < Settings.FOVSize and dist < closestDist then
                    closestDist = dist
                    closest = plr
                end
            end
            nearestEnemy = closest
        end
    end)

    local GunRemotes = ReplicatedStorage:WaitForChild("GunRemotes", 10)
    local ShootEvent = GunRemotes and GunRemotes:WaitForChild("ShootEvent", 10)

    if ShootEvent then
        local oldFireServer = ShootEvent.FireServer
        ShootEvent.FireServer = function(self, ...)
            if Settings.SilentAim and nearestEnemy then
                local char = nearestEnemy.Character
                if char then
                    local head = char:FindFirstChild("Head")
                    if head then
                        local args = {...}
                        if args[1] and type(args[1]) == "table" then
                            for _, shot in pairs(args[1]) do
                                if type(shot) == "table" and shot[2] then
                                    shot[2] = head.Position
                                    shot[3] = head
                                end
                            end
                        end
                        return oldFireServer(self, unpack(args))
                    end
                end
            end
            return oldFireServer(self, ...)
        end
    end

    CombatTab:CreateSection("Shooting")

    if not isPremium then
        CombatTab:CreateLabel("Shoot Through Walls - Premium Only")
    else
        CombatTab:CreateToggle({
            Name = "Shoot Through Walls",
            CurrentValue = false,
            Flag = "ShootThroughWalls",
            Callback = function(v)
                Settings.ShootThroughWalls = v
                local char = LocalPlayer.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = not v
                        end
                    end
                end
            end,
        })
    end

    local MovementTab = Window:CreateTab("Movement", nil)

    MovementTab:CreateSection("Speed")

    MovementTab:CreateToggle({
        Name = "Speed Hack",
        CurrentValue = false,
        Flag = "SpeedHack",
        Callback = function(v)
            Settings.SpeedHack = v
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChild("Humanoid")
                if hum then
                    hum.WalkSpeed = v and Settings.SpeedValue or 16
                end
            end
        end,
    })

    MovementTab:CreateSlider({
        Name = "Speed Value",
        Range = {16, 200},
        Increment = 4,
        Suffix = " ws",
        CurrentValue = 24,
        Flag = "SpeedValue",
        Callback = function(v)
            Settings.SpeedValue = v
            if Settings.SpeedHack then
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChild("Humanoid")
                    if hum then
                        hum.WalkSpeed = v
                    end
                end
            end
        end,
    })

    MovementTab:CreateSection("Physics")

    MovementTab:CreateToggle({
        Name = "Noclip",
        CurrentValue = false,
        Flag = "Noclip",
        Callback = function(v)
            Settings.Noclip = v
        end,
    })

    RunService.Stepped:Connect(function()
        if Settings.Noclip then
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)

    MovementTab:CreateToggle({
        Name = "Infinite Jump",
        CurrentValue = false,
        Flag = "InfiniteJump",
        Callback = function(v)
            Settings.InfiniteJump = v
        end,
    })

    UserInputService.JumpRequest:Connect(function()
        if Settings.InfiniteJump then
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end)

    if isPremium then
        MovementTab:CreateSection("Fly - Premium")

        MovementTab:CreateToggle({
            Name = "Fly Hack",
            CurrentValue = false,
            Flag = "Fly",
            Callback = function(v)
                Settings.Fly = v
                local char = LocalPlayer.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                if v then
                    local bg = Instance.new("BodyGyro")
                    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    bg.D = 100
                    bg.Name = "PyroFlyGyro"
                    bg.Parent = hrp
                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity = Vector3.zero
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bv.Name = "PyroFlyVelocity"
                    bv.Parent = hrp
                    task.spawn(function()
                        while Settings.Fly and hrp and hrp.Parent do
                            local moveDir = Vector3.zero
                            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                                moveDir = moveDir + Camera.CFrame.LookVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                                moveDir = moveDir - Camera.CFrame.LookVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                                moveDir = moveDir - Camera.CFrame.RightVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                                moveDir = moveDir + Camera.CFrame.RightVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                                moveDir = moveDir + Vector3.new(0, 1, 0)
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                                moveDir = moveDir - Vector3.new(0, 1, 0)
                            end
                            bv.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * Settings.FlySpeed or Vector3.zero
                            bg.CFrame = Camera.CFrame
                            task.wait()
                        end
                    end)
                else
                    if hrp then
                        local bg2 = hrp:FindFirstChild("PyroFlyGyro")
                        local bv2 = hrp:FindFirstChild("PyroFlyVelocity")
                        if bg2 then bg2:Destroy() end
                        if bv2 then bv2:Destroy() end
                    end
                end
            end,
        })

        MovementTab:CreateSlider({
            Name = "Fly Speed",
            Range = {10, 200},
            Increment = 5,
            Suffix = " speed",
            CurrentValue = 50,
            Flag = "FlySpeed",
            Callback = function(v)
                Settings.FlySpeed = v
            end,
        })
    else
        MovementTab:CreateLabel("Fly Hack - Premium Only")
    end

    local VisualsTab = Window:CreateTab("Visuals", nil)

    VisualsTab:CreateSection("Basic ESP")

    local ESPDrawings = {}

    local function ClearESP()
        for _, drawings in pairs(ESPDrawings) do
            for _, d in pairs(drawings) do
                d:Remove()
            end
        end
        ESPDrawings = {}
    end

    local function CreateESP(plr)
        if plr == LocalPlayer then return end
        local box = Drawing.new("Square")
        box.Thickness = 1.5
        box.Color = Color3.fromRGB(34, 197, 94)
        box.Filled = false
        box.Transparency = 1
        box.Visible = false
        local nameTag = Drawing.new("Text")
        nameTag.Size = 13
        nameTag.Color = Color3.fromRGB(255, 255, 255)
        nameTag.Outline = true
        nameTag.Visible = false
        nameTag.Font = 2
        ESPDrawings[plr] = {box, nameTag}
    end

    RunService.RenderStepped:Connect(function()
        for _, plr in pairs(Players:GetPlayers()) do
            if plr == LocalPlayer then continue end
            local char = plr.Character
            if not char then continue end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            if not hrp or not hum then continue end
            if not ESPDrawings[plr] then
                CreateESP(plr)
            end
            local drawings = ESPDrawings[plr]
            if not drawings then continue end
            local box = drawings[1]
            local nameTag = drawings[2]
            if Settings.BasicESP or (isPremium and Settings.PremiumESP) then
                local pos, onScreen = Camera:WorldToScreenPoint(hrp.Position)
                if onScreen then
                    local scaleFactor = 1 / pos.Z * 100
                    local boxW = scaleFactor * 3
                    local boxH = scaleFactor * 5.5
                    box.Size = Vector2.new(boxW, boxH)
                    box.Position = Vector2.new(pos.X - boxW / 2, pos.Y - boxH / 2)
                    box.Color = plr.TeamColor == LocalPlayer.TeamColor
                        and Color3.fromRGB(100, 100, 255)
                        or Color3.fromRGB(34, 197, 94)
                    box.Visible = true
                    if isPremium and Settings.PremiumESP then
                        local lchar = LocalPlayer.Character
                        local lhrp = lchar and lchar:FindFirstChild("HumanoidRootPart")
                        local dist = lhrp and math.floor((hrp.Position - lhrp.Position).Magnitude) or 0
                        nameTag.Text = plr.Name .. " | HP: " .. math.floor(hum.Health) .. " | " .. dist .. "m"
                    else
                        nameTag.Text = plr.Name
                    end
                    nameTag.Position = Vector2.new(pos.X, pos.Y - boxH / 2 - 15)
                    nameTag.Visible = true
                else
                    box.Visible = false
                    nameTag.Visible = false
                end
            else
                if box then box.Visible = false end
                if nameTag then nameTag.Visible = false end
            end
        end
    end)

    VisualsTab:CreateToggle({
        Name = "Player ESP (Box + Name)",
        CurrentValue = false,
        Flag = "BasicESP",
        Callback = function(v)
            Settings.BasicESP = v
            if not v then ClearESP() end
        end,
    })

    if isPremium then
        VisualsTab:CreateSection("Premium ESP")
        VisualsTab:CreateToggle({
            Name = "Premium ESP (Health + Distance)",
            CurrentValue = false,
            Flag = "PremiumESP",
            Callback = function(v)
                Settings.PremiumESP = v
            end,
        })
    else
        VisualsTab:CreateLabel("Premium ESP (Health + Distance) - Premium Only")
    end

    local PremiumCombatTab = Window:CreateTab("Premium Combat", nil)

    if isPremium then
        PremiumCombatTab:CreateSection("Head Lock")

        PremiumCombatTab:CreateToggle({
            Name = "Head Lock (Always Head Shot)",
            CurrentValue = false,
            Flag = "HeadLock",
            Callback = function(v)
                Settings.HeadLock = v
            end,
        })

        if ShootEvent then
            local baseFireServer = ShootEvent.FireServer
            ShootEvent.FireServer = function(self, ...)
                if Settings.HeadLock and nearestEnemy then
                    local char = nearestEnemy.Character
                    if char then
                        local head = char:FindFirstChild("Head")
                        if head then
                            local args = {...}
                            if args[1] and type(args[1]) == "table" then
                                for _, shot in pairs(args[1]) do
                                    if type(shot) == "table" then
                                        shot[2] = head.Position
                                        shot[3] = head
                                    end
                                end
                            end
                            return baseFireServer(self, unpack(args))
                        end
                    end
                end
                return baseFireServer(self, ...)
            end
        end

        PremiumCombatTab:CreateSection("Anti-Arrest")

        PremiumCombatTab:CreateToggle({
            Name = "Anti-Arrest",
            CurrentValue = false,
            Flag = "AntiArrest",
            Callback = function(v)
                Settings.AntiArrest = v
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes then
                    local arrestRemote = remotes:FindFirstChild("ArrestPlayer")
                    if arrestRemote and v then
                        arrestRemote.OnClientEvent:Connect(function()
                            local char = LocalPlayer.Character
                            if char then
                                local hrp = char:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    hrp.CFrame = hrp.CFrame * CFrame.new(0, 10, 0)
                                end
                            end
                        end)
                    end
                end
            end,
        })

        PremiumCombatTab:CreateSection("Fake Arrest Spam")

        PremiumCombatTab:CreateToggle({
            Name = "Fake Arrest Spam",
            CurrentValue = false,
            Flag = "FakeArrest",
            Callback = function(v)
                Settings.FakeArrest = v
                if v then
                    task.spawn(function()
                        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                        while Settings.FakeArrest do
                            if remotes then
                                local arrestRemote = remotes:FindFirstChild("ArrestPlayer")
                                if arrestRemote then
                                    for _, plr in pairs(Players:GetPlayers()) do
                                        if plr ~= LocalPlayer then
                                            pcall(function()
                                                arrestRemote:FireServer(plr)
                                            end)
                                        end
                                    end
                                end
                            end
                            task.wait(0.5)
                        end
                    end)
                end
            end,
        })
    else
        PremiumCombatTab:CreateLabel("This tab requires a Premium Key.")
        PremiumCombatTab:CreateLabel("Get it at: discord.gg/EjEd3gmwma")
    end

    local PremiumMiscTab = Window:CreateTab("Premium Misc", nil)

    if isPremium then
        PremiumMiscTab:CreateSection("Team")

        PremiumMiscTab:CreateDropdown({
            Name = "Change Team",
            Options = {"Criminals", "Guards", "Inmates", "Neutral"},
            CurrentOption = {"Criminals"},
            Flag = "TeamChanger",
            MultipleOptions = false,
            Callback = function(option)
                Settings.TeamChanger = option[1]
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes then
                    local teamRemote = remotes:FindFirstChild("RequestTeamChange")
                    if teamRemote then
                        pcall(function()
                            teamRemote:FireServer(option[1])
                        end)
                    end
                end
            end,
        })

        PremiumMiscTab:CreateSection("Food")

        PremiumMiscTab:CreateToggle({
            Name = "Auto Eat Food",
            CurrentValue = false,
            Flag = "AutoEatFood",
            Callback = function(v)
                Settings.AutoEatFood = v
                if v then
                    task.spawn(function()
                        while Settings.AutoEatFood do
                            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                            if remotes then
                                local eatRemote = remotes:FindFirstChild("EatFood")
                                if eatRemote then
                                    pcall(function() eatRemote:FireServer() end)
                                end
                            end
                            task.wait(3)
                        end
                    end)
                end
            end,
        })

        PremiumMiscTab:CreateSection("God Mode")

        PremiumMiscTab:CreateToggle({
            Name = "God Mode",
            CurrentValue = false,
            Flag = "GodMode",
            Callback = function(v)
                Settings.GodMode = v
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChild("Humanoid")
                    if hum then
                        if v then
                            hum.MaxHealth = math.huge
                            hum.Health = math.huge
                            task.spawn(function()
                                while Settings.GodMode do
                                    if hum and hum.Parent then
                                        hum.Health = math.huge
                                    end
                                    task.wait(0.1)
                                end
                            end)
                        end
                    end
                end
            end,
        })
    else
        PremiumMiscTab:CreateLabel("This tab requires a Premium Key.")
        PremiumMiscTab:CreateLabel("Get it at: discord.gg/EjEd3gmwma")
    end

    local SettingsTab = Window:CreateTab("Settings", nil)

    SettingsTab:CreateSection("Account Info")
    SettingsTab:CreateLabel("Hub: Pyro Hub")
    SettingsTab:CreateLabel("Game: Prison Life")
    SettingsTab:CreateLabel("Tier: " .. (isPremium and "PREMIUM" or "BASIC"))
    SettingsTab:CreateLabel("Discord: discord.gg/EjEd3gmwma")

    SettingsTab:CreateSection("Actions")

    SettingsTab:CreateButton({
        Name = "Destroy Hub",
        Callback = function()
            Rayfield:Destroy()
            FOVCircle:Remove()
            ClearESP()
        end,
    })

    SettingsTab:CreateButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end,
    })
end

local function ValidateKey()
    local key = KFInput.Text
    if key == PREMIUM_KEY then
        isPremium = true
        isAuthorized = true
        KFStatus.TextColor3 = Color3.fromRGB(34, 197, 94)
        KFStatus.Text = "Premium Key Accepted! Loading..."
        task.wait(1)
        TweenService:Create(KeyFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -200, -1, 0)
        }):Play()
        task.wait(0.5)
        KeyGui:Destroy()
        LoadHub()
    elseif key == BASIC_KEY then
        isPremium = false
        isAuthorized = true
        KFStatus.TextColor3 = Color3.fromRGB(34, 197, 94)
        KFStatus.Text = "Basic Key Accepted! Loading..."
        task.wait(1)
        TweenService:Create(KeyFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -200, -1, 0)
        }):Play()
        task.wait(0.5)
        KeyGui:Destroy()
        LoadHub()
    else
        KFStatus.TextColor3 = Color3.fromRGB(239, 68, 68)
        KFStatus.Text = "Invalid Key! Check discord for keys."
        KFInput.Text = ""
        TweenService:Create(KFIBStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(239, 68, 68)}):Play()
        task.wait(1.5)
        TweenService:Create(KFIBStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(40, 40, 60)}):Play()
    end
end

KFSubmit.MouseButton1Click:Connect(ValidateKey)
KFInput.FocusLost:Connect(function(enter)
    if enter then ValidateKey() end
end)
