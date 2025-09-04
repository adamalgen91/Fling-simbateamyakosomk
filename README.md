local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlingGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 240)
frame.Position = UDim2.new(0.5, -150, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Parent = frame

local showBtn = Instance.new("TextButton")
showBtn.Size = UDim2.new(0, 100, 0, 40)
showBtn.Position = UDim2.new(0, 50, 0, 50)
showBtn.Text = "Show Fling"
showBtn.Visible = false
showBtn.Active = true
showBtn.Draggable = true
showBtn.Parent = screenGui

local playerBox = Instance.new("TextBox")
playerBox.Size = UDim2.new(0, 200, 0, 30)
playerBox.Position = UDim2.new(0, 50, 0, 40)
playerBox.PlaceholderText = "اسم اللاعب"
playerBox.Text = ""
playerBox.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0, 200, 0, 30)
speedBox.Position = UDim2.new(0, 50, 0, 80)
speedBox.PlaceholderText = "سرعة التطير"
speedBox.Text = "100"
speedBox.Parent = frame

local distBox = Instance.new("TextBox")
distBox.Size = UDim2.new(0, 200, 0, 30)
distBox.Position = UDim2.new(0, 50, 0, 120)
distBox.PlaceholderText = "المسافة"
distBox.Text = "50"
distBox.Parent = frame

local flingBtn = Instance.new("TextButton")
flingBtn.Size = UDim2.new(0, 90, 0, 30)
flingBtn.Position = UDim2.new(0, 30, 0, 160)
flingBtn.Text = "ابدأ التطير"
flingBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
flingBtn.TextColor3 = Color3.new(1, 1, 1)
flingBtn.Parent = frame

local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(0, 90, 0, 30)
stopBtn.Position = UDim2.new(0, 150, 0, 160)
stopBtn.Text = "إيقاف"
stopBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
stopBtn.TextColor3 = Color3.new(1, 1, 1)
stopBtn.Parent = frame

local guestBtn = Instance.new("TextButton")
guestBtn.Size = UDim2.new(0, 260, 0, 30)
guestBtn.Position = UDim2.new(0, 20, 0, 200)
guestBtn.Text = "اختيار زائر (Guest)"
guestBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
guestBtn.TextColor3 = Color3.new(1, 1, 1)
guestBtn.Parent = frame

guestBtn.MouseButton1Click:Connect(function()
    playerBox.Text = "Guest"
end)

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0, 20)
creditLabel.Position = UDim2.new(0, 0, 1, -20)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "made by Simba team"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
creditLabel.Font = Enum.Font.SourceSansBold
creditLabel.TextScaled = true
creditLabel.Parent = frame

local flingConn

local function startFling()
    local targetName = playerBox.Text
    local target = game.Players:FindFirstChild(targetName)
    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

    local speed = tonumber(speedBox.Text) or 100
    local dist = tonumber(distBox.Text) or 50
    local hrp = target.Character.HumanoidRootPart

    flingConn = game:GetService("RunService").Heartbeat:Connect(function()
        if hrp then
            hrp.Velocity = Vector3.new(speed, dist, 0)
        end
    end)
end

local function stopFling()
    if flingConn then
        flingConn:Disconnect()
        flingConn = nil
    end
end

flingBtn.MouseButton1Click:Connect(startFling)
stopBtn.MouseButton1Click:Connect(stopFling)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    showBtn.Visible = true
end)

showBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    showBtn.Visible = false
end)
