-- إنشاء واجهة زر
local ScreenGui = Instance.new("ScreenGui")
local MoneyButton = Instance.new("TextButton")
local MoneyLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "MoneyGUI"

-- زر الفلوس
MoneyButton.Parent = ScreenGui
MoneyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
MoneyButton.Position = UDim2.new(0, 100, 0, 100)
MoneyButton.Size = UDim2.new(0, 100, 0, 40)
MoneyButton.Font = Enum.Font.SourceSansBold
MoneyButton.Text = "$"
MoneyButton.TextColor3 = Color3.new(1, 1, 1)
MoneyButton.TextSize = 24

-- عرض الفلوس
MoneyLabel.Parent = ScreenGui
MoneyLabel.BackgroundTransparency = 1
MoneyLabel.Position = UDim2.new(0, 100, 0, 60)
MoneyLabel.Size = UDim2.new(0, 200, 0, 30)
MoneyLabel.Font = Enum.Font.SourceSansBold
MoneyLabel.TextColor3 = Color3.new(1, 1, 0)
MoneyLabel.TextSize = 20
MoneyLabel.Text = "$ ANS: 0"

-- المتغير
local money = 0

-- عند الضغط على الزر
MoneyButton.MouseButton1Click:Connect(function()
    money = money + 15000
    MoneyLabel.Text = "$ ANS: " .. tostring(money)
end)
