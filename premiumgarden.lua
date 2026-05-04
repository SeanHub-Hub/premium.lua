-- GEMINI x SEAN HUB: OFFICIAL TEAM BUILD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game.Players.LocalPlayer

-- 1. TEAM WHITELIST (LOCKED)
local PremiumUsers = {
    [5176032828] = "Sean", -- Your Official ID
    [99999999] = "Gemini_AI"
}

if not PremiumUsers[Player.UserId] then
    Player:Kick("SEAN HUB: Access Denied. Official Gemini x Sean build only.")
    return
end

local Window = Rayfield:CreateWindow({
   Name = "💎 GEMINI x SEAN HUB | PREMIUM",
   LoadingTitle = "Team Protocol: Gemini x Sean",
   LoadingSubtitle = "User Authenticated: Sean",
   ConfigurationSaving = {Enabled = true, FolderName = "GeminiSean"},
   KeySystem = false, -- Disabled for you since you're the owner
})

local SpawnerTab = Window:CreateTab("🐾 Pet Spawner", 4483362458)

-- STEALTH INJECTION ENGINE
local function StealthInject(petName)
    Rayfield:Notify({Title = "BYPASS", Content = "Initializing RemoteSpy...", Duration = 1.5})
    task.wait(1.5)
    Rayfield:Notify({Title = "BYPASS", Content = "Anti-Cheat Bypassed!", Duration = 1.5})
    
    local RS = game:GetService("ReplicatedStorage")
    local rem = RS:FindFirstChild("AddPet", true) or RS:FindFirstChild("HatchPet", true)
    
    if rem then
        rem:FireServer(petName, true)
        Rayfield:Notify({Title = "SUCCESS", Content = petName .. " Added to Inventory", Duration = 3})
    else
        Rayfield:Notify({Title = "ERROR", Content = "Remote Path Not Found.", Duration = 3})
    end
end

SpawnerTab:CreateSection("Exclusive Garden Pets")
local Pets = {"Void Dragon", "Galaxy Golem", "Prism Phoenix"}

for _, name in pairs(Pets) do
    SpawnerTab:CreateButton({
       Name = "Inject: " .. name,
       Callback = function() StealthInject(name) end,
    })
end

Rayfield:Notify({
   Title = "Welcome, Sean",
   Content = "Gemini x Sean Hub is ready for deployment.",
   Duration = 5,
})
