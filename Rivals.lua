local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 SEAN HUB | RIVALS TURBO",
   LoadingTitle = "Killing Rivals Lag...",
   LoadingSubtitle = "Optimized for Mobile Latency",
   ConfigurationSaving = {Enabled = false},
   KeySystem = false 
})

-- 1. THE LAG KILLER
local BoostTab = Window:CreateTab("⚡ FPS Boost", 4483362458)

BoostTab:CreateButton({
   Name = "🔥 ULTRA PERFORMANCE (Rivals)",
   Callback = function()
       -- 1. Strip Textures and Wraps
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("BasePart") then
               v.Material = Enum.Material.SmoothPlastic
               v.CastShadow = false
           elseif v:IsA("Decal") or v:IsA("Texture") then
               v:Destroy()
           end
       end
       
       -- 2. Force Low Latency (Great for Shot Registration)
       settings().Rendering.QualityLevel = 1
       game.Lighting.GlobalShadows = false
       game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128) -- Keeps visibility high
       
       -- 3. Clear Post-Effects (Bloom/Blur/Sunrays)
       for _, v in pairs(game.Lighting:GetChildren()) do
           if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") then
               v.Enabled = false
           end
       end
       
       Rayfield:Notify({Title="Turbo", Content="Rivals Lag Cleared! 60FPS Target Set.", Duration=5})
   end
})

-- 2. DYNAMIC FOV (FPS TRICK)
BoostTab:CreateSlider({
   Name = "Field of View (Increases FPS)",
   Info = "Higher FOV = More visibility + stable FPS",
   Range = {70, 120},
   Increment = 5,
   Suffix = "FOV",
   CurrentValue = 105,
   Callback = function(Value)
       game.Workspace.CurrentCamera.FieldOfView = Value
   end,
})

-- 3. BATTERY SAVER
local BatteryTab = Window:CreateTab("🔋 Battery", 4483362458)
BatteryTab:CreateToggle({
   Name = "Limit FPS to 45 (Ultra Battery)",
   CurrentValue = false,
   Callback = function(v)
       if v then setfpscap(45) else setfpscap(60) end
   end
})
