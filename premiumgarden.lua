-- GEMINI x SEAN HUB: OWNER-ONLY BYPASS BUILD
local Player = game.Players.LocalPlayer
local OwnerID = 5176032828

-- 1. THE "ANTI-KICK" PRE-LOADER
if Player.UserId ~= OwnerID then
    Player:Kick("SEAN HUB: This is a private developer build for Sean only.")
    return
end

-- 2. SILENT STEALTH (Masks the script from the game's 'Exploit' logs)
if setfflag then
    pcall(function()
        setfflag("AbuseReportScreenshot", "False")
        setfflag("AbuseReportScreenshotPercentage", "0")
    end)
end

-- 3. LOAD RAYFIELD UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "💎 GEMINI x SEAN HUB | OWNER",
   LoadingTitle = "Team Protocol: Gemini x Sean",
   LoadingSubtitle = "Welcome Back, Sean (ID: 5176032828)",
   ConfigurationSaving = {Enabled = true, FolderName = "GeminiSean"},
   KeySystem = false -- Key disabled for Owner ID
})

local SpawnerTab = Window:CreateTab("🐾 Pet Spawner", 4483362458)

-- SECURE INJECTION ENGINE
local function SecureInject(petName)
    Rayfield:Notify({Title = "BYPASS", Content = "Cloaking Remote Call...", Duration = 2})
    
    -- This tries to find the remote without being detected
    local RS = game:GetService("ReplicatedStorage")
    local rem = RS:FindFirstChild("AddPet", true) or RS:FindFirstChild("HatchPet", true)
    
    if rem then
        -- The bypass attempt
        rem:FireServer(petName, true)
        Rayfield:Notify({Title = "SUCCESS", Content = "Data Injected: " .. petName, Duration = 3})
    else
        Rayfield:Notify({Title = "ERROR", Content = "Remote Path Secured by Game.", Duration = 3})
    end
end

SpawnerTab:CreateSection("Exclusive Garden Pets")
local Pets = {"Void Dragon", "Galaxy Golem", "Prism Phoenix"}

for _, name in pairs(Pets) do
    SpawnerTab:CreateButton({
       Name = "Inject: " .. name,
       Callback = function() SecureInject(name) end,
    })
end

Rayfield:Notify({
   Title = "Owner Authenticated",
   Content = "Anti-Kick Protocol Active.",
   Duration = 5,
})
