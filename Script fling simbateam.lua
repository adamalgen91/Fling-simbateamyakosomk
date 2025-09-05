local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlingGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 480)
frame.Position = UDim2.new(0.5, -180, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.Text = "✖"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1,0)
closeBtn.Parent = frame

local showBtn = Instance.new("TextButton")
showBtn.Size = UDim2.new(0, 120, 0, 45)
showBtn.Position = UDim2.new(0, 50, 0, 50)
showBtn.Text = "⚡ Show GUI"
showBtn.Font = Enum.Font.GothamBold
showBtn.TextSize = 18
showBtn.Visible = false
showBtn.BackgroundColor3 = Color3.fromRGB(50,150,200)
showBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", showBtn).CornerRadius = UDim.new(0, 12)
showBtn.Parent = screenGui

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 45)
scroll.CanvasSize = UDim2.new(0,0,8,0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 0.15
scroll.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0,12)

local function createButton(text, y, color1, color2)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(0, 280, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, y)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = color1
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
	local g = Instance.new("UIGradient", btn)
	g.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, color1),ColorSequenceKeypoint.new(1, color2)}
	g.Rotation = 90
	btn.MouseEnter:Connect(function() btn.TextColor3 = Color3.fromRGB(0,0,0) g.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, color2),ColorSequenceKeypoint.new(1, color1)} end)
	btn.MouseLeave:Connect(function() btn.TextColor3 = Color3.fromRGB(255,255,255) g.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, color1),ColorSequenceKeypoint.new(1, color2)} end)
	return btn
end

local playerBox = Instance.new("TextBox", scroll)
playerBox.Size = UDim2.new(0, 260, 0, 30)
playerBox.Position = UDim2.new(0, 20, 0, 10)
playerBox.PlaceholderText = "اسم اللاعب"
playerBox.Text = ""

local speedBox = Instance.new("TextBox", scroll)
speedBox.Size = UDim2.new(0, 260, 0, 30)
speedBox.Position = UDim2.new(0, 20, 0, 50)
speedBox.PlaceholderText = "سرعة التطير (0-1000000)"
speedBox.Text = "100"

local distBox = Instance.new("TextBox", scroll)
distBox.Size = UDim2.new(0, 260, 0, 30)
distBox.Position = UDim2.new(0, 20, 0, 90)
distBox.PlaceholderText = "المسافة (0-1000000)"
distBox.Text = "50"

local function styleTextBox(box)
	box.BackgroundColor3 = Color3.fromRGB(60,60,60)
	box.TextColor3 = Color3.fromRGB(255,255,255)
	box.PlaceholderColor3 = Color3.fromRGB(180,180,180)
	box.TextScaled = true
	box.Font = Enum.Font.GothamBold
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 12)
	box.ClipsDescendants = true
end

styleTextBox(playerBox)
styleTextBox(speedBox)
styleTextBox(distBox)

local btnSpacing = 50
local startY = 140

local flingBtn = createButton("💨 ابدأ التطير", startY, Color3.fromRGB(50,200,100), Color3.fromRGB(90,255,150))
local stopBtn = createButton("⛔ إيقاف التطير", startY + btnSpacing, Color3.fromRGB(200,50,50), Color3.fromRGB(255,80,80))
local listBtn = createButton("👥 قائمة اللاعبين", startY + btnSpacing*2, Color3.fromRGB(80,180,200), Color3.fromRGB(120,220,250))
local lagBtn = createButton("⚡ لاق", startY + btnSpacing*3, Color3.fromRGB(200,100,0), Color3.fromRGB(255,150,50))
local stopLagBtn = createButton("🛑 إلغاء اللّاق", startY + btnSpacing*4, Color3.fromRGB(180,50,50), Color3.fromRGB(220,80,80))
local freezeBtn = createButton("❄ تجميد اللاعب", startY + btnSpacing*5, Color3.fromRGB(50,50,200), Color3.fromRGB(80,80,255))
local unfreezeBtn = createButton("👁 إخفاء التجميد", startY + btnSpacing*6, Color3.fromRGB(50,150,200), Color3.fromRGB(80,200,255))
local blurBtn = createButton("💎 تفعيل Blur", startY + btnSpacing*7, Color3.fromRGB(100,100,255), Color3.fromRGB(150,150,255))
local unblurBtn = createButton("✖ إلغاء Blur", startY + btnSpacing*8, Color3.fromRGB(150,50,50), Color3.fromRGB(200,80,80))

local creditLabel = Instance.new("TextLabel", scroll)
creditLabel.Size = UDim2.new(1, -20, 0, 20)
creditLabel.Position = UDim2.new(0, 10, 0, startY + btnSpacing*9)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "made by Simba team"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
creditLabel.Font = Enum.Font.SourceSansBold
creditLabel.TextScaled = true

local flingConn
local lagConn
local freezeList = {}
local blurEffect

local function startFling()
	local target = game.Players:FindFirstChild(playerBox.Text)
	if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end
	local speed = tonumber(speedBox.Text) or 100
	local dist = tonumber(distBox.Text) or 50
	local hrp = target.Character.HumanoidRootPart
	flingConn = game:GetService("RunService").Heartbeat:Connect(function()
		if hrp then hrp.Velocity = Vector3.new(speed, dist, 0) end
	end)
end

local function stopFling()
	if flingConn then flingConn:Disconnect() flingConn = nil end
end

local function startLag()
	local target = game.Players:FindFirstChild(playerBox.Text)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = target.Character.HumanoidRootPart
		lagConn = game:GetService("RunService").Heartbeat:Connect(function()
			hrp.Velocity = Vector3.new(0, 100000, 0)
		end)
	end
end

local function stopLag()
	if lagConn then lagConn:Disconnect() lagConn = nil end
end

local function freezePlayer()
	local target = game.Players:FindFirstChild(playerBox.Text)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = target.Character.HumanoidRootPart
		freezeList[playerBox.Text] = hrp
		hrp.Anchored = true
	end
end

local function unfreezePlayer()
	local targetName = playerBox.Text
	if freezeList[targetName] then
		freezeList[targetName].Anchored = false
		freezeList[targetName] = nil
	end
end

local function enableBlur()
	if not blurEffect then
		blurEffect = Instance.new("BlurEffect", game.Lighting)
		blurEffect.Size = 24
	end
end

local function disableBlur()
	if blurEffect then
		blurEffect:Destroy()
		blurEffect = nil
	end
end

flingBtn.MouseButton1Click:Connect(startFling)
stopBtn.MouseButton1Click:Connect(stopFling)
lagBtn.MouseButton1Click:Connect(startLag)
stopLagBtn.MouseButton1Click:Connect(stopLag)
freezeBtn.MouseButton1Click:Connect(freezePlayer)
unfreezeBtn.MouseButton1Click:Connect(unfreezePlayer)
blurBtn.MouseButton1Click:Connect(enableBlur)
unblurBtn.MouseButton1Click:Connect(disableBlur)

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	showBtn.Visible = true
end)

showBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	showBtn.Visible = false
end)

local listFrame = Instance.new("Frame", screenGui)
listFrame.Name = "PlayersList"
listFrame.Size = UDim2.new(0, 200, 0, 480)
listFrame.Position = UDim2.new(0.5, 190, 0.5, -240)
listFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
listFrame.Visible = false
Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0,12)

local listScroll = Instance.new("ScrollingFrame", listFrame)
listScroll.Size = UDim2.new(1, -10, 1, -10)
listScroll.Position = UDim2.new(0,5,0,5)
listScroll.CanvasSize = UDim2.new(0,0,0,0)
listScroll.ScrollBarThickness = 6
listScroll.BackgroundTransparency = 0.1
listScroll.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", listScroll).CornerRadius = UDim.new(0, 8)
local UIList2 = Instance.new("UIListLayout", listScroll)
UIList2.SortOrder = Enum.SortOrder.LayoutOrder

local function refreshPlayers()
	for _, c in pairs(listScroll:GetChildren()) do
		if c:IsA("TextButton") then c:Destroy() end
	end
	for _, plr in pairs(game.Players:GetPlayers()) do
		local pBtn = Instance.new("TextButton", listScroll)
		pBtn.Size = UDim2.new(1, -10, 0, 30)
		pBtn.Text = plr.Name
		pBtn.Font = Enum.Font.Gotham
		pBtn.TextSize = 14
		pBtn.TextColor3 = Color3.fromRGB(255,255,255)
		pBtn.BackgroundColor3 = Color3.fromRGB(50,50,100)
		Instance.new("UICorner", pBtn).CornerRadius = UDim.new(0,8)
		pBtn.MouseButton1Click:Connect(function() playerBox.Text = plr.Name end)
	end
	listScroll.CanvasSize = UDim2.new(0,0,0,UIList2.AbsoluteContentSize.Y)
end

listBtn.MouseButton1Click:Connect(function()
	listFrame.Visible = not listFrame.Visible
	if listFrame.Visible then refreshPlayers() end
end)

game.Players.PlayerAdded:Connect(function()
	refreshPlayers()
end)

game.Players.PlayerRemoving:Connect(function()
	refreshPlayers()
end)
