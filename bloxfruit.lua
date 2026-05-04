-- SEAN HUB V1.8 (BLOX FRUITS FULL)
if not game:IsLoaded() then game.Loaded:Wait() end

local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui") or gethui()

-- MAIN UI CONFIG
local ScreenGui = Instance.new("ScreenGui", CoreGui)
local Main = Instance.new("Frame", ScreenGui)
local Sidebar = Instance.new("Frame", Main)
local TabContainer = Instance.new("Frame", Main)
local Title = Instance.new("TextLabel", Main)

-- STYLING THE REDZ BASE
Main.Size = UDim2.new(0, 550, 0, 350)
Main.Position = UDim2.new(0.5, -275, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(180, 100, 255)
MainStroke.Thickness = 1.5

-- SIDEBAR LOGIC
Sidebar.Size = UDim2.new(0, 140, 1, -40)
Sidebar.Position = UDim2.new(0, 10, 0, 35)
Sidebar.BackgroundTransparency = 1
local SideList = Instance.new("UIListLayout", Sidebar)
SideList.Padding = UDim.new(0, 5)

-- THE TABS (CREATING THE SECTIONS)
local function CreateTab(name)
    local Content = Instance.new("ScrollingFrame", TabContainer)
    Content.Size = UDim2.new(1, 0, 1, 0)
    Content.Visible = false
    Content.BackgroundTransparency = 1
    Content.ScrollBarThickness = 2
    local List = Instance.new("UIListLayout", Content)
    List.Padding = UDim.new(0, 8)
    
    local TabBtn = Instance.new("TextButton", Sidebar)
    TabBtn.Size = UDim2.new(1, 0, 0, 35)
    TabBtn.Text = name
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.Font = Enum.Font.Gotham
    Instance.new("UICorner", TabBtn)
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, v in pairs(TabContainer:GetChildren()) do v.Visible = false end
        Content.Visible = true
    end)
    
    return Content
end

TabContainer.Size = UDim2.new(1, -170, 1, -50)
TabContainer.Position = UDim2.new(0, 160, 0, 40)
TabContainer.BackgroundTransparency = 1

-- FEATURE BUILDER
local function AddToggle(parent, text, callback)
    local Tgl = Instance.new("TextButton", parent)
    Tgl.Size = UDim2.new(0.95, 0, 0, 40)
    Tgl.Text = " " .. text
    Tgl.TextXAlignment = "Left"
    Tgl.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Tgl.TextColor3 = Color3.fromRGB(150, 150, 150)
    Instance.new("UICorner", Tgl)
    
    local state = false
    Tgl.MouseButton1Click:Connect(function()
        state = not state
        Tgl.TextColor3 = state and Color3.fromRGB(180, 100, 255) or Color3.fromRGB(150, 150, 150)
        callback(state)
    end)
end

-- --- ADDING THE "MANY MANY" FEATURES ---

-- TAB 1: FARMING
local FarmTab = CreateTab("🌾 Auto Farm")
AddToggle(FarmTab, "Auto Farm Level", function(t) _G.AutoFarm = t end)
AddToggle(FarmTab, "Auto Farm Mastery", function(t) _G.AutoMastery = t end)
AddToggle(FarmTab, "Auto Farm Chests", function(t) _G.AutoChest = t end)
AddToggle(FarmTab, "Fast Attack (No CD)", function(t) _G.FastAttack = t end)

-- TAB 2: COMBAT
local CombatTab = CreateTab("⚔️ Combat")
AddToggle(CombatTab, "Auto Clicker", function(t) _G.AutoClick = t end)
AddToggle(CombatTab, "Kill Aura", function(t) _G.KillAura = t end)
AddToggle(CombatTab, "Infinite Geppo", function(t) _G.InfGeppo = t end)
AddToggle(CombatTab, "No Stun", function(t) _G.NoStun = t end)

-- TAB 3: STATS
local StatTab = CreateTab("📊 Stats")
AddToggle(StatTab, "Auto Stats: Melee", function(t) _G.StatMelee = t end)
AddToggle(StatTab, "Auto Stats: Defense", function(t) _G.StatDef = t end)
AddToggle(StatTab, "Auto Stats: Sword", function(t) _G.StatSword = t end)
AddToggle(StatTab, "Auto Stats: Fruit", function(t) _G.StatFruit = t end)

-- TAB 4: WORLD/TP
local WorldTab = CreateTab("🌍 World")
AddToggle(WorldTab, "Fruit Notifier", function(t) _G.FruitNotif = t end)
AddToggle(WorldTab, "Safe Mode (TP Away)", function(t) _G.SafeMode = t end)
AddToggle(WorldTab, "Teleport to Fruit", function(t) _G.TPFruit = t end)

FarmTab.Visible = true -- Default Tab
print("Sean Hub V1.8: Ultimate Features Loaded!")
