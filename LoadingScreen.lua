local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "LoadingScreen"
gui.Parent = player.PlayerGui

local blur = Instance.new("BlurEffect")
blur.Size = 22
blur.Parent = Lighting

local background = Instance.new("Frame")
background.Size = UDim2.fromScale(1, 1)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(8, 10, 16)
background.BorderSizePixel = 0
background.Parent = gui

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 18, 34)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(8, 10, 16)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 7, 12))
})
bgGradient.Rotation = 90
bgGradient.Parent = background

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.92, 0, 0.92, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
mainFrame.BackgroundTransparency = 0.12
mainFrame.BorderSizePixel = 0
mainFrame.Parent = background

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 28)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 170, 255)
mainStroke.Thickness = 1
mainStroke.Transparency = 0.45
mainStroke.Parent = mainFrame

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.fromOffset(190, 190)
logo.Position = UDim2.new(0.5, 0, 0.18, 0)
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://DEINE_LOGO_ID"
logo.Parent = mainFrame

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Size = UDim2.new(0.85, 0, 0.16, 0)
title.Position = UDim2.new(0.05, 0, 0.28, 0)
title.Font = Enum.Font.GothamBlack
title.Text = "PROJECT X"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(235, 245, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Top
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(0.85, 0, 0.08, 0)
subtitle.Position = UDim2.new(0.05, 0, 0.44, 0)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "FiveM Lookalike Loading Screen"
subtitle.TextScaled = true
subtitle.TextColor3 = Color3.fromRGB(160, 190, 230)
subtitle.TextTransparency = 0.12
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextYAlignment = Enum.TextYAlignment.Top
subtitle.Parent = mainFrame

local barHolder = Instance.new("Frame")
barHolder.Size = UDim2.new(0.84, 0, 0.05, 0)
barHolder.Position = UDim2.new(0.08, 0, 0.7, 0)
barHolder.BackgroundColor3 = Color3.fromRGB(24, 28, 40)
barHolder.BorderSizePixel = 0
barHolder.Parent = mainFrame

local holderCorner = Instance.new("UICorner")
holderCorner.CornerRadius = UDim.new(1, 0)
holderCorner.Parent = barHolder

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barHolder

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = barFill

local status = Instance.new("TextLabel")
status.BackgroundTransparency = 1
status.Size = UDim2.new(0.9, 0, 0.12, 0)
status.Position = UDim2.new(0.5, 0, 0.58, 0)
status.AnchorPoint = Vector2.new(0.5, 0)
status.Font = Enum.Font.GothamSemibold
status.TextScaled = false
status.TextSize = 24
status.TextColor3 = Color3.fromRGB(223, 236, 255)
status.Text = "Loading assets..."
status.TextXAlignment = Enum.TextXAlignment.Center
status.TextYAlignment = Enum.TextYAlignment.Center
status.Parent = mainFrame

local messages = {
    "Loading assets...",
    "Loading textures...",
    "Loading sounds...",
    "Loading scripts...",
    "Syncing data...",
    "Preparing game world..."
}

local running = true
local ended = false

local function endLoading()
    if ended then
        return
    end
    ended = true
    running = false

    status.Text = "Ready to play!"

    local fadeInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(mainFrame, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(title, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(subtitle, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(status, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(barHolder, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(barFill, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(logo, fadeInfo, {ImageTransparency = 1}):Play()

    task.delay(0.8, function()
        if blur and blur.Parent then
            blur:Destroy()
        end
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

task.spawn(function()
    while running and gui.Parent do
        TweenService:Create(logo, TweenInfo.new(4, Enum.EasingStyle.Linear), {
            Rotation = logo.Rotation + 360
        }):Play()
        task.wait(4)
    end
end)

math.randomseed(tick())

local progress = 0
local function getNextStep()
    local step = math.random(4, 12) / 1000
    if math.random(1, 8) == 1 then
        return 0, math.random(80, 160) / 1000
    end
    return step, math.random(30, 90) / 1000
end

while running and gui.Parent and progress < 1 do
    local step, delayTime = getNextStep()
    progress = math.clamp(progress + step, 0, 1)
    local labelIndex = math.clamp(math.ceil(progress * #messages), 1, #messages)
    status.Text = string.format("%s (%d%%)", messages[labelIndex], math.floor(progress * 100))

    TweenService:Create(barFill, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(progress, 0, 1, 0)
    }):Play()

    task.wait(delayTime)
end

if not ended then
    endLoading()
end
