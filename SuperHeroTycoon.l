-- CADNAAN GUI TOGGLE BUTTON

local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- TOGGLE GUI
local toggleGui = Instance.new("ScreenGui", plr.PlayerGui)
toggleGui.Name = "ToggleButtonGUI"

local toggleBtn = Instance.new("TextButton", toggleGui)
toggleBtn.Size = UDim2.new(0,60,0,60) -- BUTTON YAR
toggleBtn.Position = UDim2.new(0,10,0.5,0)
toggleBtn.Text = "🦁"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextScaled = true
toggleBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggleBtn.TextColor3 = Color3.fromRGB(0,255,0)
toggleBtn.BorderSizePixel = 0
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1,0)

-- MAIN GUI (tani waa GUI-gaaga weyn)
-- HADDII AAD HORAY U LEEDAHAY -> beddel name-ka
local mainGui = plr.PlayerGui:FindFirstChild("CadnaanAllInOne")
if mainGui then
	mainGui.Enabled = true
end

-- DRAG BUTTON
do
	local dragging, dragInput, mousePos, framePos
	toggleBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = toggleBtn.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	toggleBtn.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			toggleBtn.Position = UDim2.new(
				framePos.X.Scale, framePos.X.Offset + delta.X,
				framePos.Y.Scale, framePos.Y.Offset + delta.Y
			)
		end
	end)
end

-- OPEN / CLOSE
local open = true
toggleBtn.MouseButton1Click:Connect(function()
	open = not open
	if mainGui then
		mainGui.Enabled = open
	end
end)

print("Small Toggle Button Loaded ✔")
