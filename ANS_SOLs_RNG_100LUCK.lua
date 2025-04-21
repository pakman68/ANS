-- سكربت Sol's RNG GUI مع Luck Boost + Auto Roll
-- صنع خصيصاً لك ♥️

-- Anti-AFK
local VirtualUser = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:connect(function()
   VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- واجهة GUI
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 160)
Frame.Position = UDim2.new(0.5, -100, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", Frame)
title.Text = "Sol's RNG GUI"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- زر Auto Roll
local autoRoll = Instance.new("TextButton", Frame)
autoRoll.Text = "Auto Roll"
autoRoll.Size = UDim2.new(1, -20, 0, 40)
autoRoll.Position = UDim2.new(0, 10, 0, 40)
autoRoll.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
autoRoll.TextColor3 = Color3.fromRGB(255, 255, 255)
autoRoll.Font = Enum.Font.GothamBold
autoRoll.TextSize = 16
Instance.new("UICorner", autoRoll)

-- زر Luck Boost
local luckBoost = Instance.new("TextButton", Frame)
luckBoost.Text = "100x Luck"
luckBoost.Size = UDim2.new(1, -20, 0, 40)
luckBoost.Position = UDim2.new(0, 10, 0, 90)
luckBoost.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
luckBoost.TextColor3 = Color3.fromRGB(255, 255, 255)
luckBoost.Font = Enum.Font.GothamBold
luckBoost.TextSize = 16
Instance.new("UICorner", luckBoost)

-- وظائف الأزرار
local rolling = false

autoRoll.MouseButton1Click:Connect(function()
    rolling = not rolling
    autoRoll.Text = rolling and "Stop Rolling" or "Auto Roll"
    while rolling do
        local rollBtn = workspace:FindFirstChild("RollButton")
        if rollBtn and rollBtn:FindFirstChildOfClass("ClickDetector") then
            fireclickdetector(rollBtn:FindFirstChildOfClass("ClickDetector"))
        end
        wait(1.5)
    end
end)

luckBoost.MouseButton1Click:Connect(function()
    local luck = game.Players.LocalPlayer:FindFirstChild("Luck")
    if not luck then
        luck = Instance.new("IntValue", game.Players.LocalPlayer)
        luck.Name = "Luck"
    end
    luck.Value = 100
end)
