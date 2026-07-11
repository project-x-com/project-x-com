local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "LoadingScreen"
gui.Parent = player.PlayerGui

local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = Lighting

local background = Instance.new("Frame")
background.Size = UDim2.fromScale(1, 1)
background.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
background.BorderSizePixel = 0
background.Parent = gui

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 18, 32)),
    ColorSequenceKeypoint.new(0.45, Color3.fromRGB(10, 12, 18)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 10, 15))
}
bgGradient.Rotation = 90
bgGradient.Parent = background

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.55, 0, 0.58, 0)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = background

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = mainFrame

local outline = Instance.new("UIStroke")
outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
outline.Color = Color3.fromRGB(30, 85, 130)
outline.LineJoinMode = Enum.LineJoinMode.Round
outline.Thickness = 1
outline.Transparency = 0.55
outline.Parent = mainFrame

local logoGlow = Instance.new("Frame")
logoGlow.Size = UDim2.new(1.25, 0, 1.25, 0)
logoGlow.Position = UDim2.fromScale(0.5, 0.2)
logoGlow.AnchorPoint = Vector2.new(0.5, 0.5)
logoGlow.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
logoGlow.BorderSizePixel = 0
logoGlow.BackgroundTransparency = 0.9
logoGlow.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(1, 0)
glowCorner.Parent = logoGlow

local logoGlowGradient = Instance.new("UIGradient")
logoGlowGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 35, 55))
}
logoGlowGradient.Rotation = 45
logoGlowGradient.Parent = logoGlow

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.fromOffset(180, 180)
logo.Position = UDim2.fromScale(0.5, 0.2)
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://DEINE_LOGO_ID"
logo.Parent = mainFrame

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Size = UDim2.fromScale(1, 0.08)
title.Position = UDim2.fromScale(0, 0.4)
title.Font = Enum.Font.GothamBlack
title.Text = "PROJECT X"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(230, 245, 255)
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.fromScale(1, 0.06)
subtitle.Position = UDim2.fromScale(0, 0.47)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "Loading Simulation Module"
subtitle.TextScaled = true
subtitle.TextColor3 = Color3.fromRGB(145, 190, 255)
subtitle.TextTransparency = 0.2
subtitle.Parent = mainFrame

local barHolder = Instance.new("Frame")
barHolder.Size = UDim2.fromScale(0.8, 0.045)
barHolder.Position = UDim2.fromScale(0.1, 0.68)
barHolder.BackgroundColor3 = Color3.fromRGB(30, 34, 46)
barHolder.BorderSizePixel = 0
barHolder.Parent = mainFrame

local holderCorner = Instance.new("UICorner")
holderCorner.CornerRadius = UDim.new(1, 0)
holderCorner.Parent = barHolder

local barFill = Instance.new("Frame")
barFill.Size = UDim2.fromScale(0, 1)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barHolder

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = barFill

local barGlow = Instance.new("Frame")
barGlow.Size = UDim2.fromScale(0.02, 1.4)
barGlow.Position = UDim2.fromScale(0, -0.2)
barGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barGlow.BackgroundTransparency = 0.7
barGlow.BorderSizePixel = 0
barGlow.Parent = barHolder

local glowCorner2 = Instance.new("UICorner")
glowCorner2.CornerRadius = UDim.new(1, 0)
glowCorner2.Parent = barGlow

local status = Instance.new("TextLabel")
status.BackgroundTransparency = 1
status.Position = UDim2.fromScale(0, 0.78)
status.Size = UDim2.fromScale(1, 0.08)
status.Font = Enum.Font.GothamSemibold
status.TextScaled = false
status.TextSize = 20
status.TextColor3 = Color3.fromRGB(220, 235, 255)
status.Text = "Initialisiere..."
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextYAlignment = Enum.TextYAlignment.Center
status.Parent = mainFrame

local tip = Instance.new("TextLabel")
tip.BackgroundTransparency = 1
tip.Position = UDim2.fromScale(0, 0.87)
tip.Size = UDim2.fromScale(1, 0.06)
tip.Font = Enum.Font.Gotham
tip.TextScaled = false
tip.TextSize = 16
tip.TextColor3 = Color3.fromRGB(140, 185, 255)
tip.TextTransparency = 0.25
tip.Text = "Tipp: Bleibe in Bewegung für schnelle Reaktion."
tip.TextXAlignment = Enum.TextXAlignment.Left
tip.TextYAlignment = Enum.TextYAlignment.Center
tip.Parent = mainFrame

local skipButton = Instance.new("TextButton")
skipButton.Size = UDim2.fromScale(0.2, 0.065)
skipButton.Position = UDim2.fromScale(0.75, 0.85)
skipButton.AnchorPoint = Vector2.new(0.5, 0.5)
skipButton.BackgroundColor3 = Color3.fromRGB(20, 100, 170)
skipButton.BorderSizePixel = 0
skipButton.Font = Enum.Font.GothamSemibold
skipButton.Text = "Skip"
skipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
skipButton.TextScaled = true
skipButton.Parent = mainFrame

local skipCorner = Instance.new("UICorner")
skipCorner.CornerRadius = UDim.new(0, 12)
skipCorner.Parent = skipButton

local scanning = Instance.new("Frame")
scanning.Size = UDim2.new(1, 0, 0.02, 0)
scanning.Position = UDim2.fromScale(0, 0.56)
scanning.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
scanning.BackgroundTransparency = 0.85
scanning.BorderSizePixel = 0
scanning.Parent = mainFrame

local scanCorner = Instance.new("UICorner")
scanCorner.CornerRadius = UDim.new(1, 0)
scanCorner.Parent = scanning

local scanTween = TweenService:Create(scanning, TweenInfo.new(1.6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {
    Position = UDim2.fromScale(-1, 0.56)
})
scanTween:Play()

local messages = {
    "Lade Assets...",
    "Erstelle Spielwelt...",
    "Lade externe Module...",
    "Verbinde mit Server...",
    "Synchronisiere Benutzerdaten...",
    "Kalibriere Darstellung..."
}

local tips = {
    "Tipp: Drücke F für schnelle Interaktion.",
    "Tipp: Schau dich in der Spielwelt gründlich um.",
    "Tipp: Halte Ausschau nach geheimen Verstecken.",
    "Tipp: Die schnellste Route ist nicht immer die sicherste."
}

local running = true
local ended = false

local function endLoading(skip)
    if ended then
        return
    end
    ended = true
    running = false

    if skip then
        status.Text = "Übersprungen. Willkommen."
        tip.Text = "Viel Spaß im Spiel!"
    else
        status.Text = "Bereit! Willkommen."
        tip.Text = "Loading abgeschlossen."
    end

    local fadeInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(mainFrame, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(title, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(subtitle, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(status, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(tip, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(barHolder, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(barFill, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(barGlow, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(skipButton, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(logo, fadeInfo, {ImageTransparency = 1}):Play()
    TweenService:Create(logoGlow, fadeInfo, {BackgroundTransparency = 1}):Play()

    task.delay(0.8, function()
        if blur and blur.Parent then
            blur:Destroy()
        end
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

skipButton.MouseButton1Click:Connect(function()
    endLoading(true)
end)

task.spawn(function()
    while running and gui.Parent do
        TweenService:Create(logoGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundTransparency = 0.85
        }):Play()
        TweenService:Create(logoGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundTransparency = 0.95
        }):Play()
        TweenService:Create(logo, TweenInfo.new(4, Enum.EasingStyle.Linear), {
            Rotation = logo.Rotation + 360
        }):Play()
        task.wait(4)
    end
end)

for i = 1, 100 do
    if ended then
        break
    end

    local progress = i / 100
    local labelIndex = math.clamp(math.ceil(i / 17), 1, #messages)
    status.Text = string.format("%s (%d%%)", messages[labelIndex], math.floor(progress * 100))
    tip.Text = tips[math.random(1, #tips)]

    TweenService:Create(barFill, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.fromScale(progress, 1)
    }):Play()

    TweenService:Create(barGlow, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.fromScale(math.clamp(progress - 0.01, 0, 0.98), -0.2)
    }):Play()

    task.wait(0.06)
end

if not ended then
    endLoading(false)
end
