-- SEAN HUB PREMIUM V1.2
if not game:IsLoaded() then game.Loaded:Wait() end

local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- THE MASTER LIST
local Whitelist = {
    [5176032828] = "Sean (Owner)", 
}

-- SECURITY CHECK
if not Whitelist[Player.UserId] then
    Player:Kick("\n\n💎 SEAN HUB PREMIUM 💎\n\nNo Access!\nYour ID: " .. Player.UserId)
    return
end

-- UI SETUP
local ScreenGui = Instance.new("ScreenGui", (game:GetService("CoreGui") or gethui()))
ScreenGui.Name = "ProjectReverse"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true

local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(160, 32, 240)
Stroke.Thickness = 2

-- TITLE
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "PROJECT REVERSE // OWNER: SEAN"
Title.TextColor3 = Color3.fromRGB(160, 32, 240)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Font = Enum.Font.Code
Title.TextSize = 14

-- THE INSTANT STEAL BUTTON
local StealBtn = Instance.new("TextButton", MainFrame)
StealBtn.Size = UDim2.new(0.9, 0, 0, 50)
StealBtn.Position = UDim2.new(0.05, 0, 0.3, 0)
StealBtn.Text = "⚡ START INSTANT STEAL"
StealBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
StealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StealBtn.Font = Enum.Font.Code

local StealActive = false
StealBtn.MouseButton1Click:Connect(function()
    StealActive = not StealActive
    StealBtn.Text = StealActive and "🟢 STEALING ACTIVE" or "⚡ START INSTANT STEAL"
    StealBtn.TextColor3 = StealActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    
    task.spawn(function()
        while StealActive do
            -- Find Item (Brainrot/Dummy)
            for _, v in pairs(workspace:GetChildren()) do
                if v:FindFirstChild("TouchInterest") or v:FindFirstChildWhichIsA("TouchTransmitter", true) then
                    if v.Name:find("Brain") or v.Name:find("Dummy") then
                        firetouchinterest(Player.Character.PrimaryPart, v, 0)
                        firetouchinterest(Player.Character.PrimaryPart, v, 1)
                    end
                end
            end
            
            -- TP Back to Base if holding item
            if Player.Character:FindFirstChildOfClass("Tool") or Player.Backpack:FindFirstChildOfClass("Tool") then
                local myBase = workspace:FindFirstChild(Player.Name .. "Base") or workspace.Bases:FindFirstChild(Player.Name)
                if myBase then
                    Player.Character.HumanoidRootPart.CFrame = myBase.PrimaryPart.CFrame
                end
            end
            task.wait(0.1) -- Small wait to prevent overheating/lag
        end
    end)
end)

print("Sean Hub Full V1.2 Loaded!")
 
