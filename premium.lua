-- SEAN HUB V1.4 (SKETCH EDITION)
if not game:IsLoaded() then game.Loaded:Wait() end

local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local Whitelist = {[5176032828] = "Sean"}

if not Whitelist[Player.UserId] then 
    Player:Kick("No Access to Sean Hub Premium") 
    return 
end

local ScreenGui = Instance.new("ScreenGui", (game:GetService("CoreGui") or gethui()))
local MainFrame = Instance.new("Frame", ScreenGui)
local LogoBtn = Instance.new("TextButton", ScreenGui)

-- 1. THE "SH" LOGO (The Floating Circle from your sketch)
LogoBtn.Name = "SH_Logo"
LogoBtn.Size = UDim2.new(0, 55, 0, 55)
LogoBtn.Position = UDim2.new(0, 15, 0.4, 0)
LogoBtn.BackgroundColor3 = Color3.fromRGB(160, 32, 240)
LogoBtn.Text = "SH"
LogoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoBtn.Font = Enum.Font.Code
LogoBtn.TextSize = 22
LogoBtn.Draggable = true

local Corner = Instance.new("UICorner", LogoBtn)
Corner.CornerRadius = UDim.new(1, 0)

-- 2. MAIN MENU (Vertical box from your drawing)
MainFrame.Visible = false
MainFrame.Size = UDim2.new(0, 150, 0, 180)
MainFrame.Position = UDim2.new(0, 80, 0.4, -60)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0

local MenuCorner = Instance.new("UICorner", MainFrame)
local MenuStroke = Instance.new("UIStroke", MainFrame)
MenuStroke.Color = Color3.fromRGB(160, 32, 240)
MenuStroke.Thickness = 2

-- HEADER (PREM)
local Header = Instance.new("TextLabel", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.Text = "PREMIUM"
Header.TextColor3 = Color3.fromRGB(160, 32, 240)
Header.BackgroundTransparency = 1
Header.Font = Enum.Font.Code
Header.TextSize = 16

-- INSTANT BUTTON
local InstantBtn = Instance.new("TextButton", MainFrame)
InstantBtn.Size = UDim2.new(0.85, 0, 0, 45)
InstantBtn.Position = UDim2.new(0.075, 0, 0.25, 0)
InstantBtn.Text = "INSTANT"
InstantBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InstantBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InstantBtn.Font = Enum.Font.Code

-- BASE BUTTON
local BaseBtn = Instance.new("TextButton", MainFrame)
BaseBtn.Size = UDim2.new(0.85, 0, 0, 45)
BaseBtn.Position = UDim2.new(0.075, 0, 0.55, 0)
BaseBtn.Text = "BASE"
BaseBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
BaseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BaseBtn.Font = Enum.Font.Code

-- ROUNDED BUTTONS
Instance.new("UICorner", InstantBtn).CornerRadius = UDim.new(0, 6)
Instance.new("UICorner", BaseBtn).CornerRadius = UDim.new(0, 6)

-- LOGIC: OPEN MENU
LogoBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- LOGIC: INSTANT STEAL
local StealOn = false
InstantBtn.MouseButton1Click:Connect(function()
    StealOn = not StealOn
    InstantBtn.TextColor3 = StealOn and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    
    task.spawn(function()
        while StealOn do
            for _, v in pairs(workspace:GetChildren()) do
                if v:FindFirstChildWhichIsA("TouchTransmitter", true) and (v.Name:find("Brain") or v.Name:find("Dummy")) then
                    firetouchinterest(Player.Character.PrimaryPart, v, 0)
                    firetouchinterest(Player.Character.PrimaryPart, v, 1)
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- LOGIC: BASE TELEPORT
BaseBtn.MouseButton1Click:Connect(function()
    local base = workspace:FindFirstChild(Player.Name .. "Base") or workspace.Bases:FindFirstChild(Player.Name)
    if base and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = base.PrimaryPart.CFrame
    end
end)

print("Sean Hub V1.4 Ready!")
